local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Common.ModelTypes);
local l_getDeepValue_0 = require(l_Parent_0.dependencies).SocialLibraries.Dictionary.getDeepValue;
return function(v3, v4, _)
    return function(v6)
        local v7 = l_getDeepValue_0(v3, string.format("%s.Users.byUserId.%s", v4, v6));
        if v7 then
            return v7;
        else
            return nil;
        end;
    end;
end;
