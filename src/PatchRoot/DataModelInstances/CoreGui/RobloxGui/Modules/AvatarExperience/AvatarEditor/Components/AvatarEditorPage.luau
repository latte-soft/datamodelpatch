local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = v5.Focusable;
local v8 = require(l_CorePackages_0.Cryo);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v11 = require(l_Modules_0.LuaApp.AppPage);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v14 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceView);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarNavigationItemsView);
local v18 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.TopBar.ManageButton);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.TopBar.makeTitleDropDown);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.AXTransitionSegmentedMenu);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.TopBar.makeAvatarBackButton);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v29 = require(l_Modules_0.AvatarExperience.Common.Actions.SetItemDetailsPeekViewState);
local v30 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemPrompt);
local v31 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v32 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v33 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenQuickMenu);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local v37 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v38 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v39 = require(l_Modules_0.LuaApp.Navigation.AndroidBackButtonConnection);
local v40 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Utils.isAvatarRouteVisible);
local v41 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v42 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v43 = require(l_Modules_0.AvatarExperience.Flags.AXAlternateLandingPageIXP);
local v44 = require(l_Modules_0.AvatarExperience.Flags.AXAndroidBackButtonIXPTest);
local v45 = require(l_Modules_0.AvatarExperience.Catalog.Components.OnFocusExposureLogger);
local v46 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings);
local v47 = require(l_Modules_0.AvatarExperience.Common.Hooks.useOverlayClosedCallback);
local v48 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local v49 = require(l_Modules_0.AvatarExperience.Flags.ColorPickerSliderIXPTest);
local v50 = require(l_Modules_0.AvatarExperience.Flags.AvatarMarketplaceBackendIXPTests);
local l_FFlagAvatarAndroidBackButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAvatarAndroidBackButton;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v53 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRemoveYButtonCatalogPage);
local v54 = v3.PureComponent:extend("AvatarEditorPage");
v54.init = function(v55)
    v55.topBarRef = v3.createRef();
    v55.sceneUIContainerRef = v3.createRef();
    v55.refinementButtonsRef = v3.createRef();
    v55.quickButtonsRef = v3.createRef();
    v55:setState({
        lastInputIsGamepad = l_isGamepadInput_0((l_UserInputService_0:GetLastInputType()))
    });
    v55.changeView = function()
        v55.props.setFullView(v55.props.avatarExperienceAnalytics, v55.props.avatarRoute.opaque.name, (v41.getNewFullViewEnum(v55.props.fullView)));
    end;
    v55.defaultChildRef = v3.createRef();
    v55.onBackFromTopBar = function()
        v55.props.navigation.navigate(if v55.props.shouldSkipLandingPage or v55.props.alternateAvatarLandingScreenEnabled then v11.Home else v13.AvatarExperienceLandingPage);
    end;
    v55.lastInputTypeChangedCallback = function(v56)
        local v57 = l_isGamepadInput_0(v56);
        if v57 ~= v55.state.lastInputIsGamepad then
            v55:setState({
                lastInputIsGamepad = v57
            });
        end;
    end;
    v55.titleDropDown = v20("Feature.Catalog.Action.Customize", v55.props.overlayClosedCallback);
    v55.backButton = v22(v55.onBackFromTopBar);
end;
v54.getInputBindings = function(v58)
    local l_avatarRoute_0 = v58.props.avatarRoute;
    local l_name_0 = l_avatarRoute_0.current.name;
    local v61 = {};
    if l_name_0 == v13.ItemDetails then
        v61 = v8.Dictionary.join(v61, {
            NavigateBack = v5.Input.onBegin(Enum.KeyCode.ButtonB, function()
                v27.closeFocusedScreen(v58.props.navigation);
            end), 
            OpenItemPrompt = v5.Input.onBegin(Enum.KeyCode.ButtonX, function()
                v58.props.openItemPrompt(v58.props.networking, v58.props.catalogAnalytics, v58.props.overlayClosedCallback, v58.props.navigation, l_avatarRoute_0);
            end, {
                key = "Feature.Catalog.Action.Buy"
            }), 
            OpenClosePeekView = if v53() then nil else v5.Input.onBegin(Enum.KeyCode.ButtonY, function()
                if not v58.props.itemDetailsExpanded then
                    v58.props.setItemDetailsPeekViewState(l_PeekViewState_0.Full);
                    return ;
                else
                    v58.props.setItemDetailsPeekViewState(l_PeekViewState_0.Brief);
                    return ;
                end;
            end, {
                key = not v58.props.itemDetailsExpanded and "Feature.Catalog.Action.OpenDetails" or "Feature.Catalog.Action.CloseDetails"
            }), 
            OpenCatalogContextMenu = v5.Input.onBegin(Enum.KeyCode.ButtonL3, function()
                v58.props.navigation.navigate(v13.CatalogContextMenu, {
                    itemId = l_avatarRoute_0.current.params.itemId, 
                    itemType = l_avatarRoute_0.current.params.itemType, 
                    onOverlayClosed = v58.props.overlayClosedCallback
                });
            end, {
                key = "Feature.Catalog.Action.ItemOptions"
            })
        });
    end;
    return v61;
end;
if l_FFlagAvatarAndroidBackButton_0 then
    v54.didMount = function(v62)
        if not ((not v62.props.shouldSkipLandingPage and not v62.props.alternateAvatarLandingScreenEnabled or not v62.props.axAndroidBackButtonEnabled) or not v40(v62.props)) then
            v62.props.androidBackButtonConnection.connect(v62.onBackFromTopBar);
        end;
    end;
    v54.willUnmount = function(v63)
        v63.props.androidBackButtonConnection.disconnect();
    end;
    v54.didUpdate = function(v64, v65)
        if not (not v64.props.shouldSkipLandingPage and not v64.props.alternateAvatarLandingScreenEnabled) then
            if (not v64.props.axAndroidBackButtonEnabled or v40(v65)) or not v40(v64.props) then
                if not (not v40(v65) or v40(v64.props)) then
                    v64.props.androidBackButtonConnection.disconnect();
                end;
            else
                v64.props.androidBackButtonConnection.connect(v64.onBackFromTopBar);
                return ;
            end;
        end;
    end;
end;
v54.renderTopBar = function(v66)
    local l_isPortrait_0 = v66.props.isPortrait;
    local l_showManageOutfitButton_0 = v66.props.showManageOutfitButton;
    return l_withLocalization_0({
        title = "Feature.Catalog.Action.Customize"
    })(function(v69)
        local v70 = nil;
        local v71 = nil;
        local v72 = nil;
        if not l_IsVRAppBuild_0() then
            v70 = v66.backButton;
            v71 = if not v66.props.alternateAvatarLandingScreenEnabled then v66.titleDropDown else v21;
            v72 = if not l_showManageOutfitButton_0 then {} else {
                v19
            };
        else
            v70 = nil;
            v71 = nil;
            v72 = {};
        end;
        return v3.createElement(v18.Container, {
            transparentBackground = true, 
            hideSiteMessageBanner = l_isPortrait_0, 
            [v3.Ref] = v66.topBarRef, 
            NextSelectionDown = v66.defaultChildRef, 
            NextSelectionRight = v66.sceneUIContainerRef, 
            titleText = v69.title, 
            leftItem = v70, 
            centerItem = v71, 
            rightItems = v72, 
            useParentSizeForCenterItem = true
        });
    end);
end;
v54.render = function(v73)
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v3.Ref] = v73.ref, 
        focusController = v73.props.focusController, 
        defaultChild = v73.defaultChildRef, 
        inputBindings = v73:getInputBindings(), 
        restorePreviousChildFocus = false
    }, {
        ColorPickerSliderExposure = v3.createElement(v45, {
            ixpTest = v49
        }), 
        UniversalAppCameraExposure = v3.createElement(v45, {
            ixpTest = v48
        }), 
        EditorExposure = v3.createElement(v45, {
            ixpTest = v50.Editor
        }), 
        BoundInputsUpdater = v3.createElement(v24), 
        LastInputTypeChangedConnection = v3.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = v73.lastInputTypeChangedCallback
        }), 
        NavigationEventsLogger = v3.createElement(v25, {
            pageName = "AvatarEditor"
        }), 
        AvatarExperienceView = v3.createElement(v16, {
            allowAdaptiveScrolling = false, 
            bottomBarEnabled = false, 
            changeViewFunction = v73.changeView, 
            isSceneFullView = v73.props.fullView == v32.SceneFullView, 
            isUIFullView = v73.props.fullView == v32.UIFullView, 
            topBar = v73:renderTopBar(), 
            refinementButtonsRef = v73.refinementButtonsRef, 
            quickButtonsRef = v73.quickButtonsRef, 
            ref = v73.sceneUIContainerRef, 
            NextSelectionDown = v73.defaultChildRef, 
            NextSelectionLeft = v73.topBarRef, 
            defaultChildRef = v73.defaultChildRef
        }, {
            GamepadFocusHandlerForPage = v3.createElement(v23, {
                focusController = v73.props.focusController, 
                captureFocusOnMount = true
            }), 
            AvatarNavigationItemsView = v3.createElement(v17, {
                defaultChildRef = v73.defaultChildRef, 
                NextSelectionUp = v73.topBarRef, 
                NextSelectionRight = v73.quickButtonsRef
            })
        })
    });
end;
v54 = v42.connectTestVariables({
    alternateAvatarLandingScreenEnabled = v43.EnabledForUser, 
    axAndroidBackButtonEnabled = v44.EnabledForUser
})((v26((v4.connect(function(v74, _)
    return {
        fullView = v38(v74, v13.AvatarEditor), 
        isPortrait = v37(v74), 
        itemDetailsExpanded = v74.AvatarExperience.Common.ItemDetailsExpanded, 
        showManageOutfitButton = v41.getAvatarEditorCategoryInfoFromState(v74).ManageOutfitsEnabled == true
    };
end, function(v76)
    return {
        openItemPrompt = function(v77, v78, v79, v80, v81)
            v76(v30(v77, v78, v79, v80, v81));
        end, 
        setItemDetailsPeekViewState = function(v82)
            v76(v29(v82));
        end, 
        navigateIntoQuickMenu = function(v83, v84)
            v76(v33(v83, v84));
        end, 
        setFullView = function(v85, v86, v87)
            v76(v31(v85, v86, v87));
        end
    };
end)((l_RoactAppPolicy_0.connect(function(v88, _)
    return {
        shouldSkipLandingPage = v88.getShouldSkipAvatarLandingPage()
    };
end)((l_RoactServices_0.connect({
    avatarExperienceAnalytics = v14, 
    catalogAnalytics = v15, 
    networking = v10
})(v54)))))))));
return function(v90)
    local l_current_0 = v6.useRef(v5.createFocusController()).current;
    local v92 = if not l_FFlagAvatarAndroidBackButton_0 then nil else v6.useRef(v39()).current;
    local v93 = v47(l_current_0);
    return v6.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        ref = v46({
            overlayClosedCallback = v93
        })
    }, v6.createElement(v54, (v8.Dictionary.join(v90, {
        focusController = l_current_0, 
        overlayClosedCallback = v93, 
        androidBackButtonConnection = v92
    }))));
end;
