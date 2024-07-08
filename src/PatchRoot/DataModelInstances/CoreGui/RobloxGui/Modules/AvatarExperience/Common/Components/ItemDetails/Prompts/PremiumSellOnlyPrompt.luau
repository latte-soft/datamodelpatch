local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v8 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v8.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v13 = v2.PureComponent:extend("PremiumSellOnlyPrompt");
v13.init = function(v14)
    v14.openPremiumPage = function()
        v14.closePrompt();
        v14.props.openPremiumPage();
    end;
    v14.closePrompt = function()
        v11.closeOverlay(v14.props.navigation);
    end;
end;
v13.renderAlertLocalized = function(v15, v16)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v16.titleText, 
        bodyText = v16.messageText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v15.closePrompt, 
                        text = v16.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v15.openPremiumPage, 
                        text = v16.confirmButtonText
                    }
                }
            }
        }, 
        screenSize = v15.props.screenSize, 
        defaultChildRef = v15.props.defaultChildRef
    });
end;
v13.render = function(v17)
    return l_withLocalization_0({
        titleText = "Feature.Catalog.Heading.PremiumOnly", 
        messageText = "Feature.Catalog.Label.SellPageUpsell", 
        confirmButtonText = "Feature.Catalog.Action.Upgrade", 
        cancelButtonText = "Feature.Catalog.Action.Cancel"
    })(function(v18)
        return v17:renderAlertLocalized(v18);
    end);
end;
return (v7((v3.connect(function(v19, _)
    return {
        screenSize = v19.ScreenSize
    };
end, function(v21)
    return {
        openPremiumPage = function()
            return v21(v5({
                name = v4.BuildersClub
            }));
        end
    };
end)(v13))));
