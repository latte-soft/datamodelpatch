local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Roact);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.Flags.GetFFlagSwitchInExpTranslationsPackage);
local v6 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v7 = nil;
v7 = if not v5() then require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization else require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local v9 = require(script.Components.FTUXPanel);
local v10 = require(script.Features.GetFeatures);
local _ = require(script.Enums.PlatformEnum);
return {
    mountFtuxMenu = function(v12)
        game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
        game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false);
        local v13 = v3.createElement(l_LocalizationProvider_0, {
            localization = v7.new(l_LocalizationService_0.RobloxLocaleId)
        }, {
            FTUXMenu = v3.createElement("ScreenGui", {}, {
                ThemeProvider = v6({
                    FtuxPanel = v3.createElement(v9, {
                        platform = v12
                    }, {})
                })
            })
        });
        v10(v12);
        local v14 = UserSettings().GameSettings:InStudioMode() and game:GetService("StudioService"):HasInternalPermission();
        local v15 = v3.mount(v13, l_CoreGui_0, "FTUXMenu");
        if v14 then
            require(l_CorePackages_0.DeveloperTools).forCoreGui("FTUX", {
                rootInstance = "FTUX"
            }):addRoactTree("Roact tree", v15, v3);
        end;
    end
};
