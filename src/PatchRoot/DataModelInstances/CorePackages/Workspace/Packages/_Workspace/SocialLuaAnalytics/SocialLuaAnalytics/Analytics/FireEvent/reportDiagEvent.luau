local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local l_DiagEventTypes_0 = require(l_script_FirstAncestor_0.Analytics.Enums).DiagEventTypes;
local v2 = require(script.Parent.getPlatformSuffix);
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagSocialLuaAnalyticsAddPlatformValue);
local _ = require(script.Parent.Parent.Types);
return function(v5)
    return function(v6)
        local v7 = nil;
        v7 = if not v3 then v6.name else ("%*%*"):format(v6.name, (v2(v6.platformSpecificity)));
        if v6.type == l_DiagEventTypes_0.Stats then
            v5:reportStats(v7, v6.value);
            return v6;
        else
            v5:reportCounter(v7, v6.value);
            return v6;
        end;
    end;
end;
