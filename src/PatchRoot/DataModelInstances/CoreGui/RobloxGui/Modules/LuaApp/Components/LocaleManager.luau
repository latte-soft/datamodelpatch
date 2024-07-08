local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v7 = require(l_Modules_0.LuaApp.LuaAppBacktraceReporter);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppLocalizationConsistencyFixes);
UpdateLocalizationWithLocale = function(v9)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    v9:SetLocale(l_RobloxLocaleId_0);
    v7:updateSharedAttributes({
        Locale = l_RobloxLocaleId_0
    });
end;
return function(v11)
    local l_localization_0 = v11.localization;
    v5.useEffect(function()
        if v8() and l_localization_0:GetLocale() ~= l_LocalizationService_0.RobloxLocaleId then
            UpdateLocalizationWithLocale(l_localization_0);
        end;
    end, {
        v11.localization
    });
    return v4.createElement(v6, {
        event = l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"), 
        callback = function()
            UpdateLocalizationWithLocale(l_localization_0);
        end
    });
end;
