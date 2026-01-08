-- ============================================
-- ChefGuedes - Criar Conta de Administrador
-- Use este ficheiro se os campos já existirem
-- ============================================

USE siteguedes;

-- Remover admin anterior se existir
DELETE FROM users WHERE email = 'admin@chefguedes.pt';

-- Criar nova conta admin
-- Email: admin@chefguedes.pt
-- Password: admin123 (ALTERE APÓS O PRIMEIRO LOGIN!)
INSERT INTO users (
    username, 
    email, 
    password, 
    is_admin, 
    user_code, 
    created_at
) VALUES (
    'admin',
    'admin@chefguedes.pt',
    '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
    1,
    'ADMIN1',
    NOW()
);

-- Verificar conta criada
SELECT 
    id, 
    username, 
    email, 
    is_admin, 
    created_at 
FROM users 
WHERE email = 'admin@chefguedes.pt';

-- Mensagens
SELECT '✅ Conta de administrador criada!' AS Status;
SELECT '📧 Email: admin@chefguedes.pt' AS Login;
SELECT '🔑 Password: admin123' AS Password;
