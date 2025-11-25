# 🚀 ChefGuedes - Início Rápido

## ✅ TUDO PRONTO!

A base de dados completa foi criada com sucesso! Agora só precisa de 2 passos simples:

## 📝 Passo 1: Inicializar a Base de Dados

1. **Certifique-se que o WAMP está a correr** (ícone verde)

2. **Abra o navegador** e aceda a:
   ```
   http://localhost/siteguedes/api/init_db.php
   ```

3. Verá esta mensagem de sucesso:
   ```
   ✅ Base de dados criada/atualizada com sucesso!
   ✅ Todas as tabelas foram criadas.
   ✅ Sistema pronto para usar!
   ```

## 🎉 Passo 2: Começar a Usar

Aceda ao site:
```
http://localhost/siteguedes/
```

**E está pronto!** 🎊

---

## 🔧 O que foi criado:

### ✅ Base de Dados MySQL (`chefguedes`)
- Tabela `users` - Utilizadores registados
- Tabela `user_preferences` - Preferências culinárias
- Tabela `sessions` - Sessões ativas com tokens
- Tabela `recipes` - Receitas criadas
- Tabela `favorites` - Receitas favoritas
- Tabela `groups` - Grupos de utilizadores
- Tabela `group_members` - Membros dos grupos
- Tabela `schedules` - Agendamento de receitas
- Tabela `activities` - Registo de atividades
- Tabela `migrations` - Controlo de versões

### ✅ API PHP (Backend)
- `api/db.php` - Conexão à base de dados
- `api/users.php` - Gestão de utilizadores
- `api/recipes.php` - Gestão de receitas
- `api/groups.php` - Gestão de grupos
- `api/migrate.php` - Sistema de migrações automáticas
- `api/init_db.php` - Inicialização da base de dados

### ✅ JavaScript (Frontend)
- `js/auth-api.js` - Autenticação com API
- `js/main-api.js` - Funções principais com API

### ✅ Todas as páginas HTML atualizadas
- Login e registo
- Perfil de utilizador
- Dashboard
- Explorar receitas
- Grupos
- E todas as outras!

---

## 🔐 Funcionalidades Implementadas

### ✅ Sistema de Autenticação
- Registo de novos utilizadores
- Login com sessões seguras
- Logout
- "Lembrar-me" (30 dias) vs sessão temporária (24h)
- Tokens de sessão aleatórios

### ✅ Perfil de Utilizador
- **FOTO DE PERFIL PERSISTENTE** 📸
  - Guardada na base de dados
  - Aparece em todas as páginas
  - Não desaparece ao atualizar
  - Mantém-se após logout/login
- Edição de dados pessoais
- Preferências culinárias
- Alteração de palavra-passe

### ✅ Gestão de Receitas
- Criar receitas
- Editar receitas próprias
- Apagar receitas próprias
- Pesquisar receitas
- Filtrar por categoria
- Adicionar aos favoritos

### ✅ Gestão de Grupos
- Criar grupos
- Adicionar membros
- Apagar grupos (apenas criadores)

### ✅ Sistema de Migrações Automáticas
- **Atualização automática da base de dados**
- Quando adicionar novas funcionalidades, a BD atualiza sozinha
- Não perde dados existentes
- Versionamento completo

---

## 🐛 Resolução de Problemas

### Se a foto de perfil não aparecer:
1. Limpe o cache do navegador (Ctrl+Shift+Del)
2. Faça logout e login novamente
3. Faça upload da foto novamente

### Se aparecer erro de conexão:
1. Verifique se o WAMP está a correr
2. Verifique se o MySQL está ativo
3. Execute novamente: `http://localhost/siteguedes/api/init_db.php`

### Se precisar recomeçar do zero:
1. Vá ao phpMyAdmin: `http://localhost/phpmyadmin`
2. Apague a base de dados `chefguedes`
3. Execute: `http://localhost/siteguedes/api/init_db.php`

---

## 📚 Documentação Completa

Para mais detalhes, consulte:
- `INSTALACAO_BD.md` - Instruções detalhadas de instalação
- `database/schema.sql` - Estrutura completa da base de dados

---

## 🎯 Próximos Passos

Agora pode:
1. ✅ Registar utilizadores
2. ✅ Fazer login
3. ✅ Adicionar foto de perfil (que não desaparece!)
4. ✅ Criar receitas
5. ✅ Criar grupos
6. ✅ Adicionar favoritos

**Divirta-se a usar o ChefGuedes!** 🍳👨‍🍳

---

**Nota:** Os dados agora são **permanentes** e estão guardados na base de dados MySQL. Não desaparecem ao fechar o navegador ou atualizar a página!
