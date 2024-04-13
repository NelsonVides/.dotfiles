return {

    { 'neovim/nvim-lspconfig' },

    { 'nvim-treesitter/nvim-treesitter',
        config = function()
            require("nvim-treesitter.install").prefer_git = true
            require('nvim-treesitter.configs').setup {
                ensured_installed = {
                    "erlang", "elixir", "c", "cpp", "rust",
                    "lua", "luadoc", "vimdoc", "norg", "graphql",
                    "sql", "bash", "make", "cmake", "diff", "dockerfile",
                    "git_config", "git_rebase", "gitcommit", "gitignore", "ssh_config",
                    "html", "xml", "json", "latex", "markdown", "toml", "yaml", "regex"
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "grr",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
                highlight = {
                    enable = true,
                    disable = {}
                },
                indent = {
                    enable = true, -- this is an experimental feature
                    disable = {}
                },
                matchup = {
                    enable = false,
                    disable = {}
                },
            }
        end,
    },

    { 'zaldih/themery.nvim', lazy = true,
        cmd = { 'Themery' },
        priority = 1000,
        config = function()
            require('themery').setup {
                themes = {
                    "tokyonight-night",
                    "tokyonight-storm",
                    "tokyonight-moon",
                    "tokyodark",
                    "nightfly",
                    "catppuccin-mocha",
                    "catppuccin-macchiato",
                    "catppuccin-frappe",
                    "kanagawa-wave",
                    "kanagawa-dragon",
                    "dracula",
                    "dracula-soft",
                    { name = "VSCode dark", colorscheme = "vscode",
                        before = [[ vim.opt.background = "dark" ]] },
                    { name = "Gruvbox dark", colorscheme = "gruvbox",
                        before = [[ vim.opt.background = "dark" ]] },
                    { name = "VSCode (light)", colorscheme = "vscode",
                        before = [[ vim.opt.background = "light" ]] },
                    { name = "Gruvbox (light)", colorscheme = "gruvbox",
                        before = [[ vim.opt.background = "light" ]] },
                    { name = "tokyonight-day (light)", colorscheme = "tokyonight-day"},
                    { name = "catppuccin-latte (light)", colorscheme = "catppuccin-latte"},
                    { name = "kanagawa-lotus (light)", colorscheme = "kanagawa-lotus"},
                }, -- Your list of installed colorschemes
                themeConfigFile = "~/dotfiles/nvim/lua/theme.lua", -- Described below
                livePreview = true -- Apply theme while browsing. Default to true.
            }
        end
    },
    { 'folke/tokyonight.nvim', name = "tokyonight", lazy = true },
    { 'tiagovla/tokyodark.nvim', name = "tokyodark", lazy = true },
    { 'bluz71/vim-nightfly-colors', name = "nightfly", lazy = true },
    { 'catppuccin/nvim', name = "catppuccin", lazy = true },
    { 'rebelot/kanagawa.nvim', name = "kanagawa", lazy = true },
    { 'ellisonleao/gruvbox.nvim', name = "gruvbox", lazy = true },
    { 'Mofiqul/vscode.nvim', name = "vscode", lazy = true },
    { 'Mofiqul/dracula.nvim', name = "dracula", lazy = true },

    { 'nvim-lualine/lualine.nvim',
        config = function ()
            require('lualine').setup {
                theme = 'auto',
                options = {
                    icons_enabled = true,
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                },
                sections = {
                    lualine_a = {{'mode', fmt = function(str) return str:sub(1,1) end}},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {'filename'},
                    lualine_x = {'encoding', 'fileformat'},
                    lualine_y = {'filetype'},
                    lualine_z = {function() return vim.fn.wordcount().words end, 'progress', 'location'},
                },
            }
        end
    },

    { 'nvimdev/dashboard-nvim', lazy = true,
        dependencies = 'nvim-tree/nvim-web-devicons',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'hyper',
                config = {
                    week_header = {
                        enable = true,
                    },
                    shortcut = {
                        {
                            desc = 'Lazy update',
                            group = '@property',
                            action = 'Lazy update',
                            key = 'u'
                        },
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Files',
                            group = 'Label',
                            action = 'Telescope find_files',
                            key = 'f',
                        },
                        {
                            desc = 'Restore Session',
                            group = 'Number',
                            action = 'SessionLoad',
                            key = 's',
                        },
                    },
                    mru = {
                        limit = 20,
                        icon = 'Most Recent Files',
                        label = '',
                        cwd_only = false
                    },
                }
            }
        end
    },

    { 'nvim-lua/plenary.nvim' },

    { 'willothy/flatten.nvim', lazy = false,
        priority = 1001,
        opts = {
            window = {
                open = "current",
            },
        }
    },

    { 'tpope/vim-fugitive', lazy = true,
        cmd = { 'Git' },
        keys = {
            { "<leader>b", "<cmd>:Git blame<cr>" },
        },
    },
    { 'sindrets/diffview.nvim', lazy = true },
    { 'NeogitOrg/neogit', lazy = true,
        dependencies = {
            'nvim-lua/plenary.nvim',         -- required
            'sindrets/diffview.nvim',        -- optional - Diff integration
            -- Only one of these is needed, not both.
            'nvim-telescope/telescope.nvim', -- optional
            -- 'ibhagwan/fzf-lua',              -- optional
        },
        keys = {
            { "<leader>g", "<cmd>:Neogit<cr>" },
            { "<leader>d", "<cmd>:Neogit diff<cr>" }
        },
        config = function()
            require('neogit').setup {
                graph_style = "unicode",
                telescope_sorter = function()
                    return require("telescope").extensions.fzy.native_fzy_sorter()
                end,
            }
        end
    },

    { 'jiaoshijie/undotree', lazy = true,
        dependencies = 'nvim-lua/plenary.nvim',
        config = true,
        keys = {
            { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
        },
    },

    { 'terrortylor/nvim-comment',
        config = function()
            require('nvim_comment').setup {}
        end
    },

    { 'olimorris/persisted.nvim', lazy = false,
        cmd = { 'SessionLoad', 'SessionSave', 'SessionDelete' },
        config = function()
            require('persisted').setup({
                use_git_branch = true, -- create session files based on the branch of a git enabled repository
                default_branch = "main", -- the branch to load if a session file is not found for the current branch
                autosave = true, -- automatically save session files when exiting Neovim
                should_autosave = function() return vim.bo.filetype ~= "dashboard" end, -- do not autosave if the dashboard is the current filetype
                follow_cwd = true, -- change session file name to match current working directory if it changes
            })
        end
    },

    { 'vhyrro/luarocks.nvim', lazy = true,
        priority = 1000,
        opts = {
            luarocks_build_args = { "--with-lua-include=/home/videsnelson/.asdf/installs/luajit/2.0.5--2.4.4/include/" }, -- extra options to pass to luarocks's configuration script
        }
    },
    { 'nvim-neorg/neorg', lazy = true,
        cmd = { 'Neorg' },
        ft = { 'norg' },
        dependencies = { 'luarocks.nvim' },
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.concealer"] = {
                        config = {
                            icons = {
                                todo = {
                                    done = { icon = "✓⃝" },
                                    pending = { icon = "⏱︎" },
                                },
                                heading = {
                                    icons = {"◉", "◎", "○", "▶", "▷", "⤷"}
                                }
                            },
                        },
                    },
                    ["core.completion"] = {
                        config = {
                            engine = "nvim-cmp"
                        }
                    },
                    ["core.export"] = {},
                    ["core.keybinds"] = {
                        config = {
                            hook = function(keybinds)
                                keybinds.map("norg", "n", "<leader>c", "<cmd>Neorg toggle-concealer<CR>")
                            end
                        }
                    },
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                            default_workspace = "notes"
                        },
                    },
                },
            }
        end,
    },
    { 'andrewferrier/wrapping.nvim', lazy = true,
        cmd = "ToggleWrapMode",
        ft = {"markdown", "norg"},
        config = function()
            require("wrapping").setup({
                auto_set_mode_filetype_allowlist = {
                    "asciidoc", "gitcommit", "latex", "mail",
                    "markdown", "rst", "tex", "text", "norg",
                },
            })
        end
    },

    { 'nvim-tree/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup {
                default = true
            }
        end
    },

    { 'nvim-tree/nvim-tree.lua', lazy = true,
        cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            local function my_on_attach(bufnr)
                local api = require('nvim-tree.api')
                local function opts(desc)
                    return {desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true}
                end
                -- default mappings
                api.config.mappings.default_on_attach(bufnr)
                -- custom mappings
                vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
                vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
                vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
                vim.keymap.set('n', 'i', api.node.show_info_popup, opts('Info'))
                vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
            end
            require("nvim-tree").setup {
                on_attach = my_on_attach,
                view = {
                    float = {enable = true}
                },
                filters = {
                    git_ignored = false,
                    custom = {'*.beam'}
                }
            }
        end,
    },

    { 'johnfrankmorgan/whitespace.nvim',
        config = function ()
            local whitespace = require('whitespace-nvim')
            whitespace.setup {
                highlight = 'DiffDelete',
                ignored_filetypes = {
                    'TelescopePrompt',
                    'dashboard',
                    'Trouble',
                    'NeogitPopup',
                    'help' },
                ignore_terminal = true,
            }
            vim.keymap.set('n', '<Leader>s', whitespace.trim)
        end
    },

    { 'kylechui/nvim-surround', lazy = true,
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = true
    },

    { 'yorickpeterse/nvim-window', lazy = true,
        keys = {
            { "<leader>w", "<cmd>lua require('nvim-window').pick()<cr>" },
        },
        config = true,
    },

    { 'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require('nvim-autopairs').setup({
                check_ts = true
            })
        end
    },

    { 'akinsho/toggleterm.nvim', lazy = true,
        cmd = { 'ToggleTerm' },
        keys = {
            { "<leader>t", "<cmd>ToggleTerm<cr>" },
        },
        config = function()
            require('toggleterm').setup {
                open_mapping = [[<leader>t]],
                insert_mappings = false,
                direction = 'horizontal'
            }
            vim.api.nvim_set_keymap('t', '<esc>', '<C-\\><C-n>', {noremap = true, silent = true})
        end
    },

    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-calc' },
    { 'hrsh7th/cmp-cmdline' },
    { 'chrisgrieser/cmp_yanky' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'lukas-reineke/cmp-under-comparator' },
    { 'L3MON4D3/LuaSnip' },
    { 'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                sorting = {
                    comparators = {
                        function(...) return require('cmp_buffer'):compare_locality(...) end,
                        cmp.config.compare.recently_used,
                        cmp.config.compare.exact,
                        cmp.config.compare.offset,
                        cmp.config.compare.score,
                        require("clangd_extensions.cmp_scores"),
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },
                window = {},
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources(
                    {
                        { name = 'nvim_lsp' },
                        { name = 'nvim_lsp_signature_help' },
                        { name = 'buffer' },
                        { name = 'neorg' },
                        { name = 'luasnip' },
                        { name = 'calc' },
                        { name = 'cmp_yanky' }
                    },
                    {
                        { name = 'path', option = {
                            trailing_slash = true,
                            label_trailing_slash = true
                        } },
                    })
            })
            -- Set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
                },
                {
                    { name = 'buffer' },
                })
            })
            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })
            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path', option = {
                        trailing_slash = true,
                        label_trailing_slash = true
                    } },
                }, {
                    { name = 'cmdline' }
                })
            })
        end
    },

    { 'gbprod/yanky.nvim', lazy = true,
        opts = {},
    },

    { 'p00f/clangd_extensions.nvim', lazy = true,
        config = true,
        opts = {
            inlay_hints = {
                inline = false,
            },
            ast = {
                role_icons = {
                    type = "",
                    declaration = "",
                    expression = "",
                    specifier = "",
                    statement = "",
                    ["template argument"] = "",
                },
                kind_icons = {
                    Compound = "",
                    Recovery = "",
                    TranslationUnit = "",
                    PackExpansion = "",
                    TemplateTypeParm = "",
                    TemplateTemplateParm = "",
                    TemplateParamObject = "",
                },
            },
        },
    },

    { 'nvim-telescope/telescope-fzy-native.nvim' },
    { 'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup {
                defaults = {
                    preview = {
                        treesitter = false
                    }
                },
                extensions = {
                    fzy_native = {
                        override_generic_sorter = false,
                        override_file_sorter = true,
                    }
                }
            }
            require('telescope').load_extension('fzy_native')
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
        end
    },

    { 'alexghergh/nvim-tmux-navigation', -- TODO
        config = function()
            require('nvim-tmux-navigation').setup {
                keybindings = {
                    left = "<C-h>",
                    down = "<C-j>",
                    up = "<C-k>",
                    right = "<C-l>",
                    -- last_active = "<C-\\>",
                    next = "<C-Space>",
                }
            }
        end
    },

    { 'backdround/global-note.nvim', lazy = true,
        cmd = { 'GlobalNote' },
        config = function()
            local global_note = require("global-note")
            local get_project_dir = function()
                local project_directory, err = vim.loop.cwd()
                if project_directory == nil then
                    vim.notify(err, vim.log.levels.WARN)
                    return nil
                end
                return project_directory
            end
            local get_project_name = function()
                local project_directory = get_project_dir()
                if project_directory == nil then return nil end
                local project_name = vim.fs.basename(project_directory)
                if project_name == nil then
                    vim.notify("Unable to get the project name", vim.log.levels.WARN)
                    return nil
                end
                return project_name
            end
            global_note.setup({
                additional_presets = {
                    projects = {
                        title = "Projects Note",
                        command_name = "ProjectsNote",
                        directory = get_project_dir,
                        filename = function() return get_project_name() .. ".md" end,
                    }
                }
            })
            vim.keymap.set("n", "<leader>m", global_note.toggle_note)
            vim.keymap.set("n", "<leader>p", function() global_note.toggle_note('projects') end)
        end,
        keys = {
            { "<leader>m", "<cmd>:GlobalNote<cr>" },
            { "<leader>p", "<cmd>:ProjectsNote<cr>" },
        },
    },

    { 'nanozuki/tabby.nvim',
        lazy = false,
        event = 'VimEnter',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('tabby.tabline').use_preset('active_wins_at_tail', {
                lualine_theme = "vscode",        -- lualine theme name
                theme = {
                    fill = 'TabLineFill',       -- tabline background
                    head = 'TabLine',           -- head element highlight
                    current_tab = 'TabLineSel', -- current tab label highlight
                    tab = 'TabLine',            -- other tab label highlight
                    win = 'TabLine',            -- window highlight
                    tail = 'TabLine',           -- tail element highlight
                },
            })
        end,
    },


    { 'andymass/vim-matchup' },
}
