local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialContextToasts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.ToastWrapper);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.Enums.ToastTypes);
local l_ButtonType_0 = require(l_Parent_0.UIBlox).App.Button.Enum.ButtonType;
local v7 = require(l_Parent_0.Cryo);
local l_GetFFlagEnableSocialContextToastFollowFriend_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSocialContextToastFollowFriend;
local l_GetFFlagSocialContextToastEventStream_0 = require(l_Parent_0.SharedFlags).GetFFlagSocialContextToastEventStream;
return function(v10)
    local v12 = l_useSelector_0(function(v11)
        return v11.ToastContent;
    end);
    local v13 = if not l_GetFFlagSocialContextToastEventStream_0() then nil else v7.Dictionary.join(v10.analyticsProps, {
        toastType = v12.toastType
    });
    if v12.toastType == v5.None then
        return nil;
    elseif v12.toastType == v5.YouJoinedFriends then
        local v14 = nil;
        local l_userList_0 = v12.userList;
        if #l_userList_0 == 1 then
            v14 = {
                label = {
                    "Feature.SocialContextToast.Message.YouJoinedOneFriend"; 
                    FRIEND_NAME = l_userList_0[1].name
                }
            };
        elseif #l_userList_0 == 2 then
            v14 = {
                label = {
                    "Feature.SocialContextToast.Message.YouJoinedTwoFriends"; 
                    FRIEND_NAME_ONE = l_userList_0[1].name, 
                    FRIEND_NAME_TWO = l_userList_0[2].name
                }
            };
        elseif #l_userList_0 > 2 then
            v14 = {
                label = {
                    "Feature.SocialContextToast.Message.YouJoinedManyFriends"; 
                    FRIEND_NAME = l_userList_0[1].name, 
                    FRIEND_COUNT = #l_userList_0 - 1
                }
            };
        end;
        local v16 = {};
        for v17, _ in l_userList_0, nil, nil do
            table.insert(v16, l_userList_0[v17].userId);
        end;
        return v4.createElement(v2, {
            toastStrings = v14, 
            userIdList = v16, 
            analyticsProps = v13
        });
    elseif v12.toastType == v5.FriendJoinedYou then
        return v4.createElement(v2, {
            toastStrings = {
                label = {
                    "Feature.SocialContextToast.Message.FriendJoinedYou"; 
                    FRIEND_NAME = v12.joinerName
                }
            }, 
            userIdList = {
                v12.joinerUserId
            }, 
            analyticsProps = v13
        });
    elseif v12.toastType == v5.FriendInNonRootPlace then
        return v4.createElement(v2, {
            toastStrings = {
                label = {
                    "Feature.SocialContextToast.Message.FriendInNonRootPlace"; 
                    FRIEND_NAME = v12.joinerName
                }
            }, 
            userIdList = {
                v12.joinerUserId
            }, 
            analyticsProps = v13
        });
    elseif v12.toastType == v5.FollowYourFriend then
        return v4.createElement(v2, {
            toastStrings = {
                label = {
                    "Feature.SocialContextToast.Message.FollowedFriendInOtherUniverse"; 
                    FRIEND_NAME = v12.joinerName, 
                    EXPERIENCE_NAME = v12.experienceName
                }, 
                button = "Feature.SocialContextToast.Action.JoinFriend"
            }, 
            userIdList = {
                v12.joinerUserId
            }, 
            onActivated = v12.onActivated, 
            buttonType = if not l_GetFFlagEnableSocialContextToastFollowFriend_0() then nil else l_ButtonType_0.PrimaryContextual, 
            analyticsProps = v13
        });
    elseif v12.toastType == v5.InviteBack then
        return v4.createElement(v2, {
            toastStrings = {
                label = {
                    "Feature.SocialContextToast.Message.FollowedFriendNotInGame"; 
                    FRIEND_NAME = v12.joinerName
                }, 
                button = "Feature.SocialContextToast.Action.InviteBack"
            }, 
            userIdList = {
                v12.joinerUserId
            }, 
            onActivated = v12.onActivated, 
            areUsersActive = false, 
            analyticsProps = v13
        });
    elseif v12.toastType == v5.InviteSuccess then
        return v4.createElement(v2, {
            toastStrings = {
                label = "Feature.SocialContextToast.Message.InvitationConfirmation"
            }, 
            analyticsProps = v13
        });
    elseif v12.toastType == v5.InviteFailure then
        return v4.createElement(v2, {
            toastStrings = {
                label = "Feature.SocialContextToast.Message.InvitationFailure"
            }, 
            analyticsProps = v13
        });
    else
        return nil;
    end;
end;
