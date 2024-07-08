local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.UIBlox);
local v9 = require(l_CorePackages_0.Packages.RoactGamepad);
local v10 = require(l_CorePackages_0.Packages.React);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v14 = require(l_Modules_0.LuaApp.Constants);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Utils.GamepadUtils;
local v22 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.ManageActionBar);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitDetailsContainer);
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v26 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings);
local v27 = require(l_Modules_0.AvatarExperience.Common.Hooks.useOverlayClosedCallback);
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v33 = require(l_Modules_0.AvatarExperience.Common.Actions.SetItemDetailsExpanded);
local v34 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_withStyle_0 = v8.Style.withStyle;
local l_Images_0 = v8.App.ImageSet.Images;
local l_IconButton_0 = v8.App.Button.IconButton;
local l_IconSize_0 = v8.App.ImageSet.Enum.IconSize;
local v39 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableOutfitAttribution);
local v40 = l_Images_0["icons/navigation/close"];
local v41 = UDim.new(1, 0);
local v42 = l_GuiService_0:IsTenFootInterface();
local l_Focusable_0 = v9.Focusable;
local v44 = v5.PureComponent:extend("OutfitDetailsPeekView");
v44.validateProps = v7.strictInterface({
    outfitId = v7.string, 
    focusController = if not v39 then v7.table else v7.optional(v7.table), 
    ZIndex = v7.optional(v7.integer), 
    onPeekViewClosed = if not v39 then v7.callback else v7.optional(v7.callback), 
    exitButtonPosition = if not v39 then v7.Vector2 else v7.optional(v7.Vector2), 
    deleteOutfit = if not v39 then v7.callback else v7.optional(v7.callback), 
    renameOutfit = if not v39 then v7.callback else v7.optional(v7.callback), 
    showFullWithNoPeekView = if not v39 then nil else v7.optional(v7.boolean), 
    renderBottomBar = if not v39 then nil else v7.optional(v7.boolean), 
    NextSelectionLeft = v7.optional(v7.table), 
    forwardRef = not v39 and v7.table or nil, 
    outfitDetailsPeekViewRefs = not not v39 and v7.table or nil, 
    navigation = not not v39 and v7.table or nil, 
    avatarRoute = not not v39 and v29.Interface or nil, 
    overlayClosedCallback = not not v39 and v7.callback or nil, 
    isPortrait = v7.boolean, 
    topBarHeight = v7.number, 
    itemDetailsExpanded = if not v39 then nil else v7.boolean, 
    statusBarHeight = if not v39 then nil else v7.number, 
    setItemDetailsExpanded = if not v39 then nil else v7.callback, 
    avatarEditorAnalytics = v7.table
});
if v39 then
    v44.defaultProps = {
        showFullWithNoPeekView = false, 
        renderBottomBar = true
    };
end;
v44.init = function(v45)
    v45.actionBarRef = v5.createRef();
    v45.exitButtonRef = v5.createRef();
    v45.swipeScrollingFrameRef = v5.createRef();
    v45.itemsGridRef = v5.createRef();
    v45:setState({
        isGamepad = l_isGamepadInput_0((l_UserInputService_0:GetLastInputType()))
    });
    v45.viewStateChanged = function(v46, _)
        if v39 then
            if v46 == l_PeekViewState_0.Closed then
                if v45.props.onPeekViewClosed then
                    v45.props.onPeekViewClosed();
                end;
                v30.closeFiltersAndItemDetails(v45.props.navigation);
            end;
            if not (v46 ~= l_PeekViewState_0.Full) or v46 == l_PeekViewState_0.Extended then
                v45.props.setItemDetailsExpanded(true);
                return ;
            else
                v45.props.setItemDetailsExpanded(false);
                return ;
            end;
        else
            if v46 == l_PeekViewState_0.Closed then
                v45.props.onPeekViewClosed();
            end;
            return ;
        end;
    end;
    v45.lastInputTypeChangedCallback = function()
        local v48 = l_isGamepadInput_0((l_UserInputService_0:GetLastInputType()));
        if v48 ~= v45.state.isGamepad then
            v45:setState({
                isGamepad = v48
            });
        end;
    end;
    v45.onExitButtonPressed = function()
        if v39 then
            if v45.props.onPeekViewClosed then
                v45.props.onPeekViewClosed();
            end;
            v30.closeFiltersAndItemDetails(v45.props.navigation);
            return ;
        else
            v45.props.onPeekViewClosed();
            return ;
        end;
    end;
    local v49, v50 = v5.createBinding(Vector2.new(0, 0));
    v45.absolutePositionBinding = v49;
    v45.updateAbsolutePositionBinding = v50;
    v45.containerPositionChanged = function(v51)
        v45.updateAbsolutePositionBinding(v51.AbsolutePosition);
    end;
    v45.getExitButtonUDim2Pos = function()
        if not v45.props.isPortrait then
            return UDim2.new(0, 15, 0, -44 - (v45.props.topBarHeight - 44) / 2);
        else
            return UDim2.fromScale(15, v45.props.statusBarHeight);
        end;
    end;
    v45.getRef = function()
        if v39 then
            local l_key_0 = v45.props.navigation.state.key;
            if not v45.props.outfitDetailsPeekViewRefs or not l_key_0 then
                return nil;
            else
                return v45.props.outfitDetailsPeekViewRefs[l_key_0];
            end;
        else
            return v45.props.forwardRef;
        end;
    end;
    v45.shouldRenderFullScreen = function()
        return v45.props.showFullWithNoPeekView or l_IsVRAppBuild_0();
    end;
end;
v44.renderActionBar = function(v53, v54)
    return v5.createElement(v23, {
        gradientFade = true, 
        multiSelect = false, 
        selectedOutfits = {
            v53.props.outfitId
        }, 
        ZIndex = 2, 
        bottomPadding = v54, 
        deleteOutfit = v53.props.deleteOutfit, 
        renameOutfit = v53.props.renameOutfit, 
        NextSelectionUp = not not v53.props.isPortrait and v53.exitButtonRef or nil, 
        [v5.Ref] = v53.actionBarRef
    });
end;
v44.renderWithProviders = function(v55, v56)
    local l_Theme_0 = v56.Theme;
    local v58 = UDim2.fromOffset(0, v55.props.topBarHeight);
    local v59 = UDim2.new(1, 0, 1, -v55.props.topBarHeight);
    local v60 = not v55.props.isPortrait;
    if v39 then
        v60 = not v55.props.isPortrait and not l_IsVRAppBuild_0();
    end;
    if v60 then
        v58 = UDim2.new(v22.LandscapeNavWidth, 0, 0, v55.props.topBarHeight);
        v59 = UDim2.new(v22.LandscapeSceneWidth, 0, 1, -v55.props.topBarHeight);
    end;
    local v61 = 64;
    if not v60 then
        v61 = v61 + 24;
    end;
    local v62 = nil;
    if not (not v55.state.isGamepad or not v42) then
        v62 = v14.GAMEPAD_BOTTOM_BAR_SIZE;
        v61 = v61 + v14.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    local l_exitButtonPosition_0 = v55.props.exitButtonPosition;
    local v64 = nil;
    if not (v39 and not l_exitButtonPosition_0) then
        v64 = v55.absolutePositionBinding:map(function(v65)
            return UDim2.fromOffset(l_exitButtonPosition_0.X - v65.X, l_exitButtonPosition_0.Y - v65.Y);
        end);
    end;
    local v66 = nil;
    if not (not v39 or l_exitButtonPosition_0) then
        v66 = v55.getExitButtonUDim2Pos();
    end;
    local l_isPortrait_0 = v55.props.isPortrait;
    if v39 then
        l_isPortrait_0 = v55.props.itemDetailsExpanded and (v55.props.isPortrait or v55.shouldRenderFullScreen());
    end;
    return v5.createElement(l_Focusable_0.Frame, {
        ZIndex = v55.props.ZIndex, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = v59, 
        Position = v58, 
        NextSelectionLeft = v55.props.NextSelectionLeft, 
        [v5.Ref] = v55.getRef(), 
        focusController = if not v39 then nil else v55.props.focusController, 
        defaultChild = if not v39 or v55.props.renderBottomBar then v55.actionBarRef else nil, 
        restorePreviousChildFocus = true, 
        inputBindings = {
            Close = if not v39 then v9.Input.onBegin(Enum.KeyCode.ButtonB, v55.props.onPeekViewClosed) else v9.Input.onBegin(Enum.KeyCode.ButtonB, function()
                v30.closeFiltersAndItemDetails(v55.props.navigation);
                if v55.props.onPeekViewClosed then
                    v55.props.onPeekViewClosed();
                end;
            end), 
            ScrollPeekView = if (not not v39 and v55.swipeScrollingFrameRef) and v55.swipeScrollingFrameRef.current ~= nil then v9.Input.onStep(Enum.KeyCode.Thumbstick2, function(v68, v69)
                local l_Position_0 = v68.Position;
                local l_current_0 = v55.swipeScrollingFrameRef.current;
                local v72 = l_current_0.CanvasPosition.Y + (v69 * -l_GamepadUtils_0.normalizeStickByDeadzone(l_Position_0).Y) * 1000;
                if v72 <= l_current_0.AbsoluteCanvasSize.Y * v41.Scale + v41.Offset then
                    l_current_0.CanvasPosition = Vector2.new(0, v72);
                end;
            end) else nil
        }, 
        [v5.Change.AbsolutePosition] = v55.containerPositionChanged
    }, {
        GamepadFocusHandlerForPage = if not v39 then nil else v5.createElement(v31, {
            focusController = v55.props.focusController
        }), 
        BoundInputsUpdater = if not v39 then nil else v5.createElement(v32), 
        LastInputTypeChangedConnection = v5.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = v55.lastInputTypeChangedCallback
        }), 
        Background = if not v39 or v55.props.itemDetailsExpanded then v5.createElement("TextButton", {
            BackgroundTransparency = not not v55.props.isPortrait and l_Theme_0.Overlay.Transparency or 1, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            Size = UDim2.new(1, 0, 1, v55.props.topBarHeight), 
            Position = UDim2.fromOffset(0, -v55.props.topBarHeight), 
            ZIndex = 1, 
            Text = "", 
            AutoButtonColor = false
        }) else nil, 
        ExitButton = l_isPortrait_0 and v5.createElement(l_IconButton_0, {
            position = if not v39 or l_exitButtonPosition_0 then v64 else v66, 
            size = UDim2.fromOffset(44, 44), 
            icon = v40, 
            iconSize = l_IconSize_0.Medium, 
            iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
            iconTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
            onActivated = v55.onExitButtonPressed, 
            buttonRef = v55.exitButtonRef, 
            NextSelectionDown = if not v39 or v55.props.renderBottomBar then v55.actionBarRef else v55.itemsGridRef
        }), 
        PeekViewContainer = if not not v39 and v55.shouldRenderFullScreen() then nil else v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ClipsDescendants = not not v39 or nil, 
            ZIndex = 3
        }, {
            PeekView = v5.createElement(l_PeekView_0, {
                briefViewContentHeight = UDim.new(0, v61), 
                mountAnimation = true, 
                mountAsFullView = true, 
                canDragFullViewToBrief = true, 
                showDraggerInClosedState = false, 
                returnToFullView = true, 
                thumbstickScrollEnabled = true, 
                viewStateChanged = v55.viewStateChanged, 
                bottomDockedContainerHeight = v61, 
                bottomDockedContainerContent = if not v39 or v55.props.renderBottomBar then v55:renderActionBar(v62) else nil, 
                backgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                backgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                peekHeaderClose = true, 
                isScrollingEnabled = true
            }, {
                OutfitDetailsContainer = v5.createElement(v24, {
                    outfitId = v55.props.outfitId, 
                    itemsGridRef = if not v39 then nil else v55.itemsGridRef, 
                    NextSelectionUp = if not v39 then nil else v55.exitButtonRef
                })
            })
        }), 
        ScrollingContent = if not not v39 and v55.shouldRenderFullScreen() then v5.createElement("ScrollingFrame", {
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0, 0), 
            ScrollBarThickness = 0, 
            CanvasSize = UDim2.fromScale(1, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            ElasticBehavior = Enum.ElasticBehavior.Never, 
            ZIndex = 3, 
            [v5.Ref] = v55.swipeScrollingFrameRef
        }, {
            OutfitDetailsContainer = v5.createElement(v24, {
                outfitId = v55.props.outfitId, 
                itemsGridRef = v55.itemsGridRef, 
                NextSelectionUp = v55.exitButtonRef
            })
        }) else nil
    });
end;
v44.render = function(v73)
    return l_withStyle_0(function(v74)
        return v73:renderWithProviders(v74);
    end);
end;
v44.didMount = function(v75)
    local v76 = v75.getRef();
    if not (not v75.state.isGamepad or not v75.props.isPortrait) then
        v75.props.focusController.moveFocusTo(v76);
    end;
    if v76:getValue() then
        v75.containerPositionChanged(v76:getValue());
    end;
    v75.props.avatarEditorAnalytics.viewOutfitDetails(v75.props.outfitId);
    if v39 then
        v75.props.setItemDetailsExpanded(true);
    end;
end;
v44.didUpdate = function(v77, v78, v79)
    local v80 = v77.getRef();
    if not (not (v77.state.isGamepad and not v79.isGamepad) or not v77.props.isPortrait) then
        v77.props.focusController.moveFocusTo(v80);
    end;
    if not (not (v77.props.isPortrait and v78.isPortrait) or not v77.state.isGamepad) then
        v77.props.focusController.moveFocusTo(v80);
    end;
    if v77.props.outfitId ~= v78.outfitId then
        v77.props.avatarEditorAnalytics.viewOutfitDetails(v77.props.outfitId);
    end;
end;
if v39 then
    v44.willUnmount = function(v81)
        if not (v81.props.avatarRoute.current.name == v18.OutfitDetails) or v81.props.avatarRoute.current.key == v81.props.navigation.state.key then
            v81.props.setItemDetailsExpanded(false);
        end;
    end;
end;
local function v84(v82, _)
    return {
        isPortrait = v82.DeviceOrientation == l_DeviceOrientationMode_0.Portrait, 
        topBarHeight = if not v39 then v82.TopBar.topBarHeight else v34.getTopBarHeightAvatarScene(v82), 
        itemDetailsExpanded = if not v39 then nil else v82.AvatarExperience.Common.ItemDetailsExpanded, 
        statusBarHeight = if not v39 then nil else v82.TopBar.statusBarHeight
    };
end;
v44 = if not v39 then v6.connect(v84, nil)(v44) else v6.connect(v84, function(v85)
    return {
        setItemDetailsExpanded = function(v86)
            v85(v33(v86));
        end
    };
end)(v44);
if v39 then
    v44 = v28(v44);
end;
v44 = l_RoactServices_0.connect({
    avatarEditorAnalytics = v25
})(v44);
if not v39 then
    return (v5.forwardRef(function(v87, v88)
        return v5.createElement(v44, v4.Dictionary.join(v87, {
            forwardRef = v88
        }));
    end));
else
    return function(v89)
        local l_current_1 = v10.useRef(v9.createFocusController()).current;
        if v89.focusController then
            l_current_1 = v89.focusController;
        end;
        local v91 = v27(l_current_1);
        return v5.createElement("Frame", {
            [v5.Ref] = v26({
                overlayClosedCallback = v91
            }), 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, {
            OutfitDetailsPeekView = v10.createElement(v44, (v4.Dictionary.join(v89, {
                focusController = l_current_1, 
                overlayClosedCallback = v91
            })))
        });
    end;
end;
