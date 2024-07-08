local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.Style.withStyle);
local v4 = require(l_Parent_1.UIBlox.UIBloxConfig);
local v5 = v2.PureComponent:extend("HoverButtonBackground");
v5.render = function(_)
    return v3(function(v7)
        local l_BackgroundOnHover_0 = v7.Theme.BackgroundOnHover;
        return v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = l_BackgroundOnHover_0.Color, 
            BackgroundTransparency = l_BackgroundOnHover_0.Transparency, 
            ZIndex = if not v4.useNewThemeColorPalettes then nil else -1
        }, {
            corner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        });
    end);
end;
return v5;
