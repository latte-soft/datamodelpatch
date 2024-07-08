local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.Common.Roact);
local v5 = require(l_Modules_0.LuaApp.Components.Search.ButtonStripSelectorButton);
local v6 = v4.PureComponent:extend("ButtonStripSelector");
v6.defaultProps = {
    leftRightPadding = 0
};
v6.validateProps = v2.strictInterface({
    selections = v2.array(v2.strictInterface({
        name = v2.string, 
        text = v2.string, 
        onActivated = v2.optional(v2.any), 
        image = v2.optional(v2.string)
    })), 
    activeSelection = v2.optional(v2.integer), 
    size = v2.UDim2, 
    position = v2.optional(v2.UDim2), 
    layoutOrder = v2.optional(v2.integer), 
    backgroundColor3 = v2.Color3, 
    backgroundTransparency = v2.number, 
    leftRightPadding = v2.number, 
    forwardRef = v2.optional(v2.table)
});
v6.renderChildrenButtonsAndLayout = function(_, v8, v9, v10)
    local v11 = {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 8)
        }), 
        Padding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v10), 
            PaddingRight = UDim.new(0, v10)
        })
    };
    for v12, v13 in ipairs(v8) do
        v11[v13.name] = v4.createElement(v5, {
            layoutOrder = v12, 
            text = v13.text, 
            handleClick = v13.onActivated, 
            selected = v9 == v12, 
            image = v13.image
        });
    end;
    return v11;
end;
v6.render = function(v14)
    return v4.createElement("Frame", {
        Size = v14.props.size, 
        Position = v14.props.position, 
        LayoutOrder = v14.props.layoutOrder, 
        BackgroundColor3 = v14.props.backgroundColor3, 
        BackgroundTransparency = v14.props.backgroundTransparency, 
        BorderSizePixel = 0, 
        [v4.Ref] = v14.props.forwardRef
    }, v14:renderChildrenButtonsAndLayout(v14.props.selections, v14.props.activeSelection or 1, v14.props.leftRightPadding));
end;
return v4.forwardRef(function(v15, v16)
    return v4.createElement(v6, v3.Dictionary.join(v15, {
        forwardRef = v16
    }));
end);
