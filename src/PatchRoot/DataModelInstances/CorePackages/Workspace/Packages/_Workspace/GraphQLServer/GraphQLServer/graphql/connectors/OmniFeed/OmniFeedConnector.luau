local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v3 = require(l_Parent_0.Promise);
local v4 = {};
local v5 = require(l_Parent_0.Fetch);
local l_fetch_0 = v5.fetch;
local l_Response_0 = v5.Response;
local l_GraphQLError_0 = require(l_Parent_0.GraphQL).GraphQLError;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v10 = require(script.Parent.buildOmniRecommendationsRequest);
local _ = require(script.Parent.Parent.Parent.generatedTypes);
local function v19(v12, v13)
    local v14 = v10(v13 or l_fetch_0);
    return v3.new(function(v15, v16)
        local v17 = v14(v12.pageType, v12.sessionId, v12.nextPageToken, v12.supportedTreatmentTypes):catch(function()
            return l_Response_0.error();
        end):expect();
        if v17.ok then
            local v18 = v17:json():catch(function()
                return nil;
            end):expect();
            if not v18 then
                v16(l_GraphQLError_0.new("Failed to decode HTTP response as JSON for omni-recommendation fetch"));
            end;
            v15(l_Object_0.assign({
                omniSessionId = v12.sessionId, 
                pageType = v12.pageType
            }, v18));
            return nil;
        else
            v16(l_GraphQLError_0.new(string.format("Failed to fetch omni recommendations. Error code: %d", v17.status)));
            return nil;
        end;
    end);
end;
local v20 = l_UrlBuilder_0.fromString("apis:discovery-api/omni-recommendation-metadata");
local function v28(v21, v22)
    local v23 = v22 or l_fetch_0;
    return v3.new(function(v24, v25)
        local v26 = v23(v20(), {
            body = l_HttpService_0:JSONEncode({
                sessionId = v21.sessionId, 
                contents = v21.recommendations
            }), 
            method = "POST", 
            headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }
        }):catch(function()
            return l_Response_0.error();
        end):expect();
        if v26.ok then
            local v27 = v26:json():catch(function()
                return nil;
            end):expect();
            if v27 then
                v24(l_Object_0.assign(v27, {
                    topicId = v21.topicId, 
                    recommendations = v21.recommendations
                }));
                return ;
            else
                v25(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for topicId: %s", v21.topicId)));
                return ;
            end;
        else
            v25(l_GraphQLError_0.new(string.format("Failed to fetch additional metadata for topicId: %s", v21.topicId)));
            return ;
        end;
    end);
end;
v4.findOmniFeedBySessionId = v19;
v4.fetchMoreOmniRecommendationMetadata = v28;
return v4;
