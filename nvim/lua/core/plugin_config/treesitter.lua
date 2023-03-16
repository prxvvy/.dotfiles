local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
  ensure_installed = { "bash", "cpp", "c", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "java", "yaml", "markdown", "markdown_inline", "html", "css", "cmake" }, -- one of "all" or a list of languages
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  	auto_install = true,
	highlight = {
		enable = true, -- false will disable the whole extension
    	additional_vim_regex_highlighting = false,
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	indent = { enable = true },
})
