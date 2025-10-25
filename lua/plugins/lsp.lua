return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
    },

    lazy = false,
    event = { "BufReadPre", "BufNewFile" },

    opts = {
      inlay_hints = {
        enabled = true,
      },

      servers = {
        mojo = {},

        ruby_lsp = {},

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

          efm = {
            filetypes = {
              "solidity",
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
          },
        },

        vtsls = {
          -- settings = {
          --   typescript = {
          --     inlayHints = {
          --       parameterNames = { enabled = "all" },
          --       parameterTypes = { enabled = true },
          --       variableTypes = { enabled = true },
          --       propertyDeclarationTypes = { enabled = true },
          --       functionLikeReturnTypes = { enabled = true },
          --       enumMemberValues = { enabled = true },
          --     },
          --   },
          --
          --   typescriptreact = {
          --     inlayHints = {
          --       parameterNames = { enabled = "all" },
          --       parameterTypes = { enabled = true },
          --       variableTypes = { enabled = true },
          --       propertyDeclarationTypes = { enabled = true },
          --       functionLikeReturnTypes = { enabled = true },
          --       enumMemberValues = { enabled = true },
          --     },
          --   },
          -- },
        },

        -- omnisharp = {
        --   on_attach = function(client, bufnr)
        --     -- tell Neovim this server has no inlay hints
        --     client.server_capabilities.inlayHintProvider = false
        --
        --     -- make sure hints are off in this buffer
        --     if vim.lsp.inlay_hint then
        --       pcall(vim.lsp.inlay_hint.enable, false, { bufnr = bufnr })
        --     end
        --   end,
        --
        --   -- no-op the inlayHint handler just in case
        --   handlers = {
        --     ["textDocument/inlayHint"] = function() end,
        --     ["textDocument/publishDiagnostics"] = function() end,
        --   },
        --
        --   settings = {
        --     RoslynExtensionsOptions = {
        --       InlayHintsOptions = {
        --         EnableForParameters = true,
        --         ForLiteralParameters = true,
        --         ForIndexerParameters = true,
        --         ForObjectCreationParameters = true,
        --         ForOtherParameters = true,
        --         SuppressForParametersThatDifferOnlyBySuffix = false,
        --         SuppressForParametersThatMatchMethodIntent = false,
        --         SuppressForParametersThatMatchArgumentName = false,
        --         EnableForTypes = true,
        --         ForImplicitVariableTypes = true,
        --         ForLambdaParameterTypes = true,
        --         ForImplicitObjectCreation = true,
        --       },
        --     },
        --   },
        -- },

        csharp_ls = {},

        bashls = {},

        dockerls = {},

        gopls = {
          settings = {
            gofumpt = true,

            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },

            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },

            analyses = {
              fieldalignment = true,
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },

            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
          },
        },
      },

      config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities() or {}

        local lspconfig = require("lspconfig")

        lspconfig.ruby_lsp.setup({
          capabilities = capabilities,
        })

        lspconfig.tailwindcss.setup({
          settings = {
            tailwindCSS = {
              includeLanguages = {
                "html",
                "javascript-react",
                "typescript-react",
              },
            },
          },
        })
      end,

      -- require("mason-lspconfig").setup({
      -- handlers = {
      --   function(server_name)
      --     local server = servers[server_name] or {}
      --
      --     server.capabilities = require("blink.cmp").get_lsp_capabilities(server.capabilities or {})
      --
      --     require("lspconfig")[server_name].setup(server)
      -- end,
      -- },
      -- }),
    },

    -- config = function()
    --   local capabilities = require("blink.cmp").get_lsp_capabilities()
    --
    --   local lspconfig = require("lspconfig")
    --
    --   lspconfig.ruby_lsp.setup({
    --     capabilities = capabilities,
    --   })
    -- end,

    -- config = function(_, opts)
    --   -- Capabilities (Blink → cmp → stock)
    --   local capabilities
    --   local ok_blink, blink = pcall(require, "blink.cmp")
    --   if ok_blink and blink.get_lsp_capabilities then
    --     capabilities = blink.get_lsp_capabilities()
    --   else
    --     local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    --     if ok_cmp and cmp_lsp.default_capabilities then
    --       capabilities = cmp_lsp.default_capabilities()
    --     else
    --       capabilities = vim.lsp.protocol.make_client_capabilities()
    --     end
    --   end
    --
    --   -- Mason bootstrap
    --   local mason = require("mason")
    --   local mason_lspconfig = require("mason-lspconfig")
    --   mason.setup()
    --   mason_lspconfig.setup({
    --     ensure_installed = {
    --       "cssls",
    --       "tailwindcss",
    --       "lua_ls",
    --       "vtsls",
    --       "csharp_ls",
    --       "bashls",
    --       "dockerls",
    --       "gopls",
    --       -- "efm", -- only if you actually use it
    --     },
    --   })
    --
    --   -- lspconfig setup
    --   local lspconfig = require("lspconfig")
    --   for name, server_opts in pairs(opts.servers or {}) do
    --     server_opts = server_opts or {}
    --     server_opts.capabilities = vim.tbl_deep_extend("force", capabilities, server_opts.capabilities or {})
    --     lspconfig[name].setup(server_opts)
    --   end
    --
    --   -- Example extra server
    --   lspconfig.ruby_lsp.setup({ capabilities = capabilities })
    -- end,
  },
}
