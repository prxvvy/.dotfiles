local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {

    
"                       __________________________   ",
"               __..--/\".\'                        \'.",
"       __..--\"\"      | |                          | ",
"      /              | |                          | ",
"     /               | |    ___________________   | ",
"    ;                | |   :__________________/:  | ",
"    |                | |   |                 '.|  | ",
"    |                | |   |                  ||  | ",
"    |                | |   |                  ||  | ",
"    |                | |   |                  ||  | ",
"    |                | |   |  heartofgold...  ||  | ",
"    |                | |   |                  ||  | ",
"    |                | |   |                  ||  | ",
"    |                | |   |                  ||  | ",
"    |                | |   |______......-----\"|   | ",
"    |                | |   |_______......-----\"   | ",
"    |                | |                          | ",
"    |                | |                          | ",
"    |                | |                  ____----| ",
"    |                | |_____.....----|#######|---| ",
"    |                | |______.....----\"\"\"\"       | ",
"    |                | |                          | ",
"    |. ..            | |   ,                      | ",
"    |... ....        | |  (c ----- \"\"\"           .' ",
"    |..... ......  |\\|_|    ____......------\"\"\"|\"   ",
"    |. .... .......| |\"\"\"\"\"\"                   |    ",
"    '... ..... ....| |                         |    ",
"      \"-._ .....  .| |                         |    ",
"          \"-._.....| |             ___...---\"\"\"'    ",
"              \"-._.| | ___...---\"\"\"                 ",
"                  \"\"\"\"\"                             ",

    
}

dashboard.section.buttons.val = {
    dashboard.button( "e", "new file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "r", "recent file", ":e #<1<CR>"),
    dashboard.button( "s", "settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "bye", ":qa<CR>"),
}

 -- lcd soundsystem quotes because james murphy is an excellent composer
phrases = {
    "i hear that you and your band have sold your guitars and bought turntables.\ni hear that you and your band have sold your turntables and bought guitars.",

    "forget your past, this is your last chance now.\nand we can break the rules, like nothing will last.",

    "makes you want to feel like a teenager.",

    "where are your friends tonight?",

    "if you\'re afraid of what you need, look around you -you\'re surrounded.\nit won\'t get any better, so be nice.",

    "you're blowing Marxism to pieces.\ntheir little arguments to pieces."

}

math.randomseed(os.time())
dashboard.section.footer.val = phrases[math.random(#phrases)]

alpha.setup(dashboard.opts)
