local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local v2 = require(l_CorePackages_0.Packages.React);
local l_useInputType_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useInputType;
return function(v4)
    return function(v5)
        return v2.createElement(v4, v1.join(v5, {
            lastInputGroup = l_useInputType_0()
        }));
    end;
end;
