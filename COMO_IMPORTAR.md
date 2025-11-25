# 🚀 COMO IMPORTAR A BASE DE DADOS

## ⚡ MÉTODO RÁPIDO (RECOMENDADO)

### Passo 1: Abrir phpMyAdmin
```
http://localhost/phpmyadmin
```

### Passo 2: Clicar em "Importar"
- No menu superior, clique em **"Importar"**

### Passo 3: Selecionar o ficheiro
- Clique em **"Escolher ficheiro"**
- Navegue até: `c:\wamp64\www\siteguedes\IMPORTAR_BD.sql`
- Selecione o ficheiro **IMPORTAR_BD.sql**

### Passo 4: Importar
- Role a página até ao fundo
- Clique em **"Executar"**

### Passo 5: Verificar
Verá a mensagem:
```
✅ Importação concluída com sucesso!
```

Depois, no lado esquerdo:
- Clique em **siteguedes** (nome da base de dados)
- Verá **10 TABELAS**:
  1. users
  2. user_preferences
  3. sessions
  4. recipes
  5. favorites
  6. groups
  7. group_members
  8. schedules
  9. activities
  10. migrations

---

## ✅ PRONTO!

Agora aceda ao site:
```
http://localhost/siteguedes/
```

E comece a usar! 🎉

---

## 📋 RESUMO DO QUE FOI CORRIGIDO

✅ Nome da BD mudado de `chefguedes` para `siteguedes`
✅ Todos os ficheiros PHP atualizados
✅ Ficheiro único `IMPORTAR_BD.sql` criado
✅ 10 tabelas completas
✅ Pronto para importar no phpMyAdmin

---

## 🎯 ORDEM DE IMPORTAÇÃO

O ficheiro `IMPORTAR_BD.sql`:
1. Cria a base de dados `siteguedes`
2. Cria as 10 tabelas na ordem correta
3. Configura todas as relações (Foreign Keys)
4. Adiciona todos os índices
5. Insere versão inicial nas migrações

**TUDO AUTOMÁTICO! Só precisa importar o ficheiro!** ✨
