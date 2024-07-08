local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Core.Style.withStyle);
local v6 = require(l_Parent_0.ToastFrame);
local v7 = require(l_Parent_0.ToastIcon);
local v8 = require(l_Parent_0.ToastText);
local v9 = v3.PureComponent:extend("InformativeToast");
v9.validateProps = v4.strictInterface({
    anchorPoint = v4.optional(v4.Vector2), 
    iconProps = v4.optional(v7.validateProps), 
    iconChildren = v4.optional(v4.table), 
    layoutOrder = v4.optional(v4.integer), 
    padding = v4.optional(v4.numberMin(0)), 
    position = v4.optional(v4.UDim2), 
    size = v4.UDim2, 
    subtitleTextProps = v4.optional(v8.validateProps), 
    textFrameSize = v4.optional(v4.UDim2), 
    titleTextProps = v8.validateProps
});
v9.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    layoutOrder = 1, 
    position = UDim2.new(0.5, 0, 0.5, 0), 
    size = UDim2.new(1, 0, 1, 0)
};
v9.render = function(v10)
    return v5(function(v11)
        local l_Theme_0 = v11.Theme;
        return v3.createElement("Frame", {
            AnchorPoint = v10.props.anchorPoint, 
            BackgroundColor3 = l_Theme_0.BackgroundUIContrast.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundUIContrast.Transparency * v11.Settings.PreferredTransparency, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            LayoutOrder = v10.props.layoutOrder, 
            Position = v10.props.position, 
            Size = v10.props.size
        }, {
            ToastFrame = v3.createElement(v6, {
                iconProps = v10.props.iconProps, 
                iconChildren = v10.props.iconChildren, 
                padding = v10.props.padding, 
                subtitleTextProps = v10.props.subtitleTextProps, 
                textFrameSize = v10.props.textFrameSize, 
                titleTextProps = v10.props.titleTextProps
            })
        });
    end);
end;
return v9;
