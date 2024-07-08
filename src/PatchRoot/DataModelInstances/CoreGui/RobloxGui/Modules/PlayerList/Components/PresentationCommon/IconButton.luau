local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local l_WithLayoutValues_0 = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local v7 = v1.PureComponent:extend("IconButton");
v7.validateProps = v2.strictInterface({
    size = v2.UDim2, 
    position = v2.UDim2, 
    backgroundColor = v2.Color3, 
    icon = v2.union(v2.string, v2.table), 
    showBackground = v2.boolean, 
    onActivated = v2.optional(v2.callback)
});
v7.init = function(v8)
    v8.state = {
        isHovered = false, 
        isPressed = false
    };
end;
v7.render = function(v9)
    return l_WithLayoutValues_0(function(v10)
        return l_withStyle_0(function(v11)
            local v12 = {
                Transparency = 1, 
                Color = Color3.new(1, 1, 1)
            };
            if v9.props.onActivated then
                if not v9.state.isPressed then
                    if v9.state.isHovered then
                        v12 = v11.Theme.BackgroundOnHover;
                    end;
                else
                    v12 = v11.Theme.BackgroundOnPress;
                end;
            end;
            return v1.createElement("TextButton", {
                Text = "", 
                BorderSizePixel = 0, 
                BackgroundTransparency = not not v9.props.showBackground and v10.IconButtonBackgroundTransparency or 1, 
                BackgroundColor3 = v9.props.backgroundColor, 
                Position = v9.props.position, 
                Size = v9.props.size, 
                [v1.Event.Activated] = v9.props.onActivated, 
                [v1.Event.MouseButton1Down] = function()
                    v9:setState({
                        isPressed = true
                    });
                end, 
                [v1.Event.MouseButton1Up] = function()
                    v9:setState({
                        isPressed = false
                    });
                end, 
                [v1.Event.MouseEnter] = function()
                    v9:setState({
                        isHovered = true
                    });
                end, 
                [v1.Event.MouseLeave] = function()
                    v9:setState({
                        isHovered = false, 
                        isPressed = false
                    });
                end
            }, {
                HoverBackground = v1.createElement("Frame", {
                    ZIndex = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = v12.Transparency, 
                    BackgroundColor3 = v12.Color, 
                    BorderSizePixel = 0
                }), 
                ImageButton = v1.createElement(l_ImageSetLabel_0, {
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0, v10.DropDownIconSize, 0, v10.DropDownIconSize), 
                    Image = v9.props.icon, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    ZIndex = 2
                })
            });
        end);
    end);
end;
return v7;
