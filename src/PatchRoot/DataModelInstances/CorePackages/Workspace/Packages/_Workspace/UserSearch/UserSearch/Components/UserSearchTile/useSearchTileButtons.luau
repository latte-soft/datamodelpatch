local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local v5 = require(script.Parent.useRelationshipSelector);
local v6 = require(l_script_FirstAncestor_0.Analytics.EventNames);
return function(v7, v8, v9)
    local v10 = v5(v7.userId);
    if v10.isMyself or v10.status == Enum.FriendStatus.Friend then
        return nil;
    elseif v10.status == Enum.FriendStatus.FriendRequestReceived then
        return {
            {
                icon = l_Images_0["icons/actions/friends/friendAdd"], 
                isSecondary = false, 
                isDisabled = false, 
                onActivated = function()
                    v8.acceptFriendRequest(v7);
                    if v9 then
                        v9(v6.PlayerFriendAccept);
                    end;
                end
            }
        };
    elseif v10.status == Enum.FriendStatus.FriendRequestSent then
        return {
            {
                icon = l_Images_0["icons/actions/friends/friendpending"], 
                isSecondary = false, 
                isDisabled = true, 
                onActivated = v2.noop()
            }
        };
    elseif not v10.status or v10.status == Enum.FriendStatus.NotFriend then
        return {
            {
                icon = l_Images_0["icons/actions/friends/friendAdd"], 
                isSecondary = false, 
                isDisabled = false, 
                onActivated = function()
                    v8.requestFriendship(v7);
                    if v9 then
                        v9(v6.PlayerFriendRequest);
                    end;
                end
            }
        };
    else
        return nil;
    end;
end;
