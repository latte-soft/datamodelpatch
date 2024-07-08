local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v8.Focusable;
local v10 = require(l_CorePackages_0.Cryo);
local v11 = require(l_Modules_0.LuaApp.AppPage);
local v12 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v14 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v15 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v17 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v24 = require(l_Modules_0.AvatarExperience.Common.Context.withNamedRefs);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.TopBar.makeTitleDropDown);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.AXTransitionSegmentedMenu);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.TopBar.makeAvatarBackButton);
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceView);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Components.NavigationItemsView);
local v30 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local v34 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v35 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v37 = require(l_Modules_0.AvatarExperience.Common.Actions.SetItemDetailsPeekViewState);
local v38 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemPrompt);
local v39 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v40 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v41 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v42 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenQuickMenu);
local v43 = require(l_Modules_0.LuaApp.Constants);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v45 = require(l_Modules_0.LuaApp.Navigation.AndroidBackButtonConnection);
local v46 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Utils.isAvatarRouteVisible);
local v47 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v48 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v49 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v50 = require(l_Modules_0.LuaApp.Thunks.InstantResetNavigationHistory);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v52 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreenProperties);
local v53 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v54 = require(l_Modules_0.AvatarExperience.Catalog.Components.OnFocusExposureLogger);
local v55 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings);
local v56 = require(l_Modules_0.AvatarExperience.Common.Hooks.useOverlayClosedCallback);
local v57 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSearchCategoryAndSubcategory);
local v58 = require(l_Modules_0.AvatarExperience.Flags.AvatarMarketplaceBackendIXPTests);
local v59 = require(l_Modules_0.AvatarExperience.Flags.TopicsIXPTest);
local v60 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local v61 = require(l_Modules_0.AvatarExperience.Flags.AXAlternateLandingPageIXP);
local v62 = require(l_Modules_0.AvatarExperience.Flags.AXAndroidBackButtonIXPTest);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v64 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll);
local v65 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagLooksIXPLogging);
local v66 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSearchResultsCategories);
local v67 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRemoveYButtonCatalogPage);
local l_FFlagAvatarAndroidBackButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAvatarAndroidBackButton;
local v69 = v4.PureComponent:extend("CatalogPage");
v69.validateProps = v7.strictInterface({
    fullView = v7.optional(v7.userdata), 
    isPortrait = v7.optional(v7.boolean), 
    itemDetailsExpanded = v7.optional(v7.boolean), 
    tryOnManagerPeekViewState = v7.optional(v7.valueOf(l_PeekViewState_0)), 
    tryOnItems = v7.optional(v7.table), 
    openItemPrompt = v7.callback, 
    setItemDetailsPeekViewState = v7.callback, 
    navigateIntoQuickMenu = v7.optional(v7.callback), 
    setFullView = v7.callback, 
    resetNavigationHistory = v7.callback, 
    instantResetNavigationHistory = v7.callback, 
    setTryOnManagerPeekViewState = v7.callback, 
    resetSearchCategoryAndSubcategory = if not v66() then nil else v7.callback, 
    namedRefs = v7.table, 
    prevNavPage = v7.optional(v7.string), 
    prevNavHistory = v7.optional(v7.table), 
    navigation = v7.optional(v7.table), 
    avatarRoute = v7.optional(v7.table), 
    avatarExperienceAnalytics = v7.optional(v7.table), 
    networking = v7.optional(v7.callback), 
    appAnalytics = v7.optional(v7.table), 
    avatarEditorAnalytics = v7.optional(v7.table), 
    catalogAnalytics = v7.optional(v7.table), 
    show3dView = v7.optional(v7.boolean), 
    shouldSkipLandingPage = v7.optional(v7.boolean), 
    itemId = v7.optional(v7.string), 
    itemType = v7.optional(v7.string), 
    isFirstItemDetails = v7.optional(v7.boolean), 
    alternateAvatarLandingScreenEnabled = v7.optional(v7.boolean), 
    axAndroidBackButtonEnabled = v7.optional(v7.boolean), 
    focusController = v7.table, 
    androidBackButtonConnection = if not l_FFlagAvatarAndroidBackButton_0 then nil else v7.table, 
    overlayClosedCallback = v7.callback
});
v69.init = function(v70)
    v70.topBarRef = v4.createRef();
    v70.sceneUIContainerRef = v4.createRef();
    v70.titleDropDownRef = v4.createRef();
    v70.topBarRenderRightRef = v4.createRef();
    v70.refinementButtonsRef = v4.createRef();
    v70.multiTryOnBottomBarRef = v4.createRef();
    v70.quickButtonsRef = v4.createRef();
    v70:setState({
        lastInputIsGamepad = l_isGamepadInput_0((l_UserInputService_0:GetLastInputType()))
    });
    v70.setDefaultRefOverride = function(v71)
        v70:setState({
            defaultRefOverride = v71 or v4.None
        });
    end;
    v70.changeView = function()
        v70.props.setFullView(v70.props.avatarExperienceAnalytics, v70.props.avatarRoute.opaque.name, (v12.getNewFullViewEnum(v70.props.fullView)));
    end;
    v70.setUIFullView = function()
        local l_avatarExperienceAnalytics_0 = v70.props.avatarExperienceAnalytics;
        if v70.props.isPortrait then
            v70.props.setFullView(l_avatarExperienceAnalytics_0, v13.CatalogSearch, v41.UIFullView);
        end;
    end;
    v70.isAvatarScreen = function(v73)
        return (rawget(v13, v73));
    end;
    v70.topBarBackButtonActivated = function()
        local l_navigation_0 = v70.props.navigation;
        local l_avatarEditorAnalytics_0 = v70.props.avatarEditorAnalytics;
        local l_prevNavPage_0 = v70.props.prevNavPage;
        local l_prevNavHistory_0 = v70.props.prevNavHistory;
        if not l_prevNavPage_0 or not l_prevNavHistory_0 then
            l_navigation_0.navigate(if v70.props.shouldSkipLandingPage or v70.props.alternateAvatarLandingScreenEnabled then v11.Home else v13.AvatarExperienceLandingPage);
        elseif not v70.isAvatarScreen(l_prevNavPage_0) then
            v70.props.resetNavigationHistory(l_prevNavHistory_0);
        else
            v70.props.navigation.navigate(l_prevNavPage_0);
        end;
        l_avatarEditorAnalytics_0.catalogToAvatarBackButton();
    end;
    v70.defaultChildRef = v4.createRef();
    v70.lastInputTypeChangedCallback = function(v78)
        local v79 = l_isGamepadInput_0(v78);
        if v79 ~= v70.state.lastInputIsGamepad then
            v70:setState({
                lastInputIsGamepad = v79
            });
        end;
    end;
    v70.titleDropDown = v25("Feature.Avatar.Action.Marketplace", v70.props.overlayClosedCallback);
    v70.backButton = v27(v70.topBarBackButtonActivated);
    v70.onConfirmSearchCallback = if not v66() then nil else function()
        v70.props.resetSearchCategoryAndSubcategory();
        if not (not v64() or not v70.setUIFullView) then
            v70.setUIFullView();
        end;
    end;
end;
v69.getBestDefaultRefForPage = function(v80)
    if not v80.state.defaultRefOverride then
        return v80.defaultChildRef;
    else
        return v80.state.defaultRefOverride;
    end;
end;
v69.getInputBindings = function(v81)
    local l_avatarRoute_0 = v81.props.avatarRoute;
    local l_name_0 = l_avatarRoute_0.current.name;
    local l_isMultiTryOn_0 = v52[l_avatarRoute_0.opaque.name].isMultiTryOn;
    local v85 = {
        OpenTryOnManager = if (l_name_0 ~= v13.TryOnManager and l_isMultiTryOn_0) and #v10.Dictionary.values(v81.props.tryOnItems) > 1 then v8.Input.onBegin(Enum.KeyCode.ButtonY, function()
            v22.closeFiltersAndItemDetails(v81.props.navigation);
            v81.props.navigation.navigate(v13.TryOnManager);
        end, {
            key = "Feature.Catalog.Label.TryOns"
        }) else nil
    };
    if l_name_0 == v13.ItemDetails then
        return (v10.Dictionary.join(v85, {
            NavigateBack = v8.Input.onBegin(Enum.KeyCode.ButtonB, function()
                v22.closeFocusedScreen(v81.props.navigation);
            end), 
            OpenItemPrompt = v8.Input.onBegin(Enum.KeyCode.ButtonX, function()
                v81.props.openItemPrompt(v81.props.networking, v81.props.catalogAnalytics, v81.props.overlayClosedCallback, v81.props.navigation, l_avatarRoute_0);
            end, {
                key = "Feature.Catalog.Action.Buy"
            }), 
            OpenClosePeekView = if l_isMultiTryOn_0 or v67() then nil else v8.Input.onBegin(Enum.KeyCode.ButtonY, function()
                if not v81.props.itemDetailsExpanded then
                    v81.props.setItemDetailsPeekViewState(l_PeekViewState_0.Full);
                    return ;
                else
                    v81.props.setItemDetailsPeekViewState(l_PeekViewState_0.Brief);
                    return ;
                end;
            end, {
                key = not v81.props.itemDetailsExpanded and "Feature.Catalog.Action.OpenDetails" or "Feature.Catalog.Action.CloseDetails"
            }), 
            OpenCatalogContextMenu = v8.Input.onBegin(Enum.KeyCode.ButtonL3, function()
                v81.props.navigation.navigate(v13.CatalogContextMenu, {
                    itemId = l_avatarRoute_0.current.params.itemId, 
                    itemType = l_avatarRoute_0.current.params.itemType, 
                    onOverlayClosed = v81.props.overlayClosedCallback
                });
            end, {
                key = "Feature.Catalog.Action.ItemOptions"
            })
        }));
    else
        if l_name_0 == v13.TryOnManager then
            v85 = v10.Dictionary.join(v85, {
                OpenCloseTryOnManager = v8.Input.onBegin(Enum.KeyCode.ButtonY, function()
                    local l_tryOnManagerPeekViewState_0 = v81.props.tryOnManagerPeekViewState;
                    if not (l_tryOnManagerPeekViewState_0 ~= l_PeekViewState_0.Full) or l_tryOnManagerPeekViewState_0 == l_PeekViewState_0.Extended then
                        v81.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                        return ;
                    else
                        v81.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                        return ;
                    end;
                end, {
                    key = "Feature.Catalog.Label.TryOns"
                })
            });
        end;
        return v85;
    end;
end;
if l_FFlagAvatarAndroidBackButton_0 then
    v69.didMount = function(v87)
        if not ((not v87.props.shouldSkipLandingPage and not v87.props.alternateAvatarLandingScreenEnabled or not v87.props.axAndroidBackButtonEnabled) or not v46(v87.props)) then
            v87.props.androidBackButtonConnection.connect(v87.topBarBackButtonActivated);
        end;
    end;
    v69.willUnmount = function(v88)
        v88.props.androidBackButtonConnection.disconnect();
    end;
    v69.didUpdate = function(v89, v90)
        if not (not v89.props.shouldSkipLandingPage and not v89.props.alternateAvatarLandingScreenEnabled) then
            if (not v89.props.axAndroidBackButtonEnabled or v46(v90)) or not v46(v89.props) then
                if not (not v46(v90) or v46(v89.props)) then
                    v89.props.androidBackButtonConnection.disconnect();
                end;
            else
                v89.props.androidBackButtonConnection.connect(v89.topBarBackButtonActivated);
                return ;
            end;
        end;
    end;
end;
v69.renderTopBar = function(v91)
    local l_isPortrait_0 = v91.props.isPortrait;
    local l_show3dView_0 = v91.props.show3dView;
    return l_withLocalization_0({
        title = "Feature.Avatar.Action.Marketplace"
    })(function(v94)
        local v95 = 2;
        if v64() then
            v95 = 3;
        end;
        local v96 = nil;
        local v97 = nil;
        local v98 = nil;
        if not l_IsVRAppBuild_0() then
            v96 = v91.backButton;
            v97 = if not v91.props.alternateAvatarLandingScreenEnabled then v91.titleDropDown else v26;
            v98 = {
                v30.SearchButton
            };
        else
            v97 = nil;
            v96 = nil;
            v98 = nil;
        end;
        return v4.createElement(v30.Container, {
            forceCompactMode = true, 
            searchType = v43.SearchTypes.Catalog, 
            titleText = v94.title, 
            ZIndex = v95, 
            transparentBackground = l_show3dView_0, 
            hideSiteMessageBanner = l_isPortrait_0, 
            [v4.Ref] = v91.topBarRef, 
            setDefaultRefOverride = v91.setDefaultRefOverride, 
            NextSelectionDown = v91.defaultChildRef, 
            NextSelectionRight = v91.sceneUIContainerRef, 
            onConfirmSearchCallback = if not v66() then v64() and v91.setUIFullView or nil else v91.onConfirmSearchCallback, 
            leftItem = v96, 
            centerItem = v97, 
            rightItems = v98, 
            useParentSizeForCenterItem = true
        });
    end);
end;
v69.render = function(v99)
    local v100 = v99.props.fullView == v41.SceneFullView;
    local v101 = v99.props.fullView == v41.UIFullView;
    local l_show3dView_1 = v99.props.show3dView;
    local l_namedRefs_0 = v99.props.namedRefs;
    local v104 = v99.props.avatarRoute.current.name == v13.SortAndFilters;
    local l_quickButtonsRef_0 = v99.quickButtonsRef;
    if v99.props.avatarRoute.current.name == v13.TryOnManager then
        l_quickButtonsRef_0 = l_namedRefs_0[v13.TryOnManager];
    elseif v104 then
        l_quickButtonsRef_0 = l_namedRefs_0[v13.SortAndFilters];
    end;
    return v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        focusController = v99.props.focusController, 
        defaultChild = v99:getBestDefaultRefForPage(), 
        restorePreviousChildFocus = false, 
        inputBindings = v99:getInputBindings(), 
        ref = l_namedRefs_0[v13.Catalog]
    }, {
        BoundInputsUpdater = v4.createElement(v32), 
        LastInputTypeChangedConnection = v4.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = v99.lastInputTypeChangedCallback
        }), 
        NavigationEventsLogger = v4.createElement(v19, {
            pageName = "Catalog"
        }), 
        TopicsExposure = v4.createElement(v54, {
            ixpTest = v59
        }), 
        UniversalAppCameraExposure = v4.createElement(v54, {
            ixpTest = v60
        }), 
        RelevanceRecommendationsExposure = v4.createElement(v54, {
            ixpTest = v58.RelevanceRecommendations
        }), 
        RecommendationsAndSearchExposure = v4.createElement(v54, {
            ixpTest = v58.RecommendationsAndSearch
        }), 
        WidgetExposure = v4.createElement(v54, {
            ixpTest = v58.Widgets
        }), 
        SortsExposure = v65() and v4.createElement(v54, {
            ixpTest = v58.Sorts
        }), 
        SearchWidgetsExposure = v65() and v4.createElement(v54, {
            ixpTest = v58.SearchWidgets
        }), 
        AvatarExperienceView = v4.createElement(v28, {
            changeViewFunction = v99.changeView, 
            allowAdaptiveScrolling = true, 
            isDisabled = not l_show3dView_1, 
            isSceneFullView = v100, 
            isUIFullView = v101, 
            topBar = v99:renderTopBar(), 
            refinementButtonsRef = v99.refinementButtonsRef, 
            quickButtonsRef = v99.quickButtonsRef, 
            [v4.Ref] = v99.sceneUIContainerRef, 
            NextSelectionDown = v99.defaultChildRef, 
            NextSelectionLeft = v99.topBarRef, 
            defaultChildRef = v99.defaultChildRef, 
            multiTryOnBottomBarRef = v99.multiTryOnBottomBarRef
        }, {
            GamepadFocusHandlerForPage = v4.createElement(v31, {
                focusController = v99.props.focusController, 
                captureFocusOnMount = true
            }), 
            NavigationAndItemsList = v4.createElement(v29, {
                defaultChildRef = v99.defaultChildRef, 
                NextSelectionUp = v99.topBarRef, 
                NextSelectionRight = l_quickButtonsRef_0, 
                multiTryOnBottomBarRef = v99.multiTryOnBottomBarRef
            })
        })
    });
end;
v69 = v53.connectTestVariables({
    alternateAvatarLandingScreenEnabled = v61.EnabledForUser, 
    axAndroidBackButtonEnabled = v62.EnabledForUser
})((v24((v21(v20((l_RoactAppPolicy_0.connect(function(v106, _)
    return {
        show3dView = v106.getCatalogShow3dView(), 
        shouldSkipLandingPage = v106.getShouldSkipAvatarLandingPage()
    };
end)((l_RoactServices_0.connect({
    avatarExperienceAnalytics = v14, 
    networking = v17, 
    appAnalytics = v15, 
    avatarEditorAnalytics = v34, 
    catalogAnalytics = v35
})((v6.connect(function(v108)
    return {
        fullView = v48(v108, v13.Catalog), 
        isPortrait = v47(v108), 
        itemDetailsExpanded = v108.AvatarExperience.Common.ItemDetailsExpanded, 
        tryOnManagerPeekViewState = v108.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState, 
        tryOnItems = v108.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
    };
end, function(v109)
    return {
        openItemPrompt = function(v110, v111, v112, v113, v114)
            v109(v38(v110, v111, v112, v113, v114));
        end, 
        setItemDetailsPeekViewState = function(v115)
            v109(v37(v115));
        end, 
        navigateIntoQuickMenu = function(v116, v117)
            v109(v42(v116, v117));
        end, 
        setFullView = function(v118, v119, v120)
            v109(v39(v118, v119, v120));
        end, 
        resetNavigationHistory = function(v121)
            return v109(v49(nil, v121));
        end, 
        instantResetNavigationHistory = function(v122)
            return v109(v50(nil, v122));
        end, 
        setTryOnManagerPeekViewState = function(v123)
            v109(v40(v123));
        end, 
        resetSearchCategoryAndSubcategory = if not v66() then nil else function()
            v109(v57(1, 0));
        end
    };
end)(v69))))))), nil)))));
return function(v124)
    local l_current_0 = v5.useRef(v8.createFocusController()).current;
    local v126 = if not l_FFlagAvatarAndroidBackButton_0 then nil else v5.useRef(v45()).current;
    local v127 = v56(l_current_0);
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        ref = v55({
            overlayClosedCallback = v127
        })
    }, v5.createElement(v69, (v10.Dictionary.join(v124, {
        focusController = l_current_0, 
        overlayClosedCallback = v127, 
        androidBackButtonConnection = v126
    }))));
end;
