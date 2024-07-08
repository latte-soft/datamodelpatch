local l_CorePackages_0 = game:GetService("CorePackages");
if not require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.GetFFlagUseLocalizationFromAppTempCommon)() then
    local l_LocalizationService_0 = game:GetService("LocalizationService");
    local v2 = require(l_CorePackages_0.Packages.React);
    local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
    local l_RobloxLocaleIdKey_0 = require(l_CorePackages_0.Workspace.Packages.Localization).RobloxLocaleIdKey;
    local l_LocalizationRoactContext_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationRoactContext;
    local l_localizeStrings_0 = require(l_CorePackages_0.Workspace.Packages.Localization).localizeStrings;
    local l_useSignal_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useSignal;
    return function(v8)
        local v9 = v2.useContext(l_LocalizationRoactContext_0);
        local v10, v11 = v2.useState(l_LocalizationService_0.RobloxLocaleId);
        l_useSignal_0(v9.changed, (v2.useCallback(function(v12)
            v12 = v9:GetLocale();
            if v12 ~= v10 then
                v11(v12);
            end;
        end, {
            v9
        })));
        v3.isType(v8, "table", "LocalizationConsumer.props.stringsToBeLocalized");
        local v13 = l_localizeStrings_0(v9, v8);
        v13[l_RobloxLocaleIdKey_0] = v10;
        return v13;
    end;
else
    return require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
end;
