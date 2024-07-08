local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v4 = require(l_Parent_0.Fetch);
local v5 = require(l_Parent_0.Promise);
local l_fetch_0 = v4.fetch;
local l_Response_0 = v4.Response;
local l_AccessResponseEnum_0 = require(l_script_FirstAncestor_0.Common.Enums).AccessResponseEnum;
local l_gql_0 = require(l_Parent_0.ApolloClient).gql;
local v10 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "access-management/v1/upsell-feature-access", 
    query = {
        featureName = "{featureName}", 
        successfulActions = "{successfulActions}"
    }
});
local v11 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "access-management/v1/feature-access", 
    query = {
        featureNames = "{featureNames}"
    }
});
local function _(v12, v13)
    local l_l_fetch_0_0 = l_fetch_0;
    return v5.new(function(v15, v16)
        local v17 = l_l_fetch_0_0(v10({
            featureName = v12, 
            successfulActions = table.concat(v13, ",")
        }), {
            method = "GET"
        }):catch(function()
            return l_Response_0.error();
        end):expect();
        if v17.status == 304 then
            v16("Got Response: 304");
            return ;
        elseif v17.ok then
            local v18 = v17:json():catch(function()
                return nil;
            end):expect();
            if v18 then
                v15({
                    access = v18.access, 
                    recourse = v18.recourse, 
                    shouldPrompt = v18.shouldPrompt
                });
                return ;
            else
                v16("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API");
                return ;
            end;
        else
            v16("Failed to find upsell feature access values");
            return ;
        end;
    end);
end;
return {
    upsellFeatureAccess = function(v20, v21)
        local l_l_fetch_0_1 = l_fetch_0;
        return (v5.new(function(v23, v24)
            local v25 = l_l_fetch_0_1(v10({
                featureName = v20, 
                successfulActions = table.concat(v21, ",")
            }), {
                method = "GET"
            }):catch(function()
                return l_Response_0.error();
            end):expect();
            if v25.status == 304 then
                v24("Got Response: 304");
                return ;
            elseif v25.ok then
                local v26 = v25:json():catch(function()
                    return nil;
                end):expect();
                if v26 then
                    v23({
                        access = v26.access, 
                        recourse = v26.recourse, 
                        shouldPrompt = v26.shouldPrompt
                    });
                    return ;
                else
                    v24("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API");
                    return ;
                end;
            else
                v24("Failed to find upsell feature access values");
                return ;
            end;
        end):catch(function(_)
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end):expect());
    end, 
    upsellFeatureAccessGql = function(v28, v29, _)
        local v32 = v28:query({
            query = l_gql_0("\t\tquery GetUpsellFeatureAccess($featureName: String[RecourseActions]) {\n\t\t\tgetUpsellFeatureAccess(featureName: $featureName, successfulActions: $successfulActions) {\n\t\t\t\tfeatureAccess {\n\t\t\t\t  featureName\n\t\t\t\t  access\n\t\t\t\t  recourse\n\t\t\t\t}\n\t\t\t\tshouldPrompt\n\t\t\t  }\n\t\t}\n\t"), 
            variables = {
                featureName = v29, 
                successfulActions = {}
            }, 
            fetchPolicy = "network-only"
        }):catch(function(_)
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end):expect();
        if not v32.data or not v32.data.getUpsellFeatureAccess.featureAccess then
            return {
                access = l_AccessResponseEnum_0.Error
            };
        else
            return v32.data.getUpsellFeatureAccess.featureAccess;
        end;
    end, 
    getFeatureAccess = function(v33)
        local l_l_fetch_0_2 = l_fetch_0;
        return (v5.new(function(v35, v36)
            local v37 = l_l_fetch_0_2(v11({
                featureNames = table.concat(v33, ",")
            }), {
                method = "GET"
            }):catch(function()
                return l_Response_0.error();
            end):expect();
            if v37.status == 304 then
                v36("Got Response: 304");
                return ;
            elseif v37.ok then
                local v38 = v37:json():catch(function()
                    return nil;
                end):expect();
                if v38 then
                    local v39 = {};
                    for _, v41 in v38.features, nil, nil do
                        table.insert(v39, {
                            feature = v41.featureName, 
                            access = v41.access
                        });
                    end;
                    v35({
                        featureAccessList = v39
                    });
                    return ;
                else
                    v36("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API");
                    return ;
                end;
            else
                v36("Failed to find get feature access values");
                return ;
            end;
        end):catch(function(_)
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end):expect());
    end
};
