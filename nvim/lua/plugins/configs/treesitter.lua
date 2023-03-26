local options = {
  ensure_installed = { "bash", "cpp", "c", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "java", "yaml", "markdown", "markdown_inline", "html", "css", "cmake" }, 
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
