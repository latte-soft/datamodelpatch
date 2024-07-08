local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_Cryo_0 = v1.Cryo;
local v4 = require(l_CorePackages_0.UIBlox);
local l_t_0 = v1.t;
local l_withStyle_0 = v4.Core.Style.withStyle;
local v7 = require(script.Parent.Parent.Parent.GlobalConfig);
local v8 = l_t_0.strictInterface({
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
return function(v9)
    if v7.propValidation then
        assert(v8(v9));
    end;
    return l_withStyle_0(function(v10)
        local v11 = v10.Theme[v9.themeKey or "TextDefault"];
        local v12 = v10.Font[v9.fontKey or "Body"];
        return l_Roact_0.createElement("TextLabel", (l_Cryo_0.Dictionary.join({
            TextColor3 = v11.Color, 
            TextTransparency = v11.Transparency
        }, v9, {
            fontKey = l_Cryo_0.None, 
            themeKey = l_Cryo_0.None, 
            BackgroundTransparency = 1, 
            Font = v12.Font, 
            TextSize = v12.RelativeSize * v10.Font.BaseSize
        })));
    end);
end;
