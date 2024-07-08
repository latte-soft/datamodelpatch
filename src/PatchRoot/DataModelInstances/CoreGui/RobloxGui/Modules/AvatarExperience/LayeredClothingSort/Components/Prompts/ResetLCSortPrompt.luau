local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v12 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils);
local v13 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort);
local v14 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.ClearRemovedItems);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.EquipOutfit);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v17 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Services.Analytics);
local v18 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics);
local v19 = v2.PureComponent:extend("ResetLCSortPrompt");
v19.validateProps = v5.strictInterface({
    screenSize = v5.Vector2, 
    lastSavedSort = v5.table, 
    equippedAssets = v5.optional(v5.table), 
    setCurrentSort = v5.callback, 
    equipOutfit = v5.callback, 
    clearRemovedItems = v5.callback, 
    sendAnalytics = v5.callback, 
    analytics = v5.table, 
    navigation = v5.table, 
    focusController = v5.optional(v5.table), 
    defaultChildRef = v5.optional(v5.table), 
    onOverlayClosed = v5.optional(v5.callback)
});
v19.init = function(v20)
    v20.resetToDefault = function()
        v20.props.sendAnalytics(v20.props.analytics.avatarRefineLayersResetConfirm);
        v20.props.equipOutfit((v12.formatForEquipOutfit(v20.props.lastSavedSort, v20.props.equippedAssets)));
        v20.props.setCurrentSort(v20.props.lastSavedSort);
        v20.props.clearRemovedItems();
        v20.closePrompt();
    end;
    v20.closePrompt = function()
        v11.closeOverlay(v20.props.navigation);
    end;
end;
v19.renderAlertLocalized = function(v21, v22)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v22.title, 
        bodyText = v22.body, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v21.closePrompt, 
                        text = v22.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v21.resetToDefault, 
                        text = v22.resetButtonText
                    }
                }
            }
        }, 
        screenSize = v21.props.screenSize, 
        defaultChildRef = v21.props.defaultChildRef
    });
end;
v19.render = function(v23)
    return l_withLocalization_0({
        title = "Feature.Avatar.Title.LCSortReset", 
        body = "Feature.Avatar.Message.LCSortResetBody", 
        cancelButtonText = "Feature.Catalog.Action.Cancel", 
        resetButtonText = "CommonUI.Messages.Action.Reset"
    })(function(v24)
        return v23:renderAlertLocalized(v24);
    end);
end;
return (v9((v10((l_RoactServices_0.connect({
    analytics = v17
})((v3.connect(function(v25, _)
    return {
        screenSize = v25.ScreenSize, 
        equippedAssets = v25.AvatarExperience.AvatarEditor.Character.EquippedAssets, 
        lastSavedSort = v25.AvatarExperience.LayeredClothingSort.LastSavedSort
    };
end, function(v27)
    return {
        setCurrentSort = function(v28)
            v27(v13(v28));
        end, 
        clearRemovedItems = function()
            v27(v14());
        end, 
        equipOutfit = function(v29)
            v27(v15(v29, false));
        end, 
        sendAnalytics = function(v30)
            v27(v18(v30));
        end
    };
end)(v19))))))));
