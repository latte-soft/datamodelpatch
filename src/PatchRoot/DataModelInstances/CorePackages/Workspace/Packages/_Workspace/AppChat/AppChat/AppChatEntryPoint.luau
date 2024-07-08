local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.types);
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v6 = require(l_script_FirstAncestor_0.Logger);
local v7 = require(l_script_FirstAncestor_0.getRoactChatStackNavigator);
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v9 = nil;
local v10 = nil;
if not l_default_0.isEnabled() then
    v9 = require(l_script_FirstAncestor_0.Navigators.Compact.rootNavigator);
    v10 = require(l_script_FirstAncestor_0.Navigators.Wide.rootNavigator);
end;
local v11 = require(l_script_FirstAncestor_0.LegacyAnalytics.AnalyticsProvider);
local v12 = require(l_script_FirstAncestor_0.TopBarContext);
local v13 = require(l_script_FirstAncestor_0.LuaAppNavigationContextProvider);
local l_SetTabBarVisible_0 = require(l_Parent_0.AppTabBarRodux).Actions.SetTabBarVisible;
local v15 = require(l_script_FirstAncestor_0.Analytics.RoactChatAnalyticsProvider);
local v16 = require(l_Parent_0.React);
local v17 = require(l_Parent_0.RoactNavigation);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v16.memo;
local v21 = require(l_script_FirstAncestor_0.Hooks.useAppPolicy);
local l_useCallback_0 = v16.useCallback;
local v23 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v16.useEffect;
local l_useRef_0 = v16.useRef;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v16.useState;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v30 = require(l_script_FirstAncestor_0.Conversations.Thunks.createConversation);
local v31 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v32 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local v33 = require(l_script_FirstAncestor_0.Conversations.Thunks.getUnfilteredThreadsEligibility);
local v34 = require(script.Parent.EnumScreens);
local v35 = require(l_script_FirstAncestor_0.Actions.EnteredChatFromEntryPoint);
local v36 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableStandaloneAppChat);
local v37 = require(l_script_FirstAncestor_0.Conversations.Thunks.FetchInitialChatData);
local v38 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchChatMetadata);
local v39 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v40 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableAppChatTabBarVisibilityPrevention);
local v41 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableNewChatTabExperimentAndroidBackButtonFix);
local v42 = require(l_script_FirstAncestor_0.Flags.getFFlagHideNotificationIconForVR);
local v43 = {
    logger = l_Logger_0, 
    navigateToLuaAppPages = nil, 
    parameters = nil, 
    rnBypassActionSignal = nil, 
    setActiveConversationId = nil, 
    setBackButtonEnabled = nil, 
    setTabBarVisible = function()
    end, 
    wideMode = false, 
    notificationCount = 0, 
    navigateToRootStack = nil, 
    androidBackButtonSignal = nil
};
AppChatEntryPoint = function(v44)
    local v45 = v3.Dictionary.join(v43, v44);
    if l_default_0.isEnabled() then
        v9 = require(l_script_FirstAncestor_0.Navigators.Compact.rootNavigator);
        v10 = require(l_script_FirstAncestor_0.Navigators.Wide.rootNavigator);
    end;
    local v47 = l_useSelector_0(l_useCallback_0(function(v46)
        return v46.LocalUserId;
    end, {})) or v45.localUserId;
    local v49 = l_useSelector_0(l_useCallback_0(function(v48)
        return v48.GlobalGuiInset;
    end, {})) or {
        bottom = 0
    };
    local v51 = l_useSelector_0(l_useCallback_0(function(v50)
        return v50.ChatAppReducer.LastEntryPoint;
    end, {}));
    local v52 = l_useDispatch_0();
    if v36() then
        local v53 = l_useCallback_0(function()
            if not v32() then
                v52(v37);
                return ;
            else
                v52(v38());
                return ;
            end;
        end, l_dependencyArray_0(v52));
        local l_v53_0 = v53 --[[ copy: 6 -> 27 ]];
        l_useEffect_0(function()
            l_v53_0();
        end, l_dependencyArray_0(v53));
    end;
    if v39() then
        l_useEffect_0(function()
            v52(v33());
        end, l_dependencyArray_0(v52, v47));
    end;
    local v55 = nil;
    if v40() then
        v55 = v23();
    end;
    local v56, v57 = l_useState_0({});
    local v58 = l_useRef_0(v17.createAppContainer(v7(not not v45.wideMode and v10 or v9, v45.navigateToRootStack, v45.androidBackButtonSignal, if not v41() then nil else v45.androidBackButtonConnection)));
    assert(v58.current, "RoactNavigation chat component must be defined");
    local v59 = l_useRef_0(false);
    local v60 = l_useRef_0(nil);
    local v61 = l_useRef_0(function(...)
    end);
    l_useEffect_0(function()
        if v45.logger then
            v6:setParent(v45.logger);
        end;
    end, l_dependencyArray_0(v45.logger));
    local v63 = l_useCallback_0(function(v62)
        if v59.current then
            if v61.current then
                v61.current(v62);
            end;
            return ;
        else
            return ;
        end;
    end, l_dependencyArray_0(v59, v61));
    local v65 = l_useCallback_0(function(v64)
        return v17.Actions.navigate({
            routeName = v34.ChatConversation, 
            params = {
                conversationId = v64
            }
        });
    end, {});
    local v67 = l_useCallback_0(function(v66)
        return v52(v30("one_to_one", {
            v66
        }));
    end, l_dependencyArray_0(v52));
    local v69 = l_useCallback_0(function(v68)
        return v52(v31.StartOneToOneConversation.API(v68));
    end, l_dependencyArray_0(v52));
    local v79 = l_useCallback_0(function(v70)
        v61.current = v70;
        if v45.updateExternalNavigationForScreen then
            local l_updateExternalNavigationForScreen_0 = v45.updateExternalNavigationForScreen;
            l_updateExternalNavigationForScreen_0(function(v72)
                local v73 = v72 and v72.conversationId;
                if not v73 then
                    local v74 = v72 and v72.userId;
                    if v74 then
                        spawn(function()
                            if not v32() then
                                v69(v74):andThen(function(v75)
                                    v70(v65(v75.responseBody.conversation.id));
                                end):catch(function()
                                end);
                                return ;
                            else
                                v67(v74):andThen(function(v76)
                                    v70(v65(v76.id));
                                end):catch(function(v77)
                                    warn((("Error in CreateConversation request before navigate to conversation. error: %*"):format(v77)));
                                end);
                                return ;
                            end;
                        end);
                        return ;
                    else
                        return ;
                    end;
                else
                    v70(v65(v73));
                    return ;
                end;
            end, v34.ChatConversation);
            if v32() then
                l_updateExternalNavigationForScreen_0(function(v78)
                    v70(v17.Actions.navigate({
                        routeName = v34.ChatLanding, 
                        params = v78
                    }));
                    if v45.wideMode then
                        v70(v17.Actions.navigate({
                            routeName = v34.EmptyConversation
                        }));
                    end;
                end, v34.ChatLanding);
            end;
            return function()
                if v32() then
                    l_updateExternalNavigationForScreen_0(nil, v34.ChatLanding);
                end;
                l_updateExternalNavigationForScreen_0(nil, v34.ChatConversation);
                v61.current = nil;
            end;
        else
            return function()
                v61.current = nil;
            end;
        end;
    end, l_dependencyArray_0(v61));
    local v81 = l_useCallback_0(function(v80)
        v2.isType(v80, "string", "screen");
        return v56[v80] or {};
    end, l_dependencyArray_0(v56));
    local v85 = l_useCallback_0(function(v82, v83)
        v2.isType(v82, "string", "screen");
        v2.isType(v83, "table", "state");
        v57(function(v84)
            return v3.Dictionary.join(v84, {
                [v82] = v3.Dictionary.join(v84[v82] or {}, v83)
            });
        end);
    end, {});
    local v87 = l_useCallback_0(function(v86)
        if v60.current then
            v60.current:disconnect();
            v60.current = nil;
        end;
        if v86 then
            v60.current = v86:connect(v63);
        end;
    end, l_dependencyArray_0(v60));
    l_useEffect_0(function()
        v59.current = true;
        v87(v45.rnBypassActionSignal);
        return function()
            v59.current = false;
            v87(nil);
            v52(v35());
        end;
    end, {});
    l_useEffect_0(function()
        v87(v45.rnBypassActionSignal);
    end, l_dependencyArray_0(v45.rnBypassActionSignal));
    l_useEffect_0(function()
        if not v3.isEmpty(v56) then
            v57({});
        end;
    end, l_dependencyArray_0(v45.wideMode));
    local v89 = v21(function(v88)
        return v88.getChatHeaderSearch();
    end);
    local v91 = v21(function(v90)
        return v90.getChatHeaderCreateChatGroup();
    end);
    local v93 = v21(function(v92)
        return v92.getChatHeaderNotifications() and (not v42() or v92.getWebViewSupport());
    end);
    local v94 = l_useStyle_0();
    local v95 = nil;
    if not (not l_default_0.isEnabled() or not l_default_0:getConnectTabLeadsToChatTab()) then
        v95 = l_useCallback_0(function(v96)
            v52(l_SetTabBarVisible_0(v96));
        end, l_dependencyArray_0(v52));
    end;
    local v97 = v16.createElement(v58.current, {
        externalDispatchConnector = v79, 
        parameters = v45.parameters, 
        setActiveConversationId = v45.setActiveConversationId, 
        setBackButtonEnabled = v45.setBackButtonEnabled, 
        setTabBarVisible = if not l_default_0.isEnabled() then v45.setTabBarVisible else v95, 
        chatIsVisible = v55, 
        screenProps = {
            navigateToLuaAppPages = v45.navigateToLuaAppPages, 
            topBarHeight = math.max(l_UserInputService_0.NavBarSize.Y, 56), 
            wideMode = v45.wideMode, 
            isVisible = v45.isVisible, 
            getScreenTopBar = v81, 
            setScreenTopBar = v85, 
            notificationCount = v45.notificationCount, 
            topBarShowSearch = v89, 
            topBarShowCreateChatGroup = v91, 
            topBarShowNotifications = v93, 
            navigateToRootStack = v45.navigateToRootStack, 
            navigateToAddFriends = if not l_default_0.isEnabled() then nil else v45.navigateToAddFriends
        }
    });
    if not (not l_default_0.isEnabled() and not v39()) then
        v97 = v16.createElement(v13, {
            navigateToLuaAppPages = v45.navigateToLuaAppPages, 
            dispatch = if not v39() then nil else v52
        }, {
            navigation = v97
        });
    end;
    return v16.createElement(v15, {
        entryPoint = v51
    }, {
        (v16.createElement(v11, {
            localUserId = v47, 
            entryPoint = v51
        }, {
            v16.createElement(v12.Provider, {
                value = v3.Dictionary.join(v56, {
                    getScreenTopBar = v81, 
                    setScreenTopBar = v85
                })
            }, {
                navigation = v97, 
                BottomInsetBackground = if v49.bottom > 0 then v16.createElement("Frame", {
                    BackgroundColor3 = v94.Theme.NavigationBar.Color, 
                    BackgroundTransparency = v94.Theme.NavigationBar.Transparency, 
                    BorderSizePixel = 0, 
                    Position = UDim2.new(0, 0, 1, 0), 
                    Size = UDim2.new(1, 0, 0, v49.bottom), 
                    ZIndex = 3
                }) else nil
            })
        }))
    });
end;
return l_memo_0(AppChatEntryPoint);
