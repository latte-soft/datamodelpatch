local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.SetSearchBarFocused);
return function(v4, v5)
    v4 = v4 or {
        focused = false
    };
    if v5.type == v3.name then
        v4 = v2.Dictionary.join(v4, {
            focused = v5.focused
        });
    end;
    return v4;
end;
