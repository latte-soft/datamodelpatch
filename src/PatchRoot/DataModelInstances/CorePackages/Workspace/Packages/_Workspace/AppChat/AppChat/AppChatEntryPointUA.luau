local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppBlox);
local v3 = require(l_Parent_0.AppCommonLib);
local v4 = require(l_Parent_0.AppTabBarRodux);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.RoactServiceTags);
local v8 = require(l_Parent_0.RoactUtils);
local v9 = require(l_Parent_0.RobloxAppHooks);
local v10 = require(l_Parent_0.SocialCommon);
local v11 = require(l_Parent_0.UIBlox);
local v12 = require(l_Parent_0.UniversalAppPolicy);
local l_AppNotificationService_0 = v7.AppNotificationService;
local l_FullscreenPageWithSafeArea_0 = v2.FullscreenPageWithSafeArea;
local l_SetTabBarVisibleFromChat_0 = v4.Thunks.SetTabBarVisibleFromChat;
local l_Signal_0 = v3.Signal;
local l_dependencyArray_0 = v8.Hooks.dependencyArray;
local l_useAppPolicy_0 = v12.useAppPolicy;
local l_useCallback_0 = v6.useCallback;
local l_useDispatch_0 = v8.Hooks.RoactRodux.useDispatch;
local l_useEarlyIsFocused_0 = v8.Hooks.useEarlyIsFocused;
local l_useEffect_0 = v6.useEffect;
local l_useIsWideMode_0 = v10.Hooks.useIsWideMode;
local l_useMemo_0 = v6.useMemo;
local l_useNavigation_0 = v8.Hooks.useNavigation;
local l_useRoactService_0 = v9.useRoactService;
local l_useSelector_0 = v8.Hooks.RoactRodux.useSelector;
local l_useState_0 = v6.useState;
local l_useStyle_0 = v11.Core.Style.useStyle;
local v30 = require(l_script_FirstAncestor_0.AppChatEntryPoint);
local v31 = require(l_script_FirstAncestor_0.Components.EventReceivers.ChatEventReceiver);
local v32 = require(l_script_FirstAncestor_0.Components.ExternalNavigationHandler.Container);
local v33 = require(l_script_FirstAncestor_0.Actions.ToggleChatPaused);
local v34 = require(l_script_FirstAncestor_0.Hooks.useExternalNavigationByScreen);
local v35 = {};
AppChatEntryPointUA = function(v36)
    local v37 = v5.Dictionary.join(v35, v36);
    local v38 = l_useStyle_0();
    local v39 = l_useDispatch_0();
    local v40 = l_useEarlyIsFocused_0();
    local v41 = l_useIsWideMode_0();
    local v42 = l_useNavigation_0();
    local v44 = l_useAppPolicy_0(function(v43)
        return {
            shouldSystemBarUsuallyBePresent = v43.getShouldSystemBarUsuallyBePresent()
        };
    end);
    local v45, v46 = l_useState_0(0);
    local v47, v48 = v34();
    local v49 = l_useRoactService_0(l_AppNotificationService_0);
    local v50 = l_useMemo_0(function()
        return l_Signal_0.new();
    end);
    local v51 = l_useMemo_0(function()
        return v37.RobloxEventReceiver.new(v49);
    end);
    local v53 = l_useCallback_0(function(v52)
        v39(l_SetTabBarVisibleFromChat_0(v52 or v44.shouldSystemBarUsuallyBePresent));
    end, l_dependencyArray_0(v39, v44.shouldSystemBarUsuallyBePresent));
    local v54 = l_useMemo_0(function()
        return {};
    end);
    local v56 = l_useSelector_0(function(v55)
        return v55.NotificationBadgeCounts.TopBarNotificationIcon;
    end);
    l_useEffect_0(function()
        v39(v33(not v40));
    end, l_dependencyArray_0(v40, v39));
    return v6.createElement(v6.Fragment, {}, {
        FullscreenPageWithSafeArea = v6.createElement(l_FullscreenPageWithSafeArea_0, {
            BackgroundColor3 = v38.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v38.Theme.BackgroundDefault.Transparency, 
            includeStatusBar = true
        }, {
            AppChatEntryPoint = v6.createElement(v30, {
                setActiveConversationId = v46, 
                updateExternalNavigationForScreen = v48, 
                navigateToLuaAppPages = v54, 
                rnBypassActionSignal = v50, 
                notificationCount = v56, 
                setTabBarVisible = v53, 
                isVisible = v40, 
                wideMode = v41, 
                navigation = v42
            })
        }), 
        ExternalNavigationHandler = v6.createElement(v32, {
            navigationByScreen = v47
        }), 
        ChatEventReceiver = v6.createElement(v31, {
            robloxEventReceiver = v51, 
            rnBypassActionSignal = v50, 
            activeConversationId = tostring(v45)
        })
    });
end;
return AppChatEntryPointUA;
