local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local l_EventTypes_0 = require(l_script_FirstAncestor_0.Analytics.Enums).EventTypes;
return function(v3, v4)
    local v5 = v3 or l_EventTypes_0.LoadingTime;
    local v6 = v4 or {};
    return table.concat(v1.Dictionary.values({
        v5, 
        v6.fetch, 
        if not v6.nextPage then nil else "nextPage", 
        v6.status
    }), "_");
end;
