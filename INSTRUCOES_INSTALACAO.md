# 🚀 Instruções de Instalação - Atualizações ChefGuedes

## ⚠️ IMPORTANTE: Execute estas etapas antes de usar o sistema!

---

## 📋 Passo 1: Atualizar a Base de Dados

### Opção A - Usando phpMyAdmin (Recomendado):
1. Abra o phpMyAdmin (geralmente em http://localhost/phpmyadmin)
2. Selecione a base de dados `siteguedes` na barra lateral esquerda
3. Clique no separador **SQL** no topo
4. Abra o ficheiro `database/update_recipes_table.sql` num editor de texto
5. Copie todo o conteúdo
6. Cole na área de texto do phpMyAdmin
7. Clique em **Executar** (ou **Go**)
8. Deverá ver a mensagem: "Tabela recipes atualizada com sucesso!"

### Opção B - Usando linha de comandos:
```bash
cd C:\wamp64\www\siteguedes
mysql -u root -p siteguedes < database\update_recipes_table.sql
```

---

## ✅ O que foi corrigido?

### 1️⃣ Botão "Nova Receita" na Dashboard
- **Antes:** Redirecionava para página de explorar receitas
- **Agora:** Abre corretamente a página de criação de receitas

### 2️⃣ Página de Criação de Receitas
Agora inclui TODOS os campos pedidos:
- ✅ Título da receita
- ✅ Tempo de preparação
- ✅ Tempo de cozedura
- ✅ Ingredientes (um por linha)
- ✅ **Quantidades (NOVO!)** - campo separado para quantidades
- ✅ Modo de preparação
- ✅ Categoria (com subcategorias dinâmicas)
- ✅ Upload de imagem (com pré-visualização)
- ✅ Escolha de visibilidade (Pública/Privada/Amigos)
- ✅ Opção de guardar como rascunho

### 3️⃣ Sistema de Grupos
- **Problema:** Grupos não estavam a ser guardados na base de dados
- **Causa:** Código estava a usar localStorage em vez da API
- **Solução:** Código reescrito para usar corretamente a API PHP
- **Resultado:** Grupos agora são persistidos na base de dados MySQL

---

## 🧪 Como Testar

### Testar Criação de Receita:
1. Inicie sessão no site
2. Vá para Dashboard
3. Clique em **"+ Nova Receita"**
4. Preencha todos os campos:
   - Título: "Bacalhau à Brás"
   - Categoria: "Prato Principal" → Subcategoria: "Peixe"
   - Ingredientes:
     ```
     Bacalhau demolhado
     Batata palha
     Ovos
     Cebola
     Azeitonas
     ```
   - Quantidades:
     ```
     400g
     200g
     6 unidades
     2 unidades
     a gosto
     ```
   - Tempo de Preparação: 20 min
   - Tempo de Cozedura: 15 min
   - Doses: 4
   - Upload de imagem
   - Visibilidade: Pública
5. Clique em **"Publicar Receita"**
6. Deverá ver mensagem de sucesso

### Testar Sistema de Grupos:
1. Vá para **"Grupos"** no menu
2. Clique em **"+ Criar Novo Grupo"**
3. Preencha:
   - Nome: "Família Silva"
   - Descrição: "Grupo familiar para planear refeições"
4. Clique em **"Criar Grupo"**
5. O grupo deverá aparecer na lista
6. Clique no grupo para ver detalhes

---

## 📁 Ficheiros Alterados

| Ficheiro | O que mudou |
|----------|-------------|
| `pages/dashboard.html` | Link do botão Nova Receita corrigido |
| `pages/nova-receita.html` | Adicionado campo de quantidades |
| `pages/grupos.html` | Corrigido para usar API em vez de localStorage |
| `database/schema.sql` | Estrutura da tabela recipes atualizada |
| `database/update_recipes_table.sql` | **NOVO** - Script de migração |
| `api/recipes.php` | Suporte aos novos campos |

---

## 🔍 Verificar se está a Funcionar

### Verificar na Base de Dados:

#### Ver receitas criadas:
```sql
SELECT id, title, category, subcategory, visibility, is_draft 
FROM recipes 
ORDER BY created_at DESC;
```

#### Ver grupos criados:
```sql
SELECT g.*, u.username as criador
FROM groups g
LEFT JOIN users u ON g.created_by = u.id
ORDER BY g.created_at DESC;
```

#### Ver se os campos novos foram adicionados:
```sql
DESCRIBE recipes;
```

Deverá ver os campos:
- `subcategory`
- `quantities`
- `visibility`
- `is_draft`

---

## ❓ FAQ - Perguntas Frequentes

### O botão "Nova Receita" ainda redireciona para o sítio errado
→ Limpe a cache do navegador (Ctrl + Shift + Delete)

### Ao criar receita aparece erro na base de dados
→ Certifique-se de que executou o script `update_recipes_table.sql`

### Os grupos não aparecem depois de criados
→ Verifique se o WAMP está a correr e se a base de dados está ativa

### Como adicionar membros a um grupo?
→ Esta funcionalidade será implementada em breve. Por enquanto, apenas o criador é membro.

---

## 📞 Suporte

Se encontrar algum problema:
1. Verifique se executou o script de atualização da BD
2. Verifique se o WAMP está a correr
3. Verifique a consola do navegador (F12) para erros JavaScript
4. Verifique os logs do PHP para erros de servidor

---

## ✨ Melhorias Futuras Sugeridas

- [ ] Sistema de convites para grupos
- [ ] Edição de receitas existentes
- [ ] Galeria de imagens para receitas
- [ ] Sistema de comentários em receitas
- [ ] Avaliações e classificações
- [ ] Partilha de receitas nas redes sociais
- [ ] Impressão de receitas em formato PDF
- [ ] Lista de compras automática baseada em receitas

---

**Data da Atualização:** 26 de novembro de 2025
**Versão:** 1.1.0
