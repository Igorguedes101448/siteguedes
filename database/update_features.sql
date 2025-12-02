-- ============================================
-- ChefGuedes - Atualização da Base de Dados
-- Novas Funcionalidades
-- ============================================

USE siteguedes;

-- ============================================
-- 1. TABELA DE NOTIFICAÇÕES
-- ============================================
CREATE TABLE IF NOT EXISTS notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    type ENUM('friend_request', 'group_invite', 'recipe_share', 'comment', 'like', 'system') NOT NULL,
    title VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    link VARCHAR(500),
    sender_id INT,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_user_unread (user_id, is_read),
    INDEX idx_created (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 2. TABELA DE PEDIDOS DE AMIZADE
-- ============================================
CREATE TABLE IF NOT EXISTS friend_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    status ENUM('pending', 'accepted', 'rejected') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY unique_request (sender_id, receiver_id),
    INDEX idx_receiver_status (receiver_id, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 3. TABELA DE AMIZADES
-- ============================================
CREATE TABLE IF NOT EXISTS friendships (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user1_id INT NOT NULL,
    user2_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user1_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (user2_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY unique_friendship (user1_id, user2_id),
    INDEX idx_user1 (user1_id),
    INDEX idx_user2 (user2_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 4. TABELA DE PARTILHAS DE RECEITAS
-- ============================================
CREATE TABLE IF NOT EXISTS recipe_shares (
    id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT NOT NULL,
    shared_by INT NOT NULL,
    shared_with INT NOT NULL,
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE,
    FOREIGN KEY (shared_by) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (shared_with) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_recipe (recipe_id),
    INDEX idx_shared_with (shared_with)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 5. ATUALIZAR TABELA RECIPES
-- ============================================
-- Adicionar campos para rascunhos e privacidade
ALTER TABLE recipes 
ADD COLUMN is_draft BOOLEAN DEFAULT FALSE AFTER author_id,
ADD COLUMN visibility ENUM('public', 'private', 'friends') DEFAULT 'public' AFTER is_draft,
ADD COLUMN subcategory VARCHAR(50) AFTER category;

-- ============================================
-- 6. ÍNDICES ADICIONAIS
-- ============================================
-- Melhorar performance
CREATE INDEX idx_draft ON recipes(is_draft);
CREATE INDEX idx_visibility ON recipes(visibility);
CREATE INDEX idx_subcategory ON recipes(subcategory);

-- ============================================
-- MENSAGEM DE SUCESSO
-- ============================================
SELECT 'Base de dados atualizada com sucesso!' AS Status;
