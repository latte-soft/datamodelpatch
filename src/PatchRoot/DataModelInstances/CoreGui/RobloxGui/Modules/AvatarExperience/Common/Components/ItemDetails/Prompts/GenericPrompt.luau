local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.UIBlox);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
return v3(function(v9)
    return v4.createElement(l_InteractiveAlert_0, {
        title = v9.navigation.state.params.titleText, 
        bodyText = v9.navigation.state.params.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v4.useCallback(function()
                            v2.closeOverlay(v9.navigation);
                        end, {
                            v9.navigation
                        }), 
                        text = v9.navigation.state.params.buttonText
                    }
                }
            }
        }, 
        screenSize = l_useSelector_0(function(v10)
            return v10.ScreenSize;
        end)
    });
end);
