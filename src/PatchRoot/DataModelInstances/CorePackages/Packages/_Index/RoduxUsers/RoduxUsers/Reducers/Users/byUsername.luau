local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxUsers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local l_Models_0 = l_script_FirstAncestor_0.Models;
local v6 = require(l_Actions_0.UserRemoved);
local v7 = require(l_Actions_0.UserUpdated);
local v8 = require(l_Models_0.UserModel);
local function _(v9, v10)
    local v11 = nil;
    for v12, v13 in pairs(v10) do
        if v13 == v9 then
            return v12;
        end;
    end;
    return v11;
end;
local function v20(v15, v16)
    local v17 = {};
    for _, v19 in ipairs(v16) do
        if v19.name then
            v17[v19.name] = tostring(v19.id);
        end;
    end;
    return v3.Dictionary.join(v15, v17);
end;
local v21 = {};
return function(v22)
    local l_usersNetworking_0 = v22.usersNetworking;
    local l_friendsNetworking_0 = v22.friendsNetworking;
    return v2.createReducer(v21, {
        [l_usersNetworking_0.GetUserV2FromUserId.Succeeded.name] = function(v25, v26)
            return v20(v25, {
                v26.responseBody
            });
        end, 
        [l_usersNetworking_0.GetSkinnyUsersFromUserIds.Succeeded.name] = function(v27, v28)
            return v20(v27, v28.responseBody.data);
        end, 
        [l_friendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(v29, v30)
            return v20(v29, v30.responseBody.data);
        end, 
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v31, v32)
            return v20(v31, v32.responseBody.data);
        end, 
        [l_friendsNetworking_0.GetFriendRecommendationsFromUserId.Succeeded.name] = function(v33, v34)
            return v20(v33, v34.responseBody.data);
        end, 
        [v7.name] = function(v35, v36)
            assert(v8.isValid(v36.payload));
            return v3.Dictionary.join(v35, {
                [v36.payload.username] = v36.payload.id
            });
        end, 
        [v6.name] = function(v37, v38)
            assert(type(v38.payload.id) == "string", "Expected id to be a string");
            local l_id_0 = v38.payload.id;
            local v40 = nil;
            for v41, v42 in pairs(v37) do
                if v42 == l_id_0 then
                    v40 = v41;
                    break;
                end;
            end;
            local l_v40_0 = v40;
            if not l_v40_0 then
                return v37;
            else
                return v3.Dictionary.join(v37, {
                    [l_v40_0] = v3.None
                });
            end;
        end
    });
end;
