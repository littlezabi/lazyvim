# ⚡ Custom LazyVim Configuration

A customized, high-performance [LazyVim](https://github.com/LazyVim/LazyVim) setup with **Solarized Osaka (`craftzdog/solarized-osaka.nvim`)**, **background transparency**, **system clipboard integration**, **Pyright Python tooling**, **Rust Toolchain (`rust-analyzer`)**, **LazyGit integration**, and diagnostic shortcuts.

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

# Install pre-commit tool for git hooks
pip install --user pre-commit
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
| **`<leader>cd`** (or `gl`) | **Floating Diagnostic** | Open wrapped floating popup showing full, unwrapped error message under cursor (VS Code / Zed style). |
| **`<leader>cf`** | **Format File / Selection** | Manually format current file or visual selection using `conform.nvim` (`ruff_fix`, `ruff_organize_imports`, `ruff_format`, `rustfmt`, `stylua`, etc.). |
| **`<c-/>`** (or **`Ctrl + /`**) | **Toggle Terminal** | Toggle floating terminal popup inside Neovim. |
| **`<leader>ft`** | **Floating Terminal** | Open floating terminal window. |
| **`<leader>fT`** | **Split Terminal** | Open terminal in a bottom split window. |
| **`<Esc><Esc>`** | **Terminal Normal Mode** | Exit terminal insert mode to copy text or navigate buffers. |
| **`<leader>gg`** | **LazyGit** | Open LazyGit UI inside Neovim (runs pre-commit git hooks automatically). |
| **`<leader>q`** | **Close Buffer / File** | Close current file (`b.py`) without quitting Neovim. |
| **`<leader>bd`** | **Delete Buffer** | Close current buffer (LazyVim default). |
| **`H` / `L`** | **Prev / Next Buffer** | Switch between open buffer tabs across top bar (`a.py` / `b.py`). |
| **`<leader>xx`** | **Trouble Panel (Buffer)** | Open bottom diagnostic panel for current buffer. |
| **`<leader>xX`** | **Trouble Panel (Workspace)** | Open bottom diagnostic panel for full project workspace. |
| **`[d` / `]d`** | **Prev / Next Error** | Jump directly between diagnostic errors and warnings. |
| **`<leader>cv`** | **Select VirtualEnv** | Interactively pick Python virtual environments. |

---

## ✨ Features & Customizations

### 🎨 Theme, Custom Startup Logo & Transparency
* **Custom Startup Logo**: Custom ASCII header banner (`Hi ZABI`) configured in `lua/plugins/ui.lua` via `folke/snacks.nvim` dashboard preset options.
* **Default Theme**: [craftzdog/solarized-osaka.nvim](https://github.com/craftzdog/solarized-osaka.nvim) configured in `lua/plugins/colorscheme.lua`.
* **Transparency**: Enforced using [xiyaowong/transparent.nvim](https://github.com/xiyaowong/transparent.nvim) for background transparency across buffers, floats, statuslines, and sidebars.
* **Toggle Transparency**: Run `:TransparentToggle` inside Neovim.
* **Terminal Opacity Note**: Set your terminal emulator (COSMIC Terminal, Kitty, Alacritty, WezTerm) background opacity to **`80% - 85%`** to enable desktop/window blur through Neovim.

### ⚡ Fast Zed-Style Motion & Animations
* **Snappy Smooth Physics Scrolling (`neoscroll.nvim`)**: Configured quadratic physics easing for `Ctrl+d`, `Ctrl+u`, `Ctrl+f`, `Ctrl+b` with a fast 40% duration multiplier for instant, silky-smooth scrolling.
* **Fluid Cursor Motion Animation (`smear-cursor.nvim`)**: Adds a smooth fluid trail to the cursor as it glides between lines and buffers without any input lag.
* **Snappy Responsiveness**: Set `updatetime = 200` and `timeoutlen = 300` for instant keycombo response and quick visual updates.

### 📁 Workspace Root Control
* **CWD Root Locking**: Configured `vim.g.root_spec = { "cwd" }` so LazyVim strictly keeps the folder you open (e.g. `~/rusty/export_sheet/`) as the workspace root instead of automatically jumping up to parent `.git` directories (`~/rusty/`).

### 🛠️ Formatting & Editing
* **VS Code / Zed Style Diagnostics**: Long trailing inline red error text (`virtual_text`) is **disabled**. Code errors now show clean red/yellow squiggly underlines. Press **`<leader>cd`** or **`gl`** to open the full error popup window under your cursor.
* **Manual Formatting Only (`<leader>cf`)**: Autoformat on save (`:w`) is **disabled**. Formatting is triggered manually on demand using `<leader>cf` via `conform.nvim` (`ruff_fix`, `ruff_organize_imports`, `ruff_format` for Python, `rustfmt` for Rust, `stylua` for Lua).
* **Indent Guides Disabled**: Disabled `snacks.indent` and `mini.indentscope` for a clean code view.
* **Spell Checking**: Enabled on comments and docstrings without false warnings on Python keywords (`def`, `self`, `cls`, `models`). Press **`z=`** for spelling suggestions, **`zg`** to add custom words to your developer dictionary (`~/.config/nvim/spell/en.utf-8.add`), **`[s` / `]s`** to jump between typos, or **`<leader>us`** to toggle spell checking on/off.

### 🐍 Python, Pre-Commit & Pyright Config
* **Pre-commit Git Hook Integration**: Installed `pre-commit` binary system-wide and initialized `.git/hooks/pre-commit` so committing in Neovim or LazyGit (`<leader>gg`) automatically runs `.pre-commit-config.yaml` (`ruff --fix`).
* **Auto-Parent VirtualEnv Search**: Automatically detects `.venv`, `venv`, and `env` in current directory and parent directories (`..`, `../..`).
* **Type Checking**: Set to `standard` mode with `openFilesOnly` diagnostic mode in `lua/plugins/python.lua`.
* **No Pyright Toast Notification Spam**: Pyright LSP progress notifications are suppressed via `noice.nvim`.
* **Compact Hover Docstrings**: Hover popups for classes/functions are strictly capped at `max_height = 15` and `max_width = 80`.

### 🦀 Rust Toolchain & rust-analyzer
* **LSP & Formatting**: Integrated with `rust-analyzer` and `rustfmt` via `lazyvim.plugins.extras.lang.rust` and `lang.toml`.
* **Troubleshooting (`Client rust-analyzer quit with exit code 1`)**:
  If `rust-analyzer` crashes with exit code 1 or says `Unknown binary 'rust-analyzer'`, run:
  ```bash
  rustup component add rust-analyzer
  ```

### 📋 System Clipboard
* Integrated with `unnamedplus` via `wl-clipboard` (Wayland) and `xclip` (X11) so yanking (`y`, `yy`) automatically syncs with the system clipboard.

### 📐 Line Height & Typography
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
        ├── motion.lua
        ├── python.lua
        └── ui.lua
```
