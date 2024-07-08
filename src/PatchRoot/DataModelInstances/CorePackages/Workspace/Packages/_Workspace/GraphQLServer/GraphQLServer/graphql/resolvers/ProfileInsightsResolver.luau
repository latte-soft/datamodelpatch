local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Parent_0.Cryo);
local _ = require(script.Parent.Parent.generatedTypes);
local _ = require(l_Parent_0.LuauPolyfill);
local v5 = require(script.Parent.Parent.connectors.ProfileInsightsConnector);
local l_findProfileInsightsByUserIds_0 = v5.findProfileInsightsByUserIds;
local l_findProfileInsightsByUserIdsFeed_0 = v5.findProfileInsightsByUserIdsFeed;
local function _(v8)
    return (not not v8 and v8.profileInsights) and v8.profileInsights[1] or nil;
end;
return {
    ProfileInsights = {
        targetUserId = function(v10)
            return v10.targetUser;
        end, 
        mutualFriends = function(v11)
            local v12 = (not not v11 and v11.profileInsights) and v11.profileInsights[1] or nil;
            local v13 = if not not v12 and v12.mutualFriendInsight then v12.mutualFriendInsight.mutualFriends else {};
            if v13 then
                return v2.List.foldLeft(v2.Dictionary.keys(v13), function(v14, v15)
                    local v16 = v13[v15];
                    table.insert(v14, {
                        id = v15, 
                        username = v16.username, 
                        displayName = v16.displayName
                    });
                    return v14;
                end, {});
            else
                return {};
            end;
        end, 
        isOfflineFrequents = function(v17)
            local v18 = (not not v17 and v17.profileInsights) and v17.profileInsights[1] or nil;
            local v19 = not not v18 and v18.offlineFrequentsInsight or nil;
            if not v19 or not v19.havePlayedTogether then
                return false;
            else
                return true;
            end;
        end
    }, 
    ProfileInsightsPages = {
        id = function(v20)
            if not v20.pageId then
                return (l_HttpService_0:GenerateGUID(false));
            else
                return v20.pageId;
            end;
        end, 
        profileInsights = function(v21)
            return v21.profileInsights;
        end
    }, 
    Query = {
        profilesInsights = function(_, v23, v24)
            return l_findProfileInsightsByUserIdsFeed_0(v23.userIds, v23.count, v23.pageId, v24.fetchImpl);
        end, 
        profilesInsightsByUserIds = function(_, v26, v27)
            return l_findProfileInsightsByUserIds_0(v26.userIds, v26.count, v27.fetchImpl);
        end
    }
};
