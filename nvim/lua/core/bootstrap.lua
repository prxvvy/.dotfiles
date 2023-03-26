local M = {}

M.lazy = function(install_path)
    vim.cmd "redraw|echo '' | echo '  Installing lazy.nvim & plugins ..'"

    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", repo, install_path }

    vim.opt.rtp:prepend(install_path)

    -- install plugins + compile their configs
    require "plugins"
    vim.api.nvim_buf_delete(0, { force = true }) -- close lazy window

    -- install mason packages
    vim.schedule(function()
        vim.cmd "MasonInstallAll"
        local packages = table.concat(vim.g.mason_binaries_list, " ")

        require("mason-registry"):on("package:install:success", function(pkg)
            packages = string.gsub(packages, pkg.name:gsub("%-", "%%-"), "") -- rm package name

            if packages:match "%S" == nil then
                vim.schedule(function()
                    vim.api.nvim_buf_delete(0, { force = true })
                    vim.api.nvim_echo({ { "Now please read the docs at nvchad.com!! 󰕹 󰱬 ", "NvimInternalError" } },
                    true, {})
                end)
            end
        end)
    end)
end

return M
