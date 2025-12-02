<?php
// ============================================
// ChefGuedes - API de Grupos
// Gestão completa de grupos
// ============================================

require_once 'db.php';

$method = $_SERVER['REQUEST_METHOD'];
$input = json_decode(file_get_contents('php://input'), true);

// ============================================
// LISTAR TODOS OS GRUPOS
// ============================================
if ($method === 'GET') {
    try {
        $db = getDB();
        
        $sql = "
            SELECT g.*, u.username as created_by_name,
                   (SELECT COUNT(*) FROM group_members WHERE group_id = g.id) as member_count
            FROM groups g
            LEFT JOIN users u ON g.created_by = u.id
            ORDER BY g.created_at DESC
        ";
        
        $stmt = $db->query($sql);
        $groups = $stmt->fetchAll();
        
        jsonSuccess('Grupos carregados.', ['groups' => $groups]);
        
    } catch (PDOException $e) {
        jsonError('Erro ao carregar grupos: ' . $e->getMessage(), 500);
    }
}

// ============================================
// CRIAR GRUPO
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
        
        // Criar grupo
        $stmt = $db->prepare("
            INSERT INTO groups (name, description, image, created_by) 
            VALUES (?, ?, ?, ?)
        ");
        $stmt->execute([
            $input['name'] ?? '',
            $input['description'] ?? '',
            $input['image'] ?? '',
            $userId
        ]);
        
        $groupId = $db->lastInsertId();
        
        // Adicionar criador como membro admin
        $stmt = $db->prepare("
            INSERT INTO group_members (group_id, user_id, role) 
            VALUES (?, ?, 'admin')
        ");
        $stmt->execute([$groupId, $userId]);
        
        // Registar atividade
        $stmt = $db->prepare("
            INSERT INTO activities (user_id, type, description) 
            VALUES (?, 'group_create', ?)
        ");
        $stmt->execute([$userId, "Criou grupo: {$input['name']}"]);
        
        // Buscar grupo criado
        $stmt = $db->prepare("
            SELECT g.*, u.username as created_by_name
            FROM groups g
            LEFT JOIN users u ON g.created_by = u.id
            WHERE g.id = ?
        ");
        $stmt->execute([$groupId]);
        $group = $stmt->fetch();
        
        jsonSuccess('Grupo criado com sucesso!', ['group' => $group]);
        
    } catch (PDOException $e) {
        jsonError('Erro ao criar grupo: ' . $e->getMessage(), 500);
    }
}

// ============================================
// ADICIONAR MEMBRO AO GRUPO (POR USER_CODE)
// ============================================
if ($method === 'POST' && isset($input['action']) && $input['action'] === 'add_member') {
    $sessionToken = $input['sessionToken'] ?? '';
    $groupId = $input['groupId'] ?? 0;
    $userCode = strtoupper(trim($input['userCode'] ?? ''));
    
    if (empty($sessionToken)) {
        jsonError('Token de sessão não fornecido.', 401);
    }
    
    if (empty($userCode) || strlen($userCode) !== 6) {
        jsonError('Código de utilizador inválido.', 400);
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
        
        $adminUserId = $session['user_id'];
        
        // Verificar se o utilizador é admin do grupo
        $stmt = $db->prepare("SELECT role FROM group_members WHERE group_id = ? AND user_id = ?");
        $stmt->execute([$groupId, $adminUserId]);
        $member = $stmt->fetch();
        
        if (!$member || $member['role'] !== 'admin') {
            jsonError('Apenas administradores podem adicionar membros.', 403);
        }
        
        // Buscar utilizador pelo código
        $stmt = $db->prepare("SELECT id, username FROM users WHERE user_code = ?");
        $stmt->execute([$userCode]);
        $targetUser = $stmt->fetch();
        
        if (!$targetUser) {
            jsonError('Utilizador não encontrado com este código.', 404);
        }
        
        // Verificar se já é membro
        $stmt = $db->prepare("SELECT id FROM group_members WHERE group_id = ? AND user_id = ?");
        $stmt->execute([$groupId, $targetUser['id']]);
        if ($stmt->fetch()) {
            jsonError('Este utilizador já é membro do grupo.', 400);
        }
        
        // Adicionar como membro
        $stmt = $db->prepare("INSERT INTO group_members (group_id, user_id, role) VALUES (?, ?, 'member')");
        $stmt->execute([$groupId, $targetUser['id']]);
        
        // Criar notificação para o novo membro
        $stmt = $db->prepare("SELECT name FROM groups WHERE id = ?");
        $stmt->execute([$groupId]);
        $group = $stmt->fetch();
        
        $stmt = $db->prepare("
            INSERT INTO notifications (user_id, type, title, message, link) 
            VALUES (?, 'group_invite', ?, ?, ?)
        ");
        $stmt->execute([
            $targetUser['id'],
            'Adicionado a grupo',
            "Você foi adicionado ao grupo '{$group['name']}'",
            '/pages/grupos.html'
        ]);
        
        jsonSuccess('Membro adicionado com sucesso!', ['user' => $targetUser]);
        
    } catch (PDOException $e) {
        jsonError('Erro ao adicionar membro: ' . $e->getMessage(), 500);
    }
}

// ============================================
// REMOVER MEMBRO DO GRUPO
// ============================================
if ($method === 'POST' && isset($input['action']) && $input['action'] === 'remove_member') {
    $sessionToken = $input['sessionToken'] ?? '';
    $groupId = $input['groupId'] ?? 0;
    $userId = $input['userId'] ?? 0;
    
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
        
        $adminUserId = $session['user_id'];
        
        // Verificar se é admin
        $stmt = $db->prepare("SELECT role FROM group_members WHERE group_id = ? AND user_id = ?");
        $stmt->execute([$groupId, $adminUserId]);
        $member = $stmt->fetch();
        
        if (!$member || $member['role'] !== 'admin') {
            jsonError('Apenas administradores podem remover membros.', 403);
        }
        
        // Não permitir remover admins
        $stmt = $db->prepare("SELECT role FROM group_members WHERE group_id = ? AND user_id = ?");
        $stmt->execute([$groupId, $userId]);
        $targetMember = $stmt->fetch();
        
        if ($targetMember && $targetMember['role'] === 'admin') {
            jsonError('Não é possível remover um administrador.', 403);
        }
        
        // Remover membro
        $stmt = $db->prepare("DELETE FROM group_members WHERE group_id = ? AND user_id = ?");
        $stmt->execute([$groupId, $userId]);
        
        jsonSuccess('Membro removido com sucesso!');
        
    } catch (PDOException $e) {
        jsonError('Erro ao remover membro: ' . $e->getMessage(), 500);
    }
}

// ============================================
// LISTAR MEMBROS DO GRUPO
// ============================================
if ($method === 'POST' && isset($input['action']) && $input['action'] === 'get_members') {
    $groupId = $input['groupId'] ?? 0;
    
    try {
        $db = getDB();
        
        $stmt = $db->prepare("
            SELECT gm.user_id, gm.role, u.username, u.email, u.profile_picture
            FROM group_members gm
            JOIN users u ON gm.user_id = u.id
            WHERE gm.group_id = ?
            ORDER BY gm.role DESC, u.username ASC
        ");
        $stmt->execute([$groupId]);
        $members = $stmt->fetchAll();
        
        jsonSuccess('Membros carregados.', ['members' => $members]);
        
    } catch (PDOException $e) {
        jsonError('Erro ao carregar membros: ' . $e->getMessage(), 500);
    }
}

// ============================================
// APAGAR GRUPO
// ============================================
if ($method === 'POST' && isset($input['action']) && $input['action'] === 'delete') {
    $sessionToken = $input['sessionToken'] ?? '';
    $groupId = $input['groupId'] ?? 0;
    
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
        
        // Verificar se o utilizador é o criador
        $stmt = $db->prepare("SELECT created_by FROM groups WHERE id = ?");
        $stmt->execute([$groupId]);
        $group = $stmt->fetch();
        
        if (!$group || $group['created_by'] != $userId) {
            jsonError('Não tem permissão para apagar este grupo.', 403);
        }
        
        // Apagar grupo (membros serão apagados automaticamente por CASCADE)
        $stmt = $db->prepare("DELETE FROM groups WHERE id = ?");
        $stmt->execute([$groupId]);
        
        // Registar atividade
        $stmt = $db->prepare("
            INSERT INTO activities (user_id, type, description) 
            VALUES (?, 'group_delete', ?)
        ");
        $stmt->execute([$userId, "Apagou grupo ID: $groupId"]);
        
        jsonSuccess('Grupo apagado com sucesso!');
        
    } catch (PDOException $e) {
        jsonError('Erro ao apagar grupo: ' . $e->getMessage(), 500);
    }
}

// Método não suportado
jsonError('Ação não reconhecida.', 400);
?>
