local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v6.Focusable;
local v8 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_CorePackages_0.UIBlox);
local v11 = require(l_CorePackages_0.Cryo);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v22 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v24 = require(l_Modules_0.LuaApp.Constants);
local v25 = require(l_Modules_0.AvatarExperience.Common.NamedRefConstants);
local v26 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveUnselectedItemsFromTryOn);
local v27 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLookItemsFromTryOn);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v30 = require(l_Modules_0.AvatarExperience.Catalog.Components.TryOnManager.TryOnManagerElement);
local v31 = require(l_Modules_0.AvatarExperience.Catalog.Components.TryOnManager.TryOnManagerBottomBar);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v33 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v34 = require(l_Modules_0.AvatarExperience.Common.Context.withNamedRefs);
local v35 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local v36 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v37 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v38 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXImproveTryOnManagerUI);
local l_GetFFlagHideDraggerPeekView_0 = v8.GetFFlagHideDraggerPeekView;
local l_GetFFlagPeekViewMinimizeToSuperBrief_0 = v8.GetFFlagPeekViewMinimizeToSuperBrief;
local l_withStyle_0 = v10.Style.withStyle;
local l_Images_0 = v10.App.ImageSet.Images;
local l_ImageSetButton_0 = v10.Core.ImageSet.ImageSetButton;
local l_withSelectionCursorProvider_0 = v10.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v10.App.SelectionImage.CursorKind;
local v46 = game:DefineFastFlag("EnableFixForTryOnManagerGamepadHighlight", false);
local v47 = game:DefineFastFlag("DisableLookCleanupOnPeekviewUnmount", false);
local v48 = game:DefineFastFlag("EnableScrollingInTryOnManager", false);
local v49 = game:DefineFastFlag("AXCloseTryOnManagerWhenUnselectingLook", false);
local v50 = game:DefineFastFlag("AXFixClosingTryOnManagerPeekViewForLooks", false);
local v51 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagHideShowMoreButtonOnTryOnManager);
local v52 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAvatarWidgetData);
local v53 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRefactorTryOnItems);
local l_ActionBarHeight_0 = v23.ActionBar.ActionBarHeight;
local l_ActionBarGradientHeight_0 = v23.ActionBar.ActionBarGradientHeight;
local v56 = l_Images_0["icons/navigation/close"];
local v57 = l_GuiService_0:IsTenFootInterface();
local v58 = v4.PureComponent:extend("TryOnManagerPeekView");
v58.validateProps = v9.strictInterface({
    navigation = v9.table, 
    avatarRoute = v9.table, 
    isPortrait = v9.boolean, 
    topBarHeight = v9.number, 
    tryOnItems = v9.optional(v9.table), 
    lookId = v9.optional(v9.string), 
    lookDetails = v9.optional(v9.table), 
    globalGuiInset = v9.table, 
    screenSize = v9.Vector2, 
    fullView = v9.optional(v9.userdata), 
    boundInputs = v9.optional(v9.table), 
    peekViewState = v9.optional(v9.valueOf(l_PeekViewState_0)), 
    removeUnselectedItemsFromTryOn = v9.callback, 
    removeLookItemsFromTryOn = v9.callback, 
    setTryOnManagerPeekViewState = v9.callback, 
    catalogAnalytics = v9.table, 
    namedRefs = v9.table, 
    lastInputGroup = v9.string
});
local function _(v59)
    return v24.InputTypeMap[v59] == v24.InputType.MouseAndKeyboard;
end;
v58.init = function(v61)
    v61:setState({
        isMouseAndKeyboard = v24.InputTypeMap[l_UserInputService_0:GetLastInputType()] == v24.InputType.MouseAndKeyboard
    });
    v61.frameRef = v61.props.namedRefs[v36.TryOnManager];
    v61.actionBarRef = v4.createRef();
    v61.itemsListRef = v4.createRef();
    v61.closeButtonRef = v4.createRef();
    v61.tryOnElementRefCache = v6.createRefCache();
    v61.focusController = v6.createFocusController();
    v61.contentFrameRef = v4.createRef();
    v61.onPeekViewClosed = function()
        if v61.props.lookId ~= nil then
            v61.props.removeLookItemsFromTryOn(v61.props.lookId, v61.props.lookDetails);
            return ;
        else
            v61.props.removeUnselectedItemsFromTryOn();
            return ;
        end;
    end;
    v61.viewStateChanged = function(v62, v63)
        v61.props.setTryOnManagerPeekViewState(v62);
        local l_catalogAnalytics_0 = v61.props.catalogAnalytics;
        if v62 == l_PeekViewState_0.Closed then
            v61.onPeekViewClosed();
            if not v50 then
                v32.closeFocusedScreen(v61.props.navigation);
            end;
        end;
        if v62 == l_PeekViewState_0.Brief then
            if not (v63 ~= l_PeekViewState_0.Full) or v63 == l_PeekViewState_0.Extended then
                l_catalogAnalytics_0.resizeOutfitScreen("minimize");
                return ;
            end;
        elseif v62 == l_PeekViewState_0.Full and v63 == l_PeekViewState_0.Brief then
            l_catalogAnalytics_0.resizeOutfitScreen("expand");
        end;
    end;
    v61.onCloseButtonPressed = function()
        if not l_GetFFlagPeekViewMinimizeToSuperBrief_0() then
            v61.onPeekViewClosed();
            v61.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Closed);
            return ;
        else
            v61.props.setTryOnManagerPeekViewState(l_PeekViewState_0.SuperBrief);
            return ;
        end;
    end;
end;
v58.getActionBarTotalHeight = function(v65, v66)
    local v67 = l_ActionBarHeight_0 + if not l_GetFFlagHideDraggerPeekView_0() then l_ActionBarGradientHeight_0 else 0;
    local v68 = 0;
    local v69 = 0;
    if not (v57 and v65.props.lastInputGroup == v24.InputType.Gamepad) or v11.isEmpty(v65.props.boundInputs) then
        if v65.props.lookId ~= nil then
            v69 = 20;
        end;
    else
        v68 = v24.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    return ((v67 + v68) + v69) - (not l_GetFFlagHideDraggerPeekView_0() and 0 or if if not l_GetFFlagHideDraggerPeekView_0() then nil else v65.props.peekViewState == l_PeekViewState_0.SuperBrief then v66.Tokens.Global.Space_200 else -v66.Tokens.Global.Space_100);
end;
v58.getBriefViewHeight = function(v70)
    local l_Offset_0 = l_getSafeAreaSize_0(v70.props.screenSize, v70.props.globalGuiInset).Y.Offset;
    if not v70.props.isPortrait then
        return ((l_Offset_0 - v70.props.topBarHeight) - 25) * 0.5;
    else
        return ((v70.props.screenSize.Y - l_Offset_0 * v22.PortraitSceneHeight) - v70.props.topBarHeight) - 25;
    end;
end;
v58.renderActionBar = function(v72, v73)
    local l_Theme_0 = v73.Theme;
    local v75 = v72:getActionBarTotalHeight(if not l_GetFFlagHideDraggerPeekView_0() then nil else v73);
    local v76 = if not l_GetFFlagHideDraggerPeekView_0() then nil else v72.props.peekViewState == l_PeekViewState_0.SuperBrief;
    return v4.createFragment({
        BottomContainer = v4.createElement(l_Focusable_0.Frame, {
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 0, 
            Size = UDim2.new(1, 0, 0, v75), 
            Position = UDim2.fromScale(0, 0), 
            AnchorPoint = Vector2.new(0, 0), 
            ZIndex = 2, 
            ref = v72.actionBarRef, 
            NextSelectionUp = v72.itemsListRef
        }, {
            Padding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10), 
                PaddingTop = if not not l_GetFFlagHideDraggerPeekView_0() and v76 then UDim.new(0, -v73.Tokens.Global.Space_175) else UDim.new(0, v73.Tokens.Global.Space_125)
            }), 
            TryOnManagerBottomBar = v4.createElement(v31, {
                lookId = v72.props.lookId, 
                showMoreButton = if not v51() then nil else v51() and v76
            })
        }), 
        TopFrame = if not l_GetFFlagHideDraggerPeekView_0() then nil else v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 3), 
            Position = UDim2.new(0, 0, 1, -v75), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BorderSizePixel = 0
        }), 
        Gradient = if not not l_GetFFlagHideDraggerPeekView_0() and v76 then nil else v4.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 0, l_ActionBarGradientHeight_0), 
            Position = UDim2.new(0, 0, 1, -v75 - (not l_GetFFlagHideDraggerPeekView_0() and 0 or 3)), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/LuaApp/graphic/gradient_0_100.png", 
            ImageColor3 = l_Theme_0.BackgroundDefault.Color
        })
    });
end;
v58.renderTopContent = function(v77, v78, v79, v80)
    local l_Theme_1 = v78.Theme;
    local l_Font_0 = v78.Font;
    return v4.createFragment({
        UIPadding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 25)
        }), 
        CloseButton = v4.createElement(l_Focusable_0[l_ImageSetButton_0], {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 15, 0.5, 0), 
            Size = UDim2.fromOffset(40, 40), 
            Image = v56, 
            ImageColor3 = l_Theme_1.SystemPrimaryDefault.Color, 
            ImageTransparency = l_Theme_1.SystemPrimaryDefault.Transparency, 
            [v4.Event.Activated] = v77.onCloseButtonPressed, 
            ref = v77.closeButtonRef, 
            NextSelectionDown = v77.itemsListRef, 
            SelectionImageObject = v80(l_CursorKind_0.RoundedRectNoInset)
        }), 
        Title = v4.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 36), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Text = v79.yourTryOns, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize, 
            Font = l_Font_0.Header1.Font, 
            TextColor3 = l_Theme_1.IconEmphasis.Color, 
            TextTransparency = l_Theme_1.IconEmphasis.Transparency, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;
v58.orderTryOns = function(v83, v84)
    local v85 = {};
    for _, v87 in v84, nil, nil do
        table.insert(v85, v87);
    end;
    if (not v53() or not v83.props.lookId) or not v83.props.lookDetails then
        table.sort(v85, function(v88, v89)
            return v84[v89.itemId].itemRecency < v84[v88.itemId].itemRecency;
        end);
    else
        local v90 = v83.props.lookDetails[v83.props.lookId];
        if v90 and v90.lookType == v22.LookType.Avatar then
            table.sort(v85, function(v91, v92)
                return v91.itemRecency < v92.itemRecency;
            end);
            return v85;
        end;
    end;
    return v85;
end;
v58.renderTryOnItemContents = function(v93, _, _, v96)
    local v97 = {
        ListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 20)
        })
    };
    local v98 = 1;
    local v99 = v93:orderTryOns(v93.props.tryOnItems);
    for v100, v101 in v99, nil, nil do
        local v102 = nil;
        local _ = nil;
        if v98 > 1 then
            v102 = v93.tryOnElementRefCache[v99[v100 - 1].itemId];
        elseif v96 then
            v102 = v93.closeButtonRef;
        end;
        v97[v101.itemId] = v4.createElement(v30, {
            tryOnItem = v101, 
            layoutOrder = v98, 
            allowAutomaticPeekViewStateChanges = v93.props.lookId == nil, 
            elementRef = v93.tryOnElementRefCache[v101.itemId], 
            NextSelectionUp = v102, 
            NextSelectionDown = if v98 < #v99 then v93.tryOnElementRefCache[v99[v100 + 1].itemId] else v93.actionBarRef
        });
        v98 = v98 + 1;
    end;
    return v97;
end;
v58.renderWithProviders = function(v104, v105, v106, v107)
    local l_Theme_2 = v105.Theme;
    local v109 = UDim2.fromOffset(0, v104.props.topBarHeight);
    local v110 = UDim2.new(1, 0, 1, -v104.props.topBarHeight);
    if not v104.props.isPortrait then
        v109 = UDim2.new(v22.LandscapeNavWidth, 0, 0, v104.props.topBarHeight);
        v110 = UDim2.new(v22.LandscapeSceneWidth, 0, 1, -v104.props.topBarHeight);
    end;
    local v111 = v104:getBriefViewHeight();
    local v112 = if v104.props.lookId ~= nil then v104:getActionBarTotalHeight(if not l_GetFFlagHideDraggerPeekView_0() then nil else v105) else nil;
    local v113 = v104:getActionBarTotalHeight(if not l_GetFFlagHideDraggerPeekView_0() then nil else v105);
    local v114 = (v104.props.screenSize.Y - v104.props.topBarHeight) - v104.props.globalGuiInset.bottom;
    local v115 = true;
    if v104.props.peekViewState ~= l_PeekViewState_0.Full then
        v115 = v104.props.peekViewState == l_PeekViewState_0.Extended;
    end;
    local v116 = v104.state.isMouseAndKeyboard and v104.props.peekViewState == l_PeekViewState_0.Brief;
    local v117 = not not v48 or not v116;
    local v118 = if not l_GetFFlagHideDraggerPeekView_0() then nil else v104.props.peekViewState == l_PeekViewState_0.SuperBrief;
    if not (not l_GetFFlagHideDraggerPeekView_0() or not v117) then
        v117 = not v118;
    end;
    return v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = v110, 
        Position = v109, 
        Visible = v104.props.fullView ~= v33.SceneFullView, 
        ref = v104.frameRef, 
        focusController = v104.focusController, 
        defaultChild = v104.actionBarRef, 
        restorePreviousChildFocus = true, 
        NextSelectionLeft = v104.props.namedRefs[v104.props.avatarRoute.opaque.name .. v25.ItemsList], 
        inputBindings = {
            NavigateBack = v6.Input.onBegin(Enum.KeyCode.ButtonB, function()
                v104.onPeekViewClosed();
                v32.closeFocusedScreen(v104.props.navigation);
            end), 
            OpenCloseTryOnManager = v6.Input.onBegin(Enum.KeyCode.ButtonY, function()
                local l_peekViewState_0 = v104.props.peekViewState;
                if not (l_peekViewState_0 ~= l_PeekViewState_0.Full) or l_peekViewState_0 == l_PeekViewState_0.Extended then
                    v104.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                    return ;
                else
                    v104.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                    return ;
                end;
            end, {
                key = "Feature.Catalog.Label.TryOns"
            })
        }
    }, {
        GamepadFocusHandlerForPage = v4.createElement(v29, {
            focusController = v104.focusController, 
            captureFocusOnMount = true
        }), 
        TryOnManagerTopBar = v115 and v4.createElement("Frame", {
            ZIndex = 3, 
            BackgroundTransparency = 0, 
            BackgroundColor3 = l_Theme_2.BackgroundDefault.Color, 
            Size = UDim2.new(1, 0, 0, v104.props.topBarHeight), 
            Position = UDim2.fromOffset(0, -v104.props.topBarHeight), 
            BorderSizePixel = 0, 
            Active = true
        }, {
            TopContent = v104:renderTopContent(v105, v106, v107)
        }), 
        CloseButton = v116 and v4.createElement(l_ImageSetButton_0, {
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 15, 1, -v104:getBriefViewHeight() - 36), 
            Size = UDim2.new(0, 36, 0, 36), 
            Image = v56, 
            ImageColor3 = l_Theme_2.SystemPrimaryDefault.Color, 
            [v4.Event.Activated] = v104.onCloseButtonPressed
        }), 
        PeekViewContainer = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 3, 
            ClipsDescendants = true
        }, {
            PeekView = v4.createElement(l_PeekView_0, {
                briefViewContentHeight = UDim.new(0, v111), 
                mountAnimation = true, 
                mountAsFullView = false, 
                canDragFullViewToBrief = true, 
                showDraggerInClosedState = false, 
                returnToFullView = true, 
                thumbstickScrollEnabled = true, 
                viewStateChanged = v104.viewStateChanged, 
                showDropShadow = (not l_GetFFlagHideDraggerPeekView_0() or not v118) and nil, 
                superBriefViewContentHeight = if v104.props.lookId ~= nil then UDim.new(0, v112) else nil, 
                stateOnMount = if not v104.props.lookId then nil else v104.props.peekViewState, 
                bottomDockedContainerHeight = v113, 
                bottomDockedContainerContent = v104:renderActionBar(v105), 
                backgroundColor3 = l_Theme_2.BackgroundDefault.Color, 
                backgroundTransparency = l_Theme_2.BackgroundUIDefault.Transparency, 
                peekHeaderClose = false, 
                isScrollingEnabled = v117, 
                peekViewState = v104.props.peekViewState, 
                hideDraggerInSuperBrief = not not l_GetFFlagHideDraggerPeekView_0() or nil, 
                minimizeToSuperBrief = not not l_GetFFlagPeekViewMinimizeToSuperBrief_0() or nil
            }, {
                Padding = if not v38() then nil else v4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 8)
                }), 
                TryOnManagerContainer = v4.createElement(l_Focusable_0.Frame, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v114), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    ref = v104.itemsListRef, 
                    restorePreviousChildFocus = true
                }, v104:renderTryOnItemContents(v105, v106, v115))
            })
        }), 
        LastInputTypeChangedConnection = v4.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v120)
                if v120 then
                    local v121 = v24.InputTypeMap[v120] == v24.InputType.MouseAndKeyboard;
                    if v121 ~= v104.state.isMouseAndKeyboard then
                        v104:setState({
                            isMouseAndKeyboard = v121
                        });
                    end;
                end;
            end
        })
    });
end;
v58.render = function(v122)
    return l_withStyle_0(function(v123)
        return l_withLocalization_0({
            yourTryOns = "Feature.Avatar.Title.YourTryOns"
        })(function(v124)
            return l_withSelectionCursorProvider_0(function(v125)
                return v122:renderWithProviders(v123, v124, v125);
            end);
        end);
    end);
end;
if not v49 then
    v58.didUpdate = function(v126, v127)
        if not v46 or l_wasLastInputGamepad_0() then
            if v126.props.peekViewState ~= v127.peekViewState and v126.props.peekViewState ~= l_PeekViewState_0.Closed then
                v126.focusController.captureFocus();
                if v126.props.peekViewState == l_PeekViewState_0.Brief then
                    v126.focusController.moveFocusTo(v126.actionBarRef);
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
else
    v58.didUpdate = function(v128, v129, v130)
        if not (not v129.lookId or v128.props.lookId) then
            v128.onPeekViewClosed();
            v128.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Closed);
        end;
        if not v46 or l_wasLastInputGamepad_0() then
            if v128.props.peekViewState ~= v130.peekViewState and v128.props.peekViewState ~= l_PeekViewState_0.Closed then
                v128.focusController.captureFocus();
                if v128.props.peekViewState == l_PeekViewState_0.Brief then
                    v128.focusController.moveFocusTo(v128.actionBarRef);
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v58.willUnmount = function(v131)
    if not v47 and v131.props.lookId ~= nil then
        v131.props.removeLookItemsFromTryOn(v131.props.lookId, v131.props.lookDetails);
    end;
end;
return (v5.connect(function(v132, v133)
    return {
        isPortrait = v132.DeviceOrientation == l_DeviceOrientationMode_0.Portrait, 
        topBarHeight = v132.TopBar.topBarHeight, 
        tryOnItems = v132.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        lookId = v132.AvatarExperience.AvatarScene.OutfitTryOn.LookId, 
        lookDetails = v132.AvatarExperience.AvatarScene.Looks, 
        globalGuiInset = v132.GlobalGuiInset, 
        screenSize = v132.ScreenSize, 
        fullView = v37(v132, v133.avatarRoute.opaque.name), 
        boundInputs = v132.GamepadBottomBar.boundInputs, 
        peekViewState = v132.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState
    };
end, function(v134)
    return {
        removeUnselectedItemsFromTryOn = function()
            return v134(v26());
        end, 
        removeLookItemsFromTryOn = function(v135, v136)
            if (not v135 or not v136) or not v136[v135] then
                return ;
            else
                local v137 = {};
                for v138 in v136[v135].lookAssetInfos, nil, nil do
                    table.insert(v137, v138);
                end;
                local v139 = nil;
                if v52() then
                    v139 = {};
                    for v140 in v136[v135].lookBundleInfos, nil, nil do
                        table.insert(v139, v140);
                    end;
                end;
                return v134(v27(v135, v137, v139));
            end;
        end, 
        setTryOnManagerPeekViewState = function(v141)
            v134(v28(v141));
        end
    };
end)((v35((v34((l_RoactServices_0.connect({
    catalogAnalytics = v21
})(v58))))))));
