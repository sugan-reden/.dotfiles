return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = { 'markdown', 'markdown_inline' },
  -- Replace the above line with the following if you only want to load obsidian.nvim for markdown files in
  -- your vault.
  --[[ event = {
    -- If you want to use the home shortcut '~' here, you need to call 'vim.fn.expand'.
    -- E.g. 'BufReadPre ' .. vim.fn.expand '~' .. '/my-vault/*.md'
    -- Refer to `h:file-pattern` for more examples.
    "BufReadPre path/to/my-vault/*.md",
    "BufNewFile path/to/my-vault/*.md",
  }, ]]
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'sr',
        path = '$HOME/notes/sr',
        -- overrides = {
        --   notes_subdir = '00-zettelkasten',
        -- },
      },
      --[[ {
        name = 'work',
        path = './na-notes/*.md',
        overrides = {
          notes_subdir = '00-zettelkasten',
        },
      }, ]]
    },
    -- notes_subdir = '00-zettelkasten',

    log_level = vim.log.levels.ERROR,

    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },

    -- Where to put new notes. Valid options are
    -- * 'current_dir' - put new notes in the same directory as the currend buffer.
    -- * 'notes_subdir' - put new notes in the default notes subdirectory.
    new_notes_location = 'notes_subdir',

    -- Set you preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
    picker = {
      name = 'telescope.nvim',

      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      note_mappings = {
        -- Create a new note from your query.
        new = '<C-x>',
        -- Insert a link to the selected note.
        insert_link = '<C-l>',
      },
      tag_mappings = {
        -- Add tag(s) to the current note.
        tag_note = '<C-x>',
        -- Insert a tag at the current location.
        insert_tag = '<C-l>',
      },
    },

    ui = {
      enable = false,
    },
  },
}
