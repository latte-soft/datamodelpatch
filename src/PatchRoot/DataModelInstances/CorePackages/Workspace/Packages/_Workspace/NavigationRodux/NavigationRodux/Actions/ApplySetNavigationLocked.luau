local l_Parent_0 = script:FindFirstAncestor("NavigationRodux").Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local v2 = require(l_Parent_0.ArgCheck);
return l_makeActionCreator_0(script.Name, function(v3)
    return {
        locked = v2.isType(v3, "boolean", "locked")
    };
end);
