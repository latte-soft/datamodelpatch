local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local v3 = require(l_CorePackages_0.UIBlox);
local l_Cryo_0 = v1.Cryo;
local l_t_0 = v1.t;
local l_withStyle_0 = v3.Core.Style.withStyle;
local v7 = require(script.Parent.Parent.Parent.GlobalConfig);
local v8 = l_t_0.strictInterface({
    Size = l_t_0.optional(l_t_0.UDim2), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    Visible = l_t_0.optional(l_t_0.boolean)
});
return function(v9)
    if v7.propValidation then
        assert(v8(v9));
    end;
    return l_withStyle_0(function(v10)
        return l_Roact_0.createElement("Frame", l_Cryo_0.Dictionary.join({
            Size = UDim2.new(1, 0, 0, 1)
        }, v9, {
            BorderSizePixel = 0, 
            BackgroundColor3 = v10.Theme.Divider.Color, 
            BackgroundTransparency = v10.Theme.Divider.Transparency
        }));
    end);
end;
