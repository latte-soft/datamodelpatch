local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigation").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(script.Parent.useNavigationProps);
local _ = require(script.Parent.types);
return function(v5)
    return function(v6)
        return function(v7)
            return v1.createElement(v6, v2.Dictionary.join(v7, v3(v5)));
        end;
    end;
end;
