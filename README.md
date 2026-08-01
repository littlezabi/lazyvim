# ⚡ Custom LazyVim Configuration

A customized, high-performance [LazyVim](https://github.com/LazyVim/LazyVim) setup with **Catppuccin Mocha**, **background transparency**, **system clipboard integration**, and language support.

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

## ✨ Features & Customizations

### 🎨 Theme & Background Transparency
* **Default Theme**: [Catppuccin Mocha](https://github.com/catppuccin/nvim) configured in `lua/plugins/colorscheme.lua`.
* **Transparency**: Enforced using [xiyaowong/transparent.nvim](https://github.com/xiyaowong/transparent.nvim) for background transparency across buffers, floats, statuslines, and sidebars.
* **Toggle Transparency**: Run `:TransparentToggle` inside Neovim.
* **Terminal Opacity Note**: Set your terminal emulator (COSMIC Terminal, Kitty, Alacritty, WezTerm) background opacity to **`80% - 85%`** to enable desktop/window blur through Neovim.

### 📋 System Clipboard
* Integrated with `unnamedplus` via `wl-clipboard` (Wayland) and `xclip` (X11) so yanking (`y`, `yy`) automatically syncs with the system clipboard.

### 📐 Line Height & Typography
* Line spacing configured via `vim.opt.linespace = 6` in `lua/config/options.lua`.

### 📦 Configured Extras & Languages
* **Python**: `lazyvim.plugins.extras.lang.python`
* **AI Support**: `lazyvim.plugins.extras.ai.copilot-chat`

---

## 📁 Repository Structure

```
~/.config/nvim/
├── init.lua
├── lazy-lock.json
├── lazyvim.json
└── lua/
    ├── config/
    │   ├── autocmds.lua
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   └── options.lua
    └── plugins/
        └── colorscheme.lua
```
