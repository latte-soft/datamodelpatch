local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_Focusable_0 = v5.Focusable;
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v22 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitNameTextBox);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.CheckShouldPreloadEditableCostumes);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.RenameOutfit);
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetEditableOutfits);
local v30 = v3.PureComponent:extend("RenameOutfitPrompt");
v30.validateProps = v7.strictInterface({
    costumeId = v7.string, 
    containerWidth = v7.optional(v7.number), 
    defaultChildRef = v7.optional(v7.table), 
    onOverlayClosed = v7.optional(v7.callback), 
    focusController = v7.optional(v7.table), 
    networking = v7.callback, 
    avatarEditorAnalytics = v7.table, 
    navigation = v7.table, 
    screenSize = v7.Vector2, 
    fetchingState = v7.string, 
    shouldPreloadEditableCostumes = v7.boolean, 
    ownedItemIdsBySubtype = v7.table, 
    outfitInfos = v7.table, 
    renameOutfit = v7.callback, 
    getEditableUserCostumes = v7.callback
});
v30.init = function(v31)
    v31:setState({
        isKeyboardRepositioned = false, 
        costumeName = "", 
        isNameInvalid = true
    });
    v31.renameOutfit = function()
        if not v31.state.isNameInvalid then
            local l_costumeName_0 = v31.state.costumeName;
            if not v23.isDuplicateOutfitName(v31.props.ownedItemIdsBySubtype, v31.props.outfitInfos, l_costumeName_0) then
                v31.props.renameOutfit(v31.props.avatarEditorAnalytics, v31.props.costumeId, l_costumeName_0);
                return ;
            else
                local l_costumeId_0 = v31.props.costumeId;
                v12.navigateToNextOverlay(v31.props.navigation, v13.DuplicateOutfitNamePrompt, {
                    outfitName = l_costumeName_0, 
                    sourcePrompt = v13.RenameOutfitPrompt, 
                    sourceParams = {
                        costumeId = v31.props.costumeId
                    }, 
                    saveCallback = function()
                        v31.props.renameOutfit(v31.props.avatarEditorAnalytics, l_costumeId_0, l_costumeName_0);
                    end, 
                    saveFetchingStateKey = v21.RenameOutfitKey .. l_costumeId_0
                });
                return ;
            end;
        else
            return ;
        end;
    end;
    v31.onOutfitNameUpdated = function(v34, v35)
        v31:setState({
            costumeName = v34, 
            isNameInvalid = v35
        });
    end;
    v31.renderMiddleContent = function()
        return v3.createElement(v26, {
            onOutfitNameUpdated = v31.onOutfitNameUpdated
        });
    end;
    v31.onScreenKeyboardVisibleChanged = function()
        if v31.state.isKeyboardRepositioned ~= l_UserInputService_0.OnScreenKeyboardVisible then
            v31:setState({
                isKeyboardRepositioned = l_UserInputService_0.OnScreenKeyboardVisible
            });
        end;
    end;
    v31.closePrompt = function()
        v12.closeOverlay(v31.props.navigation);
    end;
end;
v30.checkFetchEditableCostumes = function(v36)
    if v36.props.shouldPreloadEditableCostumes then
        v36.props.getEditableUserCostumes(v36.props.networking);
    end;
end;
v30.didMount = function(v37)
    v37:checkFetchEditableCostumes();
end;
v30.willUpdate = function(v38, v39, _)
    if v22.isFetchingDoneOrFailed(v38.props.fetchingState, v39.fetchingState) then
        v38.closePrompt();
    end;
end;
v30.renderWithProviders = function(v41, v42)
    local l_screenSize_0 = v41.props.screenSize;
    local v44 = UDim2.new(0.5, 0, 0.5, 0);
    if v41.state.isKeyboardRepositioned then
        v44 = UDim2.new(0.5, 0, 0, (l_screenSize_0.Y - l_UserInputService_0.OnScreenKeyboardSize.Y) / 2);
    end;
    return v3.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        inputBindings = {
            NavigateBack = v5.Input.onBegin(Enum.KeyCode.ButtonB, v41.closePrompt), 
            Confirm = v5.Input.onBegin(Enum.KeyCode.ButtonA, function()
            end, {
                key = "CommonUI.Controls.Action.Confirm"
            })
        }
    }, {
        KeyboardConnection = v3.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"), 
            callback = v41.onScreenKeyboardVisibleChanged
        }), 
        Alert = v3.createElement(l_InteractiveAlert_0, {
            title = v42.titleText, 
            bodyText = v42.messageText, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v41.closePrompt, 
                            text = v42.cancelButtonText
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isDisabled = v41.state.isNameInvalid, 
                            isLoading = v41.props.fetchingState == l_RetrievalStatus_0.Fetching, 
                            onActivated = v41.renameOutfit, 
                            text = v42.confirmButtonText
                        }
                    }
                }
            }, 
            middleContent = v41.renderMiddleContent, 
            isMiddleContentFocusable = true, 
            position = v44, 
            screenSize = v41.props.screenSize, 
            defaultChildRef = v41.props.defaultChildRef
        })
    });
end;
v30.render = function(v45)
    return l_withLocalization_0({
        titleText = "Feature.Avatar.Heading.RenameCharacter", 
        messageText = "Feature.Avatar.Label.EnterNewCostumeName", 
        confirmButtonText = "Feature.Avatar.Action.Save", 
        cancelButtonText = "Feature.Avatar.Action.Cancel"
    })(function(v46)
        return v45:renderWithProviders(v46);
    end);
end;
v30.didUpdate = function(v47, _, _)
    v47:checkFetchEditableCostumes();
end;
return (v25((v24((l_RoactServices_0.connect({
    networking = v16, 
    avatarEditorAnalytics = v17
})((v4.connect(function(v50, v51)
    return {
        fetchingState = l_PerformFetch_0.GetStatus(v50, v21.RenameOutfitKey .. v51.costumeId), 
        screenSize = v50.ScreenSize, 
        shouldPreloadEditableCostumes = v27(v50), 
        ownedItemIdsBySubtype = v50.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype, 
        outfitInfos = v50.AvatarExperience.AvatarEditor.OutfitInfos
    };
end, function(v52)
    return {
        renameOutfit = function(v53, v54, v55)
            v52(v28(v53, v54, v55));
        end, 
        getEditableUserCostumes = function(v56)
            return v52(v29(v56));
        end
    };
end)(v30))))))));
