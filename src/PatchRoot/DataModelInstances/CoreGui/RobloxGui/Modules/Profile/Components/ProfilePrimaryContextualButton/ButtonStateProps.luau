local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(script.Parent.ButtonStates);
local l_UIBlox_0 = v1.UIBlox;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v7 = require(l_Parent_0.Components.ProfileJoinButton);
local v8 = require(l_Parent_0.Common.TextKeys);
local l_GetFFlagHideContextualButtonBasedOnStateForVR_0 = v1.GetFFlagHideContextualButtonBasedOnStateForVR;
local l_IsVRAppBuild_0 = v1.IsVRAppBuild;
return {
    [v2.EditProfile] = {
        textKey = v8.EditProfile, 
        button = {
            component = l_Button_0, 
            type = l_ButtonType_0.PrimarySystem
        }, 
        showToast = false, 
        successIcon = nil, 
        successTextKey = "", 
        isDisabled = l_GetFFlagHideContextualButtonBasedOnStateForVR_0() and l_IsVRAppBuild_0()
    }, 
    [v2.OpenEditProfilePage] = {
        textKey = v8.EditProfile, 
        button = {
            component = l_Button_0, 
            type = l_ButtonType_0.PrimarySystem
        }, 
        showToast = false, 
        successIcon = nil, 
        successTextKey = "", 
        isDisabled = l_GetFFlagHideContextualButtonBasedOnStateForVR_0() and l_IsVRAppBuild_0()
    }, 
    [v2.ShareProfileQRCode] = {
        textKey = v8.ToQRCode, 
        button = {
            component = l_Button_0, 
            type = l_ButtonType_0.PrimarySystem
        }, 
        icon = l_Images_0["icons/menu/scanqr"], 
        showToast = false, 
        successIcon = nil, 
        successTextKey = "", 
        isDisabled = l_GetFFlagHideContextualButtonBasedOnStateForVR_0() and l_IsVRAppBuild_0()
    }, 
    [v2.JoinExperience] = {
        textKey = v8.Join, 
        button = {
            component = v7
        }, 
        showToast = false, 
        successIcon = nil, 
        successTextKey = ""
    }, 
    [v2.Chat] = {
        textKey = v8.Chat, 
        button = {
            component = l_Button_0, 
            type = l_ButtonType_0.PrimarySystem
        }, 
        showToast = false, 
        successIcon = nil, 
        successTextKey = ""
    }, 
    [v2.Unfriend] = {
        textKey = v8.Unfriend, 
        button = {
            component = l_Button_0, 
            type = l_ButtonType_0.PrimarySystem
        }, 
        showToast = true, 
        successTextKey = v8.FriendRemoved, 
        successIcon = l_Images_0["icons/actions/friends/friendRemove"]
    }, 
    [v2.Unblock] = {
        textKey = v8.Unblock, 
        button = {
            component = l_Button_0, 
            type = l_ButtonType_0.PrimarySystem
        }, 
        showToast = false, 
        successTextKey = "", 
        successIcon = l_Images_0["icons/actions/block"]
    }, 
    [v2.AddFriend] = {
        textKey = v8.AddFriend, 
        button = {
            component = l_Button_0, 
            type = l_ButtonType_0.PrimarySystem
        }, 
        showToast = true, 
        successTextKey = v8.FriendRequestSent, 
        successIcon = l_Images_0["icons/actions/friends/friendAdd"]
    }, 
    [v2.AcceptFriendRequest] = {
        textKey = v8.AcceptFriend, 
        button = {
            component = l_Button_0, 
            type = l_ButtonType_0.PrimarySystem
        }, 
        showToast = true, 
        successTextKey = v8.FriendAdded, 
        successIcon = l_Images_0["icons/actions/friends/friendAdd"]
    }, 
    [v2.PendingFriendRequest] = {
        textKey = v8.PendingRequest, 
        button = {
            component = l_Button_0, 
            type = l_ButtonType_0.Secondary
        }, 
        showToast = true, 
        successTextKey = v8.FriendRequestCancelled, 
        successIcon = l_Images_0["icons/actions/friends/friendRemove"], 
        isDisabled = true
    }, 
    [v2.CannotAddFriend] = {
        textKey = v8.AddFriend, 
        button = {
            component = l_Button_0, 
            type = l_ButtonType_0.PrimarySystem
        }, 
        showToast = false, 
        successIcon = nil, 
        successTextKey = "", 
        isDisabled = true
    }, 
    [v2.AcceptOffNetworkFriendRequest] = {
        textKey = v8.AcceptFriend, 
        button = {
            component = l_Button_0, 
            type = l_ButtonType_0.PrimarySystem
        }, 
        showToast = true, 
        successTextKey = v8.FriendAdded, 
        successIcon = l_Images_0["icons/actions/friends/friendAdd"]
    }, 
    [v2.AddFriendFromContacts] = {
        textKey = v8.AddFriend, 
        showToast = true, 
        successTextKey = v8.FriendRequestSent
    }, 
    [v2.AddFriendFromContactsSent] = {
        textKey = v8.PendingRequest, 
        button = {
            component = l_Button_0, 
            type = l_ButtonType_0.Secondary
        }, 
        showToast = false, 
        successTextKey = v8.FriendRequestSent, 
        isDisabled = true
    }
};
