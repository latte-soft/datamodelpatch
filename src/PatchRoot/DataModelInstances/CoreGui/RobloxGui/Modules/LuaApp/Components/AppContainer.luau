local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_CorePackages_0.Cryo);
local v7 = require(l_CorePackages_0.Roact);
local v8 = require(l_CorePackages_0.RoactRodux);
local v9 = require(l_CorePackages_0.UIBlox);
local v10 = require(l_Modules_0.Common.memoize);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v12 = require(l_Modules_0.LuaApp.Constants);
local v13 = require(l_Modules_0.LuaApp.LuaAppEvents);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_withStyle_0 = v9.Core.Style.withStyle;
local v16 = require(l_CorePackages_0.RoactNavigation);
local v17 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v17.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v17.FocusNavigableSurfaceIdentifierEnum;
local l_wrapNavigatorWith_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).wrapNavigatorWith;
local l_AppReadyHandler_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).AppReadyHandler;
local v22 = require(l_Modules_0.LuaApp.Navigation.getLegacyRoutes);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.makeNavigationStateLogger);
local v25 = require(l_Modules_0.LuaApp.Components.ToastV2);
local v26 = require(l_Modules_0.LuaApp.Components.CentralOverlay);
local v27 = require(l_Modules_0.LuaApp.Components.AppSystemBar);
local l_BadgeStates_0 = v9.App.Indicator.Enum.BadgeStates;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local v31 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v32 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v33 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsBottomBar);
local v34 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v35 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v36 = require(l_Modules_0.LuaApp.Enum.SystemBarVisibility);
local v37 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v38 = require(l_Modules_0.LuaApp.AppPage);
local v39 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v40 = require(l_Modules_0.LuaApp.Components.NavbarExperimentation);
local v41 = require(l_Modules_0.LuaApp.Components.FullscreenTitleBar);
local v42 = require(l_Modules_0.LuaApp.Components.UpdateRequiredPrompt);
local v43 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadBottomBar);
local v44 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceMountedAtStartup);
local l_withIsGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).withIsGamepadInput;
local v46 = require(l_Modules_0.LuaApp.Navigation.createLuaAppStackNavigator);
local v47 = require(l_Modules_0.LuaApp.Navigation.RootNavigator);
local v48 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_VRReadyWrapper_0 = v48.VRReadyWrapper;
local l_VRConstants_0 = v48.VRConstants;
local v51 = require(l_Modules_0.LuaApp.Components.Analytics.RouterAnalyticsReporterForRoactNav);
local v52 = require(l_Modules_0.LuaApp.AppPageProperties);
local l_SetTabBarVisible_0 = require(l_CorePackages_0.Workspace.Packages.AppTabBarRodux).Actions.SetTabBarVisible;
local l_CheckForUpdate_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppUpdate).Thunks.CheckForUpdate;
local l_AppUpdateService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUpdateService;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Experiments.NewChatTabExperimentation.default;
local l_EnteredChatFromEntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Actions.EnteredChatFromEntryPoint;
local l_ChatEntryPointNames_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames;
local v59 = require(l_Modules_0.LuaApp.Thunks.NavigateToRoute);
local v60 = require(l_Modules_0.LuaApp.Thunks.SetNavigationLocked);
local v61 = require(l_Modules_0.LuaApp.Actions.SetPlatform);
local v62 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v63 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v64 = require(l_Modules_0.LuaApp.Analytics.Events.luaPageLoad);
local v65 = require(l_Modules_0.LuaApp.Analytics.Events.luaPageUnload);
local v66 = require(l_Modules_0.LuaApp.Actions.ApplyRoactNavigationHistory);
local v67 = require(l_Modules_0.LuaApp.Navigation.wrapWithSwitchVisibility);
local v68 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v69 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v70 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v71 = require(l_Modules_0.Profile.Flags.ProfileIXPTest);
local v72 = require(l_Modules_0.AvatarExperience.Flags.AXAlternateLandingPageIXP);
local v73 = require(l_Modules_0.LuaApp.Components.CrossPlatformCompatibility.VRAppPointer);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v75 = require(l_Modules_0.LuaApp.GetIABottomBarItems);
local l_AppToastNotificationContainer_0 = require(l_CorePackages_0.Workspace.Packages.ToastNotification).AppToastNotificationContainer;
local v77 = require(l_Modules_0.LuaApp.Components.Common.AppLoadingSplashScreen);
local v78 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
local l_GameInviteModal_0 = v78.GameInviteModal;
local l_GameInviteConstants_0 = v78.GameInviteConstants;
local v81 = require(l_Modules_0.LuaApp.Components.Shell.ShellEventsContainer);
local v82 = {
    GetFStringLuaAppUnloadEventEnabledPageNames = require(l_Modules_0.LuaApp.Flags.GetFStringLuaAppUnloadEventEnabledPageNames), 
    UseGameDetailsPeekView = require(l_Modules_0.LuaApp.Flags.UseGameDetailsPeekView), 
    GetFFlagUpdateCheckOnLogin = require(l_Modules_0.LuaApp.Flags.GetFFlagUpdateCheckOnLogin), 
    GetFFlagAdjustVRFloor = v39.GetFFlagAdjustVRFloor, 
    GetFFlagLuaAppNavigationAnalytics = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppNavigationAnalytics), 
    GetFFlagEnableUniversalAppGameInviteUnification = v39.GetFFlagEnableUniversalAppGameInviteUnification, 
    FFlagUnifyNavigationGraph = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifyNavigationGraph, 
    GetFFlagEnableSponsoredAdsGameCarouselTooltip = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableSponsoredAdsGameCarouselTooltip), 
    FFlagEnableUniversalFocusNavigation = v39.FFlagEnableUniversalFocusNavigation, 
    GetFFlagMobileScrollToTopLogging = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagMobileScrollToTopLogging, 
    GetFFlagMoveUpdateCheckToUniversalApp = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagMoveUpdateCheckToUniversalApp, 
    GetFFlagUseUpdatedVNGAgreementsWorkflow = v39.GetFFlagUseUpdatedVNGAgreementsWorkflow, 
    FFlagLuaAppChartsPageRename = require(l_Modules_0.Personalization.Flags.FFlagLuaAppChartsPageRename)
};
local v83 = require(l_Modules_0.LuaApp.FlagSettings);
local v84 = game:DefineFastFlag("LuaAppEnableToastNotifications4", false);
local v85 = game:DefineFastFlag("LuaAppMakeRNViewNotSelectable", false);
local function _()
    if not _G.__TESTEZ_RUNNING_TEST__ then
        return l_UserInputService_0:GetPlatform();
    else
        return Enum.Platform.None;
    end;
end;
local v87 = if not _G.__TESTEZ_RUNNING_TEST__ then l_UserInputService_0:GetPlatform() else Enum.Platform.None;
local v88 = l_GuiService_0:isTenFootInterface();
local v89, v90 = v75();
local v91 = v24("AppContainer");
local v92 = v7.Component:extend("AppContainer");
local v93 = if not v82.GetFFlagLuaAppNavigationAnalytics() then os.clock() else nil;
if not v82.FFlagUnifyNavigationGraph then
    v92.updateRnBypassActionSignal = function(v94, v95)
        if v94._rnBypassActionHandle then
            v94._rnBypassActionHandle:disconnect();
            v94._rnBypassActionHandle = nil;
        end;
        if v95 then
            v94._rnBypassActionHandle = v95:connect(v94.processRnBypassAction);
        end;
    end;
end;
v92.initPageConstructors = function(v96)
    local v97, v98 = v22(v96.props.appPolicy);
    local l_TempRnSwitchNavigatorName_0 = v12.TempRnSwitchNavigatorName;
    local v100 = v83.GetDefaultAppPage();
    if not v90[v100] and v98[v100] ~= nil then
        l_TempRnSwitchNavigatorName_0 = v100;
    end;
    v96._rnAppContainerComponent = v16.createAppContainer((l_wrapNavigatorWith_0(v67((v46(v97, {
        initialRouteName = l_TempRnSwitchNavigatorName_0, 
        mode = v16.StackPresentationStyle.Overlay, 
        defaultNavigationOptions = function(v101)
            local l_navigation_0 = v101.navigation;
            local v103 = v52[l_navigation_0.state.routeName] or {};
            local v104 = not v103.renderUnderlyingPage and 1 or 0.3;
            if not ((((((((not v82.UseGameDetailsPeekView() or l_navigation_0.state.routeName ~= v38.GameDetail) and l_navigation_0.state.routeName ~= v37.ItemDetails) and l_navigation_0.state.routeName ~= v38.ProfilePeekView) and l_navigation_0.state.routeName ~= v38.SocialMessageToast) and l_navigation_0.state.routeName ~= v38.AccountSelectorPeekView) and l_navigation_0.state.routeName ~= v38.AccountSwitchingAddAccountPeekView) and l_navigation_0.state.routeName ~= v38.AvatarExperienceWrapperTransparent) and (not v82.GetFFlagEnableSponsoredAdsGameCarouselTooltip() or l_navigation_0.state.routeName ~= v38.SponsoredTooltipPeekView)) or l_navigation_0.state.routeName == v38.InfoPeekView then
                v104 = 1;
            end;
            return {
                overlayEnabled = true, 
                overlayTransparency = v104, 
                absorbInput = v103.absorbInput, 
                absorbInputSelectable = if not v85 then nil else false
            };
        end
    }))), l_AppReadyHandler_0)));
end;
v92.init = function(v105)
    v105.props.loggingProtocol:logEventOnce("app_container_init_begin");
    l_Logger_0:info("Initializing App Container");
    local l_store_0 = v105.props.store;
    local l_bottomBarAnalytics_0 = v105.props.bottomBarAnalytics;
    local v108 = nil;
    if not v82.GetFFlagLuaAppNavigationAnalytics() then
        local l_experienceEventReceiver_0 = v105.props.experienceEventReceiver;
        local v110 = v82.GetFStringLuaAppUnloadEventEnabledPageNames();
        v108 = v110 and #v110 > 0;
        if not (not v108 or not l_experienceEventReceiver_0) then
            l_experienceEventReceiver_0:onLaunched(function(v111)
                v65(v105.props.eventIngest, "AppRouter", v105.props.currentPage, v105.props.currentDetail, {
                    nextPage = "Experience", 
                    nextDetail = v111.placeId, 
                    timeOnPage = os.clock() - v93
                });
                v93 = os.clock();
            end);
            l_experienceEventReceiver_0:onLeft(function()
                v64(v105.props.eventIngest, "AppRouter", v105.props.name, v105.props.detail);
                v93 = os.clock();
            end);
        end;
    end;
    l_store_0:dispatch(v61(v87));
    if not v82.FFlagUnifyNavigationGraph then
        v105:initPageConstructors();
    end;
    if not v82.GetFFlagLuaAppNavigationAnalytics() then
        v105.sendPageChangeAnalytics = function(v112, v113, v114, v115)
            local l_eventIngest_0 = v105.props.eventIngest;
            v64(l_eventIngest_0, "AppRouter", v112, v113);
            if v108 then
                if v114 then
                    v65(l_eventIngest_0, "AppRouter", v114, v115, {
                        nextPage = v112, 
                        nextDetail = v113, 
                        timeOnPage = os.clock() - v93
                    });
                end;
                v93 = os.clock();
            end;
        end;
    end;
    if not v82.FFlagUnifyNavigationGraph then
        v105.connectRnBypassAction = function(v117)
            if #v105._navigationActionQueue ~= 0 then
                local l__navigationActionQueue_0 = v105._navigationActionQueue;
                v105._navigationActionQueue = {};
                for _, v120 in ipairs(l__navigationActionQueue_0) do
                    v117(v120);
                end;
            end;
            v105._rnBypassActionCallback = v117;
            return function()
                v105._rnBypassActionCallback = nil;
            end;
        end;
        v105._navigationActionQueue = {};
        v105.processRnBypassAction = function(v121)
            if v105._isMounted then
                if not v105._rnBypassActionCallback then
                    table.insert(v105._navigationActionQueue, v121);
                    return ;
                else
                    v105._rnBypassActionCallback(v121);
                    return ;
                end;
            else
                table.insert(v105._navigationActionQueue, v121);
                return ;
            end;
        end;
        v105.processNavigationStateChange = function(v122, v123, v124)
            v91(v122, v123, v124);
            if v105._isMounted then
                if v105.props.updateRoute then
                    v105.props.updateRoute(v123);
                end;
                v105.props.store:dispatch(v66(v123));
                return ;
            else
                return ;
            end;
        end;
    end;
    v105.bottomBarButtonActivated = function(v125, v126)
        local l_currentPage_0 = v105.props.currentPage;
        local l_selectedBottomBarItemIndex_0 = v105.props.selectedBottomBarItemIndex;
        if l_selectedBottomBarItemIndex_0 then
            local l_page_0 = v105.props.bottomBarItems[l_selectedBottomBarItemIndex_0].page;
            local v130 = l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab();
            if v125 == l_currentPage_0 then
                v13.ReloadPage:fire(v125);
            elseif v125 == v38.AvatarExperienceRoot then
                local _ = nil;
                v105.props.navigateToPage(if v105.props.shouldSkipLandingPage or v105.props.alternateAvatarLandingScreenEnabled then v37.Catalog else v38.AvatarExperienceRoot);
                if v126 then
                    v105.props.notificationService:ActionTaken(v126);
                end;
            elseif v130 and v125 == v38.Chat then
                v105.props.enteredChatFromEntryPoint(l_ChatEntryPointNames_0.SystemBar);
                v105.props.navigateToPage(v125);
                if v126 then
                    v105.props.notificationService:ActionTaken(v126);
                end;
            else
                v105.props.navigateToPage(v125);
                if v126 then
                    v105.props.notificationService:ActionTaken(v126);
                end;
            end;
            l_bottomBarAnalytics_0.ButtonActivated(v125, l_page_0);
            return ;
        else
            return ;
        end;
    end;
    v105.getBottomBarLayoutInfo = v10(function(v132, v133, _)
        local v135 = math.max(((v132.X - v133.left) - v133.right) - 600, 0);
        return {
            Background = {
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, -v133.left, 1, 0), 
                Size = UDim2.new(0, v132.X, 0, v133.bottom)
            }, 
            Padding = {
                PaddingLeft = UDim.new(0, v133.left + v135 / 2), 
                PaddingRight = UDim.new(0, v133.right + v135 / 2), 
                PaddingBottom = UDim.new(0, (math.max(v133.bottom - v12.BOTTOM_BAR_SIZE, 0)))
            }
        };
    end);
    if not v82.FFlagUnifyNavigationGraph then
        v105:updateRnBypassActionSignal(v105.props.rnBypassActionSignal);
    end;
    v105.props.loggingProtocol:logEventOnce("app_container_init_end");
end;
v92.didMount = function(v136)
    if not v82.FFlagUnifyNavigationGraph then
        v136._isMounted = true;
    end;
    local l_store_1 = v136.props.store;
    if not v82.GetFFlagLuaAppNavigationAnalytics() then
        local v138 = v82.GetFStringLuaAppUnloadEventEnabledPageNames();
        if v138 and #v138 > 0 then
            v93 = os.clock();
        end;
    end;
    if not v82.FFlagUnifyNavigationGraph then
        v136:updateRnBypassActionSignal(v136.props.rnBypassActionSignal);
    end;
    if not v82.GetFFlagLuaAppNavigationAnalytics() then
        local l_currentPage_1 = v136.props.currentPage;
        v136.sendPageChangeAnalytics(l_currentPage_1, v136.props.currentDetail);
        l_NotificationService_0:SwitchedToAppShellFeature(v52[l_currentPage_1].appShellReporterFeature or Enum.AppShellFeature.None);
    end;
    l_store_1:dispatch(v60(false));
end;
v92.willUnmount = function(v140)
    if not v82.FFlagUnifyNavigationGraph then
        v140._isMounted = false;
        v140:updateRnBypassActionSignal(nil);
    end;
end;
v92.willUpdate = function(v141, v142)
    local v143 = v52[v142.currentPage] or {};
    local v144 = nil;
    local l_tabBarVisibility_0 = v142.tabBarVisibility;
    if typeof(l_tabBarVisibility_0) == "function" then
        l_tabBarVisibility_0 = l_tabBarVisibility_0({
            formFactor = v142.formFactor
        });
    end;
    v144 = if l_tabBarVisibility_0 == v36.PolicyDependent then v141.props.shouldSystemBarUsuallyBePresent else l_tabBarVisibility_0 ~= v36.Hidden;
    if not v143.overridesAppRouterTabBarControl and v144 ~= v142.bottomBarVisible then
        v141.props.setTabBarVisible(v144);
    end;
end;
v92.didUpdate = function(v146, v147, _)
    if not v82.FFlagUnifyNavigationGraph and v147.rnBypassActionSignal ~= v146.props.rnBypassActionSignal then
        v146:updateRnBypassActionSignal(v146.props.rnBypassActionSignal);
    end;
    if not v82.GetFFlagLuaAppNavigationAnalytics() then
        local l_currentPage_2 = v146.props.currentPage;
        local l_currentDetail_0 = v146.props.currentDetail;
        local l_currentPage_3 = v147.currentPage;
        local l_currentDetail_1 = v147.currentDetail;
        if not (l_currentPage_2 == l_currentPage_3) or l_currentDetail_0 ~= l_currentDetail_1 then
            v146.sendPageChangeAnalytics(l_currentPage_2, l_currentDetail_0, l_currentPage_3, l_currentDetail_1);
            local v153 = v52[l_currentPage_2];
            l_NotificationService_0:SwitchedToAppShellFeature(v153 and v153.appShellReporterFeature or Enum.AppShellFeature.None);
        end;
    end;
    if not (((v82.GetFFlagMoveUpdateCheckToUniversalApp() or v147.userLoggedIn) or not v146.props.userLoggedIn) or not v82.GetFFlagUpdateCheckOnLogin()) then
        v146.props.checkForUpdate(v146.props.appUpdate, false, v146.props.analytics, nil, {
            ctx = "AppContainer"
        });
    end;
    if not ((not v146.props.userLoggedIn or not v146.props.appPolicy.getVNGFormRequired()) or v82.GetFFlagUseUpdatedVNGAgreementsWorkflow()) then
        v146.props.showVngForm();
    end;
end;
v92.render = function(v154)
    local l_screenSize_0 = v154.props.screenSize;
    local l_globalGuiInset_0 = v154.props.globalGuiInset;
    local l_bottomBarVisible_0 = v154.props.bottomBarVisible;
    local l_selectedBottomBarItemIndex_1 = v154.props.selectedBottomBarItemIndex;
    local l_bottomBarItems_0 = v154.props.bottomBarItems;
    local v160 = v88 and v154.props.isGamepadInput;
    local l_policyFullscreenTitleBar_0 = v154.props.policyFullscreenTitleBar;
    local _ = nil;
    local v163 = v7.createElement(v73);
    local v164 = nil;
    v164 = if not v82.FFlagUnifyNavigationGraph then v7.createElement(v154._rnAppContainerComponent, {
        externalDispatchConnector = v154.connectRnBypassAction, 
        onNavigationStateChange = v154.processNavigationStateChange
    }) else v7.createElement(v47, {
        navigation = v154.props.navigation
    });
    local v165 = if not v82.FFlagEnableUniversalFocusNavigation then v164 else v7.createElement(l_FocusNavigableSurfaceWrapper_0, {
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView
    }, v164);
    local v167 = v7.createElement(v7.Portal, {
        target = l_CoreGui_0
    }, {
        LuaAppScreenGui = l_withStyle_0(function(v166)
            return v7.createElement(l_VRReadyWrapper_0, {
                component = "ScreenGui", 
                props = {
                    Enabled = true, 
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    DisplayOrder = 1
                }, 
                vrProps = {
                    partSize = l_VRConstants_0.MainScreenSize, 
                    offset = if not v82.GetFFlagAdjustVRFloor() then CFrame.lookAt(l_VRConstants_0.MainScreenPosition, l_VRConstants_0.DefaultCameraPosition) else l_VRConstants_0.MainScreenPosition, 
                    virtualScreenSize = l_VRConstants_0.MainScreenResolution, 
                    panelName = "MainAppScreen", 
                    curvature = l_VRConstants_0.MainScreenCurvature, 
                    hidden = l_IsVRAppBuild_0() and v154.props.currentPage == v38.AvatarExperienceRoot, 
                    roundedCornersFrameColor = v166.Theme.BackgroundDefault.Color
                }
            }, {
                RNAppContainer = v165, 
                Reporter = v7.createElement(v51)
            });
        end)
    });
    local v168 = false;
    if v154.props.currentPage == v38.PurchaseRobux then
        v168 = v154.props.previousPage == v38.AvatarExperienceRoot;
    end;
    local v169 = false;
    if not (not (v154.props.currentPage ~= v38.AvatarExperienceRoot) or not l_bottomBarVisible_0) then
        v169 = not v168;
    end;
    local v170 = nil;
    if v82.GetFFlagEnableUniversalAppGameInviteUnification() then
        v170 = l_GameInviteModal_0;
    end;
    return v7.createElement("Folder", {}, {
        Toast = v7.createElement(v25, {
            displayOrder = v12.DisplayOrder.Toast
        }), 
        ToastNotification = if not v84 then nil else v7.createElement(l_AppToastNotificationContainer_0, {
            displayOrder = v12.DisplayOrder.Toast
        }), 
        GameInviteModal = if not v170 then nil else v7.createElement(v170, {
            displayOrder = v12.DisplayOrder.GameInviteModal, 
            renderLocation = l_GameInviteConstants_0.RenderLocation.UniversalApp
        }), 
        CentralOverlay = v7.createElement(v26, {
            includeStatusBar = l_bottomBarVisible_0, 
            displayOrder = v12.DisplayOrder.CentralOverlay
        }), 
        GamepadBottomBar = v160 and v7.createElement(v43, {
            displayOrder = v12.DisplayOrder.GamepadBottomBar
        }), 
        SystemBar = v7.createElement(v27, {
            isVisible = l_bottomBarVisible_0, 
            displayOrder = v12.DisplayOrder.SystemBar, 
            layoutInfo = v154.getBottomBarLayoutInfo(l_screenSize_0, l_globalGuiInset_0), 
            selectedIndex = l_selectedBottomBarItemIndex_1, 
            items = l_bottomBarItems_0, 
            onActivated = v154.bottomBarButtonActivated
        }), 
        RNBypassTree = v167, 
        AvatarExperienceMountedAtStartup = v7.createElement(v44, {
            store = v154.props.store, 
            shouldManageBackground = if not l_IsVRAppBuild_0() then nil else false
        }), 
        FullscreenTitleBar = not not l_policyFullscreenTitleBar_0 and v7.createElement(v41, {
            displayOrder = v12.DisplayOrder.FullscreenTitleBar
        }) or nil, 
        UpdateRequiredPrompt = v7.createElement(v42), 
        VRPointer = if not v154.props.use3DPanels then nil else v163, 
        AppLoadingSplashScreen = v7.createElement(v77), 
        ShellEventsContainer = if not v82.GetFFlagMobileScrollToTopLogging() then nil else v7.createElement(v81, {
            currentPage = v154.props.currentPage
        })
    });
end;
local v175 = v10(function(v171)
    if not (not (v40.isEnabled() or l_default_0.isEnabled()) and not v82.FFlagLuaAppChartsPageRename) then
        local v172, v173 = v75();
        v89 = v172;
        v90 = v173;
    end;
    local v174 = v6.List.join(v89);
    v174[v90[v38.Chat]].badgeCount = v171;
    return v174;
end);
v92 = l_withIsGamepadInput_0((l_RoactAppPolicy_0.connect(function(v176)
    return {
        appPolicy = v176, 
        policyFullscreenTitleBar = v176.getFullscreenTitleBarEnabled(), 
        shouldSystemBarUsuallyBePresent = v176.getShouldSystemBarUsuallyBePresent(), 
        systemBarPlacement = v176.getSystemBarPlacement(), 
        use3DPanels = v176.getUse3DPanels(), 
        shouldSkipLandingPage = v176.getShouldSkipAvatarLandingPage()
    };
end)((l_RoactServices_0.connect({
    notificationService = l_AppNotificationService_0, 
    networking = v31, 
    analytics = v32, 
    bottomBarAnalytics = v33, 
    eventIngest = if not v82.GetFFlagLuaAppNavigationAnalytics() then v34 else nil, 
    loggingProtocol = l_AppLogging_0, 
    appUpdate = l_AppUpdateService_0
})((v8.connect(function(v177, _)
    local l_history_0 = v177.Navigation.history;
    local v180 = l_history_0[#l_history_0];
    local v181 = v177.SocialTab.UnreadConversationCount or 0;
    local v182 = nil;
    v182 = (function(v183)
        for v184 = #v183, 1, -1 do
            local v185 = v52[v180[v184].name] or {};
            if v185.tabBarHidden then
                return v185.tabBarHidden;
            end;
        end;
        return v36.Visible;
    end)(v180);
    if v181 > 0 then
        v181 = l_BadgeStates_0.isEmpty;
    end;
    return {
        screenSize = v177.ScreenSize, 
        globalGuiInset = v177.GlobalGuiInset, 
        bottomBarVisible = v177.TabBarVisible, 
        selectedBottomBarItemIndex = v90[v180[1].name], 
        currentPage = v180[#v180].name, 
        previousPage = v180[math.max(#v180 - 1, 1)].name, 
        tabBarVisibility = v182, 
        bottomBarItems = v175(v181), 
        userLoggedIn = v177.AuthenticationStatus.status == v35.LOGGED_IN, 
        currentDetail = if not v82.GetFFlagLuaAppNavigationAnalytics() then v180[#v180].detail else nil, 
        formFactor = v177.FormFactor, 
        localUserId = v177.LocalUserId
    };
end, function(v186)
    return {
        navigateToPage = function(v187)
            v186(v59({
                {
                    name = v187
                }
            }));
        end, 
        setTabBarVisible = function(v188)
            v186(l_SetTabBarVisible_0(v188));
        end, 
        checkForUpdate = function(v189, v190, v191, v192, v193)
            v186(l_CheckForUpdate_0(v189, v190, v191, v192, v193));
        end, 
        showVngForm = function()
            v186(v69(v68.VngContactInfoFormWebviewPopup, {}, {
                DisableBackButtonClose = true
            }));
        end, 
        enteredChatFromEntryPoint = function(v194)
            v186(l_EnteredChatFromEntryPoint_0(v194));
        end
    };
end)(v92)))))));
if v82.FFlagUnifyNavigationGraph then
    v92 = v16.withNavigation(v92);
end;
return (v70.connectTestVariables({
    alternateAvatarLandingScreenEnabled = v72.EnabledForUser
})((v62.connectUserLayer({
    v63.SocialFriendsLayer
}, function(v195, _)
    return {
        luaAddFriendsPageEnabled = (v195[v63.SocialFriendsLayer] or {}).show_lua_add_friends_page == "True", 
        luaProfileEnabled = v71.experimentOrRolloutEnabled(v195)
    };
end)(v92))));
