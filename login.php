<?php
session_start();
require_once 'api/db.php';

$error = '';

// Verificar se já está logado
if (isset($_SESSION['user_id'])) {
    header('Location: pages/dashboard.html');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';
    $rememberMe = isset($_POST['rememberMe']);
    
    if (empty($email) || empty($password)) {
        $error = 'Preencha todos os campos.';
    } else {
        try {
            $db = getDB();
            
            // Buscar utilizador
            $stmt = $db->prepare("SELECT * FROM users WHERE email = ?");
            $stmt->execute([$email]);
            $user = $stmt->fetch();
            
            if (!$user || !password_verify($password, $user['password'])) {
                $error = 'Email ou palavra-passe incorretos.';
            } else {
                // Login bem-sucedido
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['username'] = $user['username'];
                $_SESSION['email'] = $user['email'];
                
                // Criar token de sessão na BD
                $sessionToken = bin2hex(random_bytes(32));
                $expiresAt = $rememberMe ? date('Y-m-d H:i:s', strtotime('+30 days')) : date('Y-m-d H:i:s', strtotime('+24 hours'));
                
                $stmt = $db->prepare("INSERT INTO sessions (user_id, session_token, remember_me, expires_at) VALUES (?, ?, ?, ?)");
                $stmt->execute([$user['id'], $sessionToken, $rememberMe ? 1 : 0, $expiresAt]);
                
                // Redirecionar
                header('Location: pages/dashboard.html');
                exit;
            }
        } catch (PDOException $e) {
            $error = 'Erro de conexão. Certifique-se de que a base de dados foi criada.';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - ChefGuedes</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        .auth-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
        }
        .auth-card {
            background-color: var(--bg-card);
            border-radius: var(--border-radius);
            box-shadow: var(--shadow-lg);
            padding: 50px 40px;
            width: 100%;
            max-width: 450px;
        }
        .auth-header h1 {
            color: var(--primary-color);
            font-size: 2.5rem;
            margin-bottom: 10px;
            text-align: center;
        }
        .error-message {
            background-color: rgba(230, 57, 70, 0.1);
            border: 2px solid var(--danger-color);
            color: var(--danger-color);
            padding: 12px;
            border-radius: var(--border-radius-sm);
            margin-bottom: 20px;
            font-weight: 600;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-header">
                <h1>ChefGuedes</h1>
                <p>Bem-vindo de volta! Faça login para continuar.</p>
            </div>

            <?php if ($error): ?>
                <div class="error-message"><?php echo htmlspecialchars($error); ?></div>
            <?php endif; ?>

            <form method="POST" class="auth-form">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required placeholder="seu@email.com">
                </div>

                <div class="form-group">
                    <label for="password">Palavra-passe:</label>
                    <input type="password" id="password" name="password" required placeholder="••••••••">
                </div>

                <div class="form-group checkbox-group">
                    <label>
                        <input type="checkbox" id="rememberMe" name="rememberMe">
                        Lembrar-me neste dispositivo
                    </label>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary" style="width: 100%;">Iniciar Sessão</button>
                </div>
            </form>

            <div class="auth-link" style="text-align: center; margin-top: 20px;">
                Ainda não tens conta? <a href="registo.php">Regista-te aqui</a>
            </div>

            <div class="back-home" style="text-align: center; margin-top: 15px;">
                <a href="index.html">← Voltar à página inicial</a>
            </div>
        </div>
    </div>
</body>
</html>
