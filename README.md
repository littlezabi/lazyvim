# ⚡ Custom LazyVim Configuration

A customized, high-performance [LazyVim](https://github.com/LazyVim/LazyVim) setup with **Ayu Dark (`Shatur/neovim-ayu`)**, **background transparency**, **system clipboard integration**, **Pyright Python tooling**, **Rust Toolchain (`rust-analyzer`)**, **LazyGit integration**, and diagnostic shortcuts.

---

## 🚀 Quick Setup on a New Machine

### 1. Install System Prerequisites (Ubuntu / Pop!_OS / Debian)

Before cloning, install required system dependencies (including clipboard tools, search utilities, compiler tools, LazyGit, and Rust components):

```bash
# Install system packages
sudo apt update && sudo apt install -y \
  neovim \
  git \
  lazygit \
  curl \
  build-essential \
  wl-clipboard \
  xclip \
  ripgrep \
  fd-find \
  python3-venv \
  python3-pip \
  nodejs \
  npm

# Install rust-analyzer component for Rust LSP
rustup component add rust-analyzer
```

### 2. Clone Configuration

Clone this repository into your `~/.config/nvim` directory:

```bash
git clone https://github.com/littlezabi/lazyvim.git ~/.config/nvim
```

### 3. Launch Neovim

Start Neovim:

```bash
nvim
```

`lazy.nvim` will automatically bootstrap and install all plugins, LSP servers, and Treesitter parsers on first launch.

---

## 🔍 Key Navigation & Terminal Shortcuts

| Shortcut | Action | Description |
|---|---|---|
| **`<C-=>`** / **`<C-->`** | **Zoom In / Out Font** | Increase or decrease font size dynamically (GUI / Neovide). |
| **`<leader>cd`** (or `gl`) | **Floating Diagnostic** | Open wrapped floating popup showing full, unwrapped error message under cursor (VS Code / Zed style). |
| **`<leader>cf`** | **Format File / Selection** | Manually format current file or visual selection using `conform.nvim` (`rustfmt`, `ruff_format`, `stylua`, etc.). |
| **`<c-/>`** (or **`Ctrl + /`**) | **Toggle Terminal** | Toggle floating terminal popup inside Neovim. |
| **`<leader>ft`** | **Floating Terminal** | Open floating terminal window. |
| **`<leader>fT`** | **Split Terminal** | Open terminal in a bottom split window. |
| **`<Esc><Esc>`** | **Terminal Normal Mode** | Exit terminal insert mode to copy text or navigate buffers. |
| **`<leader>gg`** | **LazyGit** | Open LazyGit UI inside Neovim. |
| **`<leader>q`** | **Close Buffer / File** | Close current file (`b.py`) without quitting Neovim. |
| **`<leader>bd`** | **Delete Buffer** | Close current buffer (LazyVim default). |
| **`H` / `L`** | **Prev / Next Buffer** | Switch between open buffer tabs across top bar (`a.py` / `b.py`). |
| **`<leader>xx`** | **Trouble Panel (Buffer)** | Open bottom diagnostic panel for current buffer. |
| **`<leader>xX`** | **Trouble Panel (Workspace)** | Open bottom diagnostic panel for full project workspace. |
| **`[d` / `]d`** | **Prev / Next Error** | Jump directly between diagnostic errors and warnings. |
| **`<leader>cv`** | **Select VirtualEnv** | Interactively pick Python virtual environments. |

---

## ✨ Features & Customizations

### 🎨 Theme & Background Transparency
* **Default Theme**: [Shatur/neovim-ayu](https://github.com/Shatur/neovim-ayu) (`ayu-dark` / `ayu-mirage`) configured in `lua/plugins/colorscheme.lua`.
* **Transparency**: Enforced using [xiyaowong/transparent.nvim](https://github.com/xiyaowong/transparent.nvim) for background transparency across buffers, floats, statuslines, and sidebars.
* **Toggle Transparency**: Run `:TransparentToggle` inside Neovim.
* **Terminal Opacity Note**: Set your terminal emulator (COSMIC Terminal, Kitty, Alacritty, WezTerm) background opacity to **`80% - 85%`** to enable desktop/window blur through Neovim.

### 🛠️ Formatting & Editing
* **VS Code / Zed Style Diagnostics**: Long trailing inline red error text (`virtual_text`) is **disabled**. Code errors now show clean red/yellow squiggly underlines. Press **`<leader>cd`** or **`gl`** to open the full error popup window under your cursor.
* **Manual Formatting Only (`<leader>cf`)**: Autoformat on save is **disabled**. Formatting is triggered on-demand using `<leader>cf` via `conform.nvim` (`rustfmt` for Rust, `ruff_format` for Python, `stylua` for Lua, `shfmt` for Shell).
* **Indent Guides Disabled**: Disabled `snacks.indent` and `mini.indentscope` for a clean code view.
* **Spell Checking**: Enabled (`vim.opt.spell = true`, `spelllang = en`).

### 🦀 Rust Toolchain & rust-analyzer
* **LSP & Formatting**: Integrated with `rust-analyzer` and `rustfmt` via `lazyvim.plugins.extras.lang.rust` and `lang.toml`.
* **Troubleshooting (`Client rust-analyzer quit with exit code 1`)**:
  If `rust-analyzer` crashes with exit code 1 or says `Unknown binary 'rust-analyzer'`, run:
  ```bash
  rustup component add rust-analyzer
  ```

### 🐍 Python & Pyright Config
* **Auto-Parent VirtualEnv Search**: Automatically detects `.venv`, `venv`, and `env` in current directory and parent directories (`..`, `../..`).
* **Type Checking**: Set to `standard` mode in `lua/plugins/python.lua`.
* **Django ORM Support**: Overrides `reportAttributeAccessIssue` to prevent false-positive warnings on dynamic Django ORM attributes (e.g. `group.filters.all()`).

### 📋 System Clipboard
* Integrated with `unnamedplus` via `wl-clipboard` (Wayland) and `xclip` (X11) so yanking (`y`, `yy`) automatically syncs with the system clipboard.

### 📐 Line Height & Typography
* Default editor font size configured to 18pt via `vim.opt.guifont = "JetBrainsMono Nerd Font:h18"`.
* Dynamic font zoom shortcuts: `<C-=>` (Zoom In) and `<C-->` (Zoom Out).
* Line spacing configured via `vim.opt.linespace = 6` in `lua/config/options.lua`.
* Absolute line numbers permanently enabled (`vim.opt.relativenumber = false`).

---

## 📁 Repository Structure

```
~/.config/nvim/
├── init.lua
├── lazy-lock.json
├── lazyvim.json
├── README.md
└── lua/
    ├── config/
    │   ├── autocmds.lua
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   └── options.lua
    └── plugins/
        ├── colorscheme.lua
        ├── formatting.lua
        ├── lsp.lua
        └── python.lua
```
