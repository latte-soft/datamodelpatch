local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.InGameMenuDependencies).Roact;
if not require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.GetFFlagSwitchInExpTranslationsPackage)() then
    local v2 = require(script.Parent.LocalizationRoactContext);
    LocalizationProvider = function(v3)
        return l_Roact_0.createElement(v2.Provider, {
            value = v3.localization
        }, v3[l_Roact_0.Children]);
    end;
    return LocalizationProvider;
else
    return require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
end;
