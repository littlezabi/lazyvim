# ⚡ Custom LazyVim Configuration

A customized, high-performance [LazyVim](https://github.com/LazyVim/LazyVim) setup with **Catppuccin Mocha**, **background transparency**, **system clipboard integration**, **Pyright Python tooling**, and diagnostic shortcuts.

---

## 🚀 Quick Setup on a New Machine

### 1. Install System Prerequisites (Ubuntu / Pop!_OS / Debian)

Before cloning, install required system dependencies (including clipboard tools, search utilities, and compiler tools for Treesitter/LSP):

```bash
sudo apt update && sudo apt install -y \
  neovim \
  git \
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

## 🔍 Diagnostic & Error Shortcuts

| Shortcut | Action | Description |
|---|---|---|
| **`<leader>cd`** (or `gl`) | **Floating Diagnostic** | Open wrapped floating popup showing full, unwrapped error message under cursor. |
| **`<leader>xx`** | **Trouble Panel (Buffer)** | Open bottom diagnostic panel for current buffer. |
| **`<leader>xX`** | **Trouble Panel (Workspace)** | Open bottom diagnostic panel for full project workspace. |
| **`[d` / `]d`** | **Prev / Next Error** | Jump directly between diagnostic errors and warnings. |
| **`<leader>cv`** | **Select VirtualEnv** | Interactively pick Python virtual environments. |

---

## ✨ Features & Customizations

### 🐍 Python & Pyright Config
* **Auto-Parent VirtualEnv Search**: Automatically detects `.venv`, `venv`, and `env` in current directory and parent directories (`..`, `../..`).
* **Type Checking**: Set to `standard` mode in `lua/plugins/python.lua`.
* **Django ORM Support**: Overrides `reportAttributeAccessIssue` to prevent false-positive warnings on dynamic Django ORM attributes (e.g. `group.filters.all()`).

### 🎨 Theme & Background Transparency
* **Default Theme**: [Catppuccin Mocha](https://github.com/catppuccin/nvim) configured in `lua/plugins/colorscheme.lua`.
* **Transparency**: Enforced using [xiyaowong/transparent.nvim](https://github.com/xiyaowong/transparent.nvim) for background transparency across buffers, floats, statuslines, and sidebars.
* **Toggle Transparency**: Run `:TransparentToggle` inside Neovim.
* **Terminal Opacity Note**: Set your terminal emulator (COSMIC Terminal, Kitty, Alacritty, WezTerm) background opacity to **`80% - 85%`** to enable desktop/window blur through Neovim.

### 📋 System Clipboard
* Integrated with `unnamedplus` via `wl-clipboard` (Wayland) and `xclip` (X11) so yanking (`y`, `yy`) automatically syncs with the system clipboard.

### 📐 Line Height & Typography
* Line spacing configured via `vim.opt.linespace = 6` in `lua/config/options.lua`.

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
        └── python.lua
```
