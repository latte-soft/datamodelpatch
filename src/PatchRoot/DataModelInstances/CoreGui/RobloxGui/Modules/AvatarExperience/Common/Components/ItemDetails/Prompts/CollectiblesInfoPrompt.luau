local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local function v11(v10)
    return v10.ScreenSize;
end;
return v9(function(v12)
    local v13 = l_useSelector_0(v11);
    local v14 = v2.useCallback(function()
        v8.closeOverlay(v12.navigation);
    end, {
        v12.navigation
    });
    local v15 = l_useLocalization_0({
        titleText = "Feature.Catalog.Label.NewCollectibles", 
        bodyText = "Feature.Catalog.Message.CollectiblesInfo", 
        okButtonText = "CommonUI.Messages.Action.OK"
    });
    return v2.createElement(l_InteractiveAlert_0, {
        title = v15.titleText, 
        bodyText = v15.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v14, 
                        text = v15.okButtonText
                    }
                }
            }
        }, 
        screenSize = v13
    });
end);
