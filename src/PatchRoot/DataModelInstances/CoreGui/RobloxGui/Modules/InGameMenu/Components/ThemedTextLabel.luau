local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_Cryo_0 = v0.Cryo;
local l_UIBlox_0 = v0.UIBlox;
local l_t_0 = v0.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local v6 = require(script.Parent.Parent.GlobalConfig);
local v7 = l_t_0.strictInterface({
    themeKey = l_t_0.optional(l_t_0.string), 
    fontKey = l_t_0.optional(l_t_0.string), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    Size = l_t_0.optional(l_t_0.UDim2), 
    Text = l_t_0.string, 
    TextColor3 = l_t_0.optional(l_t_0.Color3), 
    TextTransparency = l_t_0.optional(l_t_0.numberConstrained(0, 1)), 
    TextWrapped = l_t_0.optional(l_t_0.boolean), 
    TextXAlignment = l_t_0.optional(l_t_0.enum(Enum.TextXAlignment)), 
    TextYAlignment = l_t_0.optional(l_t_0.enum(Enum.TextYAlignment)), 
    TextTruncate = l_t_0.optional(l_t_0.enum(Enum.TextTruncate)), 
    Visible = l_t_0.optional(l_t_0.boolean), 
    ZIndex = l_t_0.optional(l_t_0.integer), 
    AutomaticSize = l_t_0.optional(l_t_0.enum(Enum.AutomaticSize)), 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table)
});
return function(v8)
    if v6.propValidation then
        assert(v7(v8));
    end;
    return l_withStyle_0(function(v9)
        local v10 = v9.Theme[v8.themeKey or "TextDefault"];
        local v11 = v9.Font[v8.fontKey or "Body"];
        return l_Roact_0.createElement("TextLabel", (l_Cryo_0.Dictionary.join({
            TextColor3 = v10.Color, 
            TextTransparency = v10.Transparency
        }, v8, {
            fontKey = l_Cryo_0.None, 
            themeKey = l_Cryo_0.None, 
            BackgroundTransparency = 1, 
            Font = v11.Font, 
            TextSize = v11.RelativeSize * v9.Font.BaseSize
        })));
    end);
end;
