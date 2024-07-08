local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v3 = require(l_Parent_0.ReactFocusNavigation);
local v4 = require(l_Parent_0.InputHandlers);
local v5 = require(l_Parent_0.React);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagAddPYMKToConsoleAddFriends);
local l_FFlagFixControllerBarButtonNames_0 = require(l_Parent_0.SharedFlags).FFlagFixControllerBarButtonNames;
return function(v8, v9)
    return v3.useEventHandlerMap(v5.useMemo(function()
        if not v6 or v9 then
            return {
                [l_FocusNavigationEventNameEnum_0.AcceptFriendRequest] = {
                    handler = v4.onRelease(v8.acceptFriendRequest)
                }, 
                [l_FocusNavigationEventNameEnum_0.IgnoreFriendRequest] = {
                    handler = v4.onRelease(v8.declineFriendRequest)
                }
            };
        elseif not l_FFlagFixControllerBarButtonNames_0 then
            return {
                [l_FocusNavigationEventNameEnum_0.AcceptFriendRequest] = {
                    handler = v4.onRelease(v8.requestFriendship)
                }
            };
        else
            return {
                [l_FocusNavigationEventNameEnum_0.AddFriend] = {
                    handler = v4.onRelease(v8.requestFriendship)
                }
            };
        end;
    end, if not v6 then {
        v8.acceptFriendRequest, 
        v8.declineFriendRequest
    } else {
        v8.acceptFriendRequest, 
        v8.declineFriendRequest, 
        v8.requestFriendship
    }), (v3.useEventMap({
        [Enum.KeyCode.ButtonX] = if not l_FFlagFixControllerBarButtonNames_0 or v9 then l_FocusNavigationEventNameEnum_0.AcceptFriendRequest else l_FocusNavigationEventNameEnum_0.AddFriend, 
        [Enum.KeyCode.ButtonR3] = l_FocusNavigationEventNameEnum_0.IgnoreFriendRequest
    })));
end;
