# 🍳 ChefGuedes - Sistema Completo com Base de Dados

## ✨ NOVIDADES - Base de Dados MySQL Implementada!

O ChefGuedes agora possui uma **base de dados MySQL completa** com:

- ✅ **Persistência total de dados** - Os dados nunca mais se perdem!
- ✅ **Foto de perfil permanente** - Guardada na BD, aparece sempre!
- ✅ **Sistema de migrações automáticas** - BD atualiza-se sozinha!
- ✅ **API PHP completa** - Backend robusto e seguro
- ✅ **Sessões com tokens** - Sistema de autenticação profissional
- ✅ **Todas as funcionalidades estáveis** - Contas, receitas, grupos, favoritos

---

## 🚀 Instalação Rápida (2 Passos!)

### Passo 1: Inicializar a Base de Dados

Abra o navegador e aceda a:
```
http://localhost/siteguedes/api/init_db.php
```

Verá:
```
✅ Base de dados criada/atualizada com sucesso!
✅ Todas as tabelas foram criadas.
✅ Sistema pronto para usar!
```

### Passo 2: Começar a Usar

Aceda a:
```
http://localhost/siteguedes/
```

**Pronto! Está tudo a funcionar!** 🎉

---

## 📋 Pré-requisitos

- WAMP Server (ou XAMPP/LAMP)
- PHP 7.4 ou superior
- MySQL 5.7 ou superior
- Navegador moderno

---

## 🎯 Funcionalidades Principais

### 👤 Sistema de Utilizadores
- Registo de novos utilizadores
- Login seguro com tokens
- Perfil editável
- **Foto de perfil persistente** (guardada na BD!)
- Preferências culinárias
- Sistema de favoritos

### 📖 Gestão de Receitas
- Criar receitas personalizadas
- Editar receitas próprias
- Apagar receitas
- Pesquisa avançada
- Filtros por categoria
- Adicionar aos favoritos

### 👥 Grupos
- Criar grupos temáticos
- Adicionar membros
- Gestão de permissões (admin/membro)

### 🔐 Segurança
- Passwords com hash (bcrypt)
- Tokens de sessão aleatórios
- Prepared statements (anti SQL injection)
- Sessões seguras (24h ou 30 dias)

---

## 📊 Estrutura da Base de Dados

### Tabelas Criadas:

1. **users** - Utilizadores registados
2. **user_preferences** - Preferências culinárias
3. **sessions** - Sessões ativas com tokens
4. **recipes** - Receitas criadas
5. **favorites** - Receitas favoritas
6. **groups** - Grupos de utilizadores
7. **group_members** - Membros dos grupos
8. **schedules** - Agendamento de receitas
9. **activities** - Registo de atividades
10. **migrations** - Controlo de versões da BD

---

## 🔄 Sistema de Migrações Automáticas

O sistema possui **atualização automática**! Quando adicionar novas funcionalidades:

```bash
# Via navegador
http://localhost/siteguedes/api/migrate.php?run=1

# Ou via linha de comandos
php api/migrate.php
```

A base de dados atualiza-se automaticamente sem perder dados!

---

## 🛠️ Estrutura de Ficheiros

```
siteguedes/
├── api/                      # Backend PHP
│   ├── db.php               # Conexão à BD
│   ├── users.php            # API de utilizadores
│   ├── recipes.php          # API de receitas
│   ├── groups.php           # API de grupos
│   ├── migrate.php          # Sistema de migrações
│   └── init_db.php          # Inicialização da BD
├── database/
│   ├── schema.sql           # Estrutura da BD
│   └── demo_data.sql        # Dados de demonstração (opcional)
├── js/
│   ├── auth-api.js          # Autenticação com API
│   └── main-api.js          # Funções principais com API
├── css/
│   └── styles.css           # Estilos do site
├── pages/                    # Páginas internas
│   ├── dashboard.html
│   ├── perfil.html          # ⭐ Foto de perfil corrigida!
│   ├── explorar-receitas.html
│   ├── grupos.html
│   └── receita-detalhes.html
├── index.html               # Página inicial
├── login.html               # Página de login
├── registo.html             # Página de registo
├── test-db.html             # 🧪 Testes da BD
├── INICIO_RAPIDO_BD.md      # 📚 Guia rápido
└── INSTALACAO_BD.md         # 📚 Guia detalhado
```

---

## 🧪 Testar o Sistema

Aceda ao ficheiro de testes:
```
http://localhost/siteguedes/test-db.html
```

Este ficheiro permite:
- ✅ Testar conexão PHP
- ✅ Criar/Verificar base de dados
- ✅ Testar API
- ✅ Executar migrações

---

## 📝 Dados de Demonstração (Opcional)

Se quiser ter dados iniciais para testar:

1. Aceda ao phpMyAdmin: `http://localhost/phpmyadmin`
2. Selecione a base de dados `chefguedes`
3. Vá ao separador "SQL"
4. Copie o conteúdo de `database/demo_data.sql`
5. Cole e execute

**Credenciais de teste:**
- Email: `demo@chefguedes.pt`
- Password: `demo123`

---

## 🐛 Resolução de Problemas

### A foto de perfil não aparece?
1. Limpe o cache do navegador (Ctrl+Shift+Del)
2. Faça logout e login novamente
3. Faça upload da foto novamente
4. A foto está agora na BD - não desaparece mais!

### Erro de conexão à BD?
1. Verifique se o WAMP está a correr (ícone verde)
2. Verifique se o MySQL está ativo
3. Execute: `http://localhost/siteguedes/api/init_db.php`

### Precisa recomeçar do zero?
1. Vá ao phpMyAdmin
2. Apague a base de dados `chefguedes`
3. Execute: `http://localhost/siteguedes/api/init_db.php`

---

## 📚 Documentação

- `INICIO_RAPIDO_BD.md` - Guia de início rápido
- `INSTALACAO_BD.md` - Instruções detalhadas
- `database/schema.sql` - Estrutura completa da BD

---

## ✅ O Que Foi Corrigido

### ✨ Problema da Foto de Perfil - RESOLVIDO!

**Antes:**
- ❌ Foto desaparecia ao atualizar a página
- ❌ Foto perdia-se após logout/login
- ❌ Guardada apenas no localStorage

**Agora:**
- ✅ Foto guardada na base de dados MySQL
- ✅ Aparece sempre em todas as páginas
- ✅ Mantém-se após atualizar, logout/login
- ✅ Nunca mais desaparece!

### 🔒 Sistema de Autenticação - MELHORADO!

**Antes:**
- ❌ localStorage (dados no navegador)
- ❌ Passwords em Base64 (inseguro)

**Agora:**
- ✅ Tokens de sessão na base de dados
- ✅ Passwords com hash bcrypt
- ✅ Sessões seguras (24h ou 30 dias)
- ✅ Logout em todos os dispositivos

### 💾 Persistência de Dados - COMPLETA!

**Antes:**
- ❌ Tudo no localStorage
- ❌ Dados perdiam-se facilmente

**Agora:**
- ✅ Tudo na base de dados MySQL
- ✅ Dados permanentes e seguros
- ✅ Backup fácil
- ✅ Nunca mais perde nada!

---

## 🎓 Tecnologias Utilizadas

### Frontend
- HTML5
- CSS3 (com CSS Variables)
- JavaScript ES6+ (Async/Await)
- Fetch API

### Backend
- PHP 7.4+
- MySQL 5.7+
- PDO (Prepared Statements)
- JSON API

### Segurança
- Password Hashing (bcrypt)
- Session Tokens
- CORS Headers
- SQL Injection Protection

---

## 🌟 Próximas Funcionalidades (Sugestões)

- [ ] Sistema de comentários em receitas
- [ ] Upload de múltiplas fotos por receita
- [ ] Sistema de avaliações (estrelas)
- [ ] Chat entre membros dos grupos
- [ ] Notificações em tempo real
- [ ] Exportar receitas em PDF
- [ ] Partilha nas redes sociais

---

## 📞 Suporte

Se encontrar problemas:

1. Consulte `INSTALACAO_BD.md`
2. Execute `test-db.html`
3. Verifique os logs do Apache/PHP
4. Consulte o console do navegador (F12)

---

## 📄 Licença

Este projeto é para fins educacionais.

---

## 👨‍🍳 Sobre o ChefGuedes

Sistema completo de gestão de receitas com:
- Base de dados MySQL robusta
- API PHP segura
- Interface moderna e responsiva
- Sistema de autenticação profissional
- **Foto de perfil que funciona!** 📸

---

**Desenvolvido com ❤️ para amantes de culinária portuguesa!**

---

## 🎯 Início Rápido - 3 Comandos!

```bash
# 1. Aceder ao navegador
http://localhost/siteguedes/api/init_db.php

# 2. Ver mensagem de sucesso
✅ Base de dados criada com sucesso!

# 3. Começar a usar
http://localhost/siteguedes/
```

**É só isso! Bom apetite! 🍽️**
