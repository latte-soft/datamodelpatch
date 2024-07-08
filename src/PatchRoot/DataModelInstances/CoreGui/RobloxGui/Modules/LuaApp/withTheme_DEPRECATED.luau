local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_Modules_0.LuaApp.ThemeContext_DEPRECATED);
return function(v6)
    return function(v7)
        return v3.createElement(v5.Consumer, {
            render = function(v8)
                return v3.createElement(v6, v4.Dictionary.join(v7, {
                    appTheme = v8
                }));
            end
        });
    end;
end;
