local l_CorePackages_0 = game:GetService("CorePackages");
local l_makeActionCreator_0 = require(l_CorePackages_0.Rodux).makeActionCreator;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return l_makeActionCreator_0(script.Name, function(v3)
    v2.isType(v3, "string", "searchType");
    return {
        searchType = v3
    };
end);
