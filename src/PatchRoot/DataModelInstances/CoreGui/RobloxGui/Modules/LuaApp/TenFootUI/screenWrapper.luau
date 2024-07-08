local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
return function(v3, v4)
    local v5 = v4 or function()
        return nil;
    end;
    return function(v6)
        return v1.createElement(v3, v5(v6));
    end;
end;
