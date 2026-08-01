return {
  -- Configure Pyright LSP to automatically detect .venv in current & parent directories
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
          on_new_config = function(new_config, new_root_dir)
            local root = new_root_dir or vim.fn.getcwd()
            local search_dirs = {
              root,
              vim.fn.fnamemodify(root, ":h"),
              vim.fn.fnamemodify(root, ":h:h"),
            }
            
            for _, dir in ipairs(search_dirs) do
              for _, venv_name in ipairs({ ".venv", "venv", "env" }) do
                local venv_path = dir .. "/" .. venv_name
                local python_bin = venv_path .. "/bin/python"
                if vim.fn.executable(python_bin) == 1 then
                  new_config.settings = new_config.settings or {}
                  new_config.settings.python = new_config.settings.python or {}
                  new_config.settings.python.pythonPath = python_bin

                  -- Add site-packages to extraPaths as fallback
                  local site_packages = vim.fn.glob(venv_path .. "/lib/python*/site-packages", true, true)
                  if #site_packages > 0 then
                    new_config.settings.python.analysis = new_config.settings.python.analysis or {}
                    new_config.settings.python.analysis.extraPaths = site_packages
                  end
                  return
                end
              end
            end
          end,
        },
      },
    },
  },

  -- Enable parent directory virtualenv search in venv-selector
  {
    "linux-cultist/venv-selector.nvim",
    opts = function(_, opts)
      opts.search = opts.search or {}
      opts.search.parent_venvs = {
        command = "fd -H -I -t d '^(\\.venv|venv|env)$' .. ../..",
      }
      return opts
    end,
  },
}
