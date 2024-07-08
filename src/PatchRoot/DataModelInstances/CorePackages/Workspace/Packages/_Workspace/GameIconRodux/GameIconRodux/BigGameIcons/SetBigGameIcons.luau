local l_Parent_0 = script:FindFirstAncestor("GameIconRodux").Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local v2 = require(l_Parent_0.ArgCheck);
return l_makeActionCreator_0(script.Name, function(v3)
    v2.isType(v3, "table", "iconsTable");
    return {
        gameIcons = v3
    };
end);
