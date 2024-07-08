local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v8 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v8.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v13 = v2.PureComponent:extend("OutfitIncompletePrompt");
v13.validateProps = v3.strictInterface({
    screenSize = v3.Vector2, 
    navigationCallback = v3.callback, 
    navigation = v3.table, 
    focusController = v3.optional(v3.table), 
    defaultChildRef = v3.optional(v3.table), 
    onOverlayClosed = v3.optional(v3.callback)
});
closePrompt = function(v14)
    v11.closeOverlay(v14);
end;
v13.init = function(v15)
    v15.onStay = function()
        closePrompt(v15.props.navigation);
    end;
    v15.onLeave = function()
        closePrompt(v15.props.navigation);
        v15.props.navigationCallback();
    end;
end;
v13.renderAlertLocalized = function(v16, v17)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v17.outfitIncompleteTitle, 
        bodyText = v17.outfitIncompleteBody, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v16.onLeave, 
                        text = v17.leave
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v16.onStay, 
                        text = v17.stay
                    }
                }
            }
        }, 
        screenSize = v16.props.screenSize, 
        defaultChildRef = v16.props.defaultChildRef
    });
end;
v13.render = function(v18)
    return l_withLocalization_0({
        outfitIncompleteTitle = "Feature.Avatar.Title.OutfitIncomplete", 
        outfitIncompleteBody = "Feature.Avatar.Label.OutfitIncomplete", 
        leave = "Feature.Chat.Action.Leave", 
        stay = "Feature.Chat.Action.Stay"
    })(function(v19)
        return v18:renderAlertLocalized(v19);
    end);
end;
return (v7((v6((v4.connect(function(v20, _)
    return {
        screenSize = v20.ScreenSize
    };
end, nil)(v13))))));
