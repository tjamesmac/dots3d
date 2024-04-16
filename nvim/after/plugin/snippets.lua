if not pcall(require, "luasnip") then
  return
end

local ls = require("luasnip")
ls.config.set_config({})
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

-- local sn = ls.snippet_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.expand_conditions")

local js_and_ts = {
  s(
    "imp",
    fmt([[import {} from "{}"]], {
      f(function(import_name)
        return import_name[1]
      end, { 1 }),
      i(1),
    })
  ),
  s("try", {
    t("try {"),
    i(1),
    t("} catch (e) {"),
    i(2),
    t("}"),
  }),
  s("describe", {
    t("describe('"),
    i(1),
    t("', () => {"),
    i(2),
    t("})"),
  }),
  s("it", {
    t("it('"),
    i(1),
    t("', () => {"),
    i(2),
    t("})"),
  }),
  s(
    "con",
    fmt([[console.log("{} -->", {})]], {
      f(function(message)
        return message[1]
      end, { 1 }),
      i(1),
    })
  ),
}

ls.add_snippets("javascript", js_and_ts)
ls.add_snippets("typescript", js_and_ts)

ls.add_snippets("NeogitCommitMessage", {})
