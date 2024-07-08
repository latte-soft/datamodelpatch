local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.Logger);
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Promise_0 = v2.Promise;
local v4 = require(l_script_FirstAncestor_0.Requests.GetUnreadConversationCount);
local l_GetPresencesFromUserIds_0 = v2.NetworkingPresence.GetPresencesFromUserIds;
local l_NetworkingFriends_0 = v2.NetworkingFriends;
local l_NetworkingUsers_0 = v2.NetworkingUsers;
local l_SocialLibraries_0 = v2.SocialLibraries;
local l_EnteredChatFromEntryPoint_0 = v2.AppChat.Actions.EnteredChatFromEntryPoint;
return function(v10)
    return {
        refreshPageData = function()
            return l_Promise_0.all({
                v10(v4.API()), 
                v10(function(v11)
                    local v12 = l_SocialLibraries_0.Dictionary.getDeepValue(v11:getState(), "SocialTab.Friends.byUserId.localUserId");
                    if not v12 then
                        return l_Promise_0.resolve();
                    else
                        return v10(l_GetPresencesFromUserIds_0.API(v12));
                    end;
                end), 
                v10(l_NetworkingFriends_0.GetFriendRequestsCount.API()), 
                v10(function(v13)
                    return v10(l_NetworkingUsers_0.GetUserV2FromUserId.API(v13:getState().LocalUserId));
                end)
            }):catch(function()
                v1:info("Failed to refresh SocialTab data");
            end);
        end, 
        fetchFriendsRequestsCount = function()
            return v10(l_NetworkingFriends_0.GetFriendRequestsCount.API());
        end, 
        enteredChatFromEntryPoint = function(v14)
            return v10(l_EnteredChatFromEntryPoint_0(v14));
        end
    };
end;
