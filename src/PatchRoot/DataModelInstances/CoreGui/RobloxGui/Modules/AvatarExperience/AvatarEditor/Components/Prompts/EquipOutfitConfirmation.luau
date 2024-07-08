local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.EquipOutfit);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v17 = v3.PureComponent:extend("EquipOutfitConfirmation");
local v18 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagFixAvatarCostumeChange);
v17.validateProps = v6.strictInterface({
    outfitInfo = v6.table, 
    onOverlayClosed = v6.optional(v6.callback), 
    screenSize = v6.Vector2, 
    equipOutfit = v6.callback, 
    defaultChildRef = v6.optional(v6.table), 
    focusController = v6.optional(v6.table), 
    analytics = v6.optional(v6.table), 
    navigation = v6.table
});
v17.init = function(v19)
    v19.equipCostume = function()
        local l_outfitInfo_0 = v19.props.outfitInfo;
        local l_analytics_0 = v19.props.analytics;
        local l_navigation_0 = v19.props.navigation;
        if not v18() then
            v19.props.equipOutfit(l_outfitInfo_0, l_analytics_0, l_navigation_0, nil);
            v19.closePrompt();
            return ;
        else
            v19.closePrompt();
            v19.props.equipOutfit(l_outfitInfo_0, l_analytics_0, l_navigation_0, nil);
            return ;
        end;
    end;
    v19.closePrompt = function()
        v16.closeOverlay(v19.props.navigation);
    end;
end;
v17.renderLocalized = function(v23, v24)
    return v3.createElement(l_InteractiveAlert_0, {
        title = v24.titleText, 
        bodyText = v24.messageText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v23.closePrompt, 
                        text = v24.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v23.equipCostume, 
                        text = v24.confirmButtonText
                    }
                }
            }
        }, 
        screenSize = v23.props.screenSize, 
        defaultChildRef = v23.props.defaultChildRef
    });
end;
v17.render = function(v25)
    return l_withLocalization_0({
        titleText = "Feature.Avatar.Action.Switch", 
        messageText = "Feature.Avatar.Message.EquipCostumeConfirmation", 
        confirmButtonText = "Feature.Avatar.Action.Switch", 
        cancelButtonText = "Feature.Catalog.Action.Cancel"
    })(function(v26)
        return v25:renderLocalized(v26);
    end);
end;
return (l_RoactServices_0.connect({
    analytics = v10
})((v12((v13((v4.connect(function(v27, _)
    return {
        screenSize = v27.ScreenSize
    };
end, function(v29)
    return {
        equipOutfit = function(v30, v31, v32, v33)
            v29(v15({
                outfitInfo = v30, 
                analytics = v31, 
                navigation = v32, 
                isSelected = v33
            }));
        end
    };
end)(v17))))))));
