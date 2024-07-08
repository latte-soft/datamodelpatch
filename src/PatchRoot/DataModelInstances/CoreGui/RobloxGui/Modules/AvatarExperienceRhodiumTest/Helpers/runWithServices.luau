local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaAppRhodiumTest.withServices);
local _ = require(l_CorePackages_0.Packages.Dash);
return function(v3, v4)
    v1(v4, v3.component, v3.initialStoreState, v3.props, v3.extraServices, v3.extraArgs);
end;
