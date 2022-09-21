local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

local status_dracula, dracula = pcall(require, "dracula")
if (not status_dracula) then return end


local colors = require('dracula').colors()


bufferline.setup({
  options = {
    -- mode = "tabs",
    separator_style = 'slant',
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    -- show_tab_indicators = true,
    color_icons = true,

    -- sort_by = function(buffer_a, buffer_b)
    --     print(vim.inspect(buffer_a))
    --     -- add custom logic
    --     return buffer_a.modified > buffer_b.modified
    -- end,
    always_show_bufferline = true,
    enforce_regular_tabs = true,
    diagnostics = "nvim_lsp",
    -- hover = {
    --          enabled = true,
    --          delay = 200,
    --          reveal = {'close'}
    --      },
    offsets = {
     {
       filetype = "NvimTree",
       text = function()
         return vim.fn.getcwd()
       end,
       highlight = "Directory",
       text_align = "left"
     }
   },
   close_command = function(bufnum)
        require('bufdelete').bufdelete(bufnum, true)
    end
  },

  highlights = {
    separator = {
      fg = colors.black,
      bg = colors.menu,
    },
    separator_selected = {
      fg = colors.black,
    },
    background = {
      fg = '#657b83',
      bg = colors.menu,
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
    },
    fill = {
      bg = colors.black,
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
