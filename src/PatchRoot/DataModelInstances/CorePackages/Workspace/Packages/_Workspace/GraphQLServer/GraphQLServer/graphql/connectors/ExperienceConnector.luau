local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local _ = require(l_script_FirstAncestor_0.Parent.LuauPolyfill);
local _ = require(l_script_FirstAncestor_0.graphql.generatedTypes);
local v3 = require(l_script_FirstAncestor_0.Parent.Promise);
local l_GraphQLError_0 = require(l_script_FirstAncestor_0.Parent.GraphQL).GraphQLError;
local v5 = require(l_script_FirstAncestor_0.Parent.Fetch);
local l_fetch_0 = v5.fetch;
local l_Response_0 = v5.Response;
local l_UrlBuilder_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBase;
local v10 = {};
local v11 = l_UrlBuilder_0.fromString("games:games?universeIds={universeIds}");
local v12 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.new("games", 2), 
    path = "games/{universeId}/media"
});
v10.findExperienceDetailsByUniverseId = function(v13, v14)
    local v15 = v14 or l_fetch_0;
    return v3.new(function(v16, v17)
        local v18 = v15(v11({
            universeIds = v13
        }), {
            method = "GET"
        }):catch(function()
            return l_Response_0.error();
        end):expect();
        if v18.ok then
            local v19 = v18:json():catch(function()
                return nil;
            end):expect();
            if v19 then
                v16(v19.data[1]);
                return ;
            else
                v17(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for experience with universeId: %s.", v13)));
                return ;
            end;
        else
            v17(l_GraphQLError_0.new(string.format("Failed to find experience for universeId: %s.", v13)));
            return ;
        end;
    end);
end;
v10.findExperienceMediaByUniverseId = function(v20, v21)
    local v22 = v21 or l_fetch_0;
    return v3.new(function(v23, v24)
        local v25 = v22(v12({
            universeId = v20
        }), {
            method = "GET"
        }):catch(function()
            return l_Response_0.error();
        end):expect();
        if v25.ok then
            local v26 = v25:json():catch(function()
                return nil;
            end):expect();
            if v26 then
                v23(v26.data);
                return ;
            else
                v24(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for experience media for universeId: %s.", v20)));
                return ;
            end;
        else
            v24(l_GraphQLError_0.new(string.format("Failed to find experience media for universeId: %s.", v20)));
            return ;
        end;
    end);
end;
local v27 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.new("thumbnails", 1), 
    path = "games/icons", 
    query = "universeIds={universeIds}&format={format}&size={size}"
});
v10.batchFetchThumbnailsByUniverseId = function(v28, v29)
    local v30 = v29 or l_fetch_0;
    return v3.new(function(v31, v32)
        local v33 = table.concat(v28, ",");
        local v34 = v30(v27({
            universeIds = v33, 
            size = "150x150", 
            format = "png"
        }), {
            method = "GET"
        }):catch(function()
            return l_Response_0.error();
        end):expect();
        if v34.ok then
            local v35 = v34:json():catch(function()
                return nil;
            end):expect();
            if v35 then
                v31(v35.data);
                return nil;
            else
                v32(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for thumbnails for universeIds: %s.", v33)));
                return nil;
            end;
        else
            v32(l_GraphQLError_0.new(string.format("Failed to find thumbnails for ids: %s.", v33)));
            return nil;
        end;
    end);
end;
return v10;
