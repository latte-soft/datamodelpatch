local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Parent.t);
return (v2.strictInterface({
    Theme = v2.optional(if not require(l_Parent_1.UIBloxConfig).useNewThemeColorPalettes then require(l_Parent_0.validateTheme) else require(l_Parent_0.validateThemeNew)), 
    Font = v2.optional((require(l_Parent_0.validateFont))), 
    Tokens = v2.optional((require(l_Parent_0.validateTokens))), 
    Settings = v2.optional((require(l_Parent_0.validateSettings)))
}));
