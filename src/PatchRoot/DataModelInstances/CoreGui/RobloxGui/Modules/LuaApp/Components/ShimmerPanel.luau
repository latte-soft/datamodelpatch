local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.LuaApp.Components.ShimmerAnimation);
local v3 = require(l_Modules_0.LuaApp.ThemeContext_DEPRECATED);
local v4 = v1.PureComponent:extend("ShimmerPanel");
v4.render = function(v5)
    local l_Size_0 = v5.props.Size;
    local l_Position_0 = v5.props.Position;
    local l_LayoutOrder_0 = v5.props.LayoutOrder;
    return v1.createElement(v3.Consumer, {
        render = function(v9)
            return v1.createElement("Frame", {
                Size = l_Size_0, 
                Position = l_Position_0, 
                BackgroundColor3 = v9.ShimmerPanel.Color, 
                BackgroundTransparency = v9.ShimmerPanel.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = l_LayoutOrder_0
            }, {
                v1.createElement(v2, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    shimmerScale = 4, 
                    shimmerSpeed = 2.5
                })
            });
        end
    });
end;
return v4;
