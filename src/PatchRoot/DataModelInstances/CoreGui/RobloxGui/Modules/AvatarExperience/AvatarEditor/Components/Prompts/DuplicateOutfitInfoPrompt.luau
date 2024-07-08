local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local v16 = v2.PureComponent:extend("DuplicateOutfitInfoPrompt");
v16.validateProps = v4.strictInterface({
    saveAsNew = v4.boolean, 
    duplicateOutfitId = v4.string, 
    onOverlayClosed = v4.optional(v4.callback), 
    defaultChildRef = v4.optional(v4.table), 
    focusController = v4.optional(v4.table), 
    showCustomOutfitNames = v4.boolean, 
    navigation = v4.table, 
    screenSize = v4.Vector2, 
    duplicateOutfitName = v4.optional(v4.string)
});
v16.init = function(v17)
    v17.saveOutfit = function()
        v8.navigateToNextOverlay(v17.props.navigation, v7.SaveOutfitPrompt);
    end;
    v17.updateExisting = function()
        v8.navigateFromOverlay(v17.props.navigation, v7.UpdateOutfitPage);
    end;
    v17.closePrompt = function()
        v8.closeOverlay(v17.props.navigation);
    end;
end;
v16.renderLocalized = function(v18, v19)
    local v20 = nil;
    v20 = if not not v18.props.duplicateOutfitName and v18.props.showCustomOutfitNames then v19.savedSimilarCharacter .. "\n" .. v18.props.duplicateOutfitName else v19.savedSimilarCharacterNoName;
    local v21 = nil;
    local v22 = nil;
    if not v18.props.saveAsNew then
        v21 = v19.updateExistingConfirmText;
        v22 = v18.updateExisting;
    else
        v21 = v19.saveAsNewConfirmText;
        v22 = v18.saveOutfit;
    end;
    return v2.createElement(l_InteractiveAlert_0, {
        title = v19.titleText, 
        bodyText = v20, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v18.closePrompt, 
                        text = v19.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v22, 
                        text = v21
                    }
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v18.props.screenSize, 
        defaultChildRef = v18.props.defaultChildRef
    });
end;
v16.render = function(v23)
    return l_withLocalization_0({
        titleText = "Feature.Avatar.Heading.DuplicateCharacter", 
        savedSimilarCharacter = "Feature.Avatar.Label.SavedSimilarCharacter", 
        savedSimilarCharacterNoName = "Feature.Avatar.Label.SavedSimilarCharacterNoName", 
        saveAsNewConfirmText = "Feature.Avatar.Action.Save", 
        updateExistingConfirmText = "Feature.Avatar.Action.GotIt", 
        cancelButtonText = "Feature.Avatar.Action.Cancel"
    })(function(v24)
        return v23:renderLocalized(v24);
    end);
end;
return (v13((v12((l_RoactAppPolicy_0.connect(function(v25, _)
    return {
        showCustomOutfitNames = v25.getCustomOutfitNames()
    };
end)((v3.connect(function(v27, v28)
    local l_OutfitInfos_0 = v27.AvatarExperience.AvatarEditor.OutfitInfos;
    local v30 = nil;
    if l_OutfitInfos_0[v28.duplicateOutfitId] then
        v30 = l_OutfitInfos_0[v28.duplicateOutfitId].name;
    end;
    return {
        screenSize = v27.ScreenSize, 
        duplicateOutfitName = v30
    };
end, nil)(v16))))))));
