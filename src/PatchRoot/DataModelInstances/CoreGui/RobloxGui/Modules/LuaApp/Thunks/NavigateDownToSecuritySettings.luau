local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
local v3 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v4 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v5)
    v2.isTypeOrNil(v5, "function", "onClose");
    return v4({
        name = v1.SettingsSubPage, 
        detail = v3.static.settings.security(), 
        extraProps = {
            titleKey = "Feature.AccountSettings.Heading.Tab.Security", 
            onClose = v5
        }
    });
end;
