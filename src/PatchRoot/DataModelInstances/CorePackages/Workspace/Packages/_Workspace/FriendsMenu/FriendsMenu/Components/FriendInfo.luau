local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local _ = require(l_Parent_0.NotificationsCommon);
local v8 = require(l_Context_0.FriendsListContext);
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local l_ShimmerPanel_0 = v4.App.Loading.ShimmerPanel;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
local v15 = {
    online = not require(l_Parent_0.SharedFlags).GetFFlagEnableUniversalAppGameInviteUnification() and "InGame.Presence.Label.Online" or "Common.Presence.Label.Online", 
    inStudio = "Common.Presence.Label.RobloxStudio"
};
local v16 = l_Images_0["icons/logo/studiologo_small"];
local function _(v17, v18)
    if v17.presence == l_UserModel_0.PresenceType.IN_GAME then
        return v17.lastLocation;
    elseif v17.presence == l_UserModel_0.PresenceType.ONLINE then
        return v18.online;
    elseif v17.presence == l_UserModel_0.PresenceType.IN_STUDIO then
        return v18.inStudio;
    else
        return "@" .. v17.name;
    end;
end;
return function(v20)
    local v21 = l_useStyle_0();
    local v22 = v3.useContext(v8);
    local v23 = v22.isFetchingFriends or v22.friendsNames.loading;
    local l_Theme_0 = v21.Theme;
    local l_Font_0 = v21.Font;
    local v26 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v27 = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize;
    local v28 = l_getLocalizedStrings_0(v15);
    local l_friend_0 = v20.friend;
    assert(l_friend_0, "friend should be non-nil. Silence type checker.");
    return v3.createElement("Frame", {
        Position = v20.position, 
        Size = v20.size, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 12)
        }), 
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 4)
        }), 
        DisplayName = not not v23 and v3.createElement(l_ShimmerPanel_0, {
            Size = UDim2.new(0, 120, 0, 10), 
            cornerRadius = UDim.new(0, 4), 
            LayoutOrder = 1
        }) or v3.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v26), 
            Text = l_friend_0.displayName, 
            TextSize = v26, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            Font = l_Font_0.Header2.Font, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            LayoutOrder = 1
        }), 
        UserContextContainer = not not v23 and v3.createElement(l_ShimmerPanel_0, {
            Size = UDim2.new(0, 80, 0, 10), 
            cornerRadius = UDim.new(0, 4), 
            LayoutOrder = 2
        }) or v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v27), 
            ClipsDescendants = true
        }, {
            ListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 4)
            }), 
            StudioImage = l_friend_0.presence == l_UserModel_0.PresenceType.IN_STUDIO and v3.createElement(l_ImageSetLabel_0, {
                Image = v16, 
                ImageColor3 = l_Theme_0.TextDefault.Color, 
                ImageTransparency = l_Theme_0.TextDefault.Transparency, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v27, 0, v27), 
                LayoutOrder = 1
            }), 
            UserContext = v3.createElement("TextLabel", {
                Size = UDim2.new(1, -v27, 0, v27), 
                Text = if l_friend_0.presence == l_UserModel_0.PresenceType.IN_GAME then l_friend_0.lastLocation else if l_friend_0.presence == l_UserModel_0.PresenceType.ONLINE then v28.online else if l_friend_0.presence == l_UserModel_0.PresenceType.IN_STUDIO then v28.inStudio else "@" .. l_friend_0.name, 
                TextSize = v27, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                Font = l_Font_0.CaptionBody.Font, 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                LayoutOrder = 2
            })
        })
    });
end;
