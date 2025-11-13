# Sistema de Receitas Portuguesas - ChefGuedes

## 📋 Visão Geral

Foi implementado um sistema completo de receitas portuguesas tradicionais com as seguintes funcionalidades:

### ✅ Funcionalidades Implementadas

1. **Hero Slider na Página Inicial**
   - Exibe 5 receitas portuguesas em destaque
   - Transição automática a cada 5 segundos
   - Navegação manual com botões anterior/próximo
   - Indicadores de slides (dots)
   - Totalmente responsivo

2. **Banco de Dados de Receitas**
   - 8 receitas portuguesas tradicionais
   - Cada receita contém:
     - Título, categoria, tempo de preparo
     - Nível de dificuldade
     - Descrição completa
     - Lista de ingredientes
     - Passo a passo do modo de preparo
     - Referência para imagem

3. **Página de Detalhes Individual**
   - Visualização completa da receita
   - Design elegante e organizado
   - Breadcrumb para navegação
   - Botões de impressão e compartilhamento
   - Ingredientes e preparo em formato visual

4. **Integração com Explorar Receitas**
   - Receitas portuguesas aparecem junto com receitas de usuários
   - Mesmo estilo visual para consistência
   - Sistema de filtros funcional
   - Pesquisa integrada

## 📁 Arquivos Criados/Modificados

### Novos Arquivos:
- `js/receitas-portuguesas.js` - Banco de dados de receitas
- `pages/receita-detalhes.html` - Página de visualização individual
- `images/receitas/README.md` - Guia para adicionar imagens

### Arquivos Modificados:
- `index.html` - Hero slider implementado
- `css/styles.css` - Estilos do slider e página de detalhes
- `pages/explorar-receitas.html` - Integração com receitas portuguesas

## 🎨 Design

O sistema mantém completamente o design existente:
- Utiliza as mesmas variáveis CSS
- Compatível com modo claro/escuro
- Responsivo em todos os dispositivos
- Animações suaves e transições

## 🍽️ Receitas Incluídas

1. **Bacalhau à Brás** - Prato Principal (45 min)
2. **Caldo Verde Tradicional** - Entrada (40 min)
3. **Pastéis de Nata Caseiros** - Sobremesa (60 min)
4. **Arroz de Marisco** - Prato Principal (50 min)
5. **Francesinha Autêntica** - Prato Principal (40 min)
6. **Cozido à Portuguesa** - Prato Principal (120 min)
7. **Açorda Alentejana** - Prato Principal (30 min)
8. **Polvo à Lagareiro** - Prato Principal (60 min)

## 🖼️ Imagens

As imagens devem ser colocadas em: `images/receitas/`

Nomes dos arquivos necessários:
- bacalhau-bras.jpg
- caldo-verde.jpg
- pasteis-nata.jpg
- arroz-marisco.jpg
- francesinha.jpg
- cozido-portuguesa.jpg
- acorda-alentejana.jpg
- polvo-lagareiro.jpg

**Nota:** O sistema funciona mesmo sem as imagens, exibindo placeholders automáticos.

## 🔧 Como Funciona

### Hero Slider (Página Inicial)
```javascript
// Seleciona 5 receitas aleatórias das marcadas como "destaque"
const receitasDestaque = getReceitasDestaque(5);

// Rotação automática a cada 5 segundos
// Navegação manual com botões ou dots
```

### Página de Detalhes
```
URL: pages/receita-detalhes.html?id=rp001
- Recebe ID da receita via parâmetro
- Busca receita no banco de dados
- Renderiza todos os detalhes formatados
```

### Integração Explorar Receitas
```javascript
// Combina receitas portuguesas + receitas de usuários
// Mantém filtros e pesquisa funcionais
// Diferencia visualmente (opcional)
```

## 🎯 Funcionalidades Adicionais

- **Compartilhamento:** Usa Web Share API quando disponível
- **Impressão:** Função de imprimir receita formatada
- **Navegação:** Breadcrumbs e links contextuais
- **Fallback:** Sistema robusto com placeholders para imagens

## 📱 Responsividade

Totalmente otimizado para:
- Desktop (1200px+)
- Tablet (768px - 1199px)
- Mobile (< 768px)

## 🚀 Próximos Passos

1. Adicionar as imagens na pasta `images/receitas/`
2. Testar o slider na página inicial
3. Navegar pelas receitas e verificar detalhes
4. Testar filtros na página Explorar Receitas

## 💡 Personalização

Para adicionar mais receitas:
1. Abra `js/receitas-portuguesas.js`
2. Adicione novo objeto no array `receitasPortuguesas`
3. Siga o mesmo formato das receitas existentes
4. Adicione a imagem correspondente

## 🔒 Observações

- O sistema não interfere com receitas criadas por usuários
- Layout original totalmente preservado
- Compatível com sistema de autenticação existente
- Todas as receitas são marcadas como "ChefGuedes" (autor)
