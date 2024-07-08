local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.React);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v8 = require(l_CorePackages_0.UIBlox);
local v9 = require(l_CorePackages_0.Cryo);
local v10 = require(l_CorePackages_0.Packages.t);
local l_Focusable_0 = v5.Focusable;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v15 = require(l_Modules_0.LuaApp.AppPage);
local v16 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v18 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_LoadingStateContainer_0 = v8.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v8.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v8.App.Indicator.EmptyState;
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local v27 = require(l_Common_0.Util.IXPUtils);
local v28 = require(l_Common_0.Components.RoactNavigation.AvatarScreen);
local v29 = require(l_Common_0.Services.Analytics);
local v30 = require(l_Common_0.Components.AvatarExperienceView);
local v31 = require(l_Common_0.Components.TopBar.makeTitleDropDown);
local v32 = require(l_Common_0.Components.GamepadFocusHandlerForPage);
local v33 = require(l_Common_0.Components.BoundInputsUpdater);
local v34 = require(l_Common_0.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v35 = require(l_Common_0.Components.RoactNavigation.withStackVisibilityWrapper);
local v36 = require(l_Common_0.Thunks.SetFullView);
local v37 = require(l_Common_0.Enum.FullView);
local v38 = require(l_Common_0.Utils);
local v39 = require(l_Common_0.Thunks.OpenQuickMenu);
local v40 = require(l_Common_0.Thunks.OpenItemPrompt);
local v41 = require(l_Common_0.Actions.SetItemDetailsPeekViewState);
local v42 = require(l_Common_0.Components.RoactNavigation.NavigationUtils);
local v43 = require(l_Common_0.Selectors.selectIsFullView);
local v44 = require(l_Common_0.Hooks.useAvatarExperienceFocusNavigationBindings);
local v45 = require(l_Common_0.Hooks.useOverlayClosedCallback);
local l_ProfilePictureEditor_0 = l_Modules_0.AvatarExperience.ProfilePictureEditor;
local v47 = require(l_ProfilePictureEditor_0.Services.Analytics);
local v48 = require(l_ProfilePictureEditor_0.Thunks.FetchPPEConfig);
local v49 = require(l_ProfilePictureEditor_0.Components.ProfilePictureEditorBottomBar);
local v50 = require(l_ProfilePictureEditor_0.Components.EmotesScrollView);
local v51 = require(l_ProfilePictureEditor_0.Constants);
local l_Flags_0 = l_Modules_0.AvatarExperience.Flags;
local v53 = require(l_Flags_0.AXAlternateLandingPageIXP);
local v54 = require(l_Flags_0.GetFFlagAXEnableRevertPpeCustomizationFlow);
local v55 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRemoveYButtonCatalogPage);
local v56 = v3.PureComponent:extend("ProfilePictureEditorEmotesPage");
v56.validateProps = v10.strictInterface({
    avatarRoute = v10.table, 
    navigation = v10.table, 
    networking = v10.callback, 
    avatarExperienceAnalytics = v10.table, 
    profilePictureEditorAnalytics = v10.table, 
    fullView = v10.userdata, 
    fetchingStatus = v10.string, 
    isPortrait = v10.boolean, 
    itemDetailsExpanded = v10.boolean, 
    emoteAssetId = v10.optional(v10.string), 
    tryOnItems = v10.table, 
    fetchPPEConfig = v10.callback, 
    setFullView = v10.callback, 
    navigateIntoQuickMenu = v10.callback, 
    openItemPrompt = v10.callback, 
    setItemDetailsPeekViewState = v10.callback, 
    alternateAvatarLandingScreenEnabled = v10.optional(v10.boolean), 
    shouldSkipLandingPage = v10.boolean, 
    overlayClosedCallback = v10.callback, 
    focusController = v10.table
});
v56.init = function(v57)
    v57.sceneUIContainerRef = v3.createRef();
    v57.emotesScrollViewRef = v3.createRef();
    v57.topBarRef = v3.createRef();
    v57.bottomBarRef = v3.createRef();
    v57:setState({
        lastInputIsGamepad = l_isGamepadInput_0((l_UserInputService_0:GetLastInputType())), 
        bottomBarHeight = 72
    });
    v57.fetchPPEConfig = function()
        v57.props.fetchPPEConfig(v57.props.networking);
    end;
    v57.onAbsoluteSizeChanged = function(v58)
        v57:setState({
            bottomBarHeight = v58.Y
        });
    end;
    v57.changeView = function()
        v57.props.setFullView(v57.props.avatarExperienceAnalytics, v57.props.avatarRoute.opaque.name, (v38.getNewFullViewEnum(v57.props.fullView)));
    end;
    v57.onBackFromTopBar = function()
        local v59 = nil;
        if v57.props.alternateAvatarLandingScreenEnabled then
            v59 = v57.props.navigation.getParam("prevNavPage");
        end;
        local _ = nil;
        v57.props.navigation.navigate(if not v59 then if v57.props.shouldSkipLandingPage then v15.Home else v28.AvatarExperienceLandingPage else v59);
    end;
    v57.backButton = v16.makeBackButton(v57.onBackFromTopBar);
    v57.onNext = function()
        v57.props.profilePictureEditorAnalytics.clickNextFromEmotesPage(v57.props.emoteAssetId);
        v57.props.navigation.navigate(v28.ProfilePictureEditorCamera, {});
    end;
    v57.onDone = function()
        v57.props.navigation.navigate(v28.ProfilePictureEditorFinal, {});
    end;
    if v54() then
        v57.onRevertBtnClicked = function()
            v57.props.navigation.navigate(v28.ProfilePictureEditorRevertToDefaultPrompt, {
                onBack = v57.onBackFromTopBar
            });
        end;
    end;
    v57.renderBottomBar = function()
        local v61 = not v9.isEmpty(v57.props.tryOnItems);
        local v62 = {
            textKey = "Authentication.CrossDevice.Action.Done", 
            onActivated = v57.onDone, 
            isDisabled = v61
        };
        if v54() then
            v62 = {
                textKey = "Feature.Avatar.Action.Revert", 
                onActivated = v57.onRevertBtnClicked, 
                isDisabled = false
            };
        end;
        return v3.createElement(v49, {
            button1 = v62, 
            button2 = {
                textKey = "Authentication.CrossDevice.Action.Next", 
                onActivated = v57.onNext, 
                isDisabled = v61
            }, 
            NextSelectionUp = v57.emotesScrollViewRef, 
            onAbsoluteSizeChanged = v57.onAbsoluteSizeChanged, 
            baseRef = v57.bottomBarRef
        });
    end;
    v57.lastInputTypeChangedCallback = function(v63)
        local v64 = l_isGamepadInput_0(v63);
        if v64 ~= v57.state.lastInputIsGamepad then
            v57:setState({
                lastInputIsGamepad = v64
            });
        end;
    end;
    v57.titleDropDown = v31("Feature.Avatar.Action.EditProfilePicture", v57.props.overlayClosedCallback);
end;
v56.getInputBindings = function(v65)
    local l_avatarRoute_0 = v65.props.avatarRoute;
    local l_name_0 = l_avatarRoute_0.current.name;
    local v68 = {};
    if l_name_0 == v28.ItemDetails then
        return (v9.Dictionary.join(v68, {
            NavigateBack = v5.Input.onBegin(Enum.KeyCode.ButtonB, function()
                v42.closeFocusedScreen(v65.props.navigation);
            end), 
            OpenItemPrompt = v5.Input.onBegin(Enum.KeyCode.ButtonX, function()
                v65.props.openItemPrompt(v65.props.networking, v65.props.catalogAnalytics, v65.props.overlayClosedCallback, v65.props.navigation, l_avatarRoute_0);
            end, {
                key = "Feature.Catalog.Action.Buy"
            }), 
            OpenClosePeekView = if v55() then nil else v5.Input.onBegin(Enum.KeyCode.ButtonY, function()
                if not v65.props.itemDetailsExpanded then
                    v65.props.setItemDetailsPeekViewState(l_PeekViewState_0.Full);
                    return ;
                else
                    v65.props.setItemDetailsPeekViewState(l_PeekViewState_0.Brief);
                    return ;
                end;
            end, {
                key = not v65.props.itemDetailsExpanded and "Feature.Catalog.Action.OpenDetails" or "Feature.Catalog.Action.CloseDetails"
            }), 
            OpenCatalogContextMenu = v5.Input.onBegin(Enum.KeyCode.ButtonL3, function()
                v65.props.navigation.navigate(v28.CatalogContextMenu, {
                    itemId = l_avatarRoute_0.current.params.itemId, 
                    itemType = l_avatarRoute_0.current.params.itemType, 
                    onOverlayClosed = v65.props.overlayClosedCallback
                });
            end, {
                key = "Feature.Catalog.Action.ItemOptions"
            })
        }));
    else
        return (v9.Dictionary.join(v68, {
            NavUp = v5.Input.onBegin(Enum.KeyCode.ButtonB, function()
                v65.props.focusController.moveFocusTo(v65.topBarRef);
            end)
        }));
    end;
end;
v56.renderTopBar = function(v69)
    local l_isPortrait_0 = v69.props.isPortrait;
    return l_withLocalization_0({
        title = "Feature.Avatar.Action.EditProfilePicture"
    })(function(v71)
        return v3.createElement(v16.Container, {
            [v3.Ref] = v69.topBarRef, 
            NextSelectionDown = v69.emotesScrollViewRef, 
            titleText = v71.title, 
            transparentBackground = true, 
            hideSiteMessageBanner = l_isPortrait_0, 
            leftItem = v69.backButton, 
            centerItem = if not v69.props.alternateAvatarLandingScreenEnabled then v69.titleDropDown else nil, 
            useParentSizeForCenterItem = true
        });
    end);
end;
v56.render = function(v72)
    local l_bottomBarHeight_0 = v72.state.bottomBarHeight;
    local l_fetchingStatus_0 = v72.props.fetchingStatus;
    local v75 = v72.props.fullView == v37.UIFullView;
    local v76 = v72.props.fullView == v37.SceneFullView;
    return l_withLocalization_0({
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
    })(function(v77)
        return v3.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            defaultChild = v72.emotesScrollViewRef, 
            focusController = v72.props.focusController, 
            restorePreviousChildFocus = false, 
            [v3.Ref] = v72.ref, 
            inputBindings = v72:getInputBindings()
        }, {
            BoundInputsUpdater = v3.createElement(v33), 
            NavigationEventsLogger = v3.createElement(v34, {
                pageName = "ProfilePictureEditorEmotes"
            }), 
            LastInputTypeChangedConnection = v3.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = v72.lastInputTypeChangedCallback
            }), 
            AvatarExperienceView = v3.createElement(v30, {
                bottomBarEnabled = false, 
                allowAdaptiveScrolling = false, 
                changeViewFunction = v72.changeView, 
                isSceneFullView = v76, 
                isUIFullView = v75, 
                topBar = v72:renderTopBar(), 
                [v3.Ref] = v72.sceneUIContainerRef, 
                NextSelectionDown = v72.emotesScrollViewRef
            }, {
                GamepadFocusHandlerForPage = v3.createElement(v32, {
                    focusController = v72.props.focusController, 
                    captureFocusOnMount = true
                }), 
                LoadingStateContainer = v3.createElement(l_LoadingStateContainer_0, {
                    dataStatus = l_RetrievalStatus_0.fromRawValue(l_fetchingStatus_0), 
                    renderOnLoaded = function()
                        return v3.createFragment({
                            EmotesScrollView = v3.createElement(v50, {
                                baseRef = v72.emotesScrollViewRef, 
                                NextSelectionUp = v72.topBarRef, 
                                NextSelectionDown = v72.bottomBarRef, 
                                bottomBarHeight = l_bottomBarHeight_0
                            }), 
                            BottomBar = v72.renderBottomBar()
                        });
                    end, 
                    renderOnFailed = function()
                        return v72:renderOnFailed(v77);
                    end
                })
            })
        });
    end);
end;
v56.renderOnFailed = function(v78, v79)
    return v3.createElement(l_EmptyState_0, {
        NextSelectionUp = v78.topBarRef, 
        onActivated = v78.fetchPPEConfig, 
        text = v79.failedMessage
    });
end;
v56.didMount = function(v80)
    if v80.props.fetchingStatus == v18.NotStarted then
        v80.fetchPPEConfig();
    end;
end;
v56 = v27.connectTestVariables({
    alternateAvatarLandingScreenEnabled = v53.EnabledForUser
})((v35((l_RoactAppPolicy_0.connect(function(v81)
    return {
        shouldSkipLandingPage = v81.getShouldSkipAvatarLandingPage()
    };
end)((v4.connect(function(v82, _)
    return {
        fullView = v43(v82, v28.ProfilePictureEditorEmotes), 
        fetchingStatus = l_PerformFetch_0.GetStatus(v82, v51.PPEConfigFetchStatusKey), 
        itemDetailsExpanded = v82.AvatarExperience.Common.ItemDetailsExpanded, 
        isPortrait = v82.DeviceOrientation == l_DeviceOrientationMode_0.Portrait, 
        emoteAssetId = v82.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId, 
        tryOnItems = v82.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
    };
end, function(v84)
    return {
        fetchPPEConfig = function(v85)
            v84(v48(v85));
        end, 
        setFullView = function(v86, v87, v88)
            v84(v36(v86, v87, v88));
        end, 
        navigateIntoQuickMenu = function(v89, v90)
            v84(v39(v89, v90));
        end, 
        openItemPrompt = function(v91, v92, v93, v94, v95)
            v84(v40(v91, v92, v93, v94, v95));
        end, 
        setItemDetailsPeekViewState = function(v96)
            v84(v41(v96));
        end
    };
end)((l_RoactServices_0.connect({
    avatarExperienceAnalytics = v29, 
    profilePictureEditorAnalytics = v47, 
    networking = v13
})(v56)))))))));
return function(v97)
    local l_current_0 = v6.useRef(v5.createFocusController()).current;
    local v99 = v45(l_current_0);
    return v3.createElement("Frame", {
        [v3.Ref] = v44({
            overlayClosedCallback = v99
        }), 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, v6.createElement(v56, (v9.Dictionary.join(v97, {
        focusController = l_current_0, 
        overlayClosedCallback = v99
    }))));
end;
