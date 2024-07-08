local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Packages.React);
local v2 = require(l_Modules_0.LuaApp.Components.Banner.BannerContainer);
local v3 = require(l_Modules_0.LuaApp.Components.Banner.useShowSecurityBanner);
local v4 = require(l_Modules_0.LuaApp.Components.Banner.useShowSiteMessageBanner);
return function(v5)
    local v6, v7 = v1.useState(Vector2.zero);
    local v8 = v3();
    local v9 = v4();
    if v5 then
        v9 = false;
    end;
    return v1.useMemo(function()
        return v1.createElement(v2, {
            showSiteMessageBanner = v9, 
            showSecurityBanner = v8, 
            onSizeChanged = v7
        });
    end, {
        v8, 
        v9, 
        v6
    }), v6.Y;
end;
