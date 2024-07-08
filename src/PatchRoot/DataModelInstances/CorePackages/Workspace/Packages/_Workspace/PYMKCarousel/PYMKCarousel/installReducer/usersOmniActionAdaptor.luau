local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_SocialCommon_0 = v2.SocialCommon;
local l_RoduxUsers_0 = v2.RoduxUsers;
local v5 = require(script.Parent.transformOmniRecommendationsToActions);
local _ = require(l_script_FirstAncestor_0.Common.OmniTypes);
local l_ContextualInfoTypes_0 = l_SocialCommon_0.Enums.ContextualInfoTypes;
local l_FFlagContactRecs_0 = require(l_Parent_0.SharedFlags).FFlagContactRecs;
local function v10(v9)
    return l_RoduxUsers_0.Actions.UserUpdated(if not not l_FFlagContactRecs_0 and v9.contextType == l_ContextualInfoTypes_0.Contacts then {
        id = v9.ContactId or tostring(v9.userId), 
        username = v9.ContactName or "", 
        displayName = v9.ContactName or ""
    } else {
        id = tostring(v9.userId), 
        username = v9.userName, 
        displayName = v9.displayName
    });
end;
return function(v11)
    return {
        AddContentMetadata = function(v12)
            return {
                v12
            };
        end, 
        AddOmniRecommendations = function(v13)
            return v5(v13.recommendations or {}, v11, v10);
        end
    };
end;
