
vim.api.nvim_create_user_command('CompileLatex', function()
    -- Check if Makefile exists in the current directory
    local makefile = vim.fn.getcwd() .. '/Makefile'
    if vim.fn.filereadable(makefile) == 1 then
        -- Run make if Makefile exists
        vim.fn.jobstart({'latexmk -pdf'}, {
            on_stdout = function(_, data) end,
            on_stderr = function(_, data) end,
            on_exit = function(_, code)
                if code == 0 then
                    print("Compile successful!")
                else
                    print("Compile failed!")
                end
            end,
        })
    else
        -- Run pdflatex on the current file if no Makefile exists
        local current_file = vim.fn.expand('%')
        vim.fn.jobstart({'pdflatex', current_file}, {
            on_stdout = function(_, data)
                if data then
                    print(table.concat(data, '\n'))
                end
            end,
            on_stderr = function(_, data)
                if data then
                    print(table.concat(data, '\n'))
                end
            end,
            on_exit = function(_, code)
                if code == 0 then
                    print("Compile successful!")
                else
                    print("Compile failed!")
                end
            end,
        })
    end
end, {})

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    -- api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '?', api.tree.toggle_help, opts("Help"))
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts("Open"))
end

vim.keymap.set('n', '<leader>g', function()
  local is_git = os.execute('git') == 0
  if is_git then
    require("telescope.builtin").git_files()
  else
    require("telescope.builtin").find_files()
  end
end)

require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = "<cr>",
      node_decremental = "<backspace>",
    },
  },
}
-- pass to setup along with your other options
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(invalid_win, w)
      end
    end
    if #invalid_win == #wins - 1 then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
    end
  end
})


require('aerial').setup({
    opts = {
        ensure_installed = { 'bash', 'c', 'diff', 'html', 'latex', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'python' },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = {
            enable = true,
            -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
            --  If you are experiencing weird indenting issues, add the language to
            --  the list of additional_vim_regex_highlighting and disabled languages for indent.
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
    },

    backends = {
        ['_']  = {"lsp", "treesitter"},
        python = {"treesitter"},
        rust   = {"lsp"},
    },
    on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "q", ":AerialClose<CR>", { buffer = bufnr })
        vim.keymap.set("n", "<Esc>", ":AerialClose<CR>", { buffer = bufnr })
    end,

    close_on_select = true,
    layout = {
        default_direction = 'prefer_left',
        min_width = {50, 0.3},
    },
    keymaps = {
        ['<esc>'] = "actions.close",
        ['H'] = "actions.tree_decrease_fold_level",
        ['L'] = "actions.tree_increase_fold_level",},

})

-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<CR>", "<cmd>AerialToggle<CR>")


local M = {}

function M.open_file_at_line()
  local line = vim.fn.getline('.')
  local pattern = "([^:]+):(%d+):"
  local file, line_number = line:match(pattern)
  if file and line_number then
    vim.cmd('edit ' .. file)
    vim.cmd(line_number)
  else
    print("Pattern not found in the current line")
  end
end
return M

