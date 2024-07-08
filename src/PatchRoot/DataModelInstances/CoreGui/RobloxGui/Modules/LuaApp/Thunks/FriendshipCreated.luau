local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserService_0 = game:GetService("UserService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_ApiFetchUsersPresences_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.ApiFetchUsersPresences;
local v5 = require(l_Modules_0.LuaApp.Models.User);
local v6 = require(l_Modules_0.LuaApp.Promise);
local l_UpdateUsers_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.UpdateUsers;
local l_DEPRECATED_refreshConversations_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Conversations.Thunks.DEPRECATED_refreshConversations;
local v9 = require(l_CorePackages_0.Cryo);
local l_PreloadUsersThumbnail_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.PreloadUsersThumbnail;
local l_AvatarThumbnailRequests_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.AvatarThumbnailRequests;
local l_GetUnreadConversationCount_0 = require(l_CorePackages_0.Workspace.Packages.SocialTab).Requests.GetUnreadConversationCount;
local l_isAppChatChannelsAPIEnabled_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Flags.isAppChatChannelsAPIEnabled;
local l_USER_CAROUSEL_HEAD_SHOT_0 = l_AvatarThumbnailRequests_0.USER_CAROUSEL_HEAD_SHOT;
game:DefineFastFlag("OverwriteVBFromUserServiceResponse", false);
local function v25(v15, v16, v17, v18)
    local v19 = not not v18 and v18.UserService or l_UserService_0;
    local l_status_0, l_result_0 = pcall(function()
        return v19:GetUserInfosByUserIdsAsync({
            (tonumber(v17))
        })[1];
    end);
    if l_status_0 then
        if not (not l_result_0 or not l_result_0.Username) and l_result_0.DisplayName then
            if game:GetFastFlag("OverwriteVBFromUserServiceResponse") then
                l_result_0.HasVerifiedBadge = false;
            end;
            v15:dispatch(l_UpdateUsers_0({
                (v5.fromDataTable({
                    id = v17, 
                    isFriend = true, 
                    friendRank = 0, 
                    name = l_result_0.Username, 
                    displayName = l_result_0.DisplayName, 
                    hasVerifiedBadge = l_result_0.HasVerifiedBadge
                }))
            }));
            local v22 = {
                v17
            };
            local v23 = {
                v15:dispatch(l_ApiFetchUsersPresences_0(v16, v22)), 
                (v15:dispatch(l_PreloadUsersThumbnail_0(v22, l_USER_CAROUSEL_HEAD_SHOT_0)))
            };
            if not l_isAppChatChannelsAPIEnabled_0() then
                local v24 = v15:getState();
                if v24.ChatAppReducer and not v9.isEmpty(v24.ChatAppReducer.Conversations) or tonumber(v24.FriendCount) <= 1 then
                    v15:dispatch(l_DEPRECATED_refreshConversations_0());
                end;
            end;
            v15:dispatch(l_GetUnreadConversationCount_0.API());
            v6.all(v23);
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
return function(v26, v27)
    return function(v28, v29)
        v25(v28, v26, v27, v29);
    end;
end;
