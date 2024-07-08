local l_Parent_0 = script:FindFirstAncestor("ProfileInsights").Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v2 = require(l_Parent_0.ApolloProfileInsights);
local l_useProfileInsightsByUserIds_0 = v2.Hooks.useProfileInsightsByUserIds;
local l_getMutualFriendsByUserIdFromData_0 = v2.Selectors.getMutualFriendsByUserIdFromData;
local v5 = require(l_Parent_0.UserProfiles);
local function _(v6, v7)
    return l_Array_0.map(l_Array_0.slice(v6, 1, v7 + 1), function(v8)
        return v8.id;
    end);
end;
local function _(v10, v11)
    if not v10 then
        return nil;
    else
        return (l_Array_0.map(v11, function(v12)
            return v5.Selectors.getCombinedNameFromId(v10, v12);
        end));
    end;
end;
return function(v14)
    local v15 = l_useProfileInsightsByUserIds_0({
        userIds = {
            v14.userId
        }
    });
    local v17 = l_Array_0.map(l_Array_0.slice(l_getMutualFriendsByUserIdFromData_0(v15.data, v14.userId), 1, v14.limit + 1), function(v16)
        return v16.id;
    end);
    local v18 = v5.Hooks.useUserProfilesFetch({
        userIds = v17, 
        query = v5.Queries.userProfilesCombinedNameByUserIds
    });
    local v19 = v15.loading or v18.loading;
    local l_data_0 = v18.data;
    return if not l_data_0 then nil else l_Array_0.map(v17, function(v21)
        return v5.Selectors.getCombinedNameFromId(l_data_0, v21);
    end), v19;
end;
