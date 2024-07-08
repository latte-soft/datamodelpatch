local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Themes.ClassicTheme);
local v2 = require(l_Modules_0.LuaApp.Themes.DeprecatedLightTheme);
local v3 = require(l_Modules_0.LuaApp.Themes.DeprecatedDarkTheme);
local v4 = require(game:GetService("CorePackages").Logging);
local v5 = {
    dark = v3, 
    light = v2, 
    classic = v1
};
return function(v6)
    if v6 ~= nil and #v6 > 0 then
        local v7 = v5[string.lower(v6)];
        if v7 ~= nil then
            return v7;
        else
            v4.warn("Unrecognized theme name: " .. v6);
        end;
    end;
    return v1;
end;
