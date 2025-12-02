-- ============================================
-- Atualização da tabela recipes
-- Adiciona campos: subcategory, quantities, visibility, is_draft
-- ============================================

USE siteguedes;

-- Adicionar campo subcategory
ALTER TABLE recipes ADD COLUMN subcategory VARCHAR(100) AFTER category;

-- Adicionar campo quantities
ALTER TABLE recipes ADD COLUMN quantities TEXT AFTER ingredients;

-- Adicionar campo visibility
ALTER TABLE recipes ADD COLUMN visibility ENUM('public', 'private', 'friends') DEFAULT 'public' AFTER difficulty;

-- Adicionar campo is_draft
ALTER TABLE recipes ADD COLUMN is_draft BOOLEAN DEFAULT FALSE AFTER visibility;

-- Adicionar índice para visibility
ALTER TABLE recipes ADD INDEX idx_visibility (visibility);

-- Registar migração
INSERT INTO migrations (version, description) VALUES 
('1.1.0', 'Adicionados campos subcategory, quantities, visibility e is_draft à tabela recipes')
ON DUPLICATE KEY UPDATE version=version;

SELECT 'Tabela recipes atualizada com sucesso!' as status;
