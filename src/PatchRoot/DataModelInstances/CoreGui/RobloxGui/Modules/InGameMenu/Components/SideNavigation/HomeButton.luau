local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_t_0 = v0.t;
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local v8 = l_Images_0["icons/menu/home_on"];
local v9 = l_Images_0["icons/menu/home_off"];
local v10 = l_Roact_0.PureComponent:extend("HomeButton");
v10.validateProps = l_t_0.strictInterface({
    on = l_t_0.optional(l_t_0.boolean), 
    anchorPoint = l_t_0.optional(l_t_0.Vector2), 
    position = l_t_0.optional(l_t_0.UDim2), 
    layoutOrder = l_t_0.optional(l_t_0.integer), 
    onActivated = l_t_0.callback
});
v10.defaultProps = {
    on = false
};
v10.renderWithSelectionCursor = function(v11, v12)
    return l_Roact_0.createElement("Frame", {
        AnchorPoint = v11.props.anchorPoint, 
        BackgroundTransparency = 1, 
        Position = v11.props.position, 
        Size = UDim2.fromOffset(64, 64), 
        LayoutOrder = v11.props.layoutOrder
    }, {
        HomeButton = l_Roact_0.createElement(l_ImageSetButton_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = not not v11.props.on and v8 or v9, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(32, 32), 
            SelectionImageObject = v12(l_CursorKind_0.RoundedRect), 
            [l_Roact_0.Event.Activated] = v11.props.onActivated
        })
    });
end;
v10.render = function(v13)
    return l_withSelectionCursorProvider_0(function(v14)
        return v13:renderWithSelectionCursor(v14);
    end);
end;
return v10;
