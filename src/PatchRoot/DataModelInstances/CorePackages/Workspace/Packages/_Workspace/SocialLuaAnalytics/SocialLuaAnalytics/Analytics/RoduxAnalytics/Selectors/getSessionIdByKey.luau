local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = script.Parent.Parent;
local l_SocialLibraries_0 = require(l_Parent_0.dependencies).SocialLibraries;
local _ = require(l_Parent_1.AnalyticsTypes);
return function(v4)
    local l_keyPath_0 = v4.keyPath;
    return function(v6)
        return function(v7)
            return l_SocialLibraries_0.Dictionary.getDeepValue(v6, string.format("%s.bySessionKey.%s", l_keyPath_0, v7));
        end;
    end;
end;
