-- ======================================================
-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
-- ======================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- ======================================================
-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
-- ======================================================
require("lazy").setup({
    -- NOTE: Plugins can be added via a link or github org/name. To run setup automatically, use `opts = {}`
    --
    -- { "NMAC427/guess-indent.nvim", opts = {} },

    -- Alternatively, use `config = function() ... end` for full control over the configuration.
    -- If you prefer to call `setup` explicitly, use:
    --    {
    --        'lewis6991/gitsigns.nvim',
    --        config = function()
    --            require('gitsigns').setup({
    --                -- Your gitsigns configuration here
    --            })
    --        end,
    --    }
    --
    -- Here is a more advanced example where we pass configuration
    -- options to `gitsigns.nvim`.
    --
    -- See `:help gitsigns` to understand what the configuration keys do
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 100,
            },
            current_line_blame_formatter = "<author> <author_time:%R> (<abbrev_sha>) - <summary>",
        },
    },

    -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
    --
    -- This is often very useful to both group configuration, as well as handle
    -- lazy loading plugins that don't need to be loaded immediately at startup.
    --
    -- For example, in the following configuration, we use:
    --  event = 'VimEnter'
    --
    -- which loads which-key before all the UI elements are loaded. Events can be
    -- normal autocommands events (`:help autocmd-events`).
    --
    -- Then, because we use the `opts` key (recommended), the configuration runs
    -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

    { -- Useful plugin to show you pending keybinds.
        "folke/which-key.nvim",
        event = "VimEnter",
        opts = {
            -- delay between pressing a key and opening which-key (milliseconds)
            delay = 0,
            icons = { mappings = vim.g.have_nerd_font },

            -- Document existing key chains
            spec = {
                { "<leader>s", group = "[S]earch",   mode = { "n", "v" } },
                { "<leader>t", group = "[T]oggle" },
                { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
            },
        },
    },

    -- NOTE: Plugins can specify dependencies.
    --
    -- The dependencies are proper plugin specifications as well - anything
    -- you do for a plugin at the top level, you can do for a dependency.
    --
    -- Use the `dependencies` key to specify the dependencies of a particular plugin

    { -- Fuzzy Finder (files, lsp, etc)
        "nvim-telescope/telescope.nvim",
        -- By default, Telescope is included and acts as your picker for everything.

        -- If you would like to switch to a different picker (like snacks, or fzf-lua)
        -- you can disable the Telescope plugin by setting enabled to false and enable
        -- your replacement picker by requiring it explicitly (e.g. 'custom.plugins.snacks')

        -- Note: If you customize your config for yourself,
        -- it’s best to remove the Telescope plugin config entirely
        -- instead of just disabling it here, to keep your config clean.
        enabled = true,
        event = "VimEnter",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { -- If encountering errors, see telescope-fzf-native README for installation instructions
                "nvim-telescope/telescope-fzf-native.nvim",

                -- `build` is used to run some command when the plugin is installed/updated.
                -- This is only run then, not every time Neovim starts up.
                build = "make",

                -- `cond` is a condition used to determine whether this plugin should be
                -- installed and loaded.
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
            },
            { "nvim-telescope/telescope-ui-select.nvim" },

            -- Useful for getting pretty icons, but requires a Nerd Font.
            { "nvim-tree/nvim-web-devicons",            enabled = vim.g.have_nerd_font },
        },
        config = function()
            -- Telescope is a fuzzy finder that comes with a lot of different things that
            -- it can fuzzy find! It's more than just a "file finder", it can search
            -- many different aspects of Neovim, your workspace, LSP, and more!
            --
            -- The easiest way to use Telescope, is to start by doing something like:
            --  :Telescope help_tags
            --
            -- After running this command, a window will open up and you're able to
            -- type in the prompt window. You'll see a list of `help_tags` options and
            -- a corresponding preview of the help.
            --
            -- Two important keymaps to use while in Telescope are:
            --  - Insert mode: <c-/>
            --  - Normal mode: ?
            --
            -- This opens a window that shows you all of the keymaps for the current
            -- Telescope picker. This is really useful to discover what Telescope can
            -- do as well as how to actually do it!

            -- [[ Configure Telescope ]]
            -- See `:help telescope` and `:help telescope.setup()`
            require("telescope").setup({
                -- You can put your default mappings / updates / etc. in here
                --  All the info you're looking for is in `:help telescope.setup()`
                --
                -- defaults = {
                --   mappings = {
                --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
                --   },
                -- },
                -- pickers = {}
                extensions = {
                    ["ui-select"] = { require("telescope.themes").get_dropdown() },
                },
            })

            -- Enable Telescope extensions if they are installed
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")

            -- See `:help telescope.builtin`
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
            vim.keymap.set("n", "<leader>fm", builtin.keymaps, { desc = "[F]ind Key[m]aps" })
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
            vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
            vim.keymap.set({ "n", "v" }, "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
            vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[fr] Resume current search" })
            vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
            vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "[F]ind [C]ommands" })
            vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
            vim.keymap.set("n", "<leader>fo", builtin.vim_options, { desc = "[F]ind [O]ptions" })
            vim.keymap.set("n", "<leader>fy", builtin.registers, { desc = "[fy] Find registers" })

            -- This runs on LSP attach per buffer (see main LSP attach function in 'neovim/nvim-lspconfig' config for more info,
            -- it is better explained there). This allows easily switching between pickers if you prefer using something else!
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
                callback = function(event)
                    local buf = event.buf

                    -- Find references for the word under your cursor.
                    vim.keymap.set("n", "grr", builtin.lsp_references, { buffer = buf, desc = "[G]oto [R]eferences" })

                    -- Jump to the implementation of the word under your cursor.
                    -- Useful when your language has ways of declaring types without an actual implementation.
                    vim.keymap.set(
                        "n",
                        "gri",
                        builtin.lsp_implementations,
                        { buffer = buf, desc = "[G]oto [I]mplementation" }
                    )

                    -- Jump to the definition of the word under your cursor.
                    -- This is where a variable was first declared, or where a function is defined, etc.
                    -- To jump back, press <C-t>.
                    vim.keymap.set("n", "grd", builtin.lsp_definitions, { buffer = buf, desc = "[G]oto [D]efinition" })

                    -- Fuzzy find all the symbols in your current document.
                    -- Symbols are things like variables, functions, types, etc.
                    vim.keymap.set(
                        "n",
                        "gO",
                        builtin.lsp_document_symbols,
                        { buffer = buf, desc = "Open Document Symbols" }
                    )

                    -- Fuzzy find all the symbols in your current workspace.
                    -- Similar to document symbols, except searches over your entire project.
                    vim.keymap.set(
                        "n",
                        "gW",
                        builtin.lsp_dynamic_workspace_symbols,
                        { buffer = buf, desc = "Open Workspace Symbols" }
                    )

                    -- Jump to the type of the word under your cursor.
                    -- Useful when you're not sure what type a variable is and you want to see
                    -- the definition of its *type*, not where it was *defined*.
                    vim.keymap.set(
                        "n",
                        "grt",
                        builtin.lsp_type_definitions,
                        { buffer = buf, desc = "[G]oto [T]ype Definition" }
                    )
                end,
            })

            -- Override default behavior and theme when searching
            vim.keymap.set("n", "<leader>/", function()
                -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end, { desc = "[/] Fuzzily search in current buffer" })

            -- It's also possible to pass additional configuration options.
            --  See `:help telescope.builtin.live_grep()` for information about particular keys
            vim.keymap.set("n", "<leader>s/", function()
                builtin.live_grep({
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                })
            end, { desc = "[S]earch [/] in Open Files" })

            -- Shortcut for searching your Neovim configuration files
            vim.keymap.set("n", "<leader>sn", function()
                builtin.find_files({ cwd = vim.fn.stdpath("config") })
            end, { desc = "[S]earch [N]eovim files" })
        end,
    },

    -- LSP Plugins
    {
        -- Main LSP Configuration
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Automatically install LSPs and related tools to stdpath for Neovim
            -- Mason must be loaded before its dependents so we need to set it up here.
            -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
            { "mason-org/mason.nvim", opts = {} },
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "mason-org/mason-lspconfig.nvim",

            -- Useful status updates for LSP.
            { "j-hui/fidget.nvim",    opts = {} },

            -- Allows extra capabilities provided by blink.cmp
            "saghen/blink.cmp",
        },
        config = function()
            -- Brief aside: **What is LSP?**
            --
            -- LSP is an initialism you've probably heard, but might not understand what it is.
            --
            -- LSP stands for Language Server Protocol. It's a protocol that helps editors
            -- and language tooling communicate in a standardized fashion.
            --
            -- In general, you have a "server" which is some tool built to understand a particular
            -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
            -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
            -- processes that communicate with some "client" - in this case, Neovim!
            --
            -- LSP provides Neovim with features like:
            --  - Go to definition
            --  - Find references
            --  - Autocompletion
            --  - Symbol Search
            --  - and more!
            --
            -- Thus, Language Servers are external tools that must be installed separately from
            -- Neovim. This is where `mason` and related plugins come into play.
            --
            -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
            -- and elegantly composed help section, `:help lsp-vs-treesitter`

            --  This function gets run when an LSP attaches to a particular buffer.
            --    That is to say, every time a new file is opened that is associated with
            --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
            --    function will be executed to configure the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
                callback = function(event)
                    -- NOTE: Remember that Lua is a real programming language, and as such it is possible
                    -- to define small helper and utility functions so you don't have to repeat yourself.
                    --
                    -- In this case, we create a function that lets us more easily define mappings specific
                    -- for LSP related items. It sets the mode, buffer and description for us each time.
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    -- Rename the variable under your cursor.
                    --  Most Language Servers support renaming across files, etc.
                    map("grn", vim.lsp.buf.rename, "[R]e[n]ame")

                    -- Execute a code action, usually your cursor needs to be on top of an error
                    -- or a suggestion from your LSP for this to activate.
                    map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

                    -- WARN: This is not Goto Definition, this is Goto Declaration.
                    --  For example, in C this would take you to the header.
                    map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                    -- The following two autocommands are used to highlight references of the
                    -- word under your cursor when your cursor rests there for a little while.
                    --    See `:help CursorHold` for information about when this is executed
                    --
                    -- When you move your cursor, the highlights will be cleared (the second autocommand).
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client:supports_method("textDocument/documentHighlight", event.buf) then
                        local highlight_augroup =
                            vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd("LspDetach", {
                            group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                            end,
                        })
                    end

                    -- The following code creates a keymap to toggle inlay hints in your
                    -- code, if the language server you are using supports them
                    --
                    -- This may be unwanted, since they displace some of your code
                    if client and client:supports_method("textDocument/inlayHint", event.buf) then
                        map("<leader>th", function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                        end, "[T]oggle Inlay [H]ints")
                    end
                end,
            })

            -- LSP servers and clients are able to communicate to each other what features they support.
            --  By default, Neovim doesn't support everything that is in the LSP specification.
            --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
            --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- Enable the following language servers
            --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
            --  See `:help lsp-config` for information about keys and how to configure
            local servers = {
                ansiblels = {
                    cmd = { "ansible-language-server", "--stdio" },
                    settings = {
                        ansible = {
                            python = {
                                interpreterPath = "python",
                            },
                            ansible = {
                                path = "ansible",
                            },
                            executionEnvironment = {
                                enabled = false,
                            },
                            validation = {
                                enabled = true,
                                lint = {
                                    enabled = true,
                                    path = "ansible-lint",
                                },
                            },
                        },
                    },
                    filetypes = { "yaml" },
                    root_markers = { "ansible.cfg", ".ansible-lint", ".ansible.cfg" },
                },
                clangd = {},
                gopls = {},
                -- jedi_language_server = {},
                pyright = {},
                -- pylsp = {
                --     settings = {
                --         pylsp = {
                --             plugins = {
                --                 rope_completion = { enabled = true },
                --                 rope_autoimport = { enabled = false },
                --                 rope = { enabled = true },
                --                 pydocstyle = {
                --                     enabled = true,
                --                     convention = "pep257",
                --                 },
                --                 pyflakes = { enabled = true },
                --                 pycodestyle = { enabled = true },
                --                 pylsp_mypy = { enabled = false },
                --                 pyright = { enabled = false },
                --                 jedi_completion = { enabled = false },
                --                 jedi_hover = { enabled = false },
                --                 jedi_references = { enabled = true },
                --                 jedi_signature_help = { enabled = true },
                --                 jedi_symbols = { enabled = false },
                --             },
                --         },
                --     },
                -- },
                rust_analyzer = {},
                --
                -- Some languages (like typescript) have entire language plugins that can be useful:
                --    https://github.com/pmizio/typescript-tools.nvim
                --
                -- But for many setups, the LSP (`ts_ls`) will work just fine
                -- ts_ls = {},
            }

            -- Ensure the servers and tools above are installed
            --
            -- To check the current status of installed tools and/or manually install
            -- other tools, you can run
            --    :Mason
            --
            -- You can press `g?` for help in this menu.
            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                "lua_ls", -- Lua Language server
                -- "stylua", -- Used to format Lua code
                -- You can add other tools here that you want Mason to install
            })

            require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

            for name, server in pairs(servers) do
                server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                vim.lsp.config(name, server)
                vim.lsp.enable(name)
            end

            -- Special Lua Config, as recommended by neovim help docs
            vim.lsp.config("lua_ls", {
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if
                            path ~= vim.fn.stdpath("config")
                            and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
                        then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                        runtime = {
                            version = "LuaJIT",
                            path = { "lua/?.lua", "lua/?/init.lua" },
                        },
                        workspace = {
                            checkThirdParty = false,
                            -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
                            --  See https://github.com/neovim/nvim-lspconfig/issues/3189
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                    })
                end,
                settings = {
                    Lua = {},
                },
            })
            vim.lsp.enable("lua_ls")
        end,
    },

    { -- Autoformat
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_format = "fallback" })
                end,
                mode = "",
                desc = "[F]ormat buffer",
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = { c = true, cpp = true, go = true }
                if disable_filetypes[vim.bo[bufnr].filetype] then
                    return nil
                else
                    return {
                        timeout_ms = 500,
                        lsp_format = "fallback",
                    }
                end
            end,
            formatters_by_ft = {
                -- lua = { "stylua" },
                -- Conform can also run multiple formatters sequentially
                -- python = { "isort", "black" },
                --
                -- You can use 'stop_after_first' to run the first available formatter from the list
                -- javascript = { "prettierd", "prettier", stop_after_first = true },
            },
        },
    },

    { -- Autocompletion
        "saghen/blink.cmp",
        event = "VimEnter",
        version = "1.*",
        dependencies = {
            -- Snippet Engine
            {
                "L3MON4D3/LuaSnip",
                version = "2.*",
                build = (function()
                    -- Build Step is needed for regex support in snippets.
                    -- This step is not supported in many windows environments.
                    -- Remove the below condition to re-enable on windows.
                    if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
                        return
                    end
                    return "make install_jsregexp"
                end)(),
                dependencies = {
                    -- `friendly-snippets` contains a variety of premade snippets.
                    --    See the README about individual language/framework/plugin snippets:
                    --    https://github.com/rafamadriz/friendly-snippets
                    -- {
                    --   'rafamadriz/friendly-snippets',
                    --   config = function()
                    --     require('luasnip.loaders.from_vscode').lazy_load()
                    --   end,
                    -- },
                },
                opts = {},
            },
        },
        --- @module 'blink.cmp'
        --- @type blink.cmp.Config
        opts = {
            keymap = {
                -- 'default' (recommended) for mappings similar to built-in completions
                --   <c-y> to accept ([y]es) the completion.
                --    This will auto-import if your LSP supports it.
                --    This will expand snippets if the LSP sent a snippet.
                -- 'super-tab' for tab to accept
                -- 'enter' for enter to accept
                -- 'none' for no mappings
                --
                -- For an understanding of why the 'default' preset is recommended,
                -- you will need to read `:help ins-completion`
                --
                -- No, but seriously. Please read `:help ins-completion`, it is really good!
                --
                -- All presets have the following mappings:
                -- <tab>/<s-tab>: move to right/left of your snippet expansion
                -- <c-space>: Open menu or open docs if already open
                -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
                -- <c-e>: Hide menu
                -- <c-k>: Toggle signature help
                --
                -- See :h blink-cmp-config-keymap for defining your own keymap
                preset = "default",

                -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
                --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
            },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = "mono",
            },

            completion = {
                -- By default, you may press `<c-space>` to show the documentation.
                -- Optionally, set `auto_show = true` to show the documentation after a delay.
                documentation = { auto_show = false, auto_show_delay_ms = 500 },
            },
            sources = {
                default = { "lsp", "path", "snippets" },
            },

            snippets = { preset = "luasnip" },

            -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
            -- which automatically downloads a prebuilt binary when enabled.
            --
            -- By default, we use the Lua implementation instead, but you may enable
            -- the rust implementation via `'prefer_rust_with_warning'`
            --
            -- See :h blink-cmp-config-fuzzy for more information
            fuzzy = { implementation = "lua" },

            -- Shows a signature help window while you type arguments for a function
            signature = { enabled = true },
        },
    },

    { -- You can easily change to a different colorscheme.
        -- Change the name of the colorscheme plugin below, and then
        -- change the command in the config to whatever the name of that colorscheme is.
        --
        -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
        "folke/tokyonight.nvim",
        priority = 1000, -- Make sure to load this before all the other start plugins.
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("tokyonight").setup({
                transparent = true,
                styles = {
                    comments = { italic = false }, -- Disable italics in comments
                },
                on_highlights = function(hl, colors)
                    hl.ColorColumn = {
                        bg = "#608794",
                    }
                    -- hl.NormalFloat = { bg = colors.bg_float, fg = colors.fg }
                    -- hl.FloatBorder = { bg = colors.bg_float, fg = colors.border_highlight }
                    -- hl.FloatTitle = { bg = colors.bg_float, fg = colors.title }
                end,
            })

            -- Load the colorscheme here.
            -- Like many other themes, this one has different styles, and you could load
            -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
            vim.cmd.colorscheme("tokyonight-night")
        end,
    },

    -- Highlight todo, notes, etc in comments
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
    },

    { -- Collection of various small independent plugins/modules
        "nvim-mini/mini.nvim",
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
            --  - ci'  - [C]hange [I]nside [']quote
            require("mini.ai").setup({ n_lines = 500 })

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require("mini.surround").setup()

            -- Simple and easy statusline.
            --  You could remove this setup call if you don't like it,
            --  and try some other statusline plugin
            local statusline = require("mini.statusline")
            -- set use_icons to true if you have a Nerd Font
            statusline.setup({
                use_icons = vim.g.have_nerd_font,
                content = {
                    inactive = function()
                        local winid = vim.fn.win_getid() or 0
                        local winnr = vim.fn.winnr() or 0
                        return "W:" .. winid .. "," .. winnr .. " %F %="
                    end,
                },
            })

            -- You can configure sections in the statusline by overriding their
            -- default behavior. For example, here we set the section for
            -- cursor location to LINE:COLUMN
            ---@diagnostic disable-next-line: duplicate-set-field
            statusline.section_location = function()
                local winid = vim.g.statusline_winid or vim.api.nvim_get_current_win()
                local winnr = vim.fn.winnr()

                return "%2l:%-2v" .. " W:" .. winid .. "," .. winnr
            end

            -- ... and there is more!
            --  Check out: https://github.com/nvim-mini/mini.nvim
        end,
    },

    { -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        config = function()
            local filetypes = {
                "bash",
                "c",
                "diff",
                "html",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "query",
                "vim",
                "vimdoc",
                "go",
                "python",
                "perl",
            }
            require("nvim-treesitter.install").install(filetypes)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = filetypes,
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end,
    },

    {
        "Isrothy/neominimap.nvim",
        config = function()
            require('neominimap')
            vim.keymap.set('n', '<leader>mm', '<cmd>Neominimap WinToggle<cr>', { desc = 'Toggle minimap for window' })
            vim.keymap.set('n', '<leader>mr', '<cmd>Neominimap WinRefresh<cr>', { desc = 'Refresh minimaps globally' })
            vim.keymap.set('n', '<leader>mf', '<cmd>Neominimap ToggleFocus<cr>', { desc = 'Switch minimap focus' })
        end,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            filesystem = {
                filtered_items = {
                    visible = true,
                },
            },
            window = {
                width = 30,
            },
        },
    },

    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
        end,
    },

    -- Trying a different buffer manager
    --    {
    --        "ThePrimeagen/harpoon",
    --        branch = "harpoon2",
    --        requires = { "nvim-lua/plenary.nvim" },
    --        init = function()
    --            local harpoon = require("harpoon")
    --            harpoon:setup({})
    --
    --            vim.keymap.set("n", "<leader>ha", function()
    --                harpoon:list():add()
    --            end, { desc = "harpoon add to list" })
    --            vim.keymap.set("n", "<leader>hq", function()
    --                harpoon.ui:toggle_quick_menu(harpoon:list())
    --            end, { desc = "harpoon quick menu" })
    --            vim.keymap.set("n", "<leader>hn", function()
    --                harpoon:list():next()
    --            end, { desc = "harpoon next" })
    --            vim.keymap.set("n", "<leader>hp", function()
    --                harpoon:list():prev()
    --            end, { desc = "harpoon prev" })
    --            vim.keymap.set("n", "<leader>h1", function()
    --                harpoon:list():select(1)
    --            end, { desc = "harpoon select 1" })
    --            vim.keymap.set("n", "<leader>h2", function()
    --                harpoon:list():select(2)
    --            end, { desc = "harpoon select 2" })
    --            vim.keymap.set("n", "<leader>h3", function()
    --                harpoon:list():select(3)
    --            end, { desc = "harpoon select 3" })
    --            vim.keymap.set("n", "<leader>h4", function()
    --                harpoon:list():select(4)
    --            end, { desc = "harpoon select 4" })
    --        end,
    --    },

    {
        "j-morano/buffer_manager.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local bmgr = require('buffer_manager')

            -- setup must be called before requiring ui so that ui.lua captures
            -- the merged config (not the default) when it first loads
            bmgr.setup({
                toggle_key_bindings = { '<leader>bb' },
                select_menu_item_commands = {
                    v = {
                        key = 'v',
                        command = 'vsplit',
                    },
                    s = {
                        key = 's',
                        command = 'split',
                    },
                },
                short_file_names = false,
                show_depth = false,
            })

            local ui = require('buffer_manager.ui')
            vim.keymap.set('n', '<leader>bb', ui.toggle_quick_menu, { desc = 'buffer manager quick menu' })

            -- vim.api.nvim_create_autocmd('FileType', {
            --     pattern = 'buffer_manager',
            --     callback = function(ev)
            --         local opts = { noremap = true, silent = true, buffer = ev.buf }
            --         -- vim.keymap.set('n', 'n', 'j', opts)          -- next item
            --         -- vim.keymap.set('n', 'p', 'k', opts)          -- previous item
            --         -- vim.keymap.set('n', 'q', 'dd', opts)         -- close highlighted buffer
            --         -- vim.keymap.set('n', '<ESC>', ui.toggle_quick_menu, opts) -- close menu
            --     end,
            -- })
        end,
    },

    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            version = "*",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
        ft = "python",
        keys = {
            { "<leader>vv", vim.cmd.VenvSelect },
        },
        opts = {
            options = {},
            search = {},
        },
    },

    {
        "fatih/vim-go",
    },

    {
        'axkirillov/unified.nvim',
        config = function()
            local unified = require('unified')
            local nav = require('unified.navigation')
            unified.setup({
                file_tree = {
                    enabled = false,
                },
            })
            vim.keymap.set('n', '<leader>gg', unified.toggle, { desc = 'Unified: toggle git diff' })
            vim.keymap.set('n', '<leader>gc', unified.pick_commit, { desc = 'Unified: pick base commit' })
            vim.keymap.set('n', '<leader>gn', nav.next_hunk, { desc = 'Unified: goto next diff' })
            vim.keymap.set('n', '<leader>gp', nav.previous_hunk, { desc = 'Unified: goto prev diff' })
        end,
    },
    -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
    -- init.lua. If you want these files, they are in the repository, so you can just download them and
    -- place them in the correct locations.

    -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
    --
    --  Here are some example plugins that I've included in the Kickstart repository.
    --  Uncomment any of the lines below to enable them (you will need to restart nvim).
    --
    -- require 'kickstart.plugins.debug',
    -- require 'kickstart.plugins.indent_line',
    -- require 'kickstart.plugins.lint',
    -- require 'kickstart.plugins.autopairs',
    -- require 'kickstart.plugins.neo-tree',
    -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

    -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
    --    This is the easiest way to modularize your config.
    --
    --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
    -- { import = 'custom.plugins' },
    --
    -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
    -- Or use telescope!
    -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
    -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})
