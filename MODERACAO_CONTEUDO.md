# 🛡️ Sistema de Filtragem de Palavras Inadequadas

## 📋 Visão Geral

O ChefGuedes implementa um **sistema de moderação de conteúdo** que impede palavrões, insultos e termos inadequados em receitas, grupos e outros conteúdos do site.

## 🎯 Funcionalidades

### ✅ Validação em Tempo Real
- **Feedback imediato** enquanto o utilizador digita
- **Destaque visual** em campos com conteúdo inadequado
- **Mensagens claras** sobre o que está errado

### ✅ Validação no Servidor
- **Dupla proteção**: Validação no cliente E servidor
- **Impossível burlar** via API ou ferramentas de desenvolvedor
- **Registos de tentativas** inadequadas

### ✅ Campos Protegidos

#### 📝 Receitas
- **Título** da receita
- **Descrição**
- **Ingredientes**
- **Instruções** (modo de preparação)

#### 👥 Grupos
- **Nome** do grupo
- **Descrição** do grupo

## 🔧 Arquivos do Sistema

### Backend (PHP)
```
api/profanity-filter.php
```
Funções principais:
- `checkProfanity($text)` - Verifica se há palavras inadequadas
- `validateRecipeContent($recipeData)` - Valida receita completa
- `validateGroupName($name)` - Valida nome de grupo
- `validateComment($text)` - Valida comentários

### Frontend (JavaScript)
```
js/profanity-filter.js
```
Funções principais:
- `checkProfanity(text)` - Verificação em tempo real
- `validateRecipeContent(recipeData)` - Validação de receita
- `validateFieldRealtime(fieldId, fieldName)` - Validação ao digitar
- `showFieldValidation(fieldId, isValid, message)` - Feedback visual

## 📚 Como Usar

### 1️⃣ Em Páginas HTML

```html
<!-- Incluir no <head> -->
<script src="../js/profanity-filter.js"></script>

<!-- Ativar validação em tempo real -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    validateFieldRealtime('title', 'O título');
    validateFieldRealtime('description', 'A descrição');
});
</script>
```

### 2️⃣ Antes de Enviar Formulários

```javascript
async function submitForm(e) {
    e.preventDefault();
    
    // Validar conteúdo
    const validation = validateRecipeContent({
        title: document.getElementById('title').value,
        description: document.getElementById('description').value
    });
    
    if (!validation.isValid) {
        showError('Conteúdo inadequado detectado!');
        return;
    }
    
    // Continuar com envio...
}
```

### 3️⃣ No Backend (API)

```php
require_once 'profanity-filter.php';

// Validar antes de inserir no banco de dados
$validation = validateRecipeContent([
    'title' => $_POST['title'],
    'description' => $_POST['description']
]);

if (!$validation['isValid']) {
    jsonError('Conteúdo inadequado detectado!', 400);
}

// Continuar com inserção...
```

## 🔍 Lista de Palavras Filtradas

O sistema filtra:

### 🚫 Categorias Bloqueadas
- ✖️ **Palavrões** comuns em português e inglês
- ✖️ **Insultos** e ofensas pessoais
- ✖️ **Termos racistas** e discriminatórios
- ✖️ **Variações** com caracteres especiais (ex: `p@lavr@o`)
- ✖️ **Abreviações** vulgares (ex: `wtf`, `fdp`)

### ℹ️ Características
- **Case-insensitive**: Detecta maiúsculas e minúsculas
- **Remove acentos**: `caralho` = `caràlho` = `c@ralho`
- **Detecta variações**: Com números, símbolos, etc.
- **Limites de palavras**: Evita falsos positivos

## 🎨 Feedback Visual

### ✅ Campo Válido
```css
.field-valid {
    border-color: #27ae60 !important; /* Verde */
}
```

### ❌ Campo Inválido
```css
.field-invalid {
    border-color: #e74c3c !important; /* Vermelho */
    background-color: #fff5f5 !important;
}
```

### 💬 Mensagem de Erro
```html
<div class="field-error">
    O título contém palavras inadequadas.
</div>
```

## 🔐 Segurança

### Camadas de Proteção

1. **Validação Frontend** (JavaScript)
   - Feedback imediato
   - Melhor experiência do utilizador
   - Pode ser desativada pelo utilizador ⚠️

2. **Validação Backend** (PHP)
   - **Proteção real**
   - Impossível burlar
   - Validação final antes de gravar

### ⚠️ Importante
> A validação frontend é apenas para UX. **SEMPRE valide no backend!**

## 📊 Respostas da API

### ✅ Sucesso
```json
{
    "success": true,
    "message": "Receita criada com sucesso!",
    "data": { ... }
}
```

### ❌ Conteúdo Inadequado
```json
{
    "success": false,
    "message": "Conteúdo inadequado detectado: O título contém palavras inadequadas.",
    "status": 400
}
```

## 🛠️ Manutenção

### Adicionar Novas Palavras

#### Backend (`api/profanity-filter.php`)
```php
function getProfanityList() {
    return [
        // ... palavras existentes ...
        'nova_palavra',
        'outra_palavra'
    ];
}
```

#### Frontend (`js/profanity-filter.js`)
```javascript
const profanityList = [
    // ... palavras existentes ...
    'nova_palavra',
    'outra_palavra'
];
```

### Remover Falsos Positivos

Se uma palavra legítima está sendo bloqueada:

1. **Revisar a lista** de palavras
2. **Ajustar o regex** para contexto
3. **Testar** com exemplos reais

## ✅ Páginas Protegidas

- ✅ `pages/nova-receita.html` - Criar receita
- ✅ `pages/grupos.html` - Criar/editar grupos
- ✅ `api/recipes.php` - API de receitas (criar/editar)
- ✅ `api/groups.php` - API de grupos (criar)

## 📈 Próximas Melhorias

- [ ] Validação de comentários
- [ ] Validação de bio de perfil
- [ ] Sistema de denúncias
- [ ] Moderação manual por admin
- [ ] Histórico de tentativas bloqueadas
- [ ] Whitelist de termos culinários

## 🧪 Testar o Sistema

### Teste Manual
1. Aceder a **Nova Receita**
2. Tentar usar palavrão no título
3. Ver feedback em tempo real
4. Tentar submeter - deve ser bloqueado

### Teste de API
```bash
curl -X POST http://localhost/siteguedes/api/recipes.php \
  -H "Content-Type: application/json" \
  -d '{"action":"create","title":"Receita de m****","sessionToken":"..."}'
```

Resposta esperada:
```json
{"success":false,"message":"Conteúdo inadequado detectado..."}
```

## 📞 Suporte

Para questões sobre o sistema de moderação:
1. Verificar esta documentação
2. Revisar código em `api/profanity-filter.php`
3. Testar com exemplos conhecidos
4. Ajustar lista de palavras conforme necessário

---

**Última atualização**: Dezembro 2025  
**Versão**: 1.0  
**Status**: ✅ Implementado e Funcional
