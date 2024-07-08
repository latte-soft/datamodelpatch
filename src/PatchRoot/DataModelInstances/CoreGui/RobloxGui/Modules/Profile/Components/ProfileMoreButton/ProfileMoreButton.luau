local v0 = require(script:FindFirstAncestor("Profile").dependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_t_0 = v0.t;
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local v6 = l_Roact_0.PureComponent:extend("ProfileMoreButton");
v6.BUTTON_ICON_IMAGE = "icons/menu/more_off";
v6.BUTTON_ICON_IMAGE_ON = "icons/menu/more_on";
v6.BUTTON_ICON_IMAGE_OFF = "icons/menu/more_off";
v6.BUTTON_QR_ICON = "icons/menu/scanqr";
v6.validateProps = l_t_0.strictInterface({
    layoutOrder = l_t_0.optional(l_t_0.integer), 
    onActivated = l_t_0.callback, 
    isDisabled = l_t_0.optional(l_t_0.boolean), 
    isSelected = l_t_0.optional(l_t_0.boolean), 
    isQRCode = l_t_0.optional(l_t_0.boolean)
});
v6.defaultProps = {
    layoutOrder = 0
};
v6.render = function(v7)
    local l_props_0 = v7.props;
    local v9 = if not l_props_0.isSelected then l_Images_0[v6.BUTTON_ICON_IMAGE_OFF] else l_Images_0[v6.BUTTON_ICON_IMAGE_ON];
    if l_props_0.isQRCode then
        v9 = l_Images_0[v6.BUTTON_QR_ICON];
    end;
    return l_Roact_0.createElement(l_IconButton_0, {
        isDisabled = l_props_0.isDisabled, 
        size = UDim2.fromOffset(0, 0), 
        icon = v9, 
        layoutOrder = l_props_0.layoutOrder, 
        onActivated = l_props_0.onActivated
    });
end;
return v6;
