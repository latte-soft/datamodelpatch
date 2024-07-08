local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_script_FirstAncestor_0.Common.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.RoactNavigation);
local l_withStyle_0 = v4.Style.withStyle;
local v7 = require(l_script_FirstAncestor_0.LuaApp.Enum.OverlayType);
local v8 = require(l_script_FirstAncestor_0.LuaApp.Services.RoactAnalytics);
local v9 = require(l_script_FirstAncestor_0.LuaApp.Services.AppEventIngestService);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_Contexts_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Contexts;
local v12 = require(l_script_FirstAncestor_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v13 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local v14 = require(l_CorePackages_0.Workspace.Packages.FriendsLanding);
local l_EntryPoint_0 = v14.EntryPoint;
local l_EnumScreens_0 = v14.EnumScreens;
local v17 = require(l_script_FirstAncestor_0.LuaApp.Navigation.AndroidBackButtonNavigationHandler.Container);
local v18 = require(script.Parent.isRootRouteInRN);
local v19 = require(l_script_FirstAncestor_0.LuaApp.Components.Players.PlayerSearch);
local _ = require(l_script_FirstAncestor_0.Profile.Flags.ProfileIXPTest);
local v21 = require(l_CorePackages_0.Cryo);
local v22 = require(l_script_FirstAncestor_0.LuaApp.Experiment.RoactAppExperiment);
local v23 = require(l_script_FirstAncestor_0.LuaApp.Experiment.AppUserLayers);
local l_UniversalAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy;
local _ = require(l_CorePackages_0.Workspace.Packages.ProfileQRCode);
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local v27 = require(l_script_FirstAncestor_0.Common.memoize);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local l_RobloxEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver;
local l_llama_0 = require(l_CorePackages_0.LuaSocialLibrariesDeps).llama;
local l_OffPlatformFriendRequestsIXP_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Flags.OffPlatformFriendRequestsIXP;
local l_FFlagEnableFriendsLandingControllerBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableFriendsLandingControllerBar;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v37 = require(l_script_FirstAncestor_0.LuaApp.Constants);
local v38 = require(script.Parent.Parent.utils.formatUser);
local v39 = v2.PureComponent:extend("FriendsLandingUniversalAppWrapper");
local v40 = game:DefineFastFlag("FriendsLandingAllowNavParamsUAR", false);
v39.defaultProps = {
    wideMode = false
};
v39.init = function(v41)
    v41.robloxEventReceiver = l_RobloxEventReceiver_0.new(v41.props.notificationService);
    v41.navigateDownToFriendRequests = function()
        v41.props.navigateDownToFriendRequests();
    end;
    v41.viewUserProfile = function(v42, v43)
        if v43 then
            local v44 = v43.profilePeekViewProps or {};
            local v45 = v43.contextualMenuProps or {};
            v41.props.navigateToUserInfo(v42, {
                contextualMenuProps = l_llama_0.Dictionary.join(v45, {
                    user = if not v45.user then {} else v38(v45.user)
                }), 
                profilePeekViewProps = l_llama_0.Dictionary.join(v44, {
                    resetPeekView = true, 
                    source = v43.source
                }), 
                entryPoint = v43.entryPoint, 
                openJoinable = v43.openJoinable, 
                userInGame = v43.userInGame
            });
        end;
    end;
    v41.navigateToLuaAppPages = {
        [l_EnumScreens_0.FriendFinder] = v41.navigateDownToFriendRequests, 
        [l_EnumScreens_0.ViewUserProfile] = v41.viewUserProfile, 
        [l_EnumScreens_0.LearnMore] = if not not v41.props.contactImporterAndPYMKEnabled and v41.props.isContactImporterPolicyEnabled or v41.props.isLocalUserSoothsayer then v41.props.openLearnMoreLink else nil, 
        [l_EnumScreens_0.ProfileQRCode] = function()
            v41.props.navigateTo3DQRCodePage({
                source = l_Contexts_0.AddFriends
            });
        end, 
        [l_EnumScreens_0.SearchPage] = if not l_FFlagEnableFriendsLandingControllerBar_0 then nil else function()
            v41.props.navigation.navigate(v13.SearchPage, {
                defaultSearchType = v37.SearchTypes.Players
            });
        end, 
        [l_EnumScreens_0.AmpWizardContainer] = v41.props.openAmpWizardContainer
    };
    v41.luaAppPages = {
        playerSearchPage = v19
    };
    v41.isAndroidBackButtonHandlerDisabled = function()
        local l_currentAppPage_0 = v41.props.currentAppPage;
        local v47 = true;
        if l_currentAppPage_0 ~= v13.GameDetail then
            v47 = true;
            if l_currentAppPage_0 ~= v13.ShareGameToChat then
                v47 = true;
                if l_currentAppPage_0 ~= v13.ProfilePeekView then
                    v47 = true;
                    if l_currentAppPage_0 ~= v13.AvatarExperienceWrapperTransparent then
                        v47 = true;
                        if v41.props.centralOverlayType ~= v7.PeopleList then
                            v47 = l_currentAppPage_0 == v13.AvatarExperienceWrapper;
                        end;
                    end;
                end;
            end;
        end;
        return v47;
    end;
    v41.renderAndroidBackButtonNavigationHandler = function(v48)
        return function(v49)
            return v2.createElement(v17, {
                canGoBackInRN = not v18(v49.state), 
                navigateBackInRN = v49.pop, 
                disabled = v48
            });
        end;
    end;
    v41.getLoadingTimeInfo = function()
        return v41.props.navigateToFriendsLandingEventStart;
    end;
    v41.navigationAppContainer = v5.createAppContainer(l_EntryPoint_0);
    v41.renderFriendsLanding = v41.props.renderFriendsLanding or v27(function(v50, v51, v52, v53, v54)
        return v2.createElement(v41.navigationAppContainer, {
            exitFriendsLanding = v50, 
            navigateToLuaAppPages = v51, 
            isLuaProfilePageEnabled = true, 
            wideMode = v52, 
            luaAppPages = v53, 
            logger = l_Logger_0, 
            renderAndroidBackButtonNavigationHandler = v41.renderAndroidBackButtonNavigationHandler(v54), 
            debug_willUnmount = v41.props.debug_entryPointWillUnmount, 
            entryPage = v41.props.entryPage, 
            luaAddFriendsPageEnabled = v41.props.luaAddFriendsPageEnabled, 
            robloxEventReceiver = v41.robloxEventReceiver, 
            getLoadingTimeInfo = v41.getLoadingTimeInfo, 
            contactImporterAndPYMKEnabled = not not v41.props.contactImporterAndPYMKEnabled and v41.props.isContactImporterPolicyEnabled or v41.props.isLocalUserSoothsayer, 
            contactImporterExperimentVariant = v41.props.contactImporterExperimentVariant, 
            diagService = v41.props.roactAnalytics.Diag, 
            eventIngestService = v41.props.eventIngestService, 
            openProfilePeekView = v41.props.openProfilePeekView, 
            openPlayerContextualMenu = v41.props.openPlayerContextualMenu, 
            passedNavParams = if not v40 then nil else v41.props.passedNavParams
        });
    end);
end;
v39.render = function(v55)
    return l_withStyle_0(function(_)
        return v2.createElement(v12, {
            BackgroundColor3 = v55.props.BackgroundColor, 
            BackgroundTransparency = v55.props.BackgroundTransparency, 
            useFullScalePage = v55.props.useFullScalePage, 
            includeStatusBar = true
        }, {
            FriendsLanding = v55.renderFriendsLanding(v55.props.navigateBackInAppRoute, v55.navigateToLuaAppPages, v55.props.wideMode, v55.luaAppPages, v55.isAndroidBackButtonHandlerDisabled())
        });
    end);
end;
v39 = l_RoactServices_0.connect({
    roactAnalytics = v8, 
    eventIngestService = v9
})((l_UniversalAppPolicy_0.connect(function(v57)
    return {
        isContactImporterPolicyEnabled = v57.getContactImporterEnabled()
    };
end)((v3.connect(function(v58, _)
    return {
        centralOverlayType = v58.CentralOverlay.OverlayType
    };
end, nil)((v22.connectUserLayer({
    v23.SocialFriendsLayer
}, function(v60, _)
    return {
        luaAddFriendsPageEnabled = (v60[v23.SocialFriendsLayer] or {}).show_lua_add_friends_page == "True", 
        contactImporterAndPYMKEnabled = l_OffPlatformFriendRequestsIXP_0.experimentOrRolloutEnabled(v60), 
        contactImporterExperimentVariant = l_OffPlatformFriendRequestsIXP_0.getExperimentVariant(v60)
    };
end)(v39)))))));
return function(v62)
    local v63 = l_useDesignTokens_0();
    local v64 = l_useUiModeInfo_0();
    local v65 = nil;
    if l_FFlagEnableFriendsLandingControllerBar_0 then
        v65 = l_useNavigation_0();
    end;
    return v2.createElement(v39, v21.Dictionary.join(v62, {
        BackgroundColor = v63.LuaApps.App.Page.BackgroundColor, 
        BackgroundTransparency = v63.LuaApps.App.Page.BackgroundTransparency, 
        navigation = v65, 
        useFullScalePage = v64.uiMode == l_UiMode_0.TenFoot
    }, (l_useNavigationProps_0(function(_, v67)
        return {
            navigateToFriendsLandingEventStart = v67.navigateToFriendsLandingEventStart
        };
    end))));
end;
