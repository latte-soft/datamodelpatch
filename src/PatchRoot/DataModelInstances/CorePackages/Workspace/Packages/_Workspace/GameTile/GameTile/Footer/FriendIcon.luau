local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UserLib);
local l_Constants_0 = v2.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v2.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_AppChatConstants_0 = require(l_Parent_0.DiscoveryAppChatApi).AppChatConstants;
local l_ImageSetLabel_0 = require(l_Parent_0.DiscoveryUiBloxApi).ImageSetLabel;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local l_Colors_0 = require(l_Parent_0.DiscoveryStyleApi).Colors;
local v9 = v1.PureComponent:extend("FriendIcon");
v9.defaultProps = {
    layoutOrder = 0, 
    maskColor = l_Colors_0.White, 
    showBackground = true
};
v9.render = function(v10)
    local l_user_0 = v10.props.user;
    local l_dotSize_0 = v10.props.dotSize;
    local l_itemSize_0 = v10.props.itemSize;
    local l_layoutOrder_0 = v10.props.layoutOrder;
    local l_showBackground_0 = v10.props.showBackground;
    local l_maskColor_0 = v10.props.maskColor;
    local v17 = l_dotSize_0 ~= nil;
    local l_l_AppChatConstants_0_PresenceIndicatorSizeKey_0 = l_AppChatConstants_0:GetPresenceIndicatorSizeKey(l_dotSize_0);
    local v19 = nil;
    local v20 = nil;
    if l_user_0 then
        if v17 then
            v20 = l_AppChatConstants_0.PresenceIndicatorImagesBySize[l_l_AppChatConstants_0_PresenceIndicatorSizeKey_0][l_user_0.presence];
        end;
        v19 = l_getRbxthumbWithTypeSizeAndOptions_0(l_user_0.id, l_Constants_0.RbxthumbTypes.AvatarHeadShot, 48);
    end;
    return v1.createElement("Frame", {
        BackgroundColor3 = Color3.fromRGB(209, 209, 209), 
        BackgroundTransparency = not l_showBackground_0 and 1 or 0, 
        BorderSizePixel = 0, 
        LayoutOrder = l_layoutOrder_0, 
        Size = UDim2.new(0, l_itemSize_0, 0, l_itemSize_0)
    }, {
        Profile = v1.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = l_GetImageData_0(v19) or v19, 
            Size = UDim2.new(0, l_itemSize_0, 0, l_itemSize_0), 
            ZIndex = 1
        }), 
        Mask = not not l_showBackground_0 and v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = "rbxasset://textures/ui/LuaApp/graphic/gr-avatar-frame-36x36.png", 
            ImageColor3 = l_maskColor_0, 
            Size = UDim2.new(0, l_itemSize_0, 0, l_itemSize_0), 
            ZIndex = 2
        }) or nil, 
        Dot = (not not l_showBackground_0 and v17) and v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = v20, 
            Position = UDim2.new(1, -l_dotSize_0, 1, -l_dotSize_0), 
            Size = UDim2.new(0, l_dotSize_0, 0, l_dotSize_0), 
            ZIndex = 3
        }) or nil
    });
end;
return v9;
