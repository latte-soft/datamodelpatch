local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_Cryo_0 = v0.Cryo;
local l_t_0 = v0.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local v6 = require(script.Parent.Parent.GlobalConfig);
local v7 = l_t_0.strictInterface({
    Size = l_t_0.optional(l_t_0.UDim2), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    Visible = l_t_0.optional(l_t_0.boolean)
});
return function(v8)
    if v6.propValidation then
        assert(v7(v8));
    end;
    return l_withStyle_0(function(v9)
        return l_Roact_0.createElement("Frame", l_Cryo_0.Dictionary.join({
            Size = UDim2.new(1, 0, 0, 1)
        }, v8, {
            BorderSizePixel = 0, 
            BackgroundColor3 = v9.Theme.Divider.Color, 
            BackgroundTransparency = v9.Theme.Divider.Transparency
        }));
    end);
end;
