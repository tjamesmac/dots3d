-- @todo Make sure we get the extra statusline types
if not pcall(require, "heirline") then
  return
end

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local background = 'bright_bg'
-- @todo make this darker
local Vi_surround_bg = 'dark_gray'

-- @todo get better err, warn, info, hint icons
local icons = {
  --  ✗   󰅖 󰅘 󰅚 󰅙 󱎘 
  close = "󰅙 ",
  dir = "󰉋 ",
  lsp = " ", --   
  vim = " ",
  debug = " ",
  err = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
  warn = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
  info = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
  hint = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
}

local function setup_colors()
  return {
  bright_bg = utils.get_highlight("Folded").bg,
  bright_fg = utils.get_highlight("Folded").fg,
  red = utils.get_highlight("DiagnosticError").fg,
  dark_red = utils.get_highlight("DiffDelete").bg,
  green = utils.get_highlight("String").fg,
  blue = utils.get_highlight("Function").fg,
  gray = utils.get_highlight("NonText").fg,
  dark_gray = utils.get_highlight("Comment").fg,
  orange = utils.get_highlight("Constant").fg,
  purple = utils.get_highlight("Statement").fg,
  cyan = utils.get_highlight("Special").fg,
  diag_warn = utils.get_highlight("DiagnosticWarn").fg,
  diag_error = utils.get_highlight("DiagnosticError").fg,
  diag_hint = utils.get_highlight("DiagnosticHint").fg,
  diag_info = utils.get_highlight("DiagnosticInfo").fg,
  git_del = utils.get_highlight("DiffDelete").fg,
  git_add = utils.get_highlight("DiffAdd").fg,
  git_change = utils.get_highlight("DiffChange").fg,
}
end


local ViMode = {
  init = function(self)
    self.mode = vim.fn.mode(1)
  end,
  static = {
    mode_names = {
      n = "N",
      no = "N?",
      nov = "N?",
      noV = "N?",
      ["no\22"] = "N?",
      niI = "Ni",
      niR = "Nr",
      niV = "Nv",
      nt = "Nt",
      v = "V",
      vs = "Vs",
      V = "V_",
      Vs = "Vs",
      ["\22"] = "^V",
      ["\22s"] = "^V",
      s = "S",
      S = "S_",
      ["\19"] = "^S",
      i = "I",
      ic = "Ic",
      ix = "Ix",
      R = "R",
      Rc = "Rc",
      Rx = "Rx",
      Rv = "Rv",
      Rvc = "Rv",
      Rvx = "Rv",
      c = "C",
      cv = "Ex",
      r = "...",
      rm = "M",
      ["r?"] = "?",
      ["!"] = "!",
      t = "T",
    },
  },
  provider = function(self)
    return icons.vim .. self.mode_names[self.mode] .. "%)"
  end,
  hl = function(self)
    local color = self:mode_color()
    return { fg = color, bg = Vi_surround_bg, bold = true }
  end,
  update = {
    "ModeChanged",
    pattern = "*:*",
    callback = vim.schedule_wrap(function()
      vim.cmd("redrawstatus")
    end),
  },
}


local Vi = {
  {
    provider = "",
    hl = { fg = Vi_surround_bg, bg = background }
  },
  ViMode,
  {
    provider = "",
    hl = { fg = Vi_surround_bg, bg = background }
  },
}


local Git = {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  hl = { fg = "diag_warn", bg = background },
  -- hl = { fg = "white" },
  {
    -- git branch name
    provider = function(self)
      return " " .. self.status_dict.head
    end,
    hl = { bold = true, fg = "diag_warn" }
  },
}

local Space = { provider = " ", hl = { bg = background } }
local Align = { provider = "%=", hl = { bg = background } }

local FileNameBlock = {
  -- let's first set up some attributes needed by this component and it's children
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}
-- We can now define some children separately and add them later

local FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon)
  end,
  hl = function(self)
    return { fg = self.icon_color, bg = background }
  end
}

local FileName = {
  provider = function(self)
    -- first, trim the pattern relative to the current directory. For other
    -- options, see :h filename-modifers
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then return "[No Name]" end
    -- now, if the filename would occupy more than 1/4th of the available
    -- space, we trim the file path to its initials
    -- See Flexible Components section below for dynamic truncation
    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename
  end,
  -- hl = { fg = utils.get_highlight("Directory").fg, bg = background },
  hl = { fg = 'white', bg = background },
}

local FileFlags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = "[+]",
    hl = { fg = "bright_fg", bg = background },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = "",
    hl = { fg = "orange" },
  },
}

-- Now, let's say that we want the filename color to change if the buffer is
-- modified. Of course, we could do that directly using the FileName.hl field,
-- but we'll see how easy it is to alter existing components using a "modifier"
-- component

local FileNameModifer = {
  hl = function()
    if vim.bo.modified then
      -- use `force` because we need to override the child's hl foreground
      return { fg = 'bright_fg', bg = background, bold = true, force = true }
    end
  end,
}

-- let's add the children to our FileNameBlock component
FileNameBlock = utils.insert(FileNameBlock,
  FileIcon,
  Space,
  utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
  Space,
  FileFlags,
  { provider = '%<' } -- this means that the statusline is cut here when there's not enough space
)

local LSPActive = {
  condition = conditions.lsp_attached,
  update    = { 'LspAttach', 'LspDetach' },
  -- You can keep it simple,
  -- provider = icons.lsp .. " [LSP]",

  -- Or complicate things a bit and get the servers names
  provider  = function()
    local names = {}
    for i, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      table.insert(names, server.name)
    end
    return icons.lsp .. "[" .. table.concat(names, " ") .. "]"
  end,
  hl        = { fg = "green", bg = background, bold = true },
}

local Diagnostics = {
  condition = conditions.has_diagnostics,
  static = {
    error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
    warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
    info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
    hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
  },
  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,
  update = { "DiagnosticChanged", "BufEnter" },
  {
    provider = "![",
    hl = { bg = "bright_bg" }
  },
  {
    provider = function(self)
      -- 0 is just another output, we can decide to print it or not!
      return self.errors > 0 and (self.error_icon .. self.errors .. " ")
    end,
    hl = { fg = "diag_error", bg = "bright_bg" },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
    end,
    hl = { fg = "diag_warn", bg = "bright_bg" },
  },
  {
    provider = function(self)
      return self.info > 0 and (self.info_icon .. self.info .. " ")
    end,
    hl = { fg = "diag_info", bg = "bright_bg" },
  },
  {
    provider = function(self)
      return self.hints > 0 and (self.hint_icon .. self.hints)
    end,
    hl = { fg = "diag_hint", bg = "bright_bg" },
  },
  {
    provider = "]",
    hl = { bg = "bright_bg" }
  },
}

local DefaultStatusline = {
  Vi,
  Space,
  Space,
  FileNameBlock,
  Space,
  Space,
  Git,
  Space,
  Align,
  Diagnostics,
  Align,
  LSPActive,
  Align,
}

local StatusLines = {
  hl = function()
    if conditions.is_active() then
      return "statusLine"
    else
      return "StatusLineNC"
    end
  end,
  static = {
    mode_colors = {
      n = "red",
      i = "green",
      v = "cyan",
      V = "cyan",
      ["\22"] = "cyan", -- this is an actual ^V, type <C-v><C-v> in insert mode
      c = "orange",
      s = "purple",
      S = "purple",
      ["\19"] = "purple", -- this is an actual ^S, type <C-v><C-s> in insert mode
      R = "orange",
      r = "orange",
      ["!"] = "red",
      t = "green",
    },
    mode_color = function(self)
      local mode = conditions.is_active() and vim.fn.mode() or "n"
      return self.mode_colors[mode]
    end,
  },
  fallthrough = false,
  -- GitStatusline,
  -- SpecialStatusline,
  -- TerminalStatusline,
  -- InactiveStatusline,
  DefaultStatusline,
}


require('heirline').setup({
  statusline = StatusLines,
  -- winbar = WinBar,
  -- tabline = TabLine,
  -- statuscolumn = Stc,
  -- opts = {
  --   disable_winbar_cb = function(args)
  --     if vim.bo[args.buf].filetype == "neo-tree" then
  --       return
  --     end
  --     return conditions.buffer_matches({
  --       buftype = { "nofile", "prompt", "help", "quickfix" },
  --       filetype = { "^git.*", "fugitive", "Trouble", "dashboard" },
  --     }, args.buf)
  --   end,
  colors = setup_colors,
  -- },
})

vim.api.nvim_create_augroup("Heirline", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    utils.on_colorscheme(setup_colors)
  end,
  group = "Heirline",
})
