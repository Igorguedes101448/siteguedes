# 📸 Guia de Administração - Upload de Imagens

## ✅ Receitas Adicionadas ao Site

Foram inseridas **8 receitas portuguesas tradicionais**:

1. **Bacalhau à Brás** - Prato Principal (Peixe)
2. **Caldo Verde** - Entrada (Vegetarianas)
3. **Arroz de Marisco** - Prato Principal (Peixe)
4. **Pastéis de Nata** - Sobremesa (Quentes)
5. **Francesinha** - Prato Principal (Carne)
6. **Polvo à Lagareiro** - Prato Principal (Peixe)
7. **Açorda Alentejana** - Prato Principal (Vegetarianos)
8. **Arroz Doce** - Sobremesa (Frias)

## 🔐 Página de Administração Temporária

### 📍 Acesso
```
http://localhost/siteguedes/pages/admin-imagens.html
```

### 🎯 Funcionalidades

1. **Ver todas as receitas** do site
2. **Estatísticas** em tempo real:
   - Total de receitas
   - Receitas com imagens
   - Receitas sem imagens

3. **Upload de imagens**:
   - Clique em "Carregar Imagem" em cada receita
   - Selecione a imagem do seu computador
   - Preview instantâneo
   - Upload automático para o servidor

### 📋 Como Usar

1. **Aceda à página** `admin-imagens.html`
2. **Faça login** (se necessário)
3. **Veja a lista** de receitas
4. **Clique em "Carregar Imagem"** na receita desejada
5. **Selecione a foto** do prato
6. **Aguarde** o upload (aparece ✅ quando concluído)
7. A imagem fica **imediatamente visível** no site

### 🖼️ Recomendações para Imagens

- **Formato**: JPG, PNG, WEBP ou AVIF
- **Tamanho**: Máximo 5MB
- **Dimensões ideais**: 800x600px ou superior
- **Qualidade**: Boa iluminação, foco no prato

### 📸 Sugestões de Imagens

Pode:
- **Tirar fotos** dos pratos quando os cozinhar
- **Usar imagens de stock** gratuitas (Unsplash, Pexels)
- **Pesquisar** no Google Images (com licença adequada)

**Sites recomendados**:
- https://unsplash.com/s/photos/portuguese-food
- https://www.pexels.com/search/portuguese-cuisine/
- https://pixabay.com/

## 🗑️ Remover a Página Admin (Quando Solicitado)

Quando quiser desativar esta funcionalidade, basta dizer:
**"Remove a página de admin"** ou **"Desativa o upload de imagens"**

Será removido:
- ✖️ `pages/admin-imagens.html`
- ✖️ Acesso à página de administração

As receitas e imagens já carregadas **permanecerão intactas**.

## 🎨 Preview das Receitas

Todas as receitas já estão visíveis em:
- **Explorar Receitas**: `pages/explorar-receitas.html`
- **Dashboard**: `pages/dashboard.html`
- **Detalhes**: Clique em cada receita para ver a página completa

## 🔒 Segurança

A página de admin:
- ✅ Requer autenticação (login)
- ✅ Apenas utilizadores logados podem aceder
- ✅ É temporária e removível

## ❓ Problemas Comuns

### Imagem não aparece
- Verifique o tamanho (máx 5MB)
- Tente outro formato (JPG em vez de PNG)
- Atualize a página após upload

### Upload falha
- Verifique se está logado
- Confirme a conexão com o servidor
- Veja se o WAMP está a correr

### Receitas não aparecem
- Confirme que o SQL foi executado
- Verifique se o MySQL está ativo
- Recarregue a página

---

**Status**: ✅ Funcional e Pronto para Usar  
**Acesso**: http://localhost/siteguedes/pages/admin-imagens.html  
**Receitas**: 8 prontas para imagens
