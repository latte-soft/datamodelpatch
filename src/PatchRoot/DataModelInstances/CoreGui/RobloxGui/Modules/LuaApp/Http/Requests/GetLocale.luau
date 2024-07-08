local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v5 = require(l_Modules_0.LuaApp.Http.Url);
return function(v6)
    return v6(string.format("%sv1/locales/user-localization-locus-supported-locales", v5.LOCALE), "GET", {
        headers = {
            ["Accept-Language"] = l_LocalizationService_0.SystemLocaleId
        }
    });
end;
