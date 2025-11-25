# ChefGuedes - Instalação da Base de Dados

## 📋 Pré-requisitos

- WAMP Server instalado e em execução
- PHP 7.4 ou superior
- MySQL 5.7 ou superior

## 🚀 Instalação Rápida

### 1. Iniciar o WAMP Server

Certifique-se de que o WAMP está a correr e que os serviços Apache e MySQL estão ativos (ícone verde).

### 2. Criar a Base de Dados

Abra o navegador e aceda a:

```
http://localhost/siteguedes/api/init_db.php
```

Este script irá:
- ✅ Criar automaticamente a base de dados `chefguedes`
- ✅ Criar todas as tabelas necessárias
- ✅ Configurar índices e relações
- ✅ Preparar o sistema de migrações

### 3. Verificar Instalação

Se tudo correr bem, verá a mensagem:

```
✅ Base de dados criada/atualizada com sucesso!
✅ Todas as tabelas foram criadas.
✅ Sistema pronto para usar!
```

## 🔧 Configuração Manual (Alternativa)

Se preferir criar manualmente através do phpMyAdmin:

1. Aceda a `http://localhost/phpmyadmin`
2. Clique em "SQL" no topo
3. Copie todo o conteúdo do ficheiro `database/schema.sql`
4. Cole na área de texto e clique em "Executar"

## 📊 Estrutura da Base de Dados

### Tabelas Criadas:

- **users** - Utilizadores registados
- **user_preferences** - Preferências culinárias
- **sessions** - Sessões ativas (com tokens)
- **recipes** - Receitas criadas
- **favorites** - Receitas favoritas
- **groups** - Grupos de utilizadores
- **group_members** - Membros dos grupos
- **schedules** - Agendamento de receitas
- **activities** - Registo de atividades
- **migrations** - Controlo de versões da BD

## 🔄 Sistema de Atualização Automática

O sistema possui migrações automáticas. Sempre que houver alterações na estrutura da base de dados:

1. O sistema verifica automaticamente
2. Aplica as mudanças necessárias
3. Mantém os dados existentes intactos

Para executar migrações manualmente:

```
http://localhost/siteguedes/api/migrate.php?run=1
```

Ou via linha de comandos:

```bash
php api/migrate.php
```

## 📝 Ficheiros Importantes

### API (Backend)

- `api/db.php` - Conexão à base de dados
- `api/users.php` - Gestão de utilizadores
- `api/recipes.php` - Gestão de receitas
- `api/groups.php` - Gestão de grupos
- `api/migrate.php` - Sistema de migrações
- `api/init_db.php` - Inicialização da BD

### JavaScript (Frontend)

- `js/auth-api.js` - Autenticação (substitui auth.js)
- `js/main-api.js` - Funções principais (substitui main.js)

## 🔐 Segurança

- As passwords são guardadas com hash usando `password_hash()` do PHP
- As sessões usam tokens aleatórios seguros
- Todas as queries usam prepared statements (proteção contra SQL injection)
- CORS configurado para segurança

## 🐛 Resolução de Problemas

### Erro: "Base de dados não existe"

Execute novamente:
```
http://localhost/siteguedes/api/init_db.php
```

### Erro: "Tabela não encontrada"

1. Aceda ao phpMyAdmin
2. Selecione a base de dados `chefguedes`
3. Verifique se todas as tabelas existem
4. Se não, execute o script `database/schema.sql`

### Erro: "Conexão recusada"

1. Verifique se o MySQL está a correr no WAMP
2. Verifique as credenciais em `api/db.php`:
   - DB_HOST: localhost
   - DB_USER: root
   - DB_PASS: (vazio por padrão no WAMP)

### A foto de perfil não aparece

A foto está agora guardada na base de dados. Se ainda não aparecer:

1. Limpe o cache do navegador (Ctrl+Shift+Del)
2. Faça logout e login novamente
3. Faça upload da foto novamente na página de perfil

## ✅ Testes

### Testar Registo de Utilizador

1. Aceda a `http://localhost/siteguedes/registo.html`
2. Registe um novo utilizador
3. Faça login
4. Aceda ao perfil e adicione uma foto

### Testar Persistência da Foto

1. Faça upload de uma foto de perfil
2. Atualize a página (F5)
3. A foto deve continuar visível
4. Faça logout e login novamente
5. A foto deve ainda estar presente

## 📱 Uso no Site

Todas as páginas foram atualizadas para usar a API:

- ✅ Login e registo
- ✅ Perfil de utilizador
- ✅ Foto de perfil persistente
- ✅ Gestão de receitas
- ✅ Gestão de grupos
- ✅ Favoritos

## 🔄 Migrações Futuras

Sempre que adicionar novas funcionalidades:

1. Edite `api/migrate.php`
2. Adicione uma nova migração na função `defineMigrations()`
3. Execute `http://localhost/siteguedes/api/migrate.php?run=1`

O sistema aplicará apenas as migrações novas, sem afetar os dados existentes.

## 📞 Suporte

Se encontrar problemas:

1. Verifique os logs do Apache/PHP no WAMP
2. Consulte o console do navegador (F12)
3. Verifique se todos os ficheiros foram criados corretamente

---

**ChefGuedes** - Sistema completo de gestão de receitas com base de dados MySQL
