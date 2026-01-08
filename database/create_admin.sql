-- ============================================
-- ChefGuedes - Adicionar Sistema de Admin
-- Adiciona campo is_admin e cria conta admin
-- ============================================

USE siteguedes;

-- Adicionar campo is_admin à tabela users
ALTER TABLE users ADD COLUMN is_admin BOOLEAN DEFAULT FALSE;

-- Adicionar campo banned à tabela users (para banir utilizadores)
ALTER TABLE users ADD COLUMN banned BOOLEAN DEFAULT FALSE;

-- Adicionar campo banned_at à tabela users
ALTER TABLE users ADD COLUMN banned_at TIMESTAMP NULL;

-- Adicionar campo banned_reason à tabela users
ALTER TABLE users ADD COLUMN banned_reason TEXT NULL;

-- Criar índice para is_admin
ALTER TABLE users ADD INDEX idx_is_admin (is_admin);

-- Criar conta admin
-- Email: admin@chefguedes.pt
-- Password: admin123
-- (Altere a password após o primeiro login!)

-- Verificar se admin já existe
DELETE FROM users WHERE email = 'admin@chefguedes.pt';

INSERT INTO users (username, email, password, is_admin, user_code, created_at) 
VALUES (
    'admin',
    'admin@chefguedes.pt',
    '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', -- password: admin123
    TRUE,
    'ADMIN1',
    NOW()
);

-- Mensagem de confirmação
SELECT 'Sistema de administração criado com sucesso!' as message;
SELECT 'Email: admin@chefguedes.pt' as credenciais;
SELECT 'Password: admin123' as credenciais2;
SELECT 'IMPORTANTE: Altere a password após o primeiro login!' as aviso;
