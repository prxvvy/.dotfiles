local M = {}

M.echo = function(str)
    vim.cmd "redraw"
    vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

M.lazy = function(install_path)
    --------- lazy.nvim ---------------
    M.echo "  Installing lazy.nvim & plugins ..."
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", repo, install_path }
    vim.opt.rtp:prepend(install_path)

    -- install plugins
    require "plugins"

    -- mason packages & show post_boostrap screen
    require "extensions.post_bootstrap" ()
end

return M
