# ChefGuedes - Documentação do Design

## 🎨 Paleta de Cores

### Modo Claro
- **Primária**: `#ff6b35` (Laranja vibrante - remete ao fogo da cozinha)
- **Primária Escura**: `#e85a28`
- **Primária Clara**: `#ff8c5a`
- **Secundária**: `#004e89` (Azul profundo - profissionalismo)
- **Secundária Escura**: `#003d6e`
- **Destaque**: `#f7b32b` (Amarelo dourado - calor e acolhimento)
- **Sucesso**: `#2a9d8f` (Verde azulado)
- **Perigo**: `#e63946` (Vermelho)

**Fundos:**
- Primário: `#ffffff` (Branco puro)
- Secundário: `#f8f9fa` (Cinza muito claro)
- Terciário: `#e9ecef` (Cinza claro)
- Cards: `#ffffff`

**Textos:**
- Primário: `#212529` (Preto suave)
- Secundário: `#6c757d` (Cinza médio)
- Claro: `#adb5bd` (Cinza claro)

### Modo Escuro
- **Primária**: `#ff7849` (Laranja mais suave)
- **Primária Escura**: `#ff6b35`
- **Primária Clara**: `#ff9575`
- **Secundária**: `#1a8cba` (Azul mais claro)
- **Secundária Escura**: `#0e6a94`
- **Destaque**: `#ffc857` (Amarelo mais claro)
- **Sucesso**: `#38b2a3`
- **Perigo**: `#ff4757`

**Fundos:**
- Primário: `#1a1d23` (Azul escuro quase preto)
- Secundário: `#22262e` (Cinza azulado escuro)
- Terciário: `#2a2f38` (Cinza médio escuro)
- Cards: `#262b35`

**Textos:**
- Primário: `#e9ecef` (Branco suave)
- Secundário: `#adb5bd` (Cinza claro)
- Claro: `#6c757d` (Cinza médio)

## 🔄 Sistema de Tema Claro/Escuro

### Funcionalidade
- Botão de alternância (🌙/☀️) no canto superior direito do menu
- Preferência salva no localStorage
- Transição suave entre temas (0.3s)
- Aplicado automaticamente em todas as páginas

### Implementação
```javascript
// Inicialização automática ao carregar a página
initTheme();

// Alternância manual pelo utilizador
toggleTheme();
```

## 📐 Elementos de Design

### Tipografia
- **Fonte**: Segoe UI (system font)
- **Títulos**: 700 (bold)
- **Corpo**: 400 (regular)
- **Botões**: 600 (semi-bold)

### Espaçamentos
- Border Radius: 12px (padrão), 8px (pequeno)
- Padding Cards: 25-30px
- Gaps Grid: 25px
- Margens Seções: 40-60px

### Sombras
- **Pequena**: `0 2px 4px rgba(0, 0, 0, 0.08)`
- **Média**: `0 4px 12px rgba(0, 0, 0, 0.1)`
- **Grande**: `0 8px 24px rgba(0, 0, 0, 0.12)`

### Animações
- **Hover Cards**: translateY(-8px) + shadow
- **Hover Botões**: translateY(-2px) + shadow
- **Modal**: fadeIn + slideDown
- **Transições**: 0.3s ease

## 🎯 Componentes Principais

### Navbar
- Background com sombra sutil
- Logo com emoji de chef (👨‍🍳)
- Menu com hover effect
- Item ativo destacado com cor primária
- Sticky no topo

### Hero Section
- Gradiente de primária para secundária
- Texto branco com sombra para legibilidade
- Border radius para suavizar

### Cards
- Border de 2px em vez de 1px
- Hover com elevação e mudança de border
- Background branco/escuro dependendo do tema
- Sombras suaves

### Botões
- Gradientes para botões primários
- Hover com elevação
- Active state com reset de elevação
- Cores específicas por tipo

### Formulários
- Inputs com border de 2px
- Focus com outline colorido
- Checkbox com accent color
- Placeholders visíveis

### Modais
- Backdrop com blur
- Animação de entrada (fadeIn + slideDown)
- Close button com hover rotate
- Scroll interno quando necessário

## 🎨 Brand Identity - ChefGuedes

### Conceito
O nome "ChefGuedes" remete a:
- **Chef**: Profissionalismo culinário
- **Guedes**: Sobrenome português comum, proximidade e familiaridade
- **Emoji**: 👨‍🍳 (chef) usado como ícone de marca

### Personalidade
- **Profissional** mas **acessível**
- **Moderno** mas **acolhedor**
- **Organizado** mas **criativo**
- **Técnico** mas **apaixonado**

### Aplicação Visual
- Laranja quente (paixão, energia, apetite)
- Azul profundo (confiança, profissionalismo)
- Amarelo dourado (calor, acolhimento)
- Branco/escuro limpo (clareza, organização)

## 📱 Responsividade

### Breakpoints
- **Desktop**: > 768px
- **Mobile**: ≤ 768px

### Ajustes Mobile
- Menu vertical
- Grid 1 coluna
- Textos menores
- Espaçamentos reduzidos
- Touch-friendly (44px mínimo)

## ♿ Acessibilidade

### Implementado
- **Focus visible**: outline de 3px na cor primária
- **Contraste**: WCAG AA compliant
- **Hover states**: claros e distintos
- **Font size**: mínimo 14px (0.85rem)
- **Touch targets**: mínimo 44x44px
- **Alt texts**: em todas as imagens
- **Semantic HTML**: estrutura clara

## 🎭 Estados de Interação

### Hover
- Cards: elevação + mudança de cor
- Botões: elevação + gradiente invertido
- Links: mudança de cor
- Inputs: border destacado

### Focus
- Outline laranja de 3px
- Visível em todos os elementos interativos

### Active
- Botões: reset de elevação
- Menu: background e cor destacados

### Disabled
- Opacity reduzida
- Cursor not-allowed
- Sem hover effects

## 🔧 Customização

### Variáveis CSS
Todas as cores estão definidas como variáveis CSS no `:root`:
```css
:root {
    --primary-color: #ff6b35;
    --bg-primary: #ffffff;
    --text-primary: #212529;
    /* ... */
}
```

### Dark Mode
Variáveis redefinidas no `body.dark-mode`:
```css
body.dark-mode {
    --primary-color: #ff7849;
    --bg-primary: #1a1d23;
    --text-primary: #e9ecef;
    /* ... */
}
```

## 📊 Performance

### Otimizações
- **Transições**: apenas propriedades específicas
- **Transforms**: uso de GPU acceleration
- **Sombras**: otimizadas para performance
- **Fonts**: system fonts (sem download)
- **CSS**: variáveis para reuso
- **Animações**: only transform e opacity

## 🎯 Filosofia de Design

### Princípios
1. **Clareza**: Interface intuitiva e clara
2. **Consistência**: Padrões mantidos em todo o site
3. **Feedback**: Estados visuais claros
4. **Hierarquia**: Importância visual clara
5. **Simplicidade**: Sem elementos desnecessários
6. **Flexibilidade**: Adaptável a diferentes conteúdos
7. **Acessibilidade**: Usável por todos

### Inspiração
- Material Design (cards, sombras, elevação)
- Flat Design 2.0 (cores vibrantes, gradientes subtis)
- Modern Web (espaçamento generoso, tipografia clara)
- Culinária (cores quentes, ambiente acolhedor)

## 🚀 Manutenção

### Adicionar Nova Cor
1. Adicionar variável em `:root`
2. Adicionar versão dark em `body.dark-mode`
3. Usar `var(--nome-variavel)` no CSS

### Modificar Componente
1. Localizar no CSS
2. Modificar mantendo variáveis
3. Testar em ambos os temas
4. Verificar responsividade

### Manter Consistência
- Usar sempre as variáveis CSS
- Manter espaçamentos padrão
- Seguir padrão de nomenclatura
- Testar em ambos os temas
