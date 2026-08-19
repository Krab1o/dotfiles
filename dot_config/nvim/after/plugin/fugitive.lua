-- vim-fugitive is a classic Vimscript plugin: no require(...).setup{} call,
-- it works out of the box after vim.pack.add (see lua/plugins/init.lua).
--
-- Reference of the most useful commands/mappings, so hotkeys can be bound
-- later (mirrors the commented-keymap style used in gitsigns.lua).

--------------------------------------------------------------------------
-- GLOBAL Ex COMMANDS (usable from any buffer)
--------------------------------------------------------------------------
-- :Git | :G                 Open the status summary window (like `git status`).
-- :Git {args}                Run any git command, e.g. :Git push, :Git pull,
--                            :Git commit -m "msg", :Git diff --paginate.
-- :Git blame                 Blame for the current file, synced with cursor.
-- :Git log                   Commit log for the current file/repo (:Gclog
--                            loads it into the quickfix list instead).
-- :Gdiffsplit [object]       Vertical vimdiff against index/commit.
-- :Gvdiffsplit / :Ghdiffsplit  Same, forced vertical/horizontal split.
-- :Gread [object]            Replace buffer with git's version (like checkout).
-- :Gwrite                    Write buffer and `git add` the current file.
-- :Gedit {object}            Edit a git object, e.g. :Gedit HEAD~2:%%
-- :Gremove / :Gmove          `git rm` / `git mv` the current file.
-- :Git mergetool             Open merge conflicts in quickfix + 3-way diff.

--------------------------------------------------------------------------
-- STATUS WINDOW (:Git) MAPPINGS -- active automatically, buffer-local
--------------------------------------------------------------------------
-- g?          Show help for mappings in this window.
-- s / u       Stage / unstage file or hunk under cursor (visual mode: range).
-- U           Unstage everything.
-- X           Discard change under cursor (checkout).
-- =           Toggle inline diff for the file under cursor.
-- >  / <      Expand / collapse inline diff.
-- p           Stage/unstage a single hunk interactively (patch mode).
-- dd / dv / ds  :Gdiffsplit / :Gvdiffsplit / :Ghdiffsplit on file under cursor.
-- o / O / gO  Open file under cursor (split / tab / vsplit).
-- cc          Create a commit.
-- ca          Amend last commit (edit message).
-- ce          Amend last commit (keep message).
-- cw          Reword last commit.
-- cf / cF     Create fixup! commit (cF also autosquash-rebases immediately).
-- cs / cS     Create squash! commit (cS also autosquash-rebases immediately).
-- cn          Create squash! commit and edit its message.
-- c<Space>    Populate command line with ":Git commit ".
-- rw / rf / rs  reword/fixup/squash the commit under cursor via rebase -i.
-- ri          Interactive rebase against commit under cursor.
-- rx          Abort/skip/continue rebase (context-dependent).
-- q           Close the status window.

--------------------------------------------------------------------------
-- BLAME WINDOW (:Git blame) MAPPINGS
--------------------------------------------------------------------------
-- o / O / gO  Open the commit under cursor (split / tab / vsplit).
-- ~           Reblame the file as of the commit under cursor (go back in time).
-- P           Reblame at the parent of the commit under cursor.
-- A / C / D   Align/resize the blame columns (author / committer / date).
-- i           Same as `o` but does not close the blame window.
-- gq / q      Close the blame window.

--------------------------------------------------------------------------
-- SUGGESTED CUSTOM KEYMAPS (uncomment & adjust when ready)
--------------------------------------------------------------------------
vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'git [s]tatus' })
vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<CR>', { desc = 'git [b]lame' })
vim.keymap.set('n', '<leader>gl', '<cmd>Git log<CR>', { desc = 'git [l]og' })
vim.keymap.set('n', '<leader>gd', '<cmd>Gdiffsplit<CR>', { desc = 'git [d]iffsplit' })
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>', { desc = 'git [p]ush' })
vim.keymap.set('n', '<leader>gP', '<cmd>Git pull<CR>', { desc = 'git [P]ull' })
vim.keymap.set('n', '<leader>gw', '<cmd>Gwrite<CR>', { desc = 'git [w]rite/add file' })
vim.keymap.set('n', '<leader>gr', '<cmd>Gread<CR>', { desc = 'git [r]ead/checkout file' })
--
-- Don't forget to add a which-key group in after/plugin/which-key.lua, e.g.:
-- { '<leader>g', group = '[G]it' },
