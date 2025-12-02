# 🔑 Atualização: Sistema de Código de Utilizador

## O que foi implementado?

Um sistema completo para convidar membros a grupos usando **códigos únicos de utilizador** (6 caracteres).

### ✨ Funcionalidades

1. **Código Único por Utilizador**
   - Cada utilizador tem um código de 6 caracteres (ex: `A3B5K9`)
   - Visível na página de perfil
   - Pode ser copiado com um clique

2. **Convites para Grupos**
   - Administradores podem adicionar membros usando o código
   - Sistema valida automaticamente
   - Novo membro recebe notificação

3. **Gestão de Membros**
   - Ver todos os membros do grupo
   - Remover membros (exceto admins)
   - Mostrar role (Admin/Membro)

## 📋 Como Atualizar a Base de Dados

### Opção 1: MySQL/phpMyAdmin (Recomendado)

1. Acesse o **phpMyAdmin** (http://localhost/phpmyadmin)
2. Selecione a base de dados `siteguedes`
3. Vá ao separador **SQL**
4. Copie e cole o conteúdo do ficheiro:
   ```
   database/atualizar_user_code.sql
   ```
5. Clique em **Executar**

### Opção 2: Linha de Comando MySQL

```bash
mysql -u root -p siteguedes < database/atualizar_user_code.sql
```

### Opção 3: Script Completo Existente

Se preferir usar o script de atualização completo:
```bash
mysql -u root -p siteguedes < ATUALIZAR_BD_COMPLETO.sql
```

## ✅ Verificar se Funcionou

Execute esta query no phpMyAdmin:

```sql
USE siteguedes;

-- Ver utilizadores com códigos
SELECT id, username, user_code 
FROM users 
LIMIT 10;

-- Contar utilizadores
SELECT 
    COUNT(*) as total_users,
    COUNT(user_code) as with_code
FROM users;
```

**Resultado esperado:** Todos os utilizadores devem ter um `user_code` preenchido.

## 🎯 Como Usar

### Para o Utilizador:

1. **Ver seu código:**
   - Ir em **Perfil**
   - O código aparece num card destacado
   - Clicar em "📋 Copiar" para copiar

2. **Partilhar com amigos:**
   - Enviar o código por WhatsApp, email, etc.

### Para Convidar Alguém:

1. Ir em **Grupos**
2. Selecionar um grupo (onde é admin)
3. Ir ao tab **Membros**
4. Clicar em **"+ Adicionar Membro"**
5. Inserir o código de 6 caracteres
6. Confirmar

### Para Remover Membros:

1. Na lista de membros
2. Clicar em **"Remover"** ao lado do membro
3. Confirmar (só funciona para membros não-admin)

## 🔧 Arquivos Modificados

### Frontend:
- ✅ `pages/perfil.html` - Mostra o código do utilizador
- ✅ `pages/grupos.html` - Modal para adicionar membros
- ✅ `js/main-api.js` - Funções de API para grupos

### Backend:
- ✅ `api/groups.php` - Endpoints para gestão de membros
- ✅ `api/users.php` - Já gera user_code no registo

### Base de Dados:
- ✅ `database/schema.sql` - Atualizado com user_code
- ✅ `database/atualizar_user_code.sql` - Script de migração
- ✅ `ATUALIZAR_BD_COMPLETO.sql` - Script completo

## 🐛 Resolução de Problemas

### Erro: "Código de utilizador não disponível"
**Solução:** Execute o script de atualização da BD.

### Erro: "Utilizador não encontrado com este código"
**Solução:** Verifique se digitou o código corretamente (6 caracteres, maiúsculas).

### Erro: "Este utilizador já é membro do grupo"
**Solução:** O utilizador já está no grupo. Verifique a lista de membros.

### Erro: "Apenas administradores podem adicionar membros"
**Solução:** Apenas o criador do grupo (admin) pode adicionar membros.

## 📊 Estrutura da Tabela Users

```sql
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_code VARCHAR(6) UNIQUE,  -- ← NOVO!
    username VARCHAR(100) UNIQUE,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    ...
);
```

## 🎨 Exemplo Visual

```
┌─────────────────────────────────────┐
│  🔑 Seu Código de Utilizador        │
├─────────────────────────────────────┤
│  Use este código para participar    │
│  em grupos ou partilhe com amigos   │
│                                      │
│  ┌──────────────────┬──────────┐   │
│  │   A 3 B 5 K 9    │ 📋 Copiar│   │
│  └──────────────────┴──────────┘   │
└─────────────────────────────────────┘
```

## 💡 Dicas

- O código é **case-insensitive** (A3B5K9 = a3b5k9)
- Use apenas caracteres sem confusão (sem O/0, I/1)
- Caracteres permitidos: `ABCDEFGHJKLMNPQRSTUVWXYZ23456789`
- Cada código é **único** no sistema

---

**Desenvolvido para ChefGuedes** 🍳
