local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.llama);
local v4 = require(l_Parent_0.Models.Recommendation);
local l_Actions_0 = l_Parent_0.Actions;
local v6 = require(l_Actions_0.RecommendationCreated);
local v7 = require(l_Actions_0.FriendshipCreated);
local v8 = require(l_Actions_0.RecommendationDestroyed);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v10 = {};
local function _(v11, v12)
    local v13 = v12[v11.baseUserId];
    if not v13 then
        return nil;
    else
        return (v3.Dictionary.removeKey(v13, v11.recommendedUserId));
    end;
end;
local function v23(v15, v16)
    local l_join_0 = v3.Dictionary.join;
    local l_v16_0 = v16;
    local v19 = {};
    local l_userId1_0 = v15.userId1;
    local v21 = {
        baseUserId = v15.userId1, 
        recommendedUserId = v15.userId2
    };
    local v22 = v16[v21.baseUserId];
    v19[l_userId1_0] = if not v22 then nil else v3.Dictionary.removeKey(v22, v21.recommendedUserId);
    l_userId1_0 = v15.userId2;
    v21 = {
        baseUserId = v15.userId2, 
        recommendedUserId = v15.userId1
    };
    v22 = v16[v21.baseUserId];
    v19[l_userId1_0] = if not v22 then nil else v3.Dictionary.removeKey(v22, v21.recommendedUserId);
    return l_join_0(l_v16_0, v19);
end;
local function _(v24, v25)
    local l_v25_0 = v25;
    v3.Dictionary.map(v24.users, function(v27)
        l_v25_0 = v23({
            userId1 = v24.baseFriendId, 
            userId2 = tostring(v27.id)
        }, l_v25_0);
    end);
    return l_v25_0;
end;
return function(v29)
    local l_friendsNetworking_0 = v29.friendsNetworking;
    return v2.createReducer(v10, {
        [v6.name] = function(v31, v32)
            local v33 = tostring(v32.payload.baseUserId);
            return v3.Dictionary.join(v31, {
                [v33] = v3.Dictionary.join(v31[v33] or {}, {
                    [tostring(v32.payload.recommendedUser.id)] = v4.format(v32.payload.recommendedUser)
                })
            });
        end, 
        [v8.name] = function(v34, v35)
            local l_join_1 = v3.Dictionary.join;
            local l_v34_0 = v34;
            local v38 = {};
            local l_baseUserId_0 = v35.payload.baseUserId;
            local l_payload_0 = v35.payload;
            local v41 = v34[l_payload_0.baseUserId];
            v38[l_baseUserId_0] = if not v41 then nil else v3.Dictionary.removeKey(v41, l_payload_0.recommendedUserId);
            return l_join_1(l_v34_0, v38);
        end, 
        [l_friendsNetworking_0.GetFriendRecommendationsFromUserId.Succeeded.name] = function(v42, v43)
            local v44 = tostring(v43.namedIds.users);
            return v3.Dictionary.join(v42, {
                [v44] = v3.Dictionary.join(v42[v44] or {}, (v3.Dictionary.map(v43.responseBody.data, function(v45, _)
                    local v47 = if v45.contextType == "Contacts" then v45.contactId else tostring(v45.id);
                    return v4.format({
                        id = v47, 
                        contactId = v45.contactId, 
                        mutualFriendsList = v45.mutualFriendsList, 
                        rank = v45.rank, 
                        contextType = v45.contextType, 
                        thumbnailEntities = v45.thumbnailEntities, 
                        displayName = v45.displayName
                    }), v47;
                end)))
            });
        end, 
        [v7.name] = function(v48, v49)
            return v23(v49.payload, v48);
        end, 
        [l_friendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(v50, v51)
            local v52 = {
                baseFriendId = tostring(v51.namedIds.users), 
                users = v51.responseBody.data
            };
            local l_v50_0 = v50;
            v3.Dictionary.map(v52.users, function(v54)
                l_v50_0 = v23({
                    userId1 = v52.baseFriendId, 
                    userId2 = tostring(v54.id)
                }, l_v50_0);
            end);
            return l_v50_0;
        end, 
        [l_friendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v55, v56)
            return v23({
                userId1 = tostring(v56.additionalData.currentUserId), 
                userId2 = tostring(v56.ids[1])
            }, v55);
        end, 
        [v29.networkingBlocking.BlockUserById.Succeeded.name] = function(v57, v58)
            return v23({
                userId1 = tostring(v58.additionalData.currentUserId), 
                userId2 = tostring(v58.namedIds.users)
            }, v57);
        end
    });
end;
