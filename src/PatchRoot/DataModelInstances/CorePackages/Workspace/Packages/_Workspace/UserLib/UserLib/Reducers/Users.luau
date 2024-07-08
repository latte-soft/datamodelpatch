local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local l_Immutable_0 = require(l_script_FirstAncestor_0.Parent.AppCommonLib).Immutable;
local l_AddUser_0 = require(l_script_FirstAncestor_0.Actions).AddUser;
local l_AddUsers_0 = require(l_script_FirstAncestor_0.Actions).AddUsers;
local l_ReceivedUserPresence_0 = require(l_script_FirstAncestor_0.Actions).ReceivedUserPresence;
local l_RemoveUser_0 = require(l_script_FirstAncestor_0.Actions).RemoveUser;
local l_SetUserIsFriend_0 = require(l_script_FirstAncestor_0.Actions).SetUserIsFriend;
local l_SetUserMembershipType_0 = require(l_script_FirstAncestor_0.Actions).SetUserMembershipType;
local l_SetUserPresence_0 = require(l_script_FirstAncestor_0.Actions).SetUserPresence;
local l_ReceivedDisplayName_0 = require(l_script_FirstAncestor_0.Actions).ReceivedDisplayName;
return function(v10, v11)
    v10 = v10 or {};
    assert(v10, "");
    if v11.type == l_AddUser_0.name then
        local l_user_0 = v11.user;
        return (l_Immutable_0.Set(v10, l_user_0.id, l_user_0));
    elseif v11.type == l_AddUsers_0.name then
        local l_users_0 = v11.users;
        local v14 = {};
        for v15, v16 in pairs(l_users_0) do
            local v17 = v10[v15];
            if not v17 then
                v14[v15] = v16;
            else
                v14[v15] = l_Immutable_0.JoinDictionaries(v17, v16);
            end;
        end;
        return (l_Immutable_0.JoinDictionaries(v10, v14));
    elseif v11.type == l_SetUserIsFriend_0.name then
        local v18 = v10[v11.userId];
        if not v18 then
            warn("Setting isFriend on user", v11.userId, "who doesn't exist yet");
            return v10;
        else
            return (l_Immutable_0.Set(v10, v18.id, (l_Immutable_0.Set(v18, "isFriend", v11.isFriend))));
        end;
    elseif v11.type == l_SetUserPresence_0.name then
        local v19 = v10[v11.userId];
        if not v19 then
            warn("Setting presence on user", v11.userId, "who doesn't exist yet");
            return v10;
        else
            return (l_Immutable_0.Set(v10, v19.id, (l_Immutable_0.JoinDictionaries(v19, {
                presence = v11.presence, 
                lastLocation = v11.lastLocation
            }))));
        end;
    else
        if v11.type == l_ReceivedUserPresence_0.name then
            local v20 = v10[v11.userId];
            if v20 then
                return (l_Immutable_0.JoinDictionaries(v10, {
                    [v11.userId] = l_Immutable_0.JoinDictionaries(v20, {
                        presence = v11.presence, 
                        lastLocation = v11.lastLocation, 
                        placeId = v11.placeId, 
                        rootPlaceId = v11.rootPlaceId, 
                        gameInstanceId = v11.gameInstanceId, 
                        lastOnline = v11.lastOnline, 
                        universeId = v11.universeId
                    })
                }));
            end;
        elseif v11.type == l_SetUserMembershipType_0.name then
            local v21 = v10[v11.userId];
            if v21 then
                return (l_Immutable_0.JoinDictionaries(v10, {
                    [v11.userId] = l_Immutable_0.JoinDictionaries(v21, {
                        membership = v11.membershipType
                    })
                }));
            end;
        elseif v11.type == l_RemoveUser_0.name then
            if v10[v11.userId] then
                return (l_Immutable_0.RemoveFromDictionary(v10, v11.userId));
            end;
        elseif v11.type == l_ReceivedDisplayName_0.name then
            local v22 = v10[v11.userId];
            if v22 then
                v10 = l_Immutable_0.JoinDictionaries(v10, {
                    [v11.userId] = l_Immutable_0.JoinDictionaries(v22, {
                        displayName = v11.displayName
                    })
                });
            end;
        end;
        return v10;
    end;
end;
