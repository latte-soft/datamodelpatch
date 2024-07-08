local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v9 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v9.Style.withStyle;
local l_Images_0 = v9.App.ImageSet.Images;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v19 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.VerticalClothingList);
local v20 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.ResetButton);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v23 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.TopBar.makeAvatarBackButton);
local v25 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetLastSavedSort);
local v26 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort);
local v27 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v28 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v29 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.ClearRemovedItems);
local v30 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v31 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v33 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.VRAvatarRotateHandler);
local v34 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v35 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Constants);
local v36 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Selectors.selectEquippedLCAccessoriesOrdered);
local v37 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v38 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Selectors.hasClassicAccessories);
local v39 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v40 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Services.Analytics);
local v41 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage);
local v42 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.UnlockCharacterUpdates);
local v43 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics);
local v44 = require(l_Modules_0.AvatarExperience.Common.Components.Refinement.RefinementNavBar);
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local v46 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAccessoryAdjustmentEnabled);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v48 = {
    toastMessage = "Feature.Avatar.Message.LCSortClassicWarning", 
    isLocalized = false, 
    toastType = v30.InformationMessage
};
local v49 = l_Images_0["icons/menu/about_large"];
local v50 = UDim.new(0, 10);
local v51 = v3.PureComponent:extend("LayeredClothingSortPage");
v51.validateProps = v6.strictInterface({
    isPortrait = v6.boolean, 
    topBarHeight = v6.number, 
    equippedLCAssetIdsOrdered = v6.table, 
    equippedAssets = v6.table, 
    hasClassicAccessories = v6.boolean, 
    removedList = v6.optional(v6.table), 
    setLastSavedSort = v6.callback, 
    setCurrentToastMessage = v6.callback, 
    setFullView = v6.callback, 
    setCurrentSort = v6.callback, 
    sendAnalytics = v6.callback, 
    setEntryPage = v6.callback, 
    clearRemovedItems = v6.callback, 
    unlockCharacterUpdates = v6.callback, 
    navigation = v6.table, 
    avatarRoute = v6.table, 
    avatarExperienceAnalytics = v6.table, 
    analytics = v6.table
});
v51.init = function(v52)
    v52.numAssetsUponPageEntry = nil;
    v52.frameRef = v3.createRef();
    v52.verticalClothingListRef = v3.createRef();
    v52.topBarRef = v3.createRef();
    v52.focusController = v4.createFocusController();
    v52:setState({
        lastInputIsGamepad = if not l_IsVRAppBuild_0() then l_isGamepadInput_0(l_UserInputService_0:GetLastInputType()) else false, 
        isDragging = false
    });
    v52.onBackFromTopBar = function()
        v52.props.unlockCharacterUpdates();
        if not v46() then
            v52.props.navigation.goBack();
        else
            v52.props.navigation.pop();
        end;
        v52.props.sendAnalytics(v52.props.analytics.avatarRefineGoBack);
        v52.props.setEntryPage(v22.None);
    end;
    v52.lastInputTypeChangedCallback = function(v53)
        local v54 = l_isGamepadInput_0(v53);
        if v54 ~= v52.state.lastInputIsGamepad then
            v52:setState({
                lastInputIsGamepad = v54
            });
        end;
    end;
    v52.onOverlayClosed = function()
        return function()
            if v52.state.lastInputIsGamepad and v52.props.avatarRoute.opaque.name == v22.LayeredClothingSort then
                v15("LayeredClothingSort");
                v52.focusController.captureFocus();
            end;
        end;
    end;
    v52.onDragChange = function(v55)
        v52:setState({
            isDragging = v55
        });
    end;
    v52.backButton = v24(v52.onBackFromTopBar);
end;
v51.saveSortOnPageEnter = function(v56)
    local v57 = {};
    for _, v59 in v56.props.equippedLCAssetIdsOrdered, nil, nil do
        if not (not v56.props.equippedAssets[v59.typeId] or not v56.props.equippedAssets[v59.typeId][v59.id]) then
            v59.equipped = true;
        end;
        table.insert(v57, v59);
    end;
    v56.props.setLastSavedSort(v57);
    v56.props.setCurrentSort(v56.props.equippedLCAssetIdsOrdered);
    v56.numAssetsUponPageEntry = #v56.props.equippedLCAssetIdsOrdered;
end;
v51.onPageEntry = function(v60)
    v60:saveSortOnPageEnter();
    v60.props.setFullView(v60.props.avatarExperienceAnalytics, v31.SceneFullView);
    if v60.props.hasClassicAccessories then
        v60.props.setCurrentToastMessage(v48);
    end;
end;
v51.renderTopBar = function(v61)
    return l_withLocalization_0({
        clothingSorting = "Feature.Avatar.Title.LCSortPage"
    })(function(v62)
        return v3.createElement(v23.Container, {
            titleText = v62.clothingSorting, 
            transparentBackground = true, 
            hideSiteMessageBanner = v61.props.isPortrait, 
            leftItem = v61.backButton, 
            ZIndex = 1, 
            [v3.Ref] = v61.topBarRef, 
            NextSelectionRight = v61.verticalClothingListRef
        });
    end);
end;
v51.render = function(v63)
    return l_withStyle_0(function(v64)
        return l_withLocalization_0({
            noItemText = "Feature.Avatar.Message.LCSortNoEquipped"
        })(function(v65)
            return v63:renderWithProviders(v64, v65);
        end);
    end);
end;
v51.renderWithProviders = function(v66, v67, v68)
    local l_Font_0 = v67.Font;
    local l_Theme_0 = v67.Theme;
    local v71 = #v66.props.equippedLCAssetIdsOrdered > 0;
    local v72 = not v71 and v66.numAssetsUponPageEntry == 0;
    local v73 = if not v71 then v66.topBarRef else v66.verticalClothingListRef;
    local v74 = v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, -v66.props.topBarHeight), 
        Position = UDim2.fromOffset(0, v66.props.topBarHeight), 
        BackgroundTransparency = 1, 
        ZIndex = 2
    }, {
        SceneInteractionFrame = v3.createElement(v21), 
        VerticalClothingList = not v72 and v3.createElement(v4.Focusable[v19], {
            [v3.Ref] = v66.verticalClothingListRef, 
            NextSelectionLeft = v66.topBarRef, 
            lastInputIsGamepad = v66.state.lastInputIsGamepad, 
            topBarRef = v66.topBarRef, 
            focusControllerProp = v66.focusController, 
            onDragChange = v66.onDragChange
        }), 
        ResetButton = not v72 and v3.createElement(v20, {
            lastInputIsGamepad = v66.state.lastInputIsGamepad, 
            isDragging = v66.state.isDragging
        }), 
        VRAvatarRotateHandler = if not l_IsVRAppBuild_0() then nil else v3.createElement(v33), 
        NoItemsMessage = v72 and v3.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, v35.NoItem.BottomPadding), 
            Size = if not l_IsVRAppBuild_0() then UDim2.new(1, 0, 0, 100) else UDim2.new(1, 0, 0, 50), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = not l_IsVRAppBuild_0() and 1 or 0
        }, {
            UICorner = if not l_IsVRAppBuild_0() then nil else v3.createElement("UICorner", {
                CornerRadius = v50
            }), 
            NoItemsTextLabel = v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(0, 0), 
                Text = v68.noItemText, 
                Font = l_Font_0.CaptionHeader.Font, 
                TextSize = v35.NoItem.TextSize, 
                TextColor3 = l_Theme_0.IconEmphasis.Color, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, {
                NoItemsIcon = v3.createElement(l_ImageSetLabel_0, {
                    Image = v49, 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, -2, 0.5, 0), 
                    Size = UDim2.fromOffset(v35.NoItem.IconSize, v35.NoItem.IconSize), 
                    ImageColor3 = l_Theme_0.IconEmphasis.Color
                })
            })
        })
    });
    if not l_IsVRAppBuild_0() then
        return v3.createElement(v4.Focusable.Frame, {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            focusController = v66.focusController, 
            [v3.Ref] = v66.frameRef, 
            defaultChild = v73, 
            inputBindings = {
                Back = v4.Input.onBegin(Enum.KeyCode.ButtonB, v66.onBackFromTopBar), 
                OpenResetPrompt = not v72 and v4.Input.onBegin(Enum.KeyCode.ButtonY, function()
                    v66.props.navigation.navigate(v22.ResetLCSortPrompt, {
                        onOverlayClosed = v66.onOverlayClosed()
                    });
                end, {
                    key = "CommonUI.Messages.Action.Reset"
                }) or nil
            }
        }, {
            TopBar = v66:renderTopBar(v68), 
            RefinementNavBar = if not v46() then nil else v3.createElement(v44), 
            LayeredClothingSortPageFrame = v74, 
            GamepadFocusHandlerForPage = v3.createElement(v32, {
                focusController = v66.focusController, 
                captureFocusOnMount = true
            }), 
            LastInputTypeChangedConnection = v3.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = v66.lastInputTypeChangedCallback
            }), 
            BoundInputsUpdater = v3.createElement(v34)
        });
    else
        return v74;
    end;
end;
v51.didMount = function(v75)
    v75:onPageEntry();
end;
v51.didUpdate = function(v76, v77, _)
    if v76.props.avatarRoute.opaque.name ~= v77.avatarRoute.opaque.name and v76.props.avatarRoute.opaque.name == v22.LayeredClothingSort then
        v76:onPageEntry();
    end;
    if not ((not (v76.props.avatarRoute.opaque.name == v22.LayeredClothingSort) or not v76.props.avatarRoute.isVisible) or v77.avatarRoute.isVisible) then
        v76:onPageEntry();
    end;
    if (v76.state.lastInputIsGamepad and #v76.props.equippedLCAssetIdsOrdered == 0) and #v77.equippedLCAssetIdsOrdered > 0 then
        v76.focusController.moveFocusTo(v76.topBarRef);
    end;
end;
v51.willUnmount = function(v79)
    v79.props.unlockCharacterUpdates();
end;
return (v18((v16((v17((v5.connect(function(v80, _)
    local _ = nil;
    local _ = nil;
    return {
        isPortrait = v37(v80), 
        topBarHeight = if not l_IsVRAppBuild_0() then v80.TopBar.topBarHeight else 0, 
        equippedLCAssetIdsOrdered = v36(v80), 
        equippedAssets = v80.AvatarExperience.AvatarEditor.Character.EquippedAssets, 
        hasClassicAccessories = v38(v80), 
        removedList = v80.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList
    };
end, function(v84)
    return {
        setLastSavedSort = function(v85)
            v84(v25(v85));
        end, 
        setCurrentSort = function(v86)
            v84(v26(v86));
        end, 
        setCurrentToastMessage = function(v87)
            v84(v27(v87));
        end, 
        setFullView = function(v88, v89)
            v84(v28(v88, v22.LayeredClothingSort, v89));
        end, 
        sendAnalytics = function(v90)
            v84(v43(v90));
        end, 
        setEntryPage = function(v91)
            v84(v41(v91));
        end, 
        clearRemovedItems = function()
            v84(v29());
        end, 
        unlockCharacterUpdates = function()
            v84(v42());
        end
    };
end)((l_RoactServices_0.connect({
    analytics = v40, 
    avatarExperienceAnalytics = v39
})(v51))))))))));
