-- Adicionar coluna user_code à tabela users
USE siteguedes;

-- Adicionar coluna se não existir
ALTER TABLE users ADD COLUMN IF NOT EXISTS user_code VARCHAR(6) UNIQUE AFTER id;

-- Criar função para gerar código único
DELIMITER $$

CREATE FUNCTION IF NOT EXISTS generate_user_code()
RETURNS VARCHAR(6)
DETERMINISTIC
BEGIN
    DECLARE code VARCHAR(6);
    DECLARE code_exists INT;
    
    REPEAT
        -- Gerar código de 6 caracteres (letras maiúsculas e números)
        SET code = UPPER(CONCAT(
            SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1),
            SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1),
            SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1),
            SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1),
            SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1),
            SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1)
        ));
        
        -- Verificar se o código já existe
        SELECT COUNT(*) INTO code_exists FROM users WHERE user_code = code;
    UNTIL code_exists = 0
    END REPEAT;
    
    RETURN code;
END$$

DELIMITER ;

-- Atualizar utilizadores existentes sem user_code
UPDATE users 
SET user_code = (
    SELECT CONCAT(
        SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1),
        SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1),
        SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1),
        SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1),
        SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1),
        SUBSTRING('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', FLOOR(1 + RAND() * 32), 1)
    )
)
WHERE user_code IS NULL OR user_code = '';
