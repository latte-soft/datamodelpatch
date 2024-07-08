local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.GlobalConfig);
local v5 = require(l_Parent_0.Components.ThemedTextLabel);
local v6 = require(l_Parent_0.Localization.withLocalization);
local v7 = l_t_0.strictInterface({
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    Size = l_t_0.optional(l_t_0.UDim2), 
    localizationKey = l_t_0.string, 
    LayoutOrder = l_t_0.optional(l_t_0.number)
});
return function(v8)
    if v4.propValidation then
        assert(v7(v8));
    end;
    return v6({
        text = v8.localizationKey
    })(function(v9)
        return l_Roact_0.createElement(v5, {
            fontKey = "Body", 
            themeKey = "TextDefault", 
            LayoutOrder = v8.LayoutOrder, 
            AnchorPoint = v8.AnchorPoint or Vector2.new(0, 0.5), 
            Position = v8.Position or UDim2.new(0, 0, 0.5, 0), 
            Size = v8.Size or UDim2.new(1, -72, 0.5, 0), 
            Text = v9.text, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left
        });
    end);
end;
