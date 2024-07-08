local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_Focusable_0 = v7.Focusable;
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v16 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v16.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v16.App.Button.Enum.ButtonType;
local l_withSelectionCursorProvider_0 = v16.App.SelectionImage.withSelectionCursorProvider;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v22 = require(l_Modules_0.AvatarExperience.Common.Util.CharacterManagerUtils);
local v23 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitNameTextBox);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.CheckShouldPreloadEditableCostumes);
local v30 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.CreateOutfit);
local v31 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetEditableOutfits);
local v32 = v4.PureComponent:extend("SaveOutfitPrompt");
v32.validateProps = v6.strictInterface({
    lookId = v6.optional(v6.string), 
    onComplete = v6.optional(v6.callback), 
    containerWidth = v6.optional(v6.number), 
    defaultChildRef = v6.optional(v6.table), 
    onOverlayClosed = v6.optional(v6.callback), 
    focusController = v6.optional(v6.table), 
    showCustomOutfitNames = v6.boolean, 
    networking = v6.callback, 
    avatarEditorAnalytics = v6.table, 
    navigation = v6.table, 
    screenSize = v6.Vector2, 
    fetchingState = v6.string, 
    shouldPreloadEditableCostumes = v6.boolean, 
    ownedItemIdsBySubtype = v6.table, 
    outfitInfos = v6.table, 
    combinedTryOnHumanoidDescription = v6.optional(v6.Instance), 
    createOutfit = v6.callback, 
    getEditableUserCostumes = v6.callback, 
    forwardRef = v6.optional(v6.table)
});
v32.init = function(v33)
    v33.getShowCustomCostumeNames = function()
        return v33.props.showCustomOutfitNames;
    end;
    v33.outfitName = if not v33.getShowCustomCostumeNames() then nil else "";
    v33.isMounted = false;
    v33.checkIsMounted = function()
        return v33.isMounted;
    end;
    v33.state = {
        isKeyboardRepositioned = false, 
        isNameInvalid = not not v33.getShowCustomCostumeNames() or false
    };
    v33.saveOutfit = function()
        if not v33.state.isNameInvalid then
            local l_networking_0 = v33.props.networking;
            if v33.getShowCustomCostumeNames() then
                if not v24.isDuplicateOutfitName(v33.props.ownedItemIdsBySubtype, v33.props.outfitInfos, v33.outfitName) then
                    v33.props.createOutfit(l_networking_0, v33.outfitName, v33.props.avatarEditorAnalytics, v33.checkIsMounted, v33.props.onComplete, if v33.props.lookId ~= nil then v33.props.combinedTryOnHumanoidDescription else nil);
                    return ;
                else
                    local l_outfitName_0 = v33.outfitName;
                    v10.navigateToNextOverlay(v33.props.navigation, v11.DuplicateOutfitNamePrompt, {
                        outfitName = v33.outfitName, 
                        sourcePrompt = v11.SaveOutfitPrompt, 
                        sourceParams = {}, 
                        saveCallback = function()
                            v33.props.createOutfit(l_networking_0, l_outfitName_0, v33.props.avatarEditorAnalytics, v33.checkIsMounted, v33.props.onComplete, if v33.props.lookId ~= nil then v33.props.combinedTryOnHumanoidDescription else nil);
                        end, 
                        saveFetchingStateKey = v21.CreateOutfitKey
                    });
                    return ;
                end;
            else
                v33.props.createOutfit(l_networking_0, v33.outfitName, v33.props.avatarEditorAnalytics, v33.checkIsMounted, v33.props.onComplete, if v33.props.lookId ~= nil then v33.props.combinedTryOnHumanoidDescription else nil);
                return ;
            end;
        else
            return ;
        end;
    end;
    v33.onOutfitNameUpdated = function(v36, v37)
        if v33.isMounted then
            v33.outfitName = v36;
            v33:setState({
                isNameInvalid = v37
            });
            return ;
        else
            return ;
        end;
    end;
    v33.renderMiddleContent = function()
        return v4.createElement(v27, {
            onOutfitNameUpdated = v33.onOutfitNameUpdated
        });
    end;
    v33.keyboardConnection = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function()
        if v33.isMounted then
            if not (v33.state.isKeyboardRepositioned or not l_UserInputService_0.OnScreenKeyboardVisible) then
                v33:setState({
                    isKeyboardRepositioned = true
                });
            end;
            return ;
        else
            return ;
        end;
    end);
    v33.closePrompt = function()
        v10.closeOverlay(v33.props.navigation);
        if v33.props.onComplete then
            v33.props.onComplete();
        end;
    end;
end;
v32.checkFetchEditableOutfits = function(v38)
    if v38.props.shouldPreloadEditableCostumes then
        v38.props.getEditableUserCostumes(v38.props.networking);
    end;
end;
v32.didMount = function(v39)
    v39.isMounted = true;
    v39:checkFetchEditableOutfits();
end;
v32.willUpdate = function(v40, v41, _)
    if v23.isFetchingDoneOrFailed(v40.props.fetchingState, v41.fetchingState) then
        v40.closePrompt();
    end;
end;
v32.renderAlertLocalized = function(v43, v44, _)
    local v46 = v43.getShowCustomCostumeNames();
    local l_screenSize_0 = v43.props.screenSize;
    local v48 = UDim2.new(0.5, 0, 0.5, 0);
    if v43.state.isKeyboardRepositioned then
        v48 = UDim2.new(0.5, 0, 0, (l_screenSize_0.Y - l_UserInputService_0.OnScreenKeyboardSize.Y) / 2);
    end;
    return v4.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        inputBindings = {
            NavigateBack = v7.Input.onBegin(Enum.KeyCode.ButtonB, v43.closePrompt), 
            Confirm = v7.Input.onBegin(Enum.KeyCode.ButtonA, function()
            end, {
                key = "CommonUI.Controls.Action.Confirm"
            })
        }
    }, {
        Alert = v4.createElement(l_InteractiveAlert_0, {
            title = v44.titleText, 
            bodyText = not not v46 and v44.messageText or nil, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v43.closePrompt, 
                            text = v44.cancelButtonText
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = v43.props.fetchingState == l_RetrievalStatus_0.Fetching, 
                            isDisabled = not not v46 and (v43.state.isNameInvalid or false), 
                            onActivated = v43.saveOutfit, 
                            text = v44.confirmButtonText
                        }
                    }
                }
            }, 
            middleContent = not not v46 and v43.renderMiddleContent or nil, 
            isMiddleContentFocusable = v46, 
            position = v48, 
            screenSize = v43.props.screenSize, 
            defaultChildRef = v43.props.defaultChildRef
        })
    });
end;
v32.render = function(v49)
    return l_withLocalization_0({
        titleText = "Feature.Avatar.Heading.SaveCostume", 
        messageText = "Feature.Avatar.Label.EnterCostumeName", 
        confirmButtonText = "Feature.Avatar.Action.Save", 
        cancelButtonText = "Feature.Avatar.Action.Cancel", 
        warningText = "Feature.Avatar.Label.CostumeWarning"
    })(function(v50)
        return l_withSelectionCursorProvider_0(function(v51)
            return v49:renderAlertLocalized(v50, v51);
        end);
    end);
end;
v32.didUpdate = function(v52, _, _)
    v52:checkFetchEditableOutfits();
end;
v32.willUnmount = function(v55)
    v55.keyboardConnection:disconnect();
    v55.keyboardConnection = nil;
    v55.isMounted = false;
end;
v32 = v25((v26((l_RoactServices_0.connect({
    networking = v13, 
    avatarEditorAnalytics = v28
})((l_RoactAppPolicy_0.connect(function(v56, _)
    return {
        showCustomOutfitNames = v56.getCustomOutfitNames()
    };
end)((v5.connect(function(v58, v59)
    return {
        fetchingState = l_PerformFetch_0.GetStatus(v58, v21.CreateOutfitKey), 
        screenSize = v58.ScreenSize, 
        shouldPreloadEditableCostumes = v29(v58), 
        ownedItemIdsBySubtype = v58.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype, 
        outfitInfos = v58.AvatarExperience.AvatarEditor.OutfitInfos, 
        combinedTryOnHumanoidDescription = if v59.lookId ~= nil then v22.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(v58) else nil
    };
end, function(v60)
    local _ = nil;
    return {
        createOutfit = function(v62, v63, v64, v65, v66, v67)
            v60(v30(v62, v63, v64, v65, v66, v67));
        end, 
        getEditableUserCostumes = function(v68)
            return v60(v31(v68));
        end
    };
end)(v32)))))))));
return v4.forwardRef(function(v69, v70)
    return v4.createElement(v32, v3.Dictionary.join(v69, {
        forwardRef = v70
    }));
end);
