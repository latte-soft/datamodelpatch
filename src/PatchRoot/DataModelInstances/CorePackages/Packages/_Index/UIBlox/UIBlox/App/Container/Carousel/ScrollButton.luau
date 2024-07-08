local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Core.Style.withStyle);
local l_Core_0 = l_Parent_1.Core;
local v7 = require(l_Parent_0.ImageSet.getIconSize);
local v8 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v9 = require(l_Core_0.Control.Interactable);
local v10 = require(l_Core_0.ImageSet.ImageSetComponent);
local v11 = v3.PureComponent:extend("ScrollButton");
v11.validateProps = v4.strictInterface({
    icon = v4.table, 
    callback = v4.callback
});
v11.render = function(v12)
    return v5(function(v13)
        return v3.createElement(v9, {
            AutoButtonColor = false, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = v13.Theme.BackgroundUIContrast.Color, 
            BackgroundTransparency = v13.Theme.BackgroundUIContrast.Transparency, 
            BorderSizePixel = 0, 
            [v3.Event.Activated] = v12.props.callback, 
            onStateChanged = function()
            end
        }, {
            Icon = v3.createElement(v10.Label, {
                Size = UDim2.fromOffset(v7(v8.Medium), v7(v8.Medium)), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v12.props.icon, 
                ImageColor3 = v13.Theme.IconEmphasis.Color, 
                ImageTransparency = v13.Theme.IconEmphasis.Transparency
            })
        });
    end);
end;
return v11;
