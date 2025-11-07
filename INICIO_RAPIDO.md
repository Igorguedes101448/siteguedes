# 🚀 Início Rápido - ChefGuedes

## 📍 Como Visualizar o Site

### Opção 1: WAMP Server (Recomendado)
1. Certifique-se que o WAMP está a correr (ícone verde)
2. Abra o navegador
3. Digite: `http://localhost/teste site/`
4. Ou: `http://127.0.0.1/teste site/`

### Opção 2: Abrir Diretamente
1. Navegue até: `c:\wamp64\www\teste site\`
2. Clique duplo em `index.html`

---

## 🎨 Novidades do Design

### 1️⃣ Modo Claro/Escuro
- **Localizador**: Botão com ícone 🌙 ou ☀️ no canto superior direito do menu
- **Como usar**: Clique uma vez para alternar
- **Resultado**: Todo o site muda de tema instantaneamente
- **Persistência**: Sua escolha fica guardada!

### 2️⃣ Sistema de Login
**Testar o Registo:**
1. Clique em "🔐 Login" no menu
2. Clique em "Regista-te aqui"
3. Preencha:
   - Nome: `João Silva`
   - Email: `joao@exemplo.com`
   - Palavra-passe: `senha123` (verá o indicador de força)
   - Confirmar palavra-passe: `senha123`
   - Marque "Aceito os termos"
4. Clique "Criar Conta"
5. Será redirecionado para o login

**Fazer Login:**
1. Email: `joao@exemplo.com`
2. Palavra-passe: `senha123`
3. Marque "Lembrar-me" (opcional)
4. Clique "Iniciar Sessão"
5. Será redirecionado para a home

**Após Login:**
- No canto superior direito, verá seu nome: "👤 João Silva"
- Clique no nome para ver o menu dropdown:
  - Meu Perfil
  - Dashboard
  - Terminar Sessão

### 3️⃣ Página Guia Renovada
- **Acesso**: Clique em "📖 Guia" no menu
- **Conteúdo**: 
  - Instruções passo-a-passo
  - Cards organizados por funcionalidade
  - Dicas e truques
  - Informações sobre armazenamento
  - Comparação visual dos modos claro/escuro

---

## 🎯 Teste Rápido (5 minutos)

### Passo 1: Tema
1. Abra `index.html`
2. Clique no botão 🌙 (canto superior direito)
3. O site fica escuro!
4. Clique no botão ☀️
5. Volta ao modo claro!

### Passo 2: Registo
1. Clique "🔐 Login"
2. Clique "Regista-te aqui"
3. Crie uma conta de teste
4. Observe o indicador de força da senha
5. Crie a conta

### Passo 3: Login
1. Faça login com a conta criada
2. Veja seu nome aparecer no menu
3. Clique no nome
4. Veja o dropdown com opções

### Passo 4: Explorar
1. Navegue pelas páginas
2. Veja que o tema persiste
3. Seu nome continua visível
4. Teste criar uma receita
5. Visite a página "📖 Guia"

### Passo 5: Logout
1. Clique no seu nome (canto superior direito)
2. Clique "Terminar Sessão"
3. Será redirecionado para o login
4. O botão voltará a ser "🔐 Login"

---

## 🎨 Paleta de Cores

### Modo Claro
- **Laranja Caloroso**: `#ff6b35` (Cor primária)
- **Azul Profundo**: `#004e89` (Cor secundária)
- **Amarelo Dourado**: `#f7b32b` (Acento)
- **Fundo Branco**: `#ffffff`
- **Fundo Secundário**: `#f8f9fa`

### Modo Escuro
- **Laranja Suave**: `#ff7849` (Cor primária)
- **Azul Claro**: `#1a8cba` (Cor secundária)
- **Amarelo Vibrante**: `#ffc857` (Acento)
- **Fundo Escuro**: `#1a1d23`
- **Fundo Secundário**: `#22262e`

---

## 📱 Responsividade

### Desktop (>768px)
- Menu horizontal completo
- Layout multi-coluna
- Cards em grid

### Tablet/Mobile (≤768px)
- Menu empilhado
- Layout em coluna única
- Touch-friendly

**Teste:**
1. Abra o site no navegador
2. Pressione F12 (Developer Tools)
3. Clique no ícone de dispositivo móvel
4. Teste diferentes tamanhos de ecrã

---

## 📂 Estrutura de Ficheiros

```
teste site/
│
├── index.html              # Página inicial
├── login.html              # Página de login
├── registo.html            # Página de registo
├── guia.html               # Guia de utilização (RENOVADO!)
│
├── css/
│   └── styles.css          # Todos os estilos (com temas!)
│
├── js/
│   ├── main.js             # Funções globais + tema
│   ├── auth.js             # Sistema de autenticação (NOVO!)
│   ├── receitas.js         # Gestão de receitas
│   ├── grupos.js           # Gestão de grupos
│   ├── dashboard.js        # Dashboard
│   └── perfil.js           # Gestão de perfil
│
├── pages/
│   ├── explorar-receitas.html
│   ├── grupos.html
│   ├── dashboard.html
│   └── perfil.html
│
└── assets/
    └── (imagens, se houver)
```

---

## ⚡ Funcionalidades Principais

### ✅ Implementado e Funcionando:

1. **Tema Claro/Escuro**
   - Alternância instantânea
   - Persistência da preferência
   - Transições suaves

2. **Sistema de Autenticação**
   - Registo de utilizadores
   - Login com validação
   - Sessões persistentes
   - Menu dinâmico baseado em estado

3. **Design Moderno**
   - Paleta culinária harmoniosa
   - Animações e transições
   - Cards com hover effects
   - Gradientes sutis

4. **Responsividade**
   - Desktop, tablet e mobile
   - Breakpoint em 768px
   - Layout adaptativo

5. **Página Guia Completa**
   - Instruções detalhadas
   - Visual moderno e organizado
   - Informações sobre todas as funcionalidades

---

## 🔍 Páginas para Explorar

1. **Home (index.html)**
   - Hero section com gradiente
   - Cards de funcionalidades
   - Links de acesso rápido

2. **Login (login.html)**
   - Formulário elegante
   - Toggle de senha
   - Opção "lembrar-me"

3. **Registo (registo.html)**
   - Indicador de força da senha
   - Validação em tempo real
   - Design consistente

4. **Explorar Receitas (pages/explorar-receitas.html)**
   - Grid de receitas
   - Pesquisa e filtros
   - Adicionar novas receitas

5. **Grupos (pages/grupos.html)**
   - Criar grupos
   - Gerir membros
   - Agendamento semanal

6. **Dashboard (pages/dashboard.html)**
   - Estatísticas
   - Atividades recentes
   - Próximas refeições

7. **Perfil (pages/perfil.html)**
   - Foto de perfil
   - Informações pessoais
   - Preferências

8. **Guia (guia.html)** ⭐ RENOVADO!
   - Design moderno
   - Instruções completas
   - Dicas e truques

---

## 💡 Dicas

### Para Desenvolvimento:
- Use o modo escuro para reduzir fadiga visual
- Abra as Developer Tools (F12) para ver o código
- CSS variables facilitam mudanças de cor
- Todos os dados ficam no localStorage

### Para Testar:
- Crie múltiplos utilizadores
- Teste em diferentes navegadores
- Experimente redimensionar a janela
- Alterne entre temas várias vezes

### Para Personalizar:
- Cores: Edite as CSS variables em `styles.css`
- Funcionalidades: Adicione em ficheiros JS específicos
- Design: Mantenha as classes CSS existentes

---

## 🎉 Pronto para Começar!

1. **Abra**: `http://localhost/teste site/`
2. **Alterne**: O tema claro/escuro
3. **Registe**: Uma conta de teste
4. **Explore**: Todas as páginas
5. **Leia**: O guia completo em "📖 Guia"

---

## 📞 Suporte

Se encontrar algum problema:
1. Verifique se o WAMP está a correr
2. Limpe o cache do navegador (Ctrl+Shift+Delete)
3. Abra as Developer Tools (F12) e veja o Console
4. Certifique-se que JavaScript está ativado

---

**Desenvolvido com ❤️ para ChefGuedes**  
*Um site moderno de partilha de receitas*

🍳 Bom apetite e boas receitas! 🍽️
