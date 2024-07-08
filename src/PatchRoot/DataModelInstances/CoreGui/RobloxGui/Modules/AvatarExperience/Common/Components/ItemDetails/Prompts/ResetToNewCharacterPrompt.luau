local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v9 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v9.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v9.App.Button.Enum.ButtonType;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v19 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v20 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v21 = require(l_Modules_0.AvatarExperience.Common.wrapDispatchTable);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectNumTryOnItems);
local v23 = v2.PureComponent:extend("ResetToNewCharacterPrompt");
v23.validateProps = v3.strictInterface({
    screenSize = v3.Vector2, 
    numCartItems = v3.number, 
    clearTryOns = v3.callback, 
    toggleTryOn = v3.callback, 
    networking = v3.callback, 
    appAnalytics = v3.table, 
    catalogAnalytics = v3.table, 
    itemId = v3.string, 
    navigation = v3.table, 
    avatarRoute = v3.table, 
    focusController = v3.optional(v3.table), 
    defaultChildRef = v3.optional(v3.table), 
    onOverlayClosed = v3.optional(v3.callback)
});
v23.init = function(v24)
    v24.equipNewCharacter = function()
        v24.props.toggleTryOn(v24.props.networking, v24.props.catalogAnalytics, v18.ItemType.Bundle, v18.BundleTypeIdStrings.BodyParts, v24.props.itemId, true, v24.props.avatarRoute, v24.props.navigation);
    end;
    v24.resetTryOnsAndAdd = function()
        v24.props.catalogAnalytics.characterBundleSwapAction(true, v24.props.numCartItems);
        v24.props.clearTryOns();
        v24.equipNewCharacter();
        v24.closePrompt();
    end;
    v24.keepTryOnsAndAdd = function()
        v24.props.catalogAnalytics.characterBundleSwapAction(false, v24.props.numCartItems);
        v24.equipNewCharacter();
        v24.closePrompt();
    end;
    v24.closePrompt = function()
        v12.closeOverlay(v24.props.navigation);
    end;
end;
v23.renderAlertLocalized = function(v25, v26)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v26.resetToNewCharacterTitle, 
        bodyText = v26.resetToNewCharacterBody, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v25.resetTryOnsAndAdd, 
                        text = v26.reset
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v25.keepTryOnsAndAdd, 
                        text = v26.keep
                    }
                }
            }
        }, 
        screenSize = v25.props.screenSize, 
        defaultChildRef = v25.props.defaultChildRef
    });
end;
v23.render = function(v27)
    return l_withLocalization_0({
        resetToNewCharacterTitle = "Feature.Avatar.Title.ResetToNewCharacter", 
        resetToNewCharacterBody = "Feature.Avatar.Label.ResetToNewCharacter", 
        reset = "CommonUI.Messages.Action.Reset", 
        keep = "Feature.Avatar.Action.Keep"
    })(function(v28)
        return v27:renderAlertLocalized(v28);
    end);
end;
return (v7((v6((v8((v4.connect(function(v29, _)
    return {
        screenSize = v29.ScreenSize, 
        numCartItems = v22(v29)
    };
end, v21({
    clearTryOns = v20, 
    toggleTryOn = v19
}))((l_RoactServices_0.connect({
    appAnalytics = v15, 
    catalogAnalytics = v17, 
    networking = v16
})(v23))))))))));
