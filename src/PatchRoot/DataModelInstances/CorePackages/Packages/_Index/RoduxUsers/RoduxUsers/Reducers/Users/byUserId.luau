local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxUsers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local l_Models_0 = l_script_FirstAncestor_0.Models;
local v6 = require(l_Actions_0.UserRemoved);
local v7 = require(l_Actions_0.UserUpdated);
local v8 = require(l_Models_0.UserModel);
local v9 = {};
local function v16(v10, v11)
    local v12 = {};
    for _, v14 in ipairs(v11) do
        local v15 = tostring(v14.id);
        v12[v15] = v8.new({
            id = v15, 
            username = v14.name, 
            displayName = v14.displayName, 
            hasVerifiedBadge = v14.hasVerifiedBadge, 
            created = v14.created
        });
    end;
    return v3.Dictionary.join(v10, v12);
end;
return function(v17)
    local l_usersNetworking_0 = v17.usersNetworking;
    local l_friendsNetworking_0 = v17.friendsNetworking;
    return v2.createReducer(v9, {
        [l_usersNetworking_0.GetUserV2FromUserId.Succeeded.name] = function(v20, v21)
            return v16(v20, {
                v21.responseBody
            });
        end, 
        [l_usersNetworking_0.GetSkinnyUsersFromUserIds.Succeeded.name] = function(v22, v23)
            return v16(v22, v23.responseBody.data);
        end, 
        [l_friendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(v24, v25)
            return v16(v24, v25.responseBody.data);
        end, 
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v26, v27)
            return v16(v26, v27.responseBody.data);
        end, 
        [l_friendsNetworking_0.GetFriendRecommendationsFromUserId.Succeeded.name] = function(v28, v29)
            return v16(v28, v29.responseBody.data);
        end, 
        [v7.name] = function(v30, v31)
            assert(v8.isValid(v31.payload));
            return v3.Dictionary.join(v30, {
                [v31.payload.id] = v31.payload
            });
        end, 
        [v6.name] = function(v32, v33)
            assert(type(v33.payload.id) == "string", "Expected id to be a string");
            return v3.Dictionary.join(v32, {
                [v33.payload.id] = v3.None
            });
        end
    });
end;
