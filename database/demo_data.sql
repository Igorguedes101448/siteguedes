-- ============================================
-- ChefGuedes - Dados de Demonstração (OPCIONAL)
-- Execute este ficheiro se quiser ter dados iniciais para testar
-- ============================================

USE chefguedes;

-- Criar utilizador de demonstração
-- Username: demo
-- Email: demo@chefguedes.pt
-- Password: demo123
INSERT INTO users (id, username, email, password, bio, location, created_at) VALUES
(1, 'Chef Demo', 'demo@chefguedes.pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Utilizador de demonstração do ChefGuedes', 'Lisboa, Portugal', NOW())
ON DUPLICATE KEY UPDATE username=username;

-- Preferências do utilizador demo
INSERT INTO user_preferences (user_id, cuisines, restrictions, newsletter, notifications) VALUES
(1, 'Portuguesa,Italiana,Asiática', 'Vegetariano', 1, 1)
ON DUPLICATE KEY UPDATE user_id=user_id;

-- Receitas portuguesas tradicionais
INSERT INTO recipes (title, category, description, ingredients, instructions, prep_time, cook_time, servings, difficulty, author_id, created_at) VALUES
('Bacalhau à Brás', 'Prato Principal', 'Um clássico da cozinha portuguesa. Delicioso bacalhau desfiado com batata palha e ovos.', 
'Bacalhau demolhado (400g)
Batatas (500g)
Cebolas (2 unidades)
Ovos (6 unidades)
Alho (3 dentes)
Salsa picada
Azeite
Azeitonas pretas
Sal e pimenta', 
'1. Demolhar o bacalhau durante 24-48 horas, mudando a água várias vezes
2. Cozer o bacalhau e desfiar, retirando peles e espinhas
3. Cortar as batatas em palitos finos e fritar
4. Refogar a cebola e o alho picados em azeite
5. Juntar o bacalhau desfiado e deixar saltear
6. Adicionar as batatas fritas escorridas
7. Bater os ovos e juntar ao preparado, mexendo rapidamente
8. Temperar com sal e pimenta
9. Servir decorado com azeitonas e salsa', 
30, 30, 4, 'Média', 1, NOW()),

('Arroz de Pato', 'Prato Principal', 'Prato tradicional português perfeito para ocasiões especiais.',
'Pato inteiro (1 unidade)
Arroz carolino (400g)
Chouriço (200g)
Presunto (100g)
Cebola (2 unidades)
Alho (4 dentes)
Folha de louro
Vinho branco
Caldo de pato
Laranja
Azeite
Sal e pimenta',
'1. Cozinhar o pato em água com cebola, alho e louro até ficar tenro
2. Desfiar o pato e reservar o caldo
3. Cortar o chouriço em rodelas e o presunto em cubos
4. Refogar cebola picada e adicionar o arroz
5. Juntar o caldo do pato gradualmente até o arroz ficar cozido
6. Misturar o pato desfiado, chouriço e presunto
7. Levar ao forno para gratinar
8. Servir com gomos de laranja',
45, 90, 6, 'Difícil', 1, NOW()),

('Pastel de Nata', 'Sobremesa', 'O doce mais famoso de Portugal! Deliciosos pastéis de nata caseiros.',
'Massa folhada (300g)
Leite (500ml)
Açúcar (250g)
Gemas (6 unidades)
Farinha (2 colheres de sopa)
Canela em pau
Raspa de limão
Canela em pó (para polvilhar)',
'1. Preparar um creme: ferver o leite com a canela em pau e raspa de limão
2. Misturar o açúcar com a farinha e as gemas
3. Juntar o leite quente aos poucos, mexendo sempre
4. Levar ao lume até engrossar
5. Forrar formas de pastéis com a massa folhada
6. Rechear com o creme
7. Levar ao forno a 250°C até a superfície caramelizar
8. Polvilhar com canela',
20, 20, 12, 'Média', 1, NOW()),

('Caldo Verde', 'Entrada', 'Sopa tradicional portuguesa perfeita para dias frios.',
'Batatas (6 unidades)
Couve galega (400g)
Chouriço (200g)
Cebola (1 unidade)
Alho (3 dentes)
Azeite
Sal',
'1. Cozer as batatas com a cebola e o alho
2. Triturar até obter um puré cremoso
3. Cortar a couve em juliana bem fina
4. Juntar a couve ao caldo e deixar ferver 5 minutos
5. Fritar as rodelas de chouriço
6. Servir o caldo com o chouriço e um fio de azeite',
15, 30, 6, 'Fácil', 1, NOW()),

('Francesinha', 'Prato Principal', 'Prato icônico do Porto. Uma explosão de sabores!',
'Pão de forma (4 fatias)
Bife de vaca (2 unidades)
Salsicha fresca (2 unidades)
Presunto (4 fatias)
Queijo (200g)
Molho de tomate
Cerveja
Mostarda
Piri-piri
Batatas fritas
Ovo (1 unidade)',
'1. Grelhar os bifes e as salsichas
2. Preparar o molho: tomate, cerveja, mostarda e piri-piri
3. Montar: pão, bife, presunto, salsicha, pão
4. Cobrir com queijo e levar ao forno
5. Cobrir com o molho bem quente
6. Servir com batata frita e ovo estrelado',
25, 25, 2, 'Média', 1, NOW()),

('Açorda Alentejana', 'Prato Principal', 'Prato tradicional do Alentejo, reconfortante e saboroso.',
'Pão alentejano (400g)
Alho (6 dentes)
Coentros frescos
Ovos (4 unidades)
Azeite
Água quente
Sal',
'1. Cortar o pão em fatias finas
2. Numa tigela, esmagar o alho com sal
3. Adicionar os coentros picados e azeite
4. Juntar água quente e mexer
5. Colocar o pão e deixar amolecer
6. Escalfar os ovos
7. Servir a açorda com os ovos por cima',
10, 15, 4, 'Fácil', 1, NOW());

-- Criar um grupo de exemplo
INSERT INTO groups (name, description, created_by, created_at) VALUES
('Amantes de Culinária Portuguesa', 'Grupo dedicado às receitas tradicionais portuguesas', 1, NOW());

-- Adicionar o utilizador demo como membro admin do grupo
INSERT INTO group_members (group_id, user_id, role, joined_at) VALUES
(1, 1, 'admin', NOW());

-- Registar algumas atividades
INSERT INTO activities (user_id, type, description, created_at) VALUES
(1, 'register', 'Novo utilizador: Chef Demo', NOW()),
(1, 'recipe_create', 'Criou receita: Bacalhau à Brás', NOW()),
(1, 'recipe_create', 'Criou receita: Arroz de Pato', NOW()),
(1, 'group_create', 'Criou grupo: Amantes de Culinária Portuguesa', NOW());

-- ============================================
-- Dados inseridos com sucesso!
-- ============================================
-- 
-- CREDENCIAIS DE TESTE:
-- Email: demo@chefguedes.pt
-- Password: demo123
-- 
-- ============================================
