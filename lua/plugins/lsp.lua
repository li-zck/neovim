return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
    },
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        cssls = {},
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },

        lua_ls = {
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                ignoredCodes = { 6133, 6192 },
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                -- defaultConfig = {
                --   indent_style = "space",
                --   indent_size = "2",
                --   continuation_indent_size = "2",
                -- },
              },
            },
          },

          pyright = {
            filetypes = {
              "python",
              "markdown",
            },
          },

          efm = {
            filetypes = {
              "solidity",
              "javascript",
              "typescript",
              "json",
              "lua",
              "markdown",
            },

            root_dir = function(fname)
              return require("lspconfig.util").root_pattern(
                "package.json",
                "tsconfig.json",
                "hardhat.config.js",
                ".git",
                "truffle-config.js",
                "foundry.toml"
              )(fname)
            end,

            settings = {
              ["solidity"] = {
                format_on_save = {
                  prettier = {
                    command = "prettierd",
                    args = { "--stdin-filepath", "%filepath%", "--parser", "solidity-parse" },
                    stdin = true,
                  },
                },

                linters = {
                  solhint = {
                    command = "solhint",
                    args = { "%filepath%" },
                    root_dir = require("lspconfig.util").root_pattern("package.json", ".git", "solhintrc.json"),
                    lint_stdin = true,
                    lint_args = { "--stdin", "%filepath%" },
                  },
                },
              },
            },
          },
        },
      },
    },
  },
}
