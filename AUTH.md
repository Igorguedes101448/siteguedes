# 🔐 Sistema de Autenticação - ChefGuedes

## Visão Geral

Sistema completo de login e registo de utilizadores para o site ChefGuedes, com validação de credenciais, gestão de sessões e proteção de páginas.

## 📄 Páginas Criadas

### 1. Login (`login.html`)
Página de início de sessão com:
- **Campo de Email**: Input validado para formato de email
- **Campo de Palavra-passe**: Input com opção de mostrar/ocultar (👁️/🙈)
- **Checkbox "Lembrar-me"**: Mantém sessão após fechar navegador
- **Botão "Iniciar Sessão"**: Submit do formulário
- **Link para Registo**: "Ainda não tens conta? Regista-te aqui"
- **Link para Home**: Voltar à página inicial
- **Mensagens de Erro**: Feedback visual em caso de credenciais inválidas
- **Mensagens de Sucesso**: Confirmação de login bem-sucedido

### 2. Registo (`registo.html`)
Página de criação de conta com:
- **Nome de utilizador**: Mínimo 3 caracteres
- **Email**: Validação de formato
- **Palavra-passe**: Mínimo 6 caracteres com indicador de força
- **Confirmar Palavra-passe**: Validação de correspondência
- **Checkbox "Aceitar termos"**: Obrigatório
- **Botão "Criar Conta"**: Submit do formulário
- **Link para Login**: "Já tens conta? Inicia sessão aqui"
- **Link para Home**: Voltar à página inicial
- **Indicador de Força da Palavra-passe**: Visual com cores (Fraca/Média/Forte)
- **Mensagens de Erro/Sucesso**: Feedback detalhado

## 🎨 Design e Estilo

### Consistência Visual
- **Cores**: Paleta do ChefGuedes (laranja, azul, amarelo)
- **Modo Claro/Escuro**: Totalmente compatível com ambos os temas
- **Gradiente de Fundo**: Primária → Secundária
- **Card Centralizado**: Design limpo e moderno
- **Animações**: slideUp no card, shake nos erros
- **Responsivo**: Funciona em mobile e desktop

### Elementos de UI
- **Logo ChefGuedes**: Com emoji 👨‍🍳
- **Botões**: Estilo consistente com o resto do site
- **Inputs**: Border de 2px, focus effect
- **Toggle de Palavra-passe**: Botão visual para mostrar/ocultar
- **Mensagens**: Cards coloridos com animações

## 🔧 Funcionalidades JavaScript

### Ficheiro: `auth.js`

#### Funções Principais:

**1. `registerUser(username, email, password)`**
- Valida se o email já existe
- Cria novo utilizador
- Guarda em localStorage
- Retorna sucesso/erro

**2. `loginUser(email, password, rememberMe)`**
- Verifica credenciais
- Cria sessão (localStorage ou sessionStorage)
- Atualiza último login
- Sincroniza com perfil
- Retorna sucesso/erro

**3. `logoutUser()`**
- Remove sessão
- Regista atividade
- Limpa dados temporários

**4. `isUserLoggedIn()`**
- Verifica se há sessão ativa
- Retorna true/false

**5. `getCurrentUser()`**
- Retorna dados do utilizador logado
- Null se não estiver logado

**6. `requireLogin()`**
- Protege páginas que requerem autenticação
- Redireciona para login se necessário

**7. `updateUIWithUser()`**
- Atualiza menu com nome do utilizador
- Adiciona dropdown com opções
- Mostra botão de logout

## 💾 Armazenamento de Dados

### LocalStorage Keys:

**`users`** - Array de utilizadores registados
```javascript
[{
  id: "abc123",
  username: "João Silva",
  email: "joao@email.com",
  password: "hash_xyz", // Hash simulado
  createdAt: "2025-11-07T10:30:00Z",
  lastLogin: "2025-11-07T15:45:00Z"
}]
```

**`currentUser`** - Sessão atual (se "Lembrar-me" ativado)
```javascript
{
  userId: "abc123",
  username: "João Silva",
  email: "joao@email.com",
  loginTime: "2025-11-07T15:45:00Z",
  rememberMe: true
}
```

### SessionStorage:
- **`currentUser`**: Sessão temporária (sem "Lembrar-me")
- **`redirectAfterLogin`**: Página para redirecionar após login

## 🔒 Segurança

### Implementado:
- ✅ Validação de email (formato)
- ✅ Validação de palavra-passe (mínimo 6 caracteres)
- ✅ Verificação de emails duplicados
- ✅ Indicador de força da palavra-passe
- ✅ Confirmação de palavra-passe
- ✅ Hash de palavra-passe (simulado)
- ✅ Sessões separadas (localStorage vs sessionStorage)
- ✅ Proteção contra injeção (sanitização básica)

### ⚠️ IMPORTANTE - Para Produção:
Atualmente o sistema usa armazenamento local (localStorage) e hash simulado de palavras-passe. **NÃO é seguro para produção real**.

**Para produção, implementar:**
1. **Backend com API REST**
2. **Base de dados real** (MySQL, PostgreSQL, MongoDB)
3. **Hash real de palavras-passe** (bcrypt, Argon2)
4. **JWT Tokens** para autenticação
5. **HTTPS obrigatório**
6. **Rate limiting** contra brute force
7. **Validação server-side**
8. **CSRF protection**
9. **2FA** (autenticação de dois fatores)
10. **Password recovery** (recuperação de palavra-passe)

## 🎯 Fluxo de Utilizador

### Novo Utilizador:
1. Acede ao site → Clica em "Login"
2. Clica em "Regista-te aqui"
3. Preenche formulário de registo
4. Sistema valida dados
5. Conta criada → Redireciona para Login
6. Faz login com credenciais
7. Redireciona para Home (logado)

### Utilizador Existente:
1. Acede ao site → Clica em "Login"
2. Introduz email e palavra-passe
3. (Opcional) Marca "Lembrar-me"
4. Clica em "Iniciar Sessão"
5. Sistema valida credenciais
6. Redireciona para Home (logado)

### Utilizador Logado:
- Menu mostra: "👤 [Nome]" com dropdown
- Dropdown tem: Perfil, Dashboard, Terminar Sessão
- Todas as funcionalidades disponíveis
- Dados sincronizados com perfil

## 🔗 Integração com Sistema Existente

### Menu de Navegação:
- **Sem Login**: Mostra link "🔐 Login"
- **Com Login**: Mostra "👤 [Nome]" com dropdown

### Sincronização de Dados:
- Ao fazer login, dados são sincronizados com `userProfile`
- Nome de utilizador atualizado automaticamente
- Email sincronizado

### Atividades:
- Registo registado em atividades
- Login registado em atividades
- Logout registado em atividades

## 📱 Responsividade

- **Desktop**: Card centralizado, layout completo
- **Mobile**: Card adaptado, touch-friendly
- **Breakpoint**: 768px
- **Botões**: Tamanho adequado para toque

## ♿ Acessibilidade

- Labels associados a inputs
- Placeholders informativos
- Feedback visual claro
- Estados de hover bem definidos
- Mensagens de erro descritivas
- Focus states visíveis
- Contraste adequado

## 🎨 Validações em Tempo Real

### Página de Registo:
- **Nome**: Mínimo 3 caracteres
- **Email**: Formato válido (name@domain.com)
- **Palavra-passe**: 
  - Mínimo 6 caracteres
  - Indicador de força visual
  - Cores: Vermelho (fraca), Amarelo (média), Verde (forte)
- **Confirmar**: Deve corresponder à palavra-passe
- **Termos**: Deve ser aceite

### Página de Login:
- **Email**: Formato válido
- **Palavra-passe**: Campo obrigatório

## 🚀 Como Usar

### Para Utilizadores:

1. **Registar Nova Conta**:
   ```
   1. Clique em "Login" no menu
   2. Clique em "Regista-te aqui"
   3. Preencha o formulário
   4. Clique em "Criar Conta"
   5. Aguarde confirmação
   6. Faça login com as credenciais
   ```

2. **Fazer Login**:
   ```
   1. Clique em "Login" no menu
   2. Introduza email e palavra-passe
   3. (Opcional) Marque "Lembrar-me"
   4. Clique em "Iniciar Sessão"
   ```

3. **Terminar Sessão**:
   ```
   1. Clique no seu nome no menu
   2. Clique em "Terminar Sessão"
   3. Confirme a ação
   ```

### Para Programadores:

**Proteger uma página:**
```javascript
// No início do script da página
if (!isUserLoggedIn()) {
    window.location.href = '../login.html';
}
```

**Obter utilizador atual:**
```javascript
const user = getCurrentUser();
if (user) {
    console.log(`Utilizador: ${user.username}`);
}
```

**Fazer logout programaticamente:**
```javascript
logoutUser();
window.location.href = 'login.html';
```

## 📋 Checklist de Funcionalidades

- ✅ Página de Login criada
- ✅ Página de Registo criada
- ✅ Validação de email
- ✅ Validação de palavra-passe
- ✅ Confirmação de palavra-passe
- ✅ Indicador de força da palavra-passe
- ✅ Toggle mostrar/ocultar palavra-passe
- ✅ Checkbox "Lembrar-me"
- ✅ Checkbox "Aceitar termos"
- ✅ Mensagens de erro detalhadas
- ✅ Mensagens de sucesso
- ✅ Animações e transições
- ✅ Redirecionamento após login
- ✅ Redirecionamento após registo
- ✅ Menu de utilizador com dropdown
- ✅ Botão de logout
- ✅ Sincronização com perfil
- ✅ Armazenamento de sessão
- ✅ Verificação de email duplicado
- ✅ Registro de atividades
- ✅ Design consistente (cores, tema)
- ✅ Modo claro/escuro compatível
- ✅ Responsivo (mobile + desktop)
- ✅ Acessibilidade

## 🔄 Melhorias Futuras

Para transformar em sistema de produção:

1. **Backend API**
   - Endpoints: `/api/register`, `/api/login`, `/api/logout`
   - Validação server-side
   - Rate limiting

2. **Base de Dados**
   - Tabela `users` com índices
   - Tabela `sessions` para gestão
   - Logs de auditoria

3. **Segurança Avançada**
   - OAuth2 / OpenID Connect
   - Social login (Google, Facebook)
   - 2FA com SMS ou authenticator app
   - Recuperação de palavra-passe por email
   - Verificação de email obrigatória

4. **Funcionalidades Extra**
   - "Esqueci-me da palavra-passe"
   - Histórico de logins
   - Gestão de dispositivos
   - Bloqueio após tentativas falhadas
   - Notificações de login suspeito

## 📞 Suporte

Sistema funcional e pronto a usar!
- Dados armazenados localmente (localStorage)
- Totalmente integrado com ChefGuedes
- Design moderno e intuitivo
- Fácil de estender e personalizar
