local navic = require("nvim-navic")

require("lualine").setup({
    options = {
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            "packer", "NvimTree", "alpha"
        }
    },
    sections = {
        lualine_c = {
            { 'filename', color = {bg='green', fg='white'}},
            { navic.get_location, cond = navic.is_available },
        }
    }
})
