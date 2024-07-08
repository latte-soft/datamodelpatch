local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.LuauPolyfill);
local l_console_0 = v3.console;
local l_Object_0 = v3.Object;
local v6 = require(l_Parent_0.NavigationActions);
local v7 = require(l_Parent_0.Events);
local v8 = require(l_Parent_0.views.NavigationContext);
local v9 = require(l_Parent_0.getNavigation);
local l_assert_0 = assert;
local l_urlToPathAndParams_0 = require(l_Parent_0.routers.pathUtils).urlToPathAndParams;
local function _(v12)
    return not v12.navigation;
end;
local function v19(v14)
    if v14.persistenceKey then
        warn("You passed persistenceKey prop to a navigator. " .. "The persistenceKey prop was replaced by a more flexible persistence mechanism, " .. "please see the navigation state persistence docs for more information. " .. "Passing the persistenceKey prop is a no-op.");
    end;
    if v14.navigation then
        local v15 = l_Object_0.assign(table.clone(v14), {
            navigation = l_Object_0.None, 
            screenProps = l_Object_0.None, 
            persistNavigationState = l_Object_0.None, 
            loadNavigationState = l_Object_0.None, 
            externalDispatchConnector = l_Object_0.None
        });
        if next(v15) ~= nil then
            error("This navigator has both navigation and container props, so it is " .. ("unclear if it should own its own state. Remove props: %q "):format(table.concat(l_Object_0.keys(v15), ", ")) .. "if the navigator should get its state from the navigation prop. If the " .. "navigator should maintain its own state, do not pass a navigation prop.");
        end;
        local l_persistNavigationState_0 = v14.persistNavigationState;
        local l_loadNavigationState_0 = v14.loadNavigationState;
        local v18;
        if l_persistNavigationState_0 == nil then
            v18 = true;
            if not (l_loadNavigationState_0 ~= nil) then
                goto label0;
            end;
        end;
        v18 = false;
        if type(l_persistNavigationState_0) == "function" then
            v18 = type(l_loadNavigationState_0) == "function";
        end;
        ::label0::;
        l_assert_0(v18, "both persistNavigationState and loadNavigationState must either be undefined, or be functions");
        return ;
    else
        return ;
    end;
end;
local v20 = 0;
return {
    createAppContainer = function(v21, v22)
        local v23 = false;
        if type(v21) == "table" then
            v23 = v21.router ~= nil;
        end;
        l_assert_0(v23, "AppComponent must be a navigator or a stateful Roact component with a 'router' field");
        v23 = v2.Component:extend((string.format("NavigationContainer(%s)", (tostring(v21)))));
        v23.router = v21.router;
        v23.getDerivedStateFromProps = function(v24)
            v19(v24);
            return nil;
        end;
        v23.init = function(v25)
            v19(v25.props);
            v25._actionEventSubscribers = {};
            v25._initialAction = v6.init();
            local v26 = nil;
            if not (not v25:_isStateful() or v25.props.loadNavigationState) then
                v26 = v21.router.getStateForAction(v25._initialAction);
            end;
            v25.state = {
                nav = v26
            };
        end;
        v23._updateExternalDispatchConnector = function(v27)
            if v27._disconnectExternalDispatch then
                v27._disconnectExternalDispatch();
                v27._disconnectExternalDispatch = nil;
            end;
            local l_externalDispatchConnector_0 = v27.props.externalDispatchConnector;
            if l_externalDispatchConnector_0 ~= nil then
                v27._disconnectExternalDispatch = l_externalDispatchConnector_0(function(...)
                    if not v27._isMounted then
                        return false;
                    else
                        return v27:dispatch(...);
                    end;
                end);
            end;
        end;
        v23._renderLoading = function(v29)
            return v29.props.renderLoading and v29.props.renderLoading();
        end;
        v23._isStateful = function(v30)
            return not v30.props.navigation;
        end;
        v23._handleOpenURL = function(v31, v32)
            local l_url_0 = v32.url;
            local l_enableURLHandling_0 = v31.props.enableURLHandling;
            local l_uriPrefix_0 = v31.props.uriPrefix;
            if l_enableURLHandling_0 == false then
                return ;
            else
                local v36 = l_urlToPathAndParams_0(l_url_0, l_uriPrefix_0);
                if v36 then
                    local v37 = v21.router.getActionForPathAndParams(v36.path, v36.params);
                    if v37 then
                        v31:dispatch(v37);
                    end;
                end;
                return ;
            end;
        end;
        v23._onNavigationStateChange = function(v38, v39, v40, v41)
            local l_onNavigationStateChange_0 = v38.props.onNavigationStateChange;
            if (not (l_onNavigationStateChange_0 == nil) or not v38:_isStateful()) or not _G.REACT_NAV_LOGGING then
                if type(l_onNavigationStateChange_0) == "function" then
                    l_onNavigationStateChange_0(v39, v40, v41);
                end;
                return ;
            else
                l_console_0.group("Navigation Dispatch: ");
                l_console_0.log("Action: ", v41);
                l_console_0.log("New State: ", v40);
                l_console_0.log("Last State: ", v39);
                l_console_0.groupEnd();
                return ;
            end;
        end;
        v23.didUpdate = function(v43, v44)
            if v43._navState == v43.state.nav then
                v43._navState = nil;
            end;
            if v43.props.externalDispatchConnector ~= v44.externalDispatchConnector then
                v43:_updateExternalDispatchConnector();
            end;
        end;
        v23.didMount = function(v45)
            v45._isMounted = true;
            v45:_updateExternalDispatchConnector();
            if v45:_isStateful() then
                if not (not _G.__DEV__ or v45.props.detached) and v20 > 0 then
                    l_console_0.warn("You should only render one navigator explicitly in your app, and other" .. " navigators should be rendered by including them in that navigator." .. " Full details at: " .. "https://reactnavigation.org/docs/4.x/common-mistakes#explicitly-rendering-more-than-one-navigator");
                end;
                v20 = v20 + 1;
                if v22 then
                    v22:listenForLuaURLs(function(v46)
                        v45:_handleOpenURL({
                            url = v46
                        });
                    end, false);
                end;
                local v47 = nil;
                local v48 = nil;
                if v45.props.enableURLHandling ~= false then
                    local v49 = v45:getStartupParams();
                    v47 = v49.parsedUrl;
                    v48 = v49.userProvidedStartupState;
                end;
                local l__initialAction_0 = v45._initialAction;
                local v51 = v45.state.nav or v21.router.getStateForAction(l__initialAction_0);
                if v48 then
                    v51 = v48;
                end;
                if v47 then
                    local v52 = v21.router.getActionForPathAndParams(v47.path, v47.params);
                    if v52 then
                        l__initialAction_0 = v52;
                        v51 = v21.router.getStateForAction(v52, v51);
                    end;
                end;
                local function v54()
                    for v53 in v45._actionEventSubscribers, nil, nil do
                        v53({
                            type = v7.Action, 
                            action = l__initialAction_0, 
                            state = v45.state.nav, 
                            lastState = nil
                        });
                    end;
                end;
                if v51 == v45.state.nav then
                    spawn(v54);
                    return ;
                else
                    v45:setState({
                        nav = v51
                    }, v54);
                    return ;
                end;
            else
                return ;
            end;
        end;
        v23.getStartupParams = function(v55)
            local l_props_0 = v55.props;
            local l_uriPrefix_1 = l_props_0.uriPrefix;
            local l_loadNavigationState_1 = l_props_0.loadNavigationState;
            local v59 = nil;
            local v60 = nil;
            if v22 then
                pcall(function()
                    v59 = v22:getLastLuaURL();
                end);
            end;
            if l_loadNavigationState_1 then
                pcall(function()
                    v60 = l_loadNavigationState_1();
                end);
            end;
            return {
                parsedUrl = v59 and l_urlToPathAndParams_0(v59, l_uriPrefix_1), 
                userProvidedStartupState = v60
            };
        end;
        v23._persistNavigationState = function(v61, v62)
            local l_persistNavigationState_1 = v61.props.persistNavigationState;
            if l_persistNavigationState_1 then
                local l_status_0, l_result_0 = pcall(l_persistNavigationState_1, v62);
                if not l_status_0 then
                    warn("Uncaught error while calling persistNavigationState() " .. "You should handle exceptions thrown from persistNavigationState(), " .. "ignoring them may result in undefined behavior.\n" .. l_result_0);
                end;
            end;
        end;
        v23.willUnmount = function(v66)
            v66._isMounted = false;
            if v22 then
                v22:stopListeningForLuaURLs();
            end;
            if v66._disconnectExternalDispatch then
                v66._disconnectExternalDispatch();
                v66._disconnectExternalDispatch = nil;
            end;
            if v66:_isStateful() then
                v20 = v20 - 1;
            end;
        end;
        v23.dispatch = function(v67, v68)
            if not v67.props.navigation then
                v67._navState = v67._navState or v67.state.nav;
                local l__navState_0 = v67._navState;
                l_assert_0(l__navState_0 ~= nil, "should be set in constructor if stateful");
                local v70 = v21.router.getStateForAction(v68, l__navState_0);
                local l_v70_0 = v70;
                if v70 == nil then
                    l_v70_0 = l__navState_0;
                end;
                local function v73()
                    for v72 in v67._actionEventSubscribers, nil, nil do
                        v72({
                            type = v7.Action, 
                            action = v68, 
                            state = l_v70_0, 
                            lastState = l__navState_0
                        });
                    end;
                end;
                if v70 == nil then
                    v73();
                    return true;
                elseif l_v70_0 ~= l__navState_0 then
                    v67._navState = l_v70_0;
                    v67:setState({
                        nav = l_v70_0
                    }, function()
                        v67:_onNavigationStateChange(l__navState_0, l_v70_0, v68);
                        task.defer(v73);
                        v67:_persistNavigationState(l_v70_0);
                    end);
                    return true;
                else
                    v73();
                    return false;
                end;
            else
                return v67.props.navigation.dispatch(v68);
            end;
        end;
        v23._getScreenProps = function(v74, v75, v76)
            if v75 == nil then
                return v74.props.screenProps;
            else
                local l_screenProps_0 = v74.props.screenProps;
                if not (l_screenProps_0 ~= nil) or l_screenProps_0[v75] == nil then
                    return v76;
                else
                    return l_screenProps_0[v75];
                end;
            end;
        end;
        v23.render = function(v78)
            local l_navigation_0 = v78.props.navigation;
            if v78:_isStateful() then
                local l_nav_0 = v78.state.nav;
                if l_nav_0 then
                    if not v78._navigation or v78._navigation.state ~= l_nav_0 then
                        v78._navigation = v9(v21.router, l_nav_0, function(...)
                            return v78:dispatch(...);
                        end, v78._actionEventSubscribers, function(...)
                            return v78:_getScreenProps(...);
                        end, function()
                            return v78._navigation;
                        end);
                    end;
                    l_navigation_0 = v78._navigation;
                else
                    return v78:_renderLoading();
                end;
            end;
            l_assert_0(l_navigation_0 ~= nil, "failed to get navigation");
            return v2.createElement(v8.Provider, {
                value = l_navigation_0
            }, {
                AppComponent = v2.createElement(v21, l_Object_0.assign(table.clone(v78.props), {
                    navigation = l_navigation_0
                }))
            });
        end;
        return v23;
    end, 
    _TESTING_ONLY_reset_container_count = function()
        v20 = 0;
    end
};
