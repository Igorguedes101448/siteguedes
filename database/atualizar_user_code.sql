-- ============================================
-- Atualização: Adicionar user_code à tabela users
-- Execute este script no phpMyAdmin ou MySQL Workbench
-- ============================================

USE siteguedes;

-- Passo 1: Adicionar coluna user_code (ignorar erro se já existir)
SET @query = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA = 'siteguedes' 
     AND TABLE_NAME = 'users' 
     AND COLUMN_NAME = 'user_code') = 0,
    'ALTER TABLE users ADD COLUMN user_code VARCHAR(6) UNIQUE COMMENT "Código único para convites" AFTER id',
    'SELECT "Coluna user_code já existe" AS info'
);
PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Passo 2: Criar índice (se necessário)
SET @query = IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS 
     WHERE TABLE_SCHEMA = 'siteguedes' 
     AND TABLE_NAME = 'users' 
     AND INDEX_NAME = 'idx_user_code') = 0,
    'CREATE INDEX idx_user_code ON users(user_code)',
    'SELECT "Índice idx_user_code já existe" AS info'
);
PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Passo 3: Gerar códigos únicos para utilizadores existentes
UPDATE users 
SET user_code = UPPER(CONCAT(
    SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1),
    SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1),
    SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1),
    SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1),
    SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1),
    SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1)
))
WHERE user_code IS NULL OR user_code = '';

-- Verificar resultados
SELECT 
    COUNT(*) as total_utilizadores,
    COUNT(user_code) as com_codigo,
    COUNT(*) - COUNT(user_code) as sem_codigo
FROM users;

SELECT '✅ Atualização concluída!' AS Status;
SELECT 'Todos os utilizadores agora têm um código único de 6 caracteres.' AS Info;

-- Ver alguns exemplos
SELECT id, username, user_code 
FROM users 
LIMIT 5;
