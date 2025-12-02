<?php
// ============================================
// ChefGuedes - API de Receitas
// Gestão completa de receitas
// ============================================

require_once 'db.php';

$method = $_SERVER['REQUEST_METHOD'];
$input = json_decode(file_get_contents('php://input'), true);

// ============================================
// LISTAR TODAS AS RECEITAS
// ============================================
if ($method === 'GET') {
    try {
        $db = getDB();
        
        $category = $_GET['category'] ?? '';
        $search = $_GET['search'] ?? '';
        
        $sql = "
            SELECT r.*, u.username as author_name
            FROM recipes r
            LEFT JOIN users u ON r.author_id = u.id
            WHERE 1=1
        ";
        $params = [];
        
        if (!empty($category)) {
            $sql .= " AND r.category = ?";
            $params[] = $category;
        }
        
        if (!empty($search)) {
            $sql .= " AND (r.title LIKE ? OR r.description LIKE ? OR r.ingredients LIKE ?)";
            $searchTerm = "%$search%";
            $params[] = $searchTerm;
            $params[] = $searchTerm;
            $params[] = $searchTerm;
        }
        
        $sql .= " ORDER BY r.created_at DESC";
        
        $stmt = $db->prepare($sql);
        $stmt->execute($params);
        $recipes = $stmt->fetchAll();
        
        jsonSuccess('Receitas carregadas.', ['recipes' => $recipes]);
        
    } catch (PDOException $e) {
        jsonError('Erro ao carregar receitas: ' . $e->getMessage(), 500);
    }
}

// ============================================
// CRIAR RECEITA
// ============================================
if ($method === 'POST' && isset($input['action']) && $input['action'] === 'create') {
    $sessionToken = $input['sessionToken'] ?? '';
    
    if (empty($sessionToken)) {
        jsonError('Token de sessão não fornecido.', 401);
    }
    
    try {
        $db = getDB();
        
        // Verificar sessão
        $stmt = $db->prepare("SELECT user_id FROM sessions WHERE session_token = ? AND (expires_at IS NULL OR expires_at > NOW())");
        $stmt->execute([$sessionToken]);
        $session = $stmt->fetch();
        
        if (!$session) {
            jsonError('Sessão inválida ou expirada.', 401);
        }
        
        $userId = $session['user_id'];
        
        // Criar receita
        $stmt = $db->prepare("
            INSERT INTO recipes (title, category, subcategory, description, ingredients, quantities, instructions, image, prep_time, cook_time, servings, difficulty, author_id, is_draft, visibility) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ");
        $stmt->execute([
            $input['title'] ?? '',
            $input['category'] ?? '',
            $input['subcategory'] ?? null,
            $input['description'] ?? '',
            $input['ingredients'] ?? '',
            $input['quantities'] ?? null,
            $input['instructions'] ?? '',
            $input['image'] ?? null,
            $input['prepTime'] ?? null,
            $input['cookTime'] ?? null,
            $input['servings'] ?? null,
            $input['difficulty'] ?? 'Média',
            $userId,
            $input['isDraft'] ?? false,
            $input['visibility'] ?? 'public'
        ]);
        
        $recipeId = $db->lastInsertId();
        
        // Registar atividade
        $stmt = $db->prepare("
            INSERT INTO activities (user_id, type, description) 
            VALUES (?, 'recipe_create', ?)
        ");
        $stmt->execute([$userId, "Criou receita: {$input['title']}"]);
        
        // Buscar receita criada
        $stmt = $db->prepare("
            SELECT r.*, u.username as author_name
            FROM recipes r
            LEFT JOIN users u ON r.author_id = u.id
            WHERE r.id = ?
        ");
        $stmt->execute([$recipeId]);
        $recipe = $stmt->fetch();
        
        jsonSuccess('Receita criada com sucesso!', ['recipe' => $recipe]);
        
    } catch (PDOException $e) {
        jsonError('Erro ao criar receita: ' . $e->getMessage(), 500);
    }
}

// ============================================
// ATUALIZAR RECEITA
// ============================================
if ($method === 'POST' && isset($input['action']) && $input['action'] === 'update') {
    $sessionToken = $input['sessionToken'] ?? '';
    $recipeId = $input['recipeId'] ?? 0;
    
    if (empty($sessionToken)) {
        jsonError('Token de sessão não fornecido.', 401);
    }
    
    try {
        $db = getDB();
        
        // Verificar sessão
        $stmt = $db->prepare("SELECT user_id FROM sessions WHERE session_token = ? AND (expires_at IS NULL OR expires_at > NOW())");
        $stmt->execute([$sessionToken]);
        $session = $stmt->fetch();
        
        if (!$session) {
            jsonError('Sessão inválida ou expirada.', 401);
        }
        
        $userId = $session['user_id'];
        
        // Verificar se a receita pertence ao utilizador
        $stmt = $db->prepare("SELECT author_id FROM recipes WHERE id = ?");
        $stmt->execute([$recipeId]);
        $recipe = $stmt->fetch();
        
        if (!$recipe || $recipe['author_id'] != $userId) {
            jsonError('Não tem permissão para editar esta receita.', 403);
        }
        
        // Atualizar receita
        $updates = [];
        $params = [];
        
        if (isset($input['title'])) {
            $updates[] = "title = ?";
            $params[] = $input['title'];
        }
        if (isset($input['category'])) {
            $updates[] = "category = ?";
            $params[] = $input['category'];
        }
        if (isset($input['description'])) {
            $updates[] = "description = ?";
            $params[] = $input['description'];
        }
        if (isset($input['ingredients'])) {
            $updates[] = "ingredients = ?";
            $params[] = $input['ingredients'];
        }
        if (isset($input['instructions'])) {
            $updates[] = "instructions = ?";
            $params[] = $input['instructions'];
        }
        if (isset($input['image'])) {
            $updates[] = "image = ?";
            $params[] = $input['image'];
        }
        if (isset($input['prep_time'])) {
            $updates[] = "prep_time = ?";
            $params[] = $input['prep_time'];
        }
        if (isset($input['cook_time'])) {
            $updates[] = "cook_time = ?";
            $params[] = $input['cook_time'];
        }
        if (isset($input['servings'])) {
            $updates[] = "servings = ?";
            $params[] = $input['servings'];
        }
        if (isset($input['difficulty'])) {
            $updates[] = "difficulty = ?";
            $params[] = $input['difficulty'];
        }
        
        if (!empty($updates)) {
            $params[] = $recipeId;
            $sql = "UPDATE recipes SET " . implode(', ', $updates) . " WHERE id = ?";
            $stmt = $db->prepare($sql);
            $stmt->execute($params);
        }
        
        // Registar atividade
        $stmt = $db->prepare("
            INSERT INTO activities (user_id, type, description) 
            VALUES (?, 'recipe_update', ?)
        ");
        $stmt->execute([$userId, "Atualizou receita ID: $recipeId"]);
        
        jsonSuccess('Receita atualizada com sucesso!');
        
    } catch (PDOException $e) {
        jsonError('Erro ao atualizar receita: ' . $e->getMessage(), 500);
    }
}

// ============================================
// APAGAR RECEITA
// ============================================
if ($method === 'POST' && isset($input['action']) && $input['action'] === 'delete') {
    $sessionToken = $input['sessionToken'] ?? '';
    $recipeId = $input['recipeId'] ?? 0;
    
    if (empty($sessionToken)) {
        jsonError('Token de sessão não fornecido.', 401);
    }
    
    try {
        $db = getDB();
        
        // Verificar sessão
        $stmt = $db->prepare("SELECT user_id FROM sessions WHERE session_token = ? AND (expires_at IS NULL OR expires_at > NOW())");
        $stmt->execute([$sessionToken]);
        $session = $stmt->fetch();
        
        if (!$session) {
            jsonError('Sessão inválida ou expirada.', 401);
        }
        
        $userId = $session['user_id'];
        
        // Verificar se a receita pertence ao utilizador
        $stmt = $db->prepare("SELECT author_id FROM recipes WHERE id = ?");
        $stmt->execute([$recipeId]);
        $recipe = $stmt->fetch();
        
        if (!$recipe || $recipe['author_id'] != $userId) {
            jsonError('Não tem permissão para apagar esta receita.', 403);
        }
        
        // Apagar receita
        $stmt = $db->prepare("DELETE FROM recipes WHERE id = ?");
        $stmt->execute([$recipeId]);
        
        // Registar atividade
        $stmt = $db->prepare("
            INSERT INTO activities (user_id, type, description) 
            VALUES (?, 'recipe_delete', ?)
        ");
        $stmt->execute([$userId, "Apagou receita ID: $recipeId"]);
        
        jsonSuccess('Receita apagada com sucesso!');
        
    } catch (PDOException $e) {
        jsonError('Erro ao apagar receita: ' . $e->getMessage(), 500);
    }
}

// ============================================
// TOGGLE FAVORITO
// ============================================
if ($method === 'POST' && isset($input['action']) && $input['action'] === 'toggle_favorite') {
    $sessionToken = $input['sessionToken'] ?? '';
    $recipeId = $input['recipeId'] ?? 0;
    
    if (empty($sessionToken)) {
        jsonError('Token de sessão não fornecido.', 401);
    }
    
    try {
        $db = getDB();
        
        // Verificar sessão
        $stmt = $db->prepare("SELECT user_id FROM sessions WHERE session_token = ? AND (expires_at IS NULL OR expires_at > NOW())");
        $stmt->execute([$sessionToken]);
        $session = $stmt->fetch();
        
        if (!$session) {
            jsonError('Sessão inválida ou expirada.', 401);
        }
        
        $userId = $session['user_id'];
        
        // Verificar se já é favorito
        $stmt = $db->prepare("SELECT id FROM favorites WHERE user_id = ? AND recipe_id = ?");
        $stmt->execute([$userId, $recipeId]);
        $favorite = $stmt->fetch();
        
        if ($favorite) {
            // Remover dos favoritos
            $stmt = $db->prepare("DELETE FROM favorites WHERE user_id = ? AND recipe_id = ?");
            $stmt->execute([$userId, $recipeId]);
            
            jsonSuccess('Removido dos favoritos.', ['isFavorite' => false]);
        } else {
            // Adicionar aos favoritos
            $stmt = $db->prepare("INSERT INTO favorites (user_id, recipe_id) VALUES (?, ?)");
            $stmt->execute([$userId, $recipeId]);
            
            // Registar atividade
            $stmt = $db->prepare("
                INSERT INTO activities (user_id, type, description) 
                VALUES (?, 'favorite', 'Adicionou receita aos favoritos')
            ");
            $stmt->execute([$userId]);
            
            jsonSuccess('Adicionado aos favoritos!', ['isFavorite' => true]);
        }
        
    } catch (PDOException $e) {
        jsonError('Erro ao atualizar favoritos: ' . $e->getMessage(), 500);
    }
}

// Método não suportado
jsonError('Ação não reconhecida.', 400);
?>
