local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local v1 = require(l_script_FirstAncestor_0.Flags.FFlagSocialLuaAnalyticsAddPlatformValueFix);
local l_DiagEventTypes_0 = require(l_script_FirstAncestor_0.Analytics.Enums).DiagEventTypes;
local _ = require(script.Parent.Parent.Types);
local function _(v4, v5)
    if type(v4) == "function" then
        return (v4(v5));
    else
        return v4;
    end;
end;
return function()
    return function(v7, v8)
        local l_name_0 = v7.name;
        local v10 = if type(l_name_0) == "function" then l_name_0(v8) else l_name_0;
        l_name_0 = v7.type or l_DiagEventTypes_0.Counter;
        local v11;
        if l_name_0 == l_DiagEventTypes_0.Stats then
            local l_stats_0 = v7.stats;
            v11 = if type(l_stats_0) == "function" then l_stats_0(v8) else l_stats_0 or 0;
        else
            local l_count_0 = v7.count;
            v11 = if type(l_count_0) == "function" then l_count_0(v8) else l_count_0 or 1;
        end;
        return {
            type = l_name_0, 
            name = v10, 
            value = v11, 
            platformSpecificity = if not v1 then nil else v7.platformSpecificity
        };
    end;
end;
