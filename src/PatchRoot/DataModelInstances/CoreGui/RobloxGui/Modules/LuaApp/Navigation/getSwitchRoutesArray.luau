local v0 = require(game:GetService("CorePackages").Packages.Cryo);
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.GetIABottomBarItems);
return function()
    local v2, _ = v1();
    return v0.List.map(v2, function(v4)
        return v4.page;
    end);
end;
