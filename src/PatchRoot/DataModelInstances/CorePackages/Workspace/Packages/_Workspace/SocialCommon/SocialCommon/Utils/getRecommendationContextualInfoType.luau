local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagContactRecs_0 = require(l_Parent_0.SharedFlags).FFlagContactRecs;
local l_RecommendationContextType_0 = (if not l_FFlagContactRecs_0 then require(l_Parent_0.LuaSocialLibrariesDeps).RoduxFriends else require(l_Parent_0.RoduxFriends)).config({
    keyPath = "SocialCommon.Friends"
}).Enums.RecommendationContextType;
local v4 = require(l_script_FirstAncestor_0.Enums.ContextualInfoTypes);
return function(v5)
    local v6 = v5.contextType and v5.contextType.rawValue();
    if v6 == l_RecommendationContextType_0.MutualFriends.rawValue() then
        return v4.MutualFriends;
    elseif v6 == l_RecommendationContextType_0.Frequents.rawValue() then
        return v4.Frequents;
    elseif l_FFlagContactRecs_0 and v6 == l_RecommendationContextType_0.Contacts.rawValue() then
        return v4.Contacts;
    else
        return nil;
    end;
end;
