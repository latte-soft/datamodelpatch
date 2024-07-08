local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.RoactUtils);
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local v7 = require(l_script_FirstAncestor_0.Constants);
local v8 = require(l_Context_0.FriendsListContext);
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_Button_0 = v4.App.Button.Button;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v4.App.Button.Enum.StandardButtonSize;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_InviteStatus_0 = v7.InviteStatus;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
local l_GetFFlagEnableUniversalAppGameInviteUnification_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUniversalAppGameInviteUnification;
local v18 = {
    inviteFriend = "Feature.SettingsHub.Action.InviteFriend", 
    [l_InviteStatus_0.Success] = "Feature.SettingsHub.Label.Invited", 
    [l_InviteStatus_0.Moderated] = "Feature.SettingsHub.Label.Moderated", 
    [l_InviteStatus_0.Pending] = "Feature.SettingsHub.Label.Sending"
};
return function(v19)
    local v22 = l_useSelector_0(function(v20)
        local l_friend_0 = v19.friend;
        assert(l_friend_0, "friend should be non-nil. Silence type checker.");
        if not l_GetFFlagEnableUniversalAppGameInviteUnification_0() then
            return v20.Invites[l_friend_0.id];
        else
            return v20.GameInvitesStatus[l_friend_0.id];
        end;
    end);
    local v23 = l_getLocalizedStrings_0(v18);
    local v24 = v3.useContext(v8);
    local v25 = l_useStyle_0();
    local v26 = v25 and v25.Theme;
    local v27 = v25 and v25.Font;
    local l_isFetchingFriends_0 = v24.isFetchingFriends;
    local v29 = v27.BaseSize * v27.CaptionHeader.RelativeSize;
    local v30;
    if v22 then
        v30 = false;
        if not (v22 == l_InviteStatus_0.Failed) then
            goto label0;
        end;
    end;
    v30 = not v19.isFullRowActivatable;
    ::label0::;
    if not v30 then
        return v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = v23[v22] or v23.inviteFriend, 
            TextSize = v29, 
            TextWrapped = true, 
            Size = v19.size, 
            AnchorPoint = v19.anchorPoint, 
            Position = v19.position, 
            TextColor3 = v26.TextDefault.Color, 
            Font = v27.CaptionHeader.Font
        });
    else
        return v3.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = v19.size, 
            AnchorPoint = v19.anchorPoint, 
            Position = v19.position
        }, {
            Button = v3.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                isDisabled = l_isFetchingFriends_0, 
                isLoading = false, 
                onActivated = v19.onInvite, 
                standardSize = l_StandardButtonSize_0.XSmall, 
                fitContent = true, 
                anchorPoint = v19.anchorPoint, 
                position = v19.position, 
                text = v23.inviteFriend
            })
        });
    end;
end;
