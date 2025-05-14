# Neovim Configuration

Este repositório contém a configuração pessoal do Neovim, utilizando `packer.nvim` como gerenciador de plugins.

---

## 🛠️ Pré-requisitos

- Neovim v0.8+  
- Git  
- Node.js (opcional, para alguns plugins de LSP e Treesitter)

---

## 🚀 Instalação

1. Clone este repositório na sua pasta de configuração do Neovim:
   ```bash
   git clone https://seu-repo.git ~/.config/nvim
    ````

2. Abra o Neovim e execute:

   ```vim
   :PackerSync
   ```

   Isso instalará e atualizará todos os plugins listados.

3. (Opcional) Para manter o Treesitter sempre atualizado:

   ```vim
   :TSUpdate
   ```
---

## 🔍 Estrutura principal

```
~/.config/nvim
├── init.lua            # Configurações gerais
└── lua
    └── config
        └── plugins.lua # Definição de plugins e auto-sincronização
```

---

## 📦 Plugins instalados

| Plugin                                     | Descrição                                       |
| ------------------------------------------ | ----------------------------------------------- |
| `wbthomason/packer.nvim`                   | Gerenciador de plugins                          |
| `neovim/nvim-lspconfig`                    | Configuração de LSP                             |
| `folke/tokyonight.nvim`                    | Tema escuro                                     |
| `hrsh7th/nvim-cmp` + fontes                | Autocompletar (buffer, caminho, LSP, snippets)  |
| `nvim-treesitter/nvim-treesitter`          | Realce de sintaxe avançado                      |
| `EmranMR/tree-sitter-blade`                | Parser Blade (para Laravel Blade)               |
| `jwalton512/vim-blade`                     | Suporte a Blade no Vim                          |
| `nvim-lualine/lualine.nvim`                | Barra de status elegante                        |
| `nvim-telescope/telescope.nvim`            | Fuzzy finder                                    |
| `nvim-tree/nvim-tree.lua` + `web-devicons` | Explorador de arquivos                          |
| `akinsho/nvim-bufferline.lua`              | Barra de abas com ícones                        |
| `tpope/vim-fugitive`                       | Integração Git                                  |
| `lewis6991/gitsigns.nvim`                  | Sinais Git na lateral                           |
| `windwp/nvim-autopairs`                    | Fechamento automático de parênteses, aspas etc. |
| `ellisonleao/gruvbox.nvim`                 | Tema Gruvbox                                    |

---

## 🔧 Configurações principais

* **Auto-atualização de plugins**

  ```lua
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/config/plugins.lua source <afile> | PackerSync
  augroup end
  ```

* **nvim-cmp**
  Configurado com buffer, path, LSP e snippets via `vim-vsnip` e `friendly-snippets`.

* **nvim-autopairs**

  ```lua
  require("nvim-autopairs").setup {}
  ```

* **Treesitter**
  Executa `:TSUpdate` após instalação para manter parsers atualizados.

---

## ⚡ Como contribuir / adaptar

1. Adicione novos plugins em `lua/config/plugins.lua` seguindo o padrão `use 'autor/plugin'` ou o formato de tabela para configurações extras.
2. Salve o arquivo e aguarde o `PackerSync` rodar automaticamente.
3. Teste a configuração abrindo diferentes tipos de arquivo (ex.: `.py`, `.js`, `.blade.php`).

---

## 📄 Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

---

#### Boa codificação! 🚀

```
