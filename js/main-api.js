/* ============================================
   ChefGuedes - Script Principal (API)
   Gerenciamento de tema e funcionalidades globais com MySQL
   ============================================ */

// ===== TEMA CLARO/ESCURO =====

// Inicializar tema ao carregar a página
document.addEventListener('DOMContentLoaded', function() {
    initializeTheme();
    createThemeToggle();
    updateAuthMenu();
    setupUserDropdown();
});

// Função para inicializar o tema
function initializeTheme() {
    const savedTheme = localStorage.getItem('chefguedes-theme') || 'light';
    document.documentElement.setAttribute('data-theme', savedTheme);
}

// Função para alternar tema
function toggleTheme() {
    const currentTheme = document.documentElement.getAttribute('data-theme');
    const newTheme = currentTheme === 'light' ? 'dark' : 'light';
    
    document.documentElement.setAttribute('data-theme', newTheme);
    localStorage.setItem('chefguedes-theme', newTheme);
    
    // Atualizar ícone do toggle
    updateThemeToggleIcon(newTheme);
}

// Função para criar botão de toggle de tema
function createThemeToggle() {
    const navMenu = document.querySelector('.nav-menu');
    if (!navMenu) return;
    
    const themeToggleLi = document.createElement('li');
    themeToggleLi.innerHTML = `
        <button class="theme-toggle" id="themeToggle" aria-label="Alternar tema">
            <span class="theme-toggle-slider" id="themeToggleIcon"></span>
        </button>
    `;
    
    navMenu.appendChild(themeToggleLi);
    
    const themeToggle = document.getElementById('themeToggle');
    themeToggle.addEventListener('click', toggleTheme);
    
    // Definir ícone inicial
    const currentTheme = document.documentElement.getAttribute('data-theme');
    updateThemeToggleIcon(currentTheme);
}

// Função para atualizar ícone do toggle
function updateThemeToggleIcon(theme) {
    const icon = document.getElementById('themeToggleIcon');
    if (icon) {
        icon.textContent = theme === 'light' ? '☀️' : '🌙';
    }
}

// ===== ATUALIZAR MENU DE AUTENTICAÇÃO =====

async function updateAuthMenu() {
    const authMenuItems = document.getElementById('authMenuItems');
    if (!authMenuItems) return;
    
    // Detectar se estamos numa subpasta (pages/) ou na raiz
    const isInPagesFolder = window.location.pathname.includes('/pages/');
    const dashboardPath = isInPagesFolder ? 'dashboard.html' : 'pages/dashboard.html';
    const perfilPath = isInPagesFolder ? 'perfil.html' : 'pages/perfil.html';
    const guiaPath = isInPagesFolder ? '../guia.html' : 'guia.html';
    const loginPath = isInPagesFolder ? '../login.html' : 'login.html';
    
    if (isUserLoggedIn()) {
        const currentUser = await getCurrentUser();
        if (currentUser) {
            authMenuItems.innerHTML = `
                <li class="user-menu">
                    <button class="user-menu-toggle" aria-expanded="false" onclick="toggleUserDropdown(event)">
                        ${currentUser.profile_picture ? `<img src="${currentUser.profile_picture}" alt="${currentUser.username}" class="user-avatar-small">` : ''}
                        Olá, ${currentUser.username}
                    </button>
                    <div class="user-dropdown" role="menu" aria-hidden="true">
                        <a href="${guiaPath}">Guia</a>
                        <a href="${dashboardPath}">Dashboard</a>
                        <a href="${perfilPath}">Perfil</a>
                        <a href="#" onclick="logoutUser(); return false;">Sair</a>
                    </div>
                </li>
            `;
        }
    } else {
        authMenuItems.innerHTML = `<li><a href="${loginPath}">Login</a></li>`;
    }
}

// ===== MENU DROPDOWN DO UTILIZADOR =====

function setupUserDropdown() {
    // Fechar qualquer dropdown aberto ao clicar fora
    document.addEventListener('click', function(e) {
        const openDropdowns = document.querySelectorAll('.user-dropdown.show');
        openDropdowns.forEach(dd => {
            const menu = dd.closest('.user-menu');
            if (menu && !menu.contains(e.target)) {
                dd.classList.remove('show');
                const toggle = menu.querySelector('.user-menu-toggle');
                if (toggle) toggle.setAttribute('aria-expanded', 'false');
                dd.setAttribute('aria-hidden', 'true');
            }
        });
    });

    // Fechar com a tecla Esc
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            document.querySelectorAll('.user-dropdown.show').forEach(dd => {
                dd.classList.remove('show');
                const toggle = dd.closest('.user-menu')?.querySelector('.user-menu-toggle');
                if (toggle) toggle.setAttribute('aria-expanded', 'false');
                dd.setAttribute('aria-hidden', 'true');
            });
        }
    });
}

function toggleUserDropdown(event) {
    event.stopPropagation();
    const toggleBtn = event.currentTarget || event.target;
    const menu = toggleBtn.closest('.user-menu');
    if (!menu) return;
    const dropdown = menu.querySelector('.user-dropdown');
    if (!dropdown) return;

    // Fechar outros dropdowns abertos
    document.querySelectorAll('.user-dropdown.show').forEach(d => {
        if (d !== dropdown) {
            d.classList.remove('show');
            const otherToggle = d.closest('.user-menu')?.querySelector('.user-menu-toggle');
            if (otherToggle) otherToggle.setAttribute('aria-expanded', 'false');
            d.setAttribute('aria-hidden', 'true');
        }
    });

    dropdown.classList.toggle('show');
    const isOpen = dropdown.classList.contains('show');
    toggleBtn.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
    dropdown.setAttribute('aria-hidden', isOpen ? 'false' : 'true');
}

// ===== GERENCIAMENTO DE RECEITAS =====

// Obter todas as receitas
async function getAllRecipes(category = '', search = '') {
    try {
        let url = `${API_BASE}/recipes.php`;
        const params = new URLSearchParams();
        
        if (category) params.append('category', category);
        if (search) params.append('search', search);
        
        if (params.toString()) {
            url += '?' + params.toString();
        }
        
        const response = await fetch(url);
        const result = await response.json();
        
        if (result.success && result.data.recipes) {
            return result.data.recipes;
        }
        
        return [];
    } catch (error) {
        console.error('Erro ao obter receitas:', error);
        return [];
    }
}

// Salvar receita
async function saveRecipe(recipe) {
    const sessionToken = getSessionToken();
    
    if (!sessionToken) {
        return {
            success: false,
            message: 'Utilizador não está logado.'
        };
    }
    
    try {
        const action = recipe.id ? 'update' : 'create';
        
        const response = await fetch(`${API_BASE}/recipes.php`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                action: action,
                sessionToken: sessionToken,
                recipeId: recipe.id,
                ...recipe
            })
        });
        
        const result = await response.json();
        return result;
    } catch (error) {
        console.error('Erro ao salvar receita:', error);
        return {
            success: false,
            message: 'Erro de conexão com o servidor.'
        };
    }
}

// Deletar receita
async function deleteRecipe(recipeId) {
    const sessionToken = getSessionToken();
    
    if (!sessionToken) {
        return {
            success: false,
            message: 'Utilizador não está logado.'
        };
    }
    
    try {
        const response = await fetch(`${API_BASE}/recipes.php`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                action: 'delete',
                sessionToken: sessionToken,
                recipeId: recipeId
            })
        });
        
        const result = await response.json();
        return result;
    } catch (error) {
        console.error('Erro ao deletar receita:', error);
        return {
            success: false,
            message: 'Erro de conexão com o servidor.'
        };
    }
}

// Obter receita por ID
async function getRecipeById(recipeId) {
    const recipes = await getAllRecipes();
    return recipes.find(r => r.id == recipeId);
}

// Pesquisar receitas
async function searchRecipes(query, category = '') {
    return await getAllRecipes(category, query);
}

// ===== GERENCIAMENTO DE GRUPOS =====

// Obter todos os grupos
async function getAllGroups() {
    try {
        const response = await fetch(`${API_BASE}/groups.php`);
        const result = await response.json();
        
        if (result.success && result.data.groups) {
            return result.data.groups;
        }
        
        return [];
    } catch (error) {
        console.error('Erro ao obter grupos:', error);
        return [];
    }
}

// Salvar grupo
async function saveGroup(group) {
    const sessionToken = getSessionToken();
    
    if (!sessionToken) {
        return {
            success: false,
            message: 'Utilizador não está logado.'
        };
    }
    
    try {
        const response = await fetch(`${API_BASE}/groups.php`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                action: 'create',
                sessionToken: sessionToken,
                ...group
            })
        });
        
        const result = await response.json();
        return result;
    } catch (error) {
        console.error('Erro ao salvar grupo:', error);
        return {
            success: false,
            message: 'Erro de conexão com o servidor.'
        };
    }
}

// Deletar grupo
async function deleteGroup(groupId) {
    const sessionToken = getSessionToken();
    
    if (!sessionToken) {
        return {
            success: false,
            message: 'Utilizador não está logado.'
        };
    }
    
    try {
        const response = await fetch(`${API_BASE}/groups.php`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                action: 'delete',
                sessionToken: sessionToken,
                groupId: groupId
            })
        });
        
        const result = await response.json();
        return result;
    } catch (error) {
        console.error('Erro ao deletar grupo:', error);
        return {
            success: false,
            message: 'Erro de conexão com o servidor.'
        };
    }
}

// Obter grupo por ID
async function getGroupById(groupId) {
    const groups = await getAllGroups();
    return groups.find(g => g.id == groupId);
}

// ===== FUNÇÕES DE DATA =====

// Formatar data
function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString('pt-PT', {
        day: '2-digit',
        month: '2-digit',
        year: 'numeric'
    });
}

// Formatar data e hora
function formatDateTime(dateString) {
    const date = new Date(dateString);
    return date.toLocaleString('pt-PT', {
        day: '2-digit',
        month: '2-digit',
        year: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    });
}

// ===== FUNÇÕES DE IMAGEM =====

// Converter imagem para Base64
function imageToBase64(file, callback) {
    const reader = new FileReader();
    reader.onload = function(e) {
        callback(e.target.result);
    };
    reader.readAsDataURL(file);
}

// Validar tipo de imagem
function isValidImageType(file) {
    const validTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
    return validTypes.includes(file.type);
}

// Validar tamanho de imagem (max 2MB)
function isValidImageSize(file) {
    const maxSize = 2 * 1024 * 1024; // 2MB
    return file.size <= maxSize;
}

// ===== FUNÇÕES DE NOTIFICAÇÃO =====

// Mostrar notificação de sucesso
function showSuccess(message) {
    showNotification(message, 'success');
}

// Mostrar notificação de erro
function showError(message) {
    showNotification(message, 'error');
}

// Mostrar notificação
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.textContent = message;
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 15px 25px;
        background-color: ${type === 'success' ? 'var(--success-color)' : type === 'error' ? 'var(--danger-color)' : 'var(--info-color)'};
        color: white;
        border-radius: var(--border-radius-sm);
        box-shadow: var(--shadow-lg);
        z-index: 10000;
        animation: slideInRight 0.3s ease;
    `;
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.style.animation = 'slideOutRight 0.3s ease';
        setTimeout(() => {
            document.body.removeChild(notification);
        }, 300);
    }, 3000);
}

// Adicionar animações de notificação
const style = document.createElement('style');
style.textContent = `
    @keyframes slideInRight {
        from {
            transform: translateX(400px);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }
    
    @keyframes slideOutRight {
        from {
            transform: translateX(0);
            opacity: 1;
        }
        to {
            transform: translateX(400px);
            opacity: 0;
        }
    }
    
    .user-avatar-small {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        object-fit: cover;
        margin-right: 8px;
        vertical-align: middle;
    }
`;
document.head.appendChild(style);

// ===== ESTATÍSTICAS =====

// Obter estatísticas do usuário
async function getUserStats() {
    const currentUser = await getCurrentUser();
    
    if (!currentUser) {
        return { recipes: 0, groups: 0, favorites: 0 };
    }
    
    const recipes = await getAllRecipes();
    const groups = await getAllGroups();
    
    const userRecipes = recipes.filter(r => r.author_id == currentUser.id);
    const userGroups = groups.filter(g => g.created_by == currentUser.id);
    
    return {
        recipes: userRecipes.length,
        groups: userGroups.length,
        favorites: currentUser.favorites ? currentUser.favorites.length : 0
    };
}

// ===== FUNÇÕES DE MODAL =====

// Abrir modal
function openModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
        modal.classList.add('show');
        document.body.style.overflow = 'hidden';
    }
}

// Fechar modal
function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
        modal.classList.remove('show');
        document.body.style.overflow = 'auto';
    }
}

// Fechar modal ao clicar fora
window.addEventListener('click', function(e) {
    if (e.target.classList.contains('modal')) {
        closeModal(e.target.id);
    }
});

// ===== FUNÇÕES DE NOTIFICAÇÃO =====

// Mostrar notificação de sucesso
function showSuccess(message) {
    showNotification(message, 'success');
}

// Mostrar notificação de erro
function showError(message) {
    showNotification(message, 'error');
}

// Mostrar notificação
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.textContent = message;
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 15px 25px;
        background-color: ${type === 'success' ? '#28a745' : type === 'error' ? '#dc3545' : '#17a2b8'};
        color: white;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        z-index: 10000;
        animation: slideIn 0.3s ease-out;
    `;
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.style.animation = 'slideOut 0.3s ease-out';
        setTimeout(() => {
            document.body.removeChild(notification);
        }, 300);
    }, 3000);
}

// Adicionar animações CSS se não existirem
if (!document.getElementById('notification-styles')) {
    const style = document.createElement('style');
    style.id = 'notification-styles';
    style.textContent = `
        @keyframes slideIn {
            from {
                transform: translateX(400px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
        @keyframes slideOut {
            from {
                transform: translateX(0);
                opacity: 1;
            }
            to {
                transform: translateX(400px);
                opacity: 0;
            }
        }
    `;
    document.head.appendChild(style);
}
