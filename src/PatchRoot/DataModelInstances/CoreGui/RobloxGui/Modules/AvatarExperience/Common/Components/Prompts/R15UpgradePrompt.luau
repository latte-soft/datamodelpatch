local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarType);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local v17 = v2.PureComponent:extend("R15UpgradePrompt");
v17.validateProps = v4.strictInterface({
    bodyTextKey = v4.string, 
    onSwitchSelected = v4.optional(v4.callback), 
    onOverlayClosed = v4.optional(v4.callback), 
    onOverlayClosedPostClose = v4.optional(v4.callback), 
    defaultChildRef = v4.optional(v4.table), 
    focusController = v4.optional(v4.table), 
    navigation = v4.table, 
    screenSize = v4.Vector2, 
    setAvatarType = v4.callback, 
    toggleEquipAsset = v4.callback
});
v17.init = function(v18)
    v18.switchToR15 = function()
        v18.props.setAvatarType(v14.AvatarType.R15);
        if v18.props.onSwitchSelected then
            v18.props.onSwitchSelected();
        end;
        v18.closePrompt();
    end;
    v18.closePrompt = function()
        v7.closeOverlay(v18.props.navigation);
        if v18.props.onOverlayClosedPostClose then
            v18.props.onOverlayClosedPostClose();
        end;
    end;
end;
v17.renderLocalized = function(v19, v20)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v20.titleText, 
        bodyText = v20.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v19.closePrompt, 
                        text = v20.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v19.switchToR15, 
                        text = v20.confirmButtonText
                    }
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v19.props.screenSize, 
        defaultChildRef = v19.props.defaultChildRef
    });
end;
v17.render = function(v21)
    return l_withLocalization_0({
        titleText = "Feature.Avatar.Label.SwitchToR15", 
        bodyText = v21.props.bodyTextKey, 
        confirmButtonText = "Feature.Avatar.Action.Switch", 
        cancelButtonText = "Feature.Avatar.Action.Cancel"
    })(function(v22)
        return v21:renderLocalized(v22);
    end);
end;
return (v11((v10((v3.connect(function(v23, _)
    return {
        screenSize = v23.ScreenSize
    };
end, function(v25)
    return {
        setAvatarType = function(v26)
            v25(v12(v26));
        end, 
        toggleEquipAsset = function(v27, v28, v29)
            v25(v13(v27, v28, v29));
        end
    };
end)(v17))))));
