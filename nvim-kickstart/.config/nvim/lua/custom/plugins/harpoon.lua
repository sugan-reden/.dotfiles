return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    -- NOTE: The following are two configs , the first is the default from ThePrimeagen, the second uses Telescope UI.
    -- Choose use the default UI, comment the Telescope UI section.
    --
    -- ThePrimeagen setup
    -- -- WARNING: The following is REQUIRED.
    -- harpoon:setup()
    -- -- WARNING: The above is REQUIRED.
    --
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end)
    -- vim.keymap.set('n', '<C-e>', function()
    --   harpoon.ui:toggle_quick_menu(harpoon:list())
    -- end)

    -- Telescope UI setup
    harpoon:setup {}

    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end
    vim.keymap.set('n', '<C-e>', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })
  end,
}
