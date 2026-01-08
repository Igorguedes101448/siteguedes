-- ============================================
-- ChefGuedes - Sistema de Administração
-- Atualização da Base de Dados para suporte Admin
-- EXECUTE ESTE FICHEIRO NO phpMyAdmin OU MySQL
-- ============================================
-- NOTA: Se alguma coluna/tabela já existir, verá um erro.
--       Pode ignorar esses erros com segurança.
-- ============================================

USE siteguedes;

-- ============================================
-- ATUALIZAR TABELA: users
-- Adicionar campos de administração e moderação
-- ============================================

-- Adicionar colunas (uma de cada vez)
ALTER TABLE users ADD COLUMN is_admin BOOLEAN DEFAULT FALSE AFTER password;
ALTER TABLE users ADD COLUMN banned BOOLEAN DEFAULT FALSE AFTER is_admin;
ALTER TABLE users ADD COLUMN banned_reason TEXT NULL AFTER banned;
ALTER TABLE users ADD COLUMN suspended_until TIMESTAMP NULL AFTER banned_reason;
ALTER TABLE users ADD COLUMN warning_count INT DEFAULT 0 AFTER suspended_until;

-- Adicionar índice
ALTER TABLE users ADD INDEX idx_is_admin (is_admin);

-- ============================================
-- CRIAR CONTA DE ADMINISTRADOR
-- ============================================

-- Remover admin anterior se existir
DELETE FROM users WHERE email = 'admin@chefguedes.pt';

-- Criar nova conta admin
-- Email: admin@chefguedes.pt
-- Password: admin123 (ALTERE APÓS O PRIMEIRO LOGIN!)
INSERT INTO users (
    username, 
-- ============================================
-- CRIAR TABELA: admin_actions
-- Registo de todas as ações de moderação
-- ============================================
CREATE TABLE IF NOT EXISTS admin_actions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    admin_id INT NOT NULL COMMENT 'ID do administrador que executou a ação',
    action_type ENUM('ban', 'unban', 'suspend', 'unsuspend', 'warn', 'delete_recipe', 'restore_user') NOT NULL,
    target_user_id INT NULL COMMENT 'ID do utilizador afetado (se aplicável)',
    target_recipe_id INT NULL COMMENT 'ID da receita afetada (se aplicável)',
    reason TEXT NULL COMMENT 'Motivo da ação',
    details JSON NULL COMMENT 'Detalhes adicionais em formato JSON',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (admin_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (target_user_id) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_admin_id (admin_id),
    INDEX idx_target_user (target_user_id),
    INDEX idx_action_type (action_type),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- CRIAR TABELA: reports
-- Sistema de denúncias de utilizadores
-- ============================================
CREATE TABLE IF NOT EXISTS reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reporter_id INT NOT NULL COMMENT 'Utilizador que fez a denúncia',
    reported_user_id INT NULL COMMENT 'Utilizador denunciado',
    reported_recipe_id INT NULL COMMENT 'Receita denunciada',
    report_type ENUM('spam', 'inappropriate', 'harassment', 'copyright', 'other') NOT NULL,
    description TEXT NOT NULL,
    status ENUM('pending', 'reviewed', 'resolved', 'dismissed') DEFAULT 'pending',
    reviewed_by INT NULL COMMENT 'Admin que revisou',
    reviewed_at TIMESTAMP NULL,
    resolution_notes TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reporter_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (reported_user_id) REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (reported_recipe_id) REFERENCES recipes(id) ON DELETE SET NULL,
    FOREIGN KEY (reviewed_by) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_reporter (reporter_id),
    INDEX idx_reported_user (reported_user_id),
    INDEX idx_status (status),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Inserir registo de migração
-- ============================================
INSERT INTO migrations (version, description) VALUES 
('1.1.0', 'Sistema de Administração e Moderação completo')
ON DUPLICATE KEY UPDATE version=version;

-- ============================================
-- SUCESSO!
-- ============================================
SELECT '✅ Base de dados atualizada com sucesso!' AS Status;
SELECT '🔧 Tabelas admin_actions e reports criadas' AS Info;
SELECT '📋 Campos de moderação adicionados à tabela users' AS Info2;
SELECT '⚠️  Próximo passo: Execute install_admin.php para criar conta admin' AS Proximo_Passo;
