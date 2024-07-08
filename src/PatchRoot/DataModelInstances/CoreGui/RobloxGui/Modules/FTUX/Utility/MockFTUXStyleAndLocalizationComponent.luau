local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(script.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
return function(v6)
    return v1.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        FTUXMock = v1.createElement("ScreenGui", {}, {
            ThemeProvider = v3({
                Frame = v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0)
                }, v6)
            })
        })
    });
end;
