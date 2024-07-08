local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen);
local v6 = require(l_Modules_0.LuaApp.Components.ProfileQRCodePage.api);
local v7 = require(l_Modules_0.LuaApp.Components.ProfileQRCodePage.ProfileQRCodeUniversalAppWrapper);
local l_TitleKey_0 = v6.TitleKey;
local v9 = require(l_CorePackages_0.Cryo);
local v10 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
return function(v11)
    return v5(v4.AvatarBackground, "QRCode", {
        playEmote = true, 
        renderContent = function(v12)
            return v3.createElement(v10, {
                includeStatusBar = true, 
                BackgroundTransparency = 1
            }, {
                QRCode = v3.createElement(v7, v9.Dictionary.join(v11, v12))
            });
        end, 
        title = l_TitleKey_0, 
        isTopBarVisible = false
    });
end;
