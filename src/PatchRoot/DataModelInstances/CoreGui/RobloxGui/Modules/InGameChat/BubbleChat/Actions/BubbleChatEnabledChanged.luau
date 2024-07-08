local l_CorePackages_0 = game:GetService("CorePackages");
local l_makeActionCreator_0 = require(l_CorePackages_0.Rodux).makeActionCreator;
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(script.Parent.Parent.Helpers.maybeAssert);
return l_makeActionCreator_0(script.Name, function(v4)
    v3(v2.boolean(v4));
    return {
        enabled = v4
    };
end);
