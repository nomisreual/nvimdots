return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    -- Set current working dir to config root:
    local vimrc = os.getenv 'MYVIMRC'
    local config_directory = string.gsub(vimrc, 'init.lua', '')

    local function switch_and_open_config()
      vim.api.nvim_set_current_dir(config_directory)
      vim.api.nvim_command('edit ' .. vim.fn.expand '$MYVIMRC')
    end

    -- Buttons

    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('f', '  Search files', ':Telescope find_files <CR>'),
      dashboard.button('h', '  Search help', ':Telescope help_tags <CR>'),
      dashboard.button('c', '  Configuration', switch_and_open_config),
      dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
    }

    -- Footer with inspiring quotes
    local function footer()
      local fortune = require 'alpha.fortune'
      local quote = table.concat(fortune(), '\n')

      return quote
    end

    dashboard.section.footer.val = footer()

    -- Settings
    dashboard.section.header.opts.hl = 'Include'
    dashboard.section.buttons.opts.hl = 'Keyword'
    dashboard.section.footer.opts.hl = 'Type'

    alpha.setup(dashboard.opts)
  end,
}
