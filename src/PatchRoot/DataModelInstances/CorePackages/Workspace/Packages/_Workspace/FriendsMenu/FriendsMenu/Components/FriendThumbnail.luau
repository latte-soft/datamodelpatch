local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_Parent_0.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local v5 = require(l_Parent_0.UserLib);
local v6 = require(l_Parent_0.UIBlox);
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local v9 = require(l_Context_0.FriendsListContext);
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v6.App.Constant.IconSize;
local l_ShimmerPanel_0 = v6.App.Loading.ShimmerPanel;
local l_Images_0 = v6.App.ImageSet.Images;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_Constants_0 = v5.Utils.Constants;
local l_Size150x150_0 = l_Constants_0.RbxThumbnailSizes.Size150x150;
local l_AvatarHeadShot_0 = l_Constants_0.RbxthumbTypes.AvatarHeadShot;
local v18 = {
    [l_UserModel_0.PresenceType.ONLINE] = {
        Image = "component_assets/circle_16", 
        Color = Color3.fromRGB(0, 180, 109), 
        Size = UDim2.new(0, 12, 0, 12)
    }, 
    [l_UserModel_0.PresenceType.IN_GAME] = {
        Image = "icons/menu/games_small"
    }, 
    [l_UserModel_0.PresenceType.IN_STUDIO] = {
        Image = "icons/logo/studiologo_small"
    }
};
return function(v19)
    local l_friend_0 = v19.friend;
    assert(l_friend_0, "friend should be non-nil. Silence type checker.");
    local v21 = l_useStyle_0();
    local l_isFetchingFriends_0 = v3.useContext(v9).isFetchingFriends;
    local v24 = v3.useMemo(function()
        local v23 = nil;
        if l_friend_0 then
            v23 = l_getRbxthumbWithTypeSizeAndOptions_0(l_friend_0.id, l_AvatarHeadShot_0, l_Constants_0.RbxThumbnailSizeToNumberSize[l_Size150x150_0]);
        end;
        if not v23 then
            v23 = "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png";
        end;
        return v23;
    end, {
        l_friend_0
    });
    local l_PlayerBackgroundDefault_0 = v21.Theme.PlayerBackgroundDefault;
    local v26 = if l_friend_0.presence ~= l_UserModel_0.PresenceType.OFFLINE then v18[l_UserModel_0.PresenceType.ONLINE] else nil;
    return v3.createElement("Frame", {
        Size = v19.size, 
        Position = v19.position, 
        AnchorPoint = v19.anchorPoint, 
        BackgroundTransparency = 1
    }, {
        Background = l_PlayerBackgroundDefault_0 and v3.createElement("Frame", {
            Size = v19.size, 
            Position = v19.position, 
            AnchorPoint = v19.anchorPoint, 
            BackgroundColor3 = v21.Theme.UIDefault.Color, 
            BackgroundTransparency = v21.Theme.UIDefault.Transparency
        }, {
            Corner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }), 
        Thumbnail = not not l_isFetchingFriends_0 and v3.createElement(l_ShimmerPanel_0, {
            Size = UDim2.new(1, 0, 1, 0), 
            cornerRadius = UDim.new(0.5, 0)
        }) or v3.createElement(l_ImageSetLabel_0, {
            Size = v19.size, 
            Position = v19.position, 
            AnchorPoint = v19.anchorPoint, 
            Image = v24, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v21 and v21.Theme.UIDefault.Color, 
            BackgroundTransparency = if not l_PlayerBackgroundDefault_0 then v21.Theme.UIDefault.Transparency else 1
        }, {
            Corner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }), 
        PresenseIcon = not (not v26 or l_isFetchingFriends_0) and v3.createElement(l_ImageSetLabel_0, {
            Image = l_Images_0[v26.Image], 
            BackgroundTransparency = 0, 
            BackgroundColor3 = not not v19.isHoverRow and v21.Theme.BackgroundOnHover.Color or v21.Theme.BackgroundDefault.Color, 
            ImageColor3 = v26.Color, 
            Position = UDim2.new(1, -1, 1, -1), 
            AnchorPoint = Vector2.new(1, 1), 
            Size = v26.Size or UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small)
        }, {
            Border = v3.createElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = v21.Theme.BackgroundDefault.Color, 
                Transparency = v21.Theme.BackgroundDefault.Transparency, 
                Thickness = 3
            }), 
            Corner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }) or nil
    });
end;
