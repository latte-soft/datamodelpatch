local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.GlobalConfig);
local v5 = require(l_Parent_0.Components.ThemedTextLabel);
local v6 = require(l_Parent_0.Localization.withLocalization);
local v7 = l_t_0.strictInterface({
    title = l_t_0.string, 
    LayoutOrder = l_t_0.integer
});
return function(v8)
    if v4.propValidation then
        assert(v7(v8));
    end;
    return v6({
        title = v8.title
    })(function(v9)
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 45), 
            BackgroundTransparency = 1, 
            LayoutOrder = v8.LayoutOrder
        }, {
            HeaderText = l_Roact_0.createElement(v5, {
                fontKey = "CaptionHeader", 
                themeKey = "TextMuted", 
                Text = v9.title, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Position = UDim2.new(0, 0, 0, 20), 
                Size = UDim2.new(1, 0, 0, 17)
            })
        });
    end);
end;
