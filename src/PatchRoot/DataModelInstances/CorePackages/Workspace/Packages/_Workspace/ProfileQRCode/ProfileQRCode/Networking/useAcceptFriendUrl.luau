local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local v1 = require(l_script_FirstAncestor_0.Parent.RoactUtils);
local v2 = require(l_script_FirstAncestor_0.Networking.configureRoduxFriends);
local l_useDispatch_0 = v1.Hooks.RoactRodux.useDispatch;
return function()
    local v4 = l_useDispatch_0();
    return function(v5, v6)
        return v4(v2.AcceptFriendRequestFromUserId.API({
            currentUserId = v5, 
            targetUserId = v6
        }));
    end;
end;
