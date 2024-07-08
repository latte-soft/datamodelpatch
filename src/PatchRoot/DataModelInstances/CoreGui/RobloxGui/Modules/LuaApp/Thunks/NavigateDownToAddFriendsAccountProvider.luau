local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Packages.t);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.AppPage);
local v4 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v5, v6)
    assert(v1.string(v5));
    assert(v1.callback(v6) or v1.none(v6));
    return v4({
        name = v3.SdkShare, 
        extraProps = {
            context = "AddFriendsTile", 
            userId = v5, 
            onClose = v6
        }
    });
end;
