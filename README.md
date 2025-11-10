# 🍳 ChefGuedes - Plataforma de Partilha de Receitas# Site de Partilha de Receitas



Bem-vindo ao **ChefGuedes**, uma plataforma moderna e intuitiva para partilhar, descobrir e organizar receitas culinárias com amigos e família.## Estrutura do Projeto



![Version](https://img.shields.io/badge/Versão-2.0.0-orange)Este é um site de partilha de receitas com funcionalidades de gestão de grupos e agendamento de refeições.

![Status](https://img.shields.io/badge/Status-Completo-success)

![Design](https://img.shields.io/badge/Design-Responsivo-blue)### Estrutura de Ficheiros



---```

teste site/

## ✨ Novidades v2.0.0├── index.html              # Página principal

├── pages/

🎨 **Design Completamente Renovado!**│   ├── explorar-receitas.html   # Página de exploração de receitas

- ✅ Nova paleta de cores harmoniosa para culinária│   ├── grupos.html              # Página de gestão de grupos

- ✅ **Modo Claro e Modo Escuro** com toggle automático│   ├── dashboard.html           # Dashboard do utilizador

- ✅ Interface moderna e profissional│   └── perfil.html              # Página de perfil

- ✅ Responsivo para mobile, tablet e desktop├── css/

- ✅ Animações e transições suaves│   └── styles.css          # Estilos CSS

├── js/

---│   ├── main.js            # Funções utilitárias globais

│   ├── receitas.js        # Gestão de receitas

## 🚀 Funcionalidades Principais│   ├── grupos.js          # Gestão de grupos

│   ├── dashboard.js       # Dashboard

### 🍳 Receitas│   └── perfil.js          # Gestão de perfil

- **Explorar**: Navegue por receitas com filtros por categoria└── assets/

- **Pesquisar**: Encontre receitas por nome ou descrição    └── default-avatar.png  # Avatar padrão

- **Criar**: Adicione suas receitas com fotos e instruções detalhadas```

- **Categorias**: Entradas, Pratos Principais, Sobremesas e Bebidas

## Funcionalidades Implementadas

### 👥 Grupos

- **Criar Grupos**: Organize grupos familiares ou de amigos### 1. Página Principal (index.html)

- **Membros**: Adicione participantes por email- Apresentação geral do site

- **Agendamento**: Planeie refeições semanais em conjunto- Navegação para todas as páginas

- Cards de acesso rápido às funcionalidades principais

### 📅 Agendamento

- **Planeamento Semanal**: Organize refeições para cada dia### 2. Explorar Receitas (explorar-receitas.html)

- **Tipos de Refeição**: Pequeno-almoço, Almoço, Jantar, Lanche- **Visualização de receitas**: Grid com todas as receitas partilhadas

- **Navegação**: Alterne entre semanas facilmente- **Pesquisa**: Campo de pesquisa para filtrar receitas por título ou descrição

- **Notas**: Adicione observações a cada refeição- **Filtros**: Filtro por categoria (Entradas, Pratos Principais, Sobremesas, Bebidas)

- **Adicionar receita**: Modal para criar novas receitas com:

### 👤 Perfil  - Título

- **Foto de Perfil**: Upload de imagem personalizada  - Categoria

- **Informações**: Nome, email, telefone, biografia, localização  - Descrição

- **Preferências**: Cozinhas favoritas e restrições alimentares  - Ingredientes

- **Configurações**: Newsletter e notificações  - Modo de preparação

  - Upload de imagem

### 📊 Dashboard- **Visualizar receita**: Modal com detalhes completos da receita

- **Estatísticas**: Receitas, grupos, favoritos e agendamentos- **Eliminar receita**: Opção para remover receitas

- **Atividades**: Histórico de ações

- **Acesso Rápido**: Links para funcionalidades principais### 3. Grupos (grupos.html)

- **Visão Geral**: Receitas recentes e próximas refeições- **Listagem de grupos**: Visualização de todos os grupos do utilizador

- **Criar grupo**: Modal para criar novos grupos com:

---  - Nome do grupo

  - Descrição

## 🎨 Sistema de Temas  - Adicionar membros (por email)

- **Visualizar grupo**: Modal com duas abas:

### ☀️ Modo Claro  - **Membros**: 

Cores vivas e alegres, perfeitas para o dia:    - Lista de todos os membros

- Laranja quente (#ff6b35)    - Adicionar novos membros

- Azul profundo (#004e89)    - Remover membros

- Amarelo dourado (#f7b32b)  - **Agendamento Semanal**:

    - Visualização semanal (7 dias)

### 🌙 Modo Escuro    - Navegação entre semanas

Cores suaves e confortáveis, ideais para a noite:    - Adicionar receitas para cada dia e refeição

- Coral suave (#ff7f50)    - Editar agendamentos existentes

- Azul brilhante (#0077b6)    - Remover agendamentos

- Amarelo vibrante (#fdc500)    - Notas para cada agendamento



**Como alternar:** Clique no botão ☀️/🌙 no menu de navegação!### 4. Dashboard (dashboard.html)

- **Estatísticas**: 

---  - Número de receitas partilhadas

  - Número de grupos

## 📋 Requisitos  - Número de receitas favoritas

- **Receitas recentes**: Últimas 5 receitas criadas

- ✅ Servidor web (WAMP, XAMPP) ou abrir diretamente no navegador- **Meus grupos**: Lista dos grupos do utilizador

- ✅ Navegador moderno (Chrome, Firefox, Safari, Edge)- **Atividades recentes**: Histórico de ações realizadas

- ✅ JavaScript ativado- **Próximas refeições agendadas**: Refeições dos próximos 7 dias

- ✅ Nenhuma dependência externa necessária- **Acesso rápido**: Botões para criar receitas e grupos



---### 5. Perfil (perfil.html)

- **Foto de perfil**: 

## 🎯 Início Rápido  - Visualização da foto atual

  - Upload de nova foto (aceita ficheiros de imagem)

### 1️⃣ Instalação  - Pré-visualização antes de guardar

```bash- **Informações pessoais**:

# Clone ou baixe os arquivos  - Nome completo

cd c:\wamp64\www\siteguedes  - Email

```  - Telefone

  - Bio

### 2️⃣ Executar  - Localização

```bash- **Preferências**:

# Opção 1: Abrir diretamente  - Cozinhas favoritas

# Dê duplo clique em index.html  - Restrições alimentares

  - Opções de newsletter e notificações

# Opção 2: Via servidor local- **Zona de perigo**:

# Acesse http://localhost/siteguedes  - Eliminar conta (com confirmação)

```

## Armazenamento de Dados

### 3️⃣ Primeiro Uso

1. Clique em **"Login"** → **"Regista-te aqui"**O site utiliza **localStorage** para armazenar todos os dados localmente no navegador. Não há integração com base de dados ainda.

2. Crie sua conta

3. Faça login### Estrutura de Dados

4. Explore o Dashboard

5. Crie sua primeira receita!```javascript

// Receitas

📖 **Guia Completo:** Veja `COMO_USAR.md` ou abra `guia.html`{

  id: string,

---  title: string,

  category: string,

## 📂 Estrutura do Projeto  description: string,

  ingredients: string,

```  instructions: string,

siteguedes/  author: string,

│  imageUrl: string,

├── 📁 css/  createdAt: string

│   └── styles.css              # Sistema completo de design}

│

├── 📁 js/// Grupos

│   ├── main.js                # Funcionalidades principais{

│   └── auth.js                # Sistema de autenticação  id: string,

│  name: string,

├── 📁 pages/  description: string,

│   ├── dashboard.html         # Painel do utilizador  members: string[],

│   ├── explorar-receitas.html # Gestão de receitas  createdAt: string

│   ├── grupos.html            # Grupos e agendamento}

│   └── perfil.html            # Edição de perfil

│// Agendamentos

├── index.html                  # Página inicial{

├── login.html                  # Login  id: string,

├── registo.html                # Registo  groupId: string,

├── guia.html                   # Guia visual  date: string,

│  mealType: string,

└── 📄 Documentação/  recipeId: string,

    ├── DESIGN_IMPLEMENTADO.md  # Detalhes técnicos  notes: string,

    ├── COMO_USAR.md           # Guia de uso  createdAt: string

    ├── RESUMO_DESIGN.md       # Resumo executivo}

    └── CHANGELOG.md           # Histórico de versões

```// Perfil

{

---  name: string,

  email: string,

## 🛠️ Tecnologias  phone: string,

  bio: string,

- **HTML5** - Estrutura semântica  location: string,

- **CSS3** - Design System com variáveis  cuisinePreferences: string,

- **JavaScript** - Vanilla JS (sem frameworks)  dietaryRestrictions: string,

- **localStorage** - Dados locais persistentes  newsletter: boolean,

  notifications: boolean,

---  photoUrl: string

}

## 📱 Responsividade```



Funciona perfeitamente em:## Funcionalidades JavaScript

- 💻 **Desktop** (> 768px)

- 📱 **Tablet** (480px - 768px)### main.js

- 📱 **Mobile** (< 480px)- Funções utilitárias globais

- Gestão de localStorage

---- Gestão de modais

- Formatação de datas

## 📚 Documentação- Sistema de atividades

- Inicialização de dados de exemplo

| Arquivo | Descrição |

|---------|-----------|### receitas.js

| `README.md` | Visão geral do projeto |- Carregamento e exibição de receitas

| `DESIGN_IMPLEMENTADO.md` | Documentação técnica completa |- Pesquisa e filtros

| `COMO_USAR.md` | Guia passo-a-passo |- Adicionar novas receitas

| `RESUMO_DESIGN.md` | Resumo executivo |- Visualizar detalhes

| `CHANGELOG.md` | Histórico de versões |- Eliminar receitas

- Upload de imagens

---

### grupos.js

## 🎯 Destaques- Gestão de grupos

- Adicionar/remover membros

- ✅ **900+ linhas** de CSS otimizado- Sistema de tabs (membros/agendamento)

- ✅ **500+ linhas** de JavaScript- Agendamento semanal

- ✅ **8 páginas** HTML completas- Navegação entre semanas

- ✅ **2 temas** (Claro/Escuro)- Adicionar/editar/remover agendamentos

- ✅ **100% responsivo**

- ✅ **0 dependências** externas### dashboard.js

- Estatísticas do utilizador

---- Listagem de receitas recentes

- Listagem de grupos

## 🆘 FAQ- Histórico de atividades

- Próximas refeições agendadas

**P: O tema não muda?**

R: Verifique se JavaScript está ativado e limpe o cache (Ctrl+F5)### perfil.js

- Carregamento do perfil

**P: Esqueci a senha?**- Edição de informações

R: Dados são locais. Limpe localStorage: `localStorage.clear()`- Upload de foto de perfil

- Guardar alterações

**P: Imagens não aparecem?**- Eliminar conta

R: Limite de 2MB. Use JPG, PNG, GIF ou WEBP

## Como Usar

---

1. Abra o ficheiro `index.html` num navegador web

## 🚀 Próximos Passos2. Navegue pelas diferentes páginas usando o menu de navegação

3. Todos os dados são guardados automaticamente no localStorage

Para utilizadores:

- ✅ Criar conta## Dados de Exemplo

- ✅ Adicionar receitas

- ✅ Criar gruposO site inicializa com alguns dados de exemplo:

- ✅ Agendar refeições- 2 receitas (Bacalhau à Brás e Arroz Doce)

- 1 grupo (Família Silva)

Para desenvolvedores:- Perfil de utilizador demo

- [ ] Backend real

- [ ] Base de dados## Próximos Passos (Para Integração Futura)

- [ ] API REST

- [ ] PWA1. **Base de Dados**: 

   - Substituir localStorage por API backend

---   - Implementar sistema de autenticação

   - Persistência de dados no servidor

## 📄 Licença

2. **Estética**:

Uso livre para fins educacionais e pessoais.   - Adicionar tema visual personalizado

   - Melhorar design responsivo

---   - Adicionar animações e transições



**ChefGuedes v2.0.0** - Partilhe, descubra e organize receitas com estilo! 🍳👨‍🍳3. **Funcionalidades Adicionais**:

   - Sistema de favoritos

*Última atualização: 10 de Novembro de 2025*   - Comentários nas receitas

   - Partilha social
   - Notificações em tempo real
   - Sistema de classificação

## Compatibilidade

O site funciona em todos os navegadores modernos que suportam:
- HTML5
- CSS3
- ES6 JavaScript
- localStorage API
- FileReader API (para upload de imagens)

## Notas Importantes

- As imagens são armazenadas como Base64 no localStorage (limitação de ~5MB por origem)
- Para produção, recomenda-se usar um sistema de armazenamento de ficheiros adequado
- O código está organizado de forma modular para facilitar manutenção futura
- Todas as funções estão documentadas e prontas para integração com backend
