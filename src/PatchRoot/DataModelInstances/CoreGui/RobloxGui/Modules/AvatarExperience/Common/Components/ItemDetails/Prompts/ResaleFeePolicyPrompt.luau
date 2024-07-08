local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
return v7(function(v10)
    local v12 = l_useSelector_0(function(v11)
        return v11.ScreenSize;
    end);
    local v13 = v2.useCallback(function()
        v6.closeOverlay(v10.navigation);
    end, {
        v10.navigation
    });
    local v14 = l_useLocalization_0({
        titleText = "Feature.Catalog.Label.ResaleFeePolicy", 
        bodyText = "Feature.Catalog.Message.ResaleFeePolicy", 
        gotItButtonText = "Feature.Avatar.Action.GotIt"
    });
    return v2.createElement(l_InteractiveAlert_0, {
        title = v14.titleText, 
        bodyText = v14.bodyText:gsub("({yourSharePercent})", v10.navigation.state.params.yourSharePercent):gsub("({robloxFeePercent})", v10.navigation.state.params.robloxFeePercent), 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v13, 
                        text = v14.gotItButtonText
                    }
                }
            }
        }, 
        screenSize = v12
    });
end);
