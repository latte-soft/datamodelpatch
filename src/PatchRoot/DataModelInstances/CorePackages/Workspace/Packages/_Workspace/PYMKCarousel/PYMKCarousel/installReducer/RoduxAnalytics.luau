local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local _ = require(l_script_FirstAncestor_0.Common.OmniTypes);
local v3 = require(script.Parent.transformOmniRecommendationsToActions);
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local l_convertActions_0 = v1.convertActions;
local l_RoduxAnalytics_0 = v1.RoduxAnalytics;
local v7 = l_RoduxAnalytics_0.installReducer();
local function v12(v8, _)
    local v10 = nil;
    if not ((not (not (not v8 or not v8.recommendations) and #v8.recommendations > 0) or not v8.recommendations[1]) or not v8.recommendations[1].contentMetadata) then
        local l_contentMetadata_0 = v8.recommendations[1].contentMetadata;
        v10 = if not l_contentMetadata_0 then nil else l_contentMetadata_0.recommendationRequestId;
    end;
    return l_RoduxAnalytics_0.Actions.SessionIdUpdated({
        sessionKey = l_RECOMMENDATION_SESSION_ID_KEY_0, 
        sessionId = v10
    });
end;
local function _(v13)
    return {
        AddOmniRecommendations = function(v14)
            return v3(v14.recommendations or {}, v13, nil, v12);
        end
    };
end;
return function(v16)
    return l_convertActions_0(v7, {
        AddOmniRecommendations = function(v17)
            return v3(v17.recommendations or {}, v16, nil, v12);
        end
    }, {});
end;
