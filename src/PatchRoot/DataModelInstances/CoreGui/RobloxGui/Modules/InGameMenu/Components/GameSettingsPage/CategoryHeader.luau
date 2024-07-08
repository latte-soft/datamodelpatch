local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.GlobalConfig);
local v5 = require(script.Parent.Parent.ThemedTextLabel);
local v6 = require(l_Parent_0.Localization.withLocalization);
local v7 = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    localizationKey = l_t_0.string
});
return function(v8)
    if v4.propValidation then
        assert(v7(v8));
    end;
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v8.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 36)
    }, {
        Label = v6({
            text = v8.localizationKey
        })(function(v9)
            return l_Roact_0.createElement(v5, {
                fontKey = "Footer", 
                themeKey = "TextEmphasis", 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(1, -48, 0, 14), 
                Text = v9.text, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            });
        end)
    });
end;
