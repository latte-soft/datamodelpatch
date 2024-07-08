local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local l_UrlBuilder_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBase;
local _ = require(l_script_FirstAncestor_0.Parent.LuauPolyfill);
local v4 = require(l_script_FirstAncestor_0.Parent.Promise);
local l_GraphQLError_0 = require(l_script_FirstAncestor_0.Parent.GraphQL).GraphQLError;
local _ = require(l_script_FirstAncestor_0.graphql.generatedTypes);
local v7 = require(l_script_FirstAncestor_0.Parent.Fetch);
local l_fetch_0 = v7.fetch;
local l_Response_0 = v7.Response;
local v10 = {};
local v11 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "access-management/v1/feature-access", 
    query = {
        featureNames = "{featureNames}"
    }
});
v10.getFeatureAccessFromFeatureNamesList = function(v12, v13)
    local v14 = v13 or l_fetch_0;
    return v4.new(function(v15, v16)
        local v17 = v14(v11({
            featureNames = table.concat(v12, ",")
        }), {
            method = "GET"
        }):catch(function()
            return l_Response_0.error();
        end):expect();
        if v17.status == 304 then
            v16(l_GraphQLError_0.new("Got Response: 304, using cached data instead"));
            return ;
        elseif v17.ok then
            local v18 = v17:json():catch(function()
                return nil;
            end):expect();
            if v18 then
                local v19 = {};
                for _, v21 in v18.features, nil, nil do
                    table.insert(v19, {
                        featureName = v21.featureName, 
                        access = v21.access
                    });
                end;
                v15({
                    features = v19
                });
                return ;
            else
                v16(l_GraphQLError_0.new("Failed to decode HTTP response as JSON for AMP Feature Access API"));
                return ;
            end;
        else
            v16(l_GraphQLError_0.new("Failed to find feature access values"));
            return ;
        end;
    end);
end;
local v22 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "access-management/v1/upsell-feature-access", 
    query = {
        featureName = "{featureName}", 
        successfulActions = "{successfulActions}"
    }
});
v10.getUpsellFeatureAccessFromFeatureName = function(v23, v24, v25)
    local v26 = v25 or l_fetch_0;
    return v4.new(function(v27, v28)
        local v29 = v26(v22({
            featureName = v23, 
            successfulActions = table.concat(v24, ",")
        }), {
            method = "GET"
        }):catch(function()
            return l_Response_0.error();
        end):expect();
        if v29.status == 304 then
            v28(l_GraphQLError_0.new("Got Response: 304, using cached data instead"));
            return ;
        elseif v29.ok then
            local v30 = v29:json():catch(function()
                return nil;
            end):expect();
            if v30 then
                v27({
                    featureName = v30.featureName, 
                    access = v30.access, 
                    recourse = v30.recourse, 
                    shouldPrompt = v30.shouldPrompt
                });
                return ;
            else
                v28(l_GraphQLError_0.new("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API"));
                return ;
            end;
        else
            v28(l_GraphQLError_0.new("Failed to find upsell feature access values"));
            return ;
        end;
    end);
end;
return v10;
