# Correções e Implementações - Site ChefGuedes

## Data: 26 de novembro de 2025

---

## 1. ✅ Botão "Nova Receita" na Dashboard - CORRIGIDO

### Problema:
O botão "Nova Receita" na dashboard estava a redirecionar para `explorar-receitas.html` em vez de abrir a página de criação de receitas.

### Solução:
- **Ficheiro alterado:** `pages/dashboard.html`
- **Alteração:** Link do botão corrigido de `explorar-receitas.html` para `nova-receita.html`

```html
<!-- ANTES -->
<a href="explorar-receitas.html" class="btn btn-primary">+ Nova Receita</a>

<!-- DEPOIS -->
<a href="nova-receita.html" class="btn btn-primary">+ Nova Receita</a>
```

---

## 2. ✅ Página de Criação de Receita - IMPLEMENTADA

### O que foi implementado:

A página `pages/nova-receita.html` já existia e continha a maioria dos campos necessários. Foi adicionado:

#### Campos Implementados:
- ✅ **Nome/título da receita** - Campo de texto obrigatório
- ✅ **Duração da receita** - Campos separados para tempo de preparação e tempo de cozedura
- ✅ **Ingredientes** - Área de texto (um por linha)
- ✅ **Quantidades** - **NOVO CAMPO ADICIONADO** - Área de texto para quantidades correspondentes
- ✅ **Modo de preparação** - Área de texto (passo a passo)
- ✅ **Categoria da receita** - Seleção (Entrada, Prato Principal, Sobremesa, Bebida)
- ✅ **Subcategoria** - Seleção dinâmica baseada na categoria escolhida
- ✅ **Upload de imagem** - Upload via ficheiros com pré-visualização
- ✅ **Visibilidade** - Opção para escolher entre Pública, Privada ou Amigos
- ✅ **Botões** - Publicar Receita, Guardar como Rascunho, Cancelar

#### Ficheiros Alterados:
- **`pages/nova-receita.html`** - Adicionado campo de quantidades
- **`database/schema.sql`** - Atualizada estrutura da tabela `recipes`
- **`api/recipes.php`** - Atualizada para suportar novos campos

#### Novos Campos na Base de Dados:
```sql
- subcategory VARCHAR(100)      -- Subcategoria da receita
- quantities TEXT                -- Quantidades dos ingredientes
- visibility ENUM('public', 'private', 'friends') -- Visibilidade
- is_draft BOOLEAN               -- Se é rascunho ou receita publicada
```

#### Script de Migração Criado:
- **`database/update_recipes_table.sql`** - Script para atualizar tabelas existentes

### Como aplicar a atualização da BD:
Execute o seguinte comando no MySQL ou phpMyAdmin:
```bash
mysql -u root -p siteguedes < database/update_recipes_table.sql
```

Ou importe manualmente o ficheiro `database/update_recipes_table.sql` através do phpMyAdmin.

---

## 3. ✅ Sistema de Criação de Grupos - CORRIGIDO

### Problema Identificado:
O sistema de criação de grupos não estava a funcionar porque o código JavaScript em `grupos.html` estava a usar funções de **localStorage** (`saveGroup()`, `getAllGroups()`, etc.) em vez de utilizar a **API PHP** (`groups.php`).

#### Comportamento Anterior:
- Os grupos eram guardados apenas no navegador (localStorage)
- Não eram persistidos na base de dados MySQL
- Cada utilizador via apenas os seus próprios grupos no seu navegador
- Os dados eram perdidos ao limpar o histórico do navegador

### Solução Implementada:
**Ficheiro alterado:** `pages/grupos.html`

#### Alterações realizadas:

1. **Substituída lógica de localStorage por chamadas à API:**
   ```javascript
   // ANTES (localStorage)
   function loadGroups() {
       const groups = getAllGroups(); // localStorage
       ...
   }

   // DEPOIS (API)
   async function loadGroups() {
       const groups = await getAllGroups(); // API fetch
       ...
   }
   ```

2. **Corrigido submitGroup() para usar a API:**
   ```javascript
   async function submitGroup(e) {
       e.preventDefault();
       
       const groupData = {
           name: document.getElementById('groupNameInput').value,
           description: document.getElementById('groupDescription').value
       };
       
       const result = await saveGroup(groupData); // Chama API
       
       if (result.success) {
           closeModal('modalNovoGrupo');
           await loadGroups();
           showSuccess('Grupo criado com sucesso!');
       } else {
           showError(result.message || 'Erro ao criar grupo.');
       }
   }
   ```

3. **Removido campo de emails de membros (temporário):**
   - O campo foi removido do formulário pois o sistema de convites de membros ainda não está totalmente implementado
   - Por enquanto, apenas o criador do grupo é membro automático

4. **Atualizada função loadMembers():**
   - Mostra o criador do grupo como Admin
   - Exibe mensagem informativa sobre futura implementação de convites

#### Como funciona agora:
1. Utilizador preenche nome e descrição do grupo
2. Ao clicar "Criar Grupo", os dados são enviados para `api/groups.php`
3. A API cria o grupo na base de dados MySQL
4. O criador é automaticamente adicionado como membro admin
5. O grupo fica persistido e visível para o utilizador

### API Já Existente:
A API `api/groups.php` já estava corretamente implementada com:
- **GET** - Listar todos os grupos
- **POST action=create** - Criar novo grupo
- **POST action=delete** - Apagar grupo

### Funções JavaScript Disponíveis (main-api.js):
- `getAllGroups()` - Obtém lista de grupos da API
- `saveGroup(group)` - Cria grupo via API
- `deleteGroup(groupId)` - Apaga grupo via API
- `getGroupById(groupId)` - Obtém grupo específico

---

## Resumo das Alterações

| Ficheiro | Alteração | Status |
|----------|-----------|--------|
| `pages/dashboard.html` | Corrigido link do botão Nova Receita | ✅ Completo |
| `pages/nova-receita.html` | Adicionado campo de quantidades | ✅ Completo |
| `database/schema.sql` | Adicionados campos à tabela recipes | ✅ Completo |
| `database/update_recipes_table.sql` | Script de migração criado | ✅ Completo |
| `api/recipes.php` | Suporte aos novos campos | ✅ Completo |
| `pages/grupos.html` | Corrigido para usar API em vez de localStorage | ✅ Completo |

---

## Próximos Passos Recomendados

### Para completar o sistema de grupos:
1. Implementar sistema de convites de membros
2. Adicionar endpoint na API para convidar/adicionar membros
3. Criar notificações para convites de grupo
4. Implementar permissões de membros (admin vs. membro)

### Para melhorar o sistema de receitas:
1. Implementar página de visualização de rascunhos (`rascunhos.html`)
2. Adicionar funcionalidade de editar receitas existentes
3. Implementar sistema de partilha de receitas com amigos
4. Adicionar galeria de imagens para cada receita

---

## Como Testar

### 1. Testar Criação de Receita:
1. Faça login no sistema
2. Aceda à Dashboard
3. Clique no botão "+ Nova Receita"
4. Preencha todos os campos (título, categoria, ingredientes, quantidades, etc.)
5. Faça upload de uma imagem
6. Escolha a visibilidade (Pública/Privada/Amigos)
7. Clique em "Publicar Receita"

### 2. Testar Sistema de Grupos:
1. Faça login no sistema
2. Aceda a "Grupos" no menu
3. Clique em "+ Criar Novo Grupo"
4. Preencha nome e descrição
5. Clique em "Criar Grupo"
6. Verifique que o grupo aparece na lista
7. Clique no grupo para ver detalhes

### 3. Verificar Base de Dados:
```sql
-- Ver receitas criadas
SELECT * FROM recipes ORDER BY created_at DESC;

-- Ver grupos criados
SELECT * FROM groups ORDER BY created_at DESC;

-- Ver membros de grupos
SELECT * FROM group_members;
```

---

## Notas Importantes

⚠️ **IMPORTANTE:** Não esquecer de executar o script `database/update_recipes_table.sql` para atualizar a estrutura da base de dados!

✅ Todas as funcionalidades estão agora a utilizar a base de dados MySQL em vez de localStorage

✅ Os dados são persistidos corretamente e podem ser acedidos de qualquer dispositivo

✅ O sistema está preparado para expansões futuras (membros de grupo, partilha de receitas, etc.)
