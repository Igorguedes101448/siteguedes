# Site de Partilha de Receitas

## Estrutura do Projeto

Este é um site de partilha de receitas com funcionalidades de gestão de grupos e agendamento de refeições.

### Estrutura de Ficheiros

```
teste site/
├── index.html              # Página principal
├── pages/
│   ├── explorar-receitas.html   # Página de exploração de receitas
│   ├── grupos.html              # Página de gestão de grupos
│   ├── dashboard.html           # Dashboard do utilizador
│   └── perfil.html              # Página de perfil
├── css/
│   └── styles.css          # Estilos CSS
├── js/
│   ├── main.js            # Funções utilitárias globais
│   ├── receitas.js        # Gestão de receitas
│   ├── grupos.js          # Gestão de grupos
│   ├── dashboard.js       # Dashboard
│   └── perfil.js          # Gestão de perfil
└── assets/
    └── default-avatar.png  # Avatar padrão
```

## Funcionalidades Implementadas

### 1. Página Principal (index.html)
- Apresentação geral do site
- Navegação para todas as páginas
- Cards de acesso rápido às funcionalidades principais

### 2. Explorar Receitas (explorar-receitas.html)
- **Visualização de receitas**: Grid com todas as receitas partilhadas
- **Pesquisa**: Campo de pesquisa para filtrar receitas por título ou descrição
- **Filtros**: Filtro por categoria (Entradas, Pratos Principais, Sobremesas, Bebidas)
- **Adicionar receita**: Modal para criar novas receitas com:
  - Título
  - Categoria
  - Descrição
  - Ingredientes
  - Modo de preparação
  - Upload de imagem
- **Visualizar receita**: Modal com detalhes completos da receita
- **Eliminar receita**: Opção para remover receitas

### 3. Grupos (grupos.html)
- **Listagem de grupos**: Visualização de todos os grupos do utilizador
- **Criar grupo**: Modal para criar novos grupos com:
  - Nome do grupo
  - Descrição
  - Adicionar membros (por email)
- **Visualizar grupo**: Modal com duas abas:
  - **Membros**: 
    - Lista de todos os membros
    - Adicionar novos membros
    - Remover membros
  - **Agendamento Semanal**:
    - Visualização semanal (7 dias)
    - Navegação entre semanas
    - Adicionar receitas para cada dia e refeição
    - Editar agendamentos existentes
    - Remover agendamentos
    - Notas para cada agendamento

### 4. Dashboard (dashboard.html)
- **Estatísticas**: 
  - Número de receitas partilhadas
  - Número de grupos
  - Número de receitas favoritas
- **Receitas recentes**: Últimas 5 receitas criadas
- **Meus grupos**: Lista dos grupos do utilizador
- **Atividades recentes**: Histórico de ações realizadas
- **Próximas refeições agendadas**: Refeições dos próximos 7 dias
- **Acesso rápido**: Botões para criar receitas e grupos

### 5. Perfil (perfil.html)
- **Foto de perfil**: 
  - Visualização da foto atual
  - Upload de nova foto (aceita ficheiros de imagem)
  - Pré-visualização antes de guardar
- **Informações pessoais**:
  - Nome completo
  - Email
  - Telefone
  - Bio
  - Localização
- **Preferências**:
  - Cozinhas favoritas
  - Restrições alimentares
  - Opções de newsletter e notificações
- **Zona de perigo**:
  - Eliminar conta (com confirmação)

## Armazenamento de Dados

O site utiliza **localStorage** para armazenar todos os dados localmente no navegador. Não há integração com base de dados ainda.

### Estrutura de Dados

```javascript
// Receitas
{
  id: string,
  title: string,
  category: string,
  description: string,
  ingredients: string,
  instructions: string,
  author: string,
  imageUrl: string,
  createdAt: string
}

// Grupos
{
  id: string,
  name: string,
  description: string,
  members: string[],
  createdAt: string
}

// Agendamentos
{
  id: string,
  groupId: string,
  date: string,
  mealType: string,
  recipeId: string,
  notes: string,
  createdAt: string
}

// Perfil
{
  name: string,
  email: string,
  phone: string,
  bio: string,
  location: string,
  cuisinePreferences: string,
  dietaryRestrictions: string,
  newsletter: boolean,
  notifications: boolean,
  photoUrl: string
}
```

## Funcionalidades JavaScript

### main.js
- Funções utilitárias globais
- Gestão de localStorage
- Gestão de modais
- Formatação de datas
- Sistema de atividades
- Inicialização de dados de exemplo

### receitas.js
- Carregamento e exibição de receitas
- Pesquisa e filtros
- Adicionar novas receitas
- Visualizar detalhes
- Eliminar receitas
- Upload de imagens

### grupos.js
- Gestão de grupos
- Adicionar/remover membros
- Sistema de tabs (membros/agendamento)
- Agendamento semanal
- Navegação entre semanas
- Adicionar/editar/remover agendamentos

### dashboard.js
- Estatísticas do utilizador
- Listagem de receitas recentes
- Listagem de grupos
- Histórico de atividades
- Próximas refeições agendadas

### perfil.js
- Carregamento do perfil
- Edição de informações
- Upload de foto de perfil
- Guardar alterações
- Eliminar conta

## Como Usar

1. Abra o ficheiro `index.html` num navegador web
2. Navegue pelas diferentes páginas usando o menu de navegação
3. Todos os dados são guardados automaticamente no localStorage

## Dados de Exemplo

O site inicializa com alguns dados de exemplo:
- 2 receitas (Bacalhau à Brás e Arroz Doce)
- 1 grupo (Família Silva)
- Perfil de utilizador demo

## Próximos Passos (Para Integração Futura)

1. **Base de Dados**: 
   - Substituir localStorage por API backend
   - Implementar sistema de autenticação
   - Persistência de dados no servidor

2. **Estética**:
   - Adicionar tema visual personalizado
   - Melhorar design responsivo
   - Adicionar animações e transições

3. **Funcionalidades Adicionais**:
   - Sistema de favoritos
   - Comentários nas receitas
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
