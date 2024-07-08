local l_script_FirstAncestor_0 = script:FindFirstAncestor("Navigation");
local l_Array_0 = require(l_script_FirstAncestor_0.Parent.LuauPolyfill).Array;
local v2 = require(l_script_FirstAncestor_0.getActiveRoutes);
local _ = require(l_script_FirstAncestor_0.NavigationTypes);
return function(v4, v5)
    return l_Array_0.find(v2(v4), function(v6)
        return v6.routeName == v5;
    end) ~= nil;
end;
