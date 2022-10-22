local present, alpha = pcall(require, "alpha")

if not present then
	return
end

-- Dynamic header padding
local fn = vim.fn
local marginTopPercent = 0.2
local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 36,
    align_shortcut = "right",
    hl = "AlphaButtons",
  }

  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

local options = {

	header = {
		type = "text",
		val = {
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣶⠟⠻⢶⣀⣠⣽⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣠⡀⠀⠀⠀⢿⣅⠀⠀⠀⠀⠉⠉⠹⣧⠀⠀⣀⣀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠴⠟⠉⠉⠛⣷⡤⠴⢾⣁⡀⠀⠀⠀⠀⠀⠀⠹⡧⠛⠉⠛⠛⢷⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣧⠀⠀⠀⠀⠀⠉⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀ ⠀⠀⠀⠀O⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⣀⣀⣀⡀⠀⠀⠈⢻⣆⣤⣀⣠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀V⠀⠀⠀⢶⡟⢹⣧⣀⡄⢀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⢀⣠⡴⠟⠈⠉⠙⠷⠶⣶⣆⠀⣠⣽⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣠⣤⣤⠶⣶⡟⢁⣼⠁⠉⠓⠚⠉⣿⣀⠀⠀⠀⠀⠀⠀⠀",
			"⢀⣾⠛⠁⠀⠀⠀⠀⠀⠀⠀⠈⠛⠚⠁⠀⠀⠀⠀⠀⠀⣀⠀⠀⢀⡼⠋⠀⠀⠁⠀⠀⠀⠙⠉⠀⠀⠀⠀⠀⠀⢀⡽⠀⠀⠀⠀⠀⠀⠀",
			"⢾⣿⡀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⢸⣳⣼⣿⢠⣰⡟⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠿⢴⣖⠀⠀⠀⠀⠀",
			"⢀⣿⠃⠀⠀⠀⠀⠀E⠀⠀⠀⠀⠐⠋⠿⢾⡆⠀⢳⣿⠈⡷⢯⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀I⠀⠀⠀⠀⠀⠀⠀⣸⠀⠀⠀⠀⠀",
			"⢸⣿⡀⠀⢀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣾⠿⡄⢀⠎⢘⠛⡿⢧⣤⣤⣦⠄⠀⣤⡄⠀⠀⠀⠀⢠⣤⢤⡤⣞⡥⣶⣄⣀⠀ ",
			"⠀⠸⣷⣤⣾⣷⣀⣀⣿⣷⣠⣴⣤⡀⠀⠐⠒⠋⠀⠈⠳⣷⢤⡀⡎⢸⠁⠀⠈⡇⡍⠀⢠⣷⣷⣂⡤⠄⠀⠈⠛⠳⠷⠟⠀⠀⠀⠘⠋⣿",
			"⠀⠀⠀⠀⠀⠈⠛⢿⣯⡉⠉⣠⠏⠀⠐⣶⠆⠀⢀⣠⣤⡌⢲⠙⠃⣾⠀⠀⡼⣰⠓⢊⣡⠷⢯⡑⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿",
			"⠀⠀⠀⠀⢀⣀⣠⡼⠉⠙⠷⠃⠀⠀⡴⢡⠔⠚⠉⠀⠘⣿⡠⠖⢻⢮⠀⠀⠀⠀⣾⣩⣀⣄⣀⡱⠘⠓⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸",
			"⠀⠀⠀⠰⡿⠍⠁⠀⠀⠀⠀⠀⠀⠈⠴⠃⠀⠀⠀⠀⠀⠈⠀⠀⠀⢛⡆⢸⢨⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡴⠉",
			"⠀⠀⠀⠀⣧⣀⣀⡀⠀⠀N⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⣠⠞⠁⠃⢸⠀⠀⠀⠀⠀⠀⠀⠀M⠀⠀⠀⠀⢴⣶⢞⠛⠛⠃⠀⠀",
			"⠀⠀⠀⠀⠈⠙⠛⣷⣠⠀⠀⠀⢀⣷⣀⠀⠀⠀⠀⢠⣤⠾⠚⠛⣧⠀⠀⢀⡼⢦⣴⠛⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢛⡿⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠈⠿⠷⠶⠾⠻⡭⠟⠀⠀⠀⠀⢠⣉⣷⠀⠀⡏⠀⠀⣞⠀⠀⠀⠸⣏⡀⠀⠀⠀⠀⠀⠀⡶⠶⠶⠒⠾⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠴⠶⠴⠴⠷⠾⠉⠁⠀⢠⡇⠀⠀⢸⠀⠀⠀⠀⠈⠙⠛⣦⣠⠤⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣇⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⠀⠀⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⢸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			"⠀______________________⣠⠋⠀⠀⠀⠳⠄____________________",
		},
		opts = {
			position = "center",
			hl = "AlphaHeader",
		},
	},

	buttons = {
		type = "group",
		val = {
			button("SPC f f", "  Find File  "),
			button("SPC N  ", "  New File  "),
			button("SPC s l", "  List sessions  "),
			button("SPC f o", "  Recent Files  "),
			button("SPC f G", "  Live Grep  "),
			button("SPC e s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
			button("SPC q  ", "  Quit NVIM" , ":qa<CR>"),
		},
		opts = {
			spacing = 1,
		},
	},

	headerPaddingTop = { type = "padding", val = headerPadding },
	headerPaddingBottom = { type = "padding", val = 2 },
}

alpha.setup {
	layout = {
		options.headerPaddingTop,
		options.header,
		options.headerPaddingBottom,
		options.buttons,
	},
}

