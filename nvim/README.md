![alt text](https://github.com/prxvvy/.dotfiles/blob/master/nvim/assets/nvim.jpg "Neovim")

# Nvim configs

Copied [nvchad](https://github.com/NvChad/NvChad) code as well as its [ui](https://github.com/NvChad/ui) and [base46](https://github.com/NvChad/base46) plugins and removed some parts I don't need to make it fit my tastes and to get to understand how those were structured. I didn't add all base46 themes, just the ones I liked the most and same goes for the ui plugins. But in general it should be as fast as nvchad and work perfectly the same.

# Mappings

Leader key is ","

| Category    |  Mode   |        Keybind | Description                                       |
| :---------- | :-----: | -------------: | ------------------------------------------------- |
| General     | Insert  |    Control + a | Go to the beginning of a line                     |
| General     | Insert  |    Control + e | Go to the end of a line                           |
| General     | Insert  |    Control + h | Move left                                         |
| General     | Insert  |    Control + l | Move right                                        |
| General     | Insert  |    Control + j | Move down                                         |
| General     | Insert  |    Control + k | Move up                                           |
| General     | Normal  |    Control + h | Move to left window                               |
| General     | Normal  |    Control + l | Move to right window                              |
| General     | Normal  |    Control + j | Move to down window                               |
| General     | Normal  |    Control + k | Move to up window                                 |
| General     | Normal  |    Control + s | Save file                                         |
| General     | Normal  |    Control + q | Quit                                              |
| General     | Normal  |            TAB | Go to next buffer                                 |
| General     | Normal  |    Shift + tAB | Go to previous buffer                             |
| General     | Normal  |     Leader + b | Close buffer                                      |
| General     | Normal  |    Leader + so | Source file                                       |
| General     | Normal  |     Leader + e | Open nvim config                                  |
| General     | Normal  |              ; | Get into command mode                             |
| General     | Normal  |        Alt + l | Resize window +5 vertically                       |
| General     | Normal  |        Alt + h | Resize window -5 vertically                       |
| General     | Normal  |        Alt + j | Resize window +5 horizontally                     |
| General     | Normal  |        Alt + k | Resize window -5 horizontally                     |
| General     | Normal  |              H | Go to the beginning of a line                     |
| General     | Normal  |              L | Go to the end of a line                           |
| General     | Normal  |     Leader + x | Make file executable                              |
| General     | Normal  |     Leader + s | Replace all occurrences in buffer                 |
| General     | Visual  |              < | Ident blocks of code to the left                  |
| General     | Visual  |              > | Ident blocks of code to the right                 |
| General     | Visual  |              J | Move blocks of code up                            |
| General     | Visual  |              K | Move blocks of code down                          |
| General     | Visual  |              H | Go to the beginning of a line                     |
| General     | Visual  |              L | Go to the end of a line                           |
| General     | Command |            w!! | Sudo to write protected files                     |
| Comment     | Normal  |   Leader + gcc | Comment line with single comment type             |
| Comment     | Normal  |   Leader + gbc | Comment line with block comment type              |
| Comment     | Visual  |    Leader + gc | Comment line with single comment type             |
| Comment     | Visual  |    Leader + gb | Comment line with block comment type              |
| ClangFormat | Normal  |             F2 | Format file with ClangFormat                      |
| Undotree    | Normal  |     Leader + u | Toggle undotree                                   |
| NvimTree    | Normal  |    Control + n | Toggle NvimTree                                   |
| Telescope   | Normal  |    Leader + pf | Find project files with Telescope                 |
| Telescope   | Normal  |    Leader + fa | Find project files including .files with Telescop |
| Telescope   | Normal  |    Leader + fw | Live grep                                         |
| Telescope   | Normal  | Leader + space | Find opened buffer with Telescope                 |
| Telescope   | Normal  |    Leader + vh | Help page with Telescope                          |
| Telescope   | Normal  |     Leader + ? | Find opened buffers history with Telescope        |
| Telescope   | Normal  |     Leader + / | Fuzzy find in buffer with Telescope               |
| Telescope   | Normal  |    Leader + cm | List git commits with Telescope                   |
| Telescope   | Normal  |    Leader + gt | List git status with Telescope                    |
| Telescope   | Normal  |   Leader + fgf | List git files with Telescope                     |
| Telescope   | Normal  |   Leader + fgb | List git branches with Telescope                  |
| Telescope   | Normal  |   Leader + fgt | List git stash with Telescope                     |
| BlankLine   | Normal  |    Leader + cc | Jump to current context                           |
| Toggleterm  | Normal  |   Control + \  | Toggle term                                       |
| Lspconfig   | Normal  |             gD | Lsp goto declaration                              |
| Lspconfig   | Normal  |             gd | Lsp goto definition                               |
| Lspconfig   | Normal  |              K | LSP hover doc                                     |
| Lspconfig   | Normal  |             gi | LSP goto implementation                           |
| Lspconfig   | Normal  |    Leader + ls | LSP signature help                                |
| Lspconfig   | Normal  |              D | LSP definition type                               |
| Lspconfig   | Normal  |    Leader + ra | LSP rename with UI                                |
| Lspconfig   | Normal  |    Leader + ca | LSP code action                                   |
| Lspconfig   | Normal  |    Leader + gr | LSP references                                    |
| Lspconfig   | Normal  |     Leader + f | LSP floating diagnostics                          |
| Lspconfig   | Normal  |             [d | LSP goto previous diagnostic                      |
| Lspconfig   | Normal  |             ]d | LSP goto next diagnostic                          |
| Lspconfig   | Normal  |     Leader + q | LSP setloclist                                    |
| Lspconfig   | Normal  |      Space + f | LSP format file                                   |
| Lspconfig   | Normal  |    Leader + wa | LSP add workspace folder                          |
| Lspconfig   | Normal  |    Leader + wr | LSP remove workspace folder                       |
| Lspconfig   | Normal  |    Leader + wl | LSP list workspace folders                        |
