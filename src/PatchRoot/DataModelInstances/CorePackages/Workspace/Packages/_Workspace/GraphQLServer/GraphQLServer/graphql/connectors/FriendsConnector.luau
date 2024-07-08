local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UrlBuilder_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBase;
local _ = require(l_script_FirstAncestor_0.Parent.LuauPolyfill);
local v5 = require(l_script_FirstAncestor_0.Parent.Promise);
local l_GraphQLError_0 = require(l_script_FirstAncestor_0.Parent.GraphQL).GraphQLError;
local _ = require(l_script_FirstAncestor_0.graphql.generatedTypes);
local v8 = require(l_script_FirstAncestor_0.Parent.Fetch);
local l_fetch_0 = v8.fetch;
local l_Response_0 = v8.Response;
local v11 = require(l_Parent_0.SocialLuaAnalytics);
local l_reportPromiseLoadingTimeWrapper_0 = v11.Analytics.Timing.reportPromiseLoadingTimeWrapper;
local l_createDiagMetricString_0 = v11.Analytics.Formatters.createDiagMetricString;
local l_Diag_0 = v11.Analytics.DefaultAnalyticsService.Diag;
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsConnectorPromiseLoadingTime);
local v16 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.FRIENDS, 
    path = "users/{userId}/friends/find", 
    query = {
        {
            name = "limit", 
            value = "{limit}", 
            optional = false
        }, 
        {
            name = "userSort", 
            value = "{userSort}", 
            optional = true
        }, 
        {
            name = "cursor", 
            value = "{cursor}", 
            optional = true
        }
    }
});
local v17 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.FRIENDS, 
    path = "users/{userId}/friends/online", 
    query = {
        {
            name = "userSort", 
            value = "{userSort}", 
            optional = true
        }
    }
});
local function v27(v18, v19)
    local v20 = v19 or l_fetch_0;
    return v5.new(function(v21, v22)
        local v25 = v20(v16({
            userId = v18.userId, 
            limit = v18.pageLimit or 50, 
            cursor = v18.pageCursor, 
            userSort = v18.sort
        }), {
            method = "GET"
        }):catch(function(v23)
            local v24 = l_Response_0.error();
            v24.statusText = v23.message;
            return v24;
        end):expect();
        if v25.ok then
            local v26 = v25:json():catch(function()
                return nil;
            end):expect();
            if v26 then
                v21(v26);
                return ;
            else
                v22(l_GraphQLError_0.new("Failed to decode HTTP response as JSON for friends API"));
                return ;
            end;
        else
            v22(l_GraphQLError_0.new(v25.statusText, nil, nil, nil, nil, {
                extensions = {
                    status = v25.status, 
                    statusText = v25.statusText
                }
            }));
            return ;
        end;
    end);
end;
local function v37(v28, v29)
    local v30 = v29 or l_fetch_0;
    return v5.new(function(v31, v32)
        local v35 = v30(v17({
            userId = v28.userId, 
            userSort = v28.sort
        }), {
            method = "GET"
        }):catch(function(v33)
            local v34 = l_Response_0.error();
            v34.statusText = v33.message;
            return v34;
        end):expect();
        if v35.ok then
            local v36 = v35:json():catch(function()
                return nil;
            end):expect();
            if v36 then
                v31(v36.data or {});
                return ;
            else
                v32(l_GraphQLError_0.new("Failed to decode HTTP response as JSON for friends API"));
                return ;
            end;
        else
            v32(l_GraphQLError_0.new(v35.statusText, nil, nil, nil, nil, {
                extensions = {
                    status = v35.status, 
                    statusText = v35.statusText
                }
            }));
            return ;
        end;
    end);
end;
local function v41(v38, v39, v40)
    l_Diag_0:reportStats(l_createDiagMetricString_0(v38, v39), v40);
end;
return {
    getAllFriendsByUserId = if not v15 then v27 else l_reportPromiseLoadingTimeWrapper_0(v27, function(v42)
        return {
            fetch = "friends_find", 
            nextPage = v42.pageCursor and v42.pageCursor ~= ""
        };
    end, {
        fireEvent = v41
    }), 
    getOnlineFriendsByUserId = if not v15 then v37 else l_reportPromiseLoadingTimeWrapper_0(v37, function(_)
        return {
            fetch = "friends_online"
        };
    end, {
        fireEvent = v41
    })
};
