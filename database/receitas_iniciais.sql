-- ============================================
-- ChefGuedes - Receitas Iniciais Portuguesas
-- Receitas tradicionais para popular o site
-- ============================================

USE siteguedes;

-- Inserir receitas tradicionais portuguesas
INSERT INTO recipes (title, category, subcategory, description, ingredients, instructions, prep_time, cook_time, servings, difficulty, author_id, is_draft, visibility) VALUES

('Bacalhau à Brás', 'Prato Principal', 'Peixe', 
'Um dos pratos mais emblemáticos da gastronomia portuguesa, o Bacalhau à Brás combina bacalhau desfiado, batata palha e ovos num refogado delicioso.',
'400g de bacalhau demolhado
300g de batata palha
6 ovos
2 cebolas grandes
3 dentes de alho
4 colheres de sopa de azeite
Azeitonas pretas a gosto
Salsa fresca
Sal e pimenta q.b.',
'1. Demolhe o bacalhau durante 24-48h, trocando a água várias vezes
2. Coza o bacalhau em água fervente por 5 minutos
3. Escorra, deixe arrefecer e desfie, removendo peles e espinhas
4. Corte a cebola em meias-luas finas e pique o alho
5. Numa frigideira grande, aqueça o azeite e refogue a cebola até ficar transparente
6. Adicione o alho e refogue por 1 minuto
7. Junte o bacalhau desfiado e misture bem
8. Adicione a batata palha e envolva delicadamente
9. Bata os ovos ligeiramente e adicione à frigideira
10. Mexa continuamente até os ovos ficarem cremosos
11. Tempere com sal e pimenta
12. Sirva decorado com azeitonas pretas e salsa picada',
30, 20, 4, 'Média', 1, 0, 'public'),

('Caldo Verde', 'Entrada', 'Vegetarianas', 
'Sopa tradicional portuguesa, originária do Minho, feita com couve galega, batata e chouriço. Perfeita para os dias frios.',
'1kg de batatas
500g de couve galega
1 chouriço
1 cebola
2 dentes de alho
4 colheres de sopa de azeite
Sal q.b.
2 litros de água',
'1. Descasque e corte as batatas em pedaços
2. Numa panela grande, aqueça o azeite e refogue a cebola picada
3. Adicione o alho esmagado e refogue por 1 minuto
4. Junte as batatas e a água, tempere com sal
5. Deixe cozer até as batatas estarem muito macias (cerca de 20 min)
6. Triture as batatas com a varinha mágica até obter um puré
7. Lave a couve, retire os talos e corte em juliana muito fina
8. Adicione a couve ao caldo e coza por 5 minutos
9. Corte o chouriço em rodelas finas e frite à parte
10. Sirva o caldo bem quente com as rodelas de chouriço e um fio de azeite',
15, 30, 6, 'Fácil', 1, 0, 'public'),

('Arroz de Marisco', 'Prato Principal', 'Peixe', 
'Rico arroz caldoso repleto de mariscos frescos, com um sabor intenso do mar. Uma verdadeira delícia da costa portuguesa.',
'400g de arroz
500g de gambas
500g de amêijoas
500g de mexilhão
300g de lulas
2 tomates maduros
1 cebola
4 dentes de alho
1 pimento vermelho
200ml de vinho branco
1.5L de caldo de peixe
1 molho de coentros
5 colheres de sopa de azeite
Sal, pimenta e colorau q.b.',
'1. Limpe todos os mariscos, deixe as amêijoas em água com sal por 1 hora
2. Corte as lulas em argolas
3. Prepare um refogado com azeite, cebola, alho e pimento
4. Adicione o tomate ralado e deixe refogar bem
5. Junte o colorau e as lulas, refogando por 5 minutos
6. Adicione o vinho branco e deixe evaporar
7. Acrescente o arroz e envolva no refogado
8. Adicione o caldo quente aos poucos, mexendo
9. A meio da cozedura, adicione as gambas e os mexilhões
10. Por último, adicione as amêijoas
11. Cozinhe até o arroz ficar cremoso e os mariscos abrirem
12. Polvilhe coentros picados e deixe repousar 5 minutos',
40, 35, 6, 'Média', 1, 0, 'public'),

('Pastéis de Nata', 'Sobremesa', 'Quentes', 
'Os famosos Pastéis de Belém, com massa folhada crocante e recheio cremoso de nata. Um ícone da doçaria portuguesa.',
'1 rolo de massa folhada (300g)
6 gemas de ovo
200g de açúcar
2 colheres de sopa de farinha Maizena
300ml de leite
200ml de nata
1 pau de canela
Casca de 1 limão
1 colher de chá de baunilha
Canela em pó para decorar',
'1. Pré-aqueça o forno a 250°C
2. Numa panela, misture o açúcar, a farinha e um pouco de leite frio
3. Adicione o resto do leite, a nata, a canela e a casca de limão
4. Leve ao lume médio, mexendo sempre até engrossar
5. Retire do lume, remova a canela e o limão, deixe arrefecer
6. Adicione as gemas e a baunilha, mexendo bem
7. Estenda a massa folhada e corte círculos
8. Forre formas de empadas untadas com manteiga
9. Encha 2/3 de cada forma com o creme
10. Leve ao forno bem quente por 15-20 minutos até caramelizar
11. Retire e deixe arrefecer
12. Polvilhe com canela em pó',
30, 20, 12, 'Difícil', 1, 0, 'public'),

('Francesinha', 'Prato Principal', 'Carne', 
'Prato típico do Porto, um verdadeiro desafio gastronómico: bife, linguiça, salsicha e fiambre, coberto com queijo derretido e molho especial.',
'8 fatias de pão de forma
4 bifes de vaca (150g cada)
4 linguiças frescas
4 salsichas frescas
8 fatias de fiambre
200g de queijo flamengo fatiado
4 ovos
200ml de molho de tomate
200ml de cerveja
300ml de caldo de carne
1 colher de sopa de mostarda
Piri-piri a gosto
1 folha de louro
Manteiga, sal e pimenta q.b.',
'1. Prepare o molho: numa panela, derreta manteiga e adicione molho de tomate
2. Acrescente a cerveja, caldo de carne, mostarda, piri-piri e louro
3. Deixe ferver e reduza por 15 minutos, tempere
4. Grelhe os bifes, linguiças e salsichas
5. Torre ligeiramente as fatias de pão
6. Monte: pão, fiambre, bife, linguiça, salsicha, fiambre, pão
7. Cubra com queijo fatiado generosamente
8. Leve ao forno até o queijo derreter
9. Frite os ovos estrelados
10. Coloque a francesinha no prato, cubra com molho quente
11. Coloque o ovo estrelado por cima
12. Sirva com batatas fritas',
30, 30, 4, 'Média', 1, 0, 'public'),

('Polvo à Lagareiro', 'Prato Principal', 'Peixe', 
'Polvo cozido e grelhado, acompanhado de batatas a murro e regado com azeite. Simples e delicioso.',
'1kg de polvo (limpo)
1kg de batatas pequenas
8 dentes de alho
200ml de azeite virgem extra
Sal grosso
Pimenta preta
2 folhas de louro
Coentros frescos a gosto',
'1. Bata o polvo para amaciar ou congele e descongele
2. Numa panela grande, ferva água com louro e sal
3. Mergulhe o polvo 3 vezes na água fervente
4. Deixe cozer em lume brando por 40-50 minutos
5. Coza as batatas com pele em água com sal
6. Escorra o polvo e corte em pedaços
7. Numa frigideira bem quente, grelhe o polvo até dourar
8. Esmague as batatas cozidas (batatas a murro) e grelhe
9. Aqueça bastante azeite com alho em lâminas
10. Disponha o polvo e as batatas num prato
11. Regue generosamente com o azeite de alho a ferver
12. Tempere com sal grosso, pimenta e coentros',
20, 60, 4, 'Média', 1, 0, 'public'),

('Açorda Alentejana', 'Prato Principal', 'Vegetarianos', 
'Prato tradicional alentejano, feito com pão, alho, coentros e ovos escalfados. Confortante e saboroso.',
'400g de pão alentejano (duro)
4 ovos
6 dentes de alho
1 molho grande de coentros
100ml de azeite virgem extra
Sal q.b.
800ml de água quente
2 colheres de sopa de vinagre',
'1. Corte o pão em fatias ou pedaços pequenos
2. Num almofariz, esmague o alho com sal até formar uma pasta
3. Adicione os coentros picados e continue a esmagar
4. Coloque o pão numa tigela ou terrina
5. Misture a pasta de alho e coentros com água quente
6. Despeje sobre o pão e deixe embeber
7. Adicione o azeite e envolva bem
8. Numa panela, ferva água com vinagre
9. Escalde os ovos até a clara estar cozida mas a gema mole
10. Sirva a açorda em pratos fundos
11. Coloque um ovo escalfado sobre cada porção
12. Regue com um fio de azeite',
15, 10, 4, 'Fácil', 1, 0, 'public'),

('Arroz Doce', 'Sobremesa', 'Frias', 
'Sobremesa tradicional portuguesa cremosa, aromatizada com limão e canela. Presente em todas as festas e celebrações.',
'200g de arroz carolino
1 litro de leite
200g de açúcar
4 gemas de ovo
Casca de 1 limão grande
1 pau de canela
1 pitada de sal
Canela em pó para decorar',
'1. Numa panela, ferva água com sal, casca de limão e pau de canela
2. Adicione o arroz e cozinhe por 5 minutos, escorra
3. Adicione o leite ao arroz e cozinhe em lume brando, mexendo
4. Quando o arroz estiver macio, adicione o açúcar
5. Continue cozinhando até ficar cremoso
6. Bata as gemas ligeiramente
7. Retire um pouco do arroz quente e misture com as gemas
8. Adicione as gemas ao arroz, mexendo rapidamente
9. Cozinhe por mais 2-3 minutos sem ferver
10. Retire a casca de limão e o pau de canela
11. Distribua por taças ou numa travessa
12. Deixe arrefecer e decore com canela em pó
13. Leve ao frigorífico até servir',
10, 40, 8, 'Média', 1, 0, 'public');
