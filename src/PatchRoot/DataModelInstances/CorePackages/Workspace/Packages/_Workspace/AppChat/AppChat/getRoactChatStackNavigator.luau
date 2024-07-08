local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.RoactNavigation);
local _ = require(l_script_FirstAncestor_0.types);
local v6 = game:DefineFastFlag("AppChatExitResetActiveConversation", false);
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableAppChatTabBarVisibilityPrevention);
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableNewChatTabExperimentAndroidBackButtonFix);
local function v9(v10)
    local v11 = v10.routes and v10.routes[v10.index];
    if not v11 then
        return v10.params;
    else
        return v9(v11);
    end;
end;
local function v12(v13)
    local l_state_0 = v13.state;
    local v15 = l_state_0.routes and l_state_0.routes[l_state_0.index];
    if not v15 or not v15.routes then
        return v4.getActiveChildNavigationOptions(v13);
    else
        return v12((v13.getChildNavigation(v15.key)));
    end;
end;
local function _(v16)
    if not v16 then
        return nil;
    elseif not v16.conversation then
        return v16.conversationId;
    else
        return v16.conversation.id;
    end;
end;
return function(v18, v19, v20, v21)
    local v22 = v3.PureComponent:extend("RoactChatStackNavigator");
    v22.defaultProps = {
        navigation = nil, 
        parameters = nil, 
        setActiveConversationId = function()
        end, 
        setBackButtonEnabled = function()
        end, 
        setTabBarVisible = function()
        end, 
        notificationCount = 0
    };
    v22.init = function(v23)
        v23.backButtonConnection = nil;
        v23.onBackButtonPressed = function()
            local l_navigation_0 = v23.props.navigation;
            local l_state_1 = l_navigation_0.state;
            local v26 = l_state_1.routes and l_state_1.routes[l_state_1.index];
            local v27 = if not not v26 and v26.routes then v12((l_navigation_0.getChildNavigation(v26.key))) else v4.getActiveChildNavigationOptions(l_navigation_0);
            if not v19 or not v27.isRoot then
                v23.props.navigation.pop();
            else
                v23.props.navigation.navigate(v2.EmptyConversation);
                v19();
                if not ((not v8() or not v21) or not v23.props.chatIsVisible) then
                    v21.showExitDialog();
                    return ;
                end;
            end;
        end;
    end;
    v22.willUpdate = function(v28, v29)
        local l_state_2 = v28.props.navigation.state;
        local v31 = l_state_2.routes and l_state_2.routes[l_state_2.index];
        local v32 = if not v31 then l_state_2.params else v9(v31);
        local l_state_3 = v29.navigation.state;
        local v34 = l_state_3.routes and l_state_3.routes[l_state_3.index];
        l_state_2 = if not v34 then l_state_3.params else v9(v34);
        l_state_3 = if not v32 then nil else if v32.conversation then v32.conversation.id else v32.conversationId;
        v31 = if not l_state_2 then nil else if l_state_2.conversation then l_state_2.conversation.id else l_state_2.conversationId;
        if l_state_3 ~= v31 then
            v28.props.setActiveConversationId(v31);
        end;
        if not v7() or v29.chatIsVisible then
            local l_navigation_1 = v29.navigation;
            local l_state_4 = l_navigation_1.state;
            local v37 = l_state_4.routes and l_state_4.routes[l_state_4.index];
            v34 = if not not v37 and v37.routes then v12((l_navigation_1.getChildNavigation(v37.key))) else v4.getActiveChildNavigationOptions(l_navigation_1);
            if v34 then
                if v34.backButtonEnabled ~= nil then
                    v28.props.setBackButtonEnabled(v34.backButtonEnabled);
                end;
                if v34.tabBarVisible ~= nil then
                    v28.props.setTabBarVisible(v34.tabBarVisible);
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
    v22.didMount = function(v38)
        if not (not v20 or not v19) then
            v38.backButtonConnection = v20:connect(v38.onBackButtonPressed);
        end;
        local l_parameters_0 = v38.props.parameters;
        local v40 = l_parameters_0 and l_parameters_0.conversationId;
        if v40 then
            v38.props.navigation.navigate(v2.ChatConversation, {
                conversationId = v40
            });
        end;
    end;
    v22.willUnmount = function(v41)
        if v6 then
            v41.props.setActiveConversationId(nil);
        end;
        if v41.backButtonConnection then
            v41.backButtonConnection:disconnect();
        end;
    end;
    v22.render = function(v42)
        return v3.createElement(v18, {
            navigation = v42.props.navigation
        });
    end;
    v22.router = v18.router;
    return v22;
end;
