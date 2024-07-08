local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Object_0 = v3.Object;
local l_Array_0 = v3.Array;
local v6 = require(l_Parent_0.utils.invariant);
local v7 = require(l_Parent_0.views.NavigationFocusEvents);
return function(v8, v9, v10)
    local v11 = v2.Component:extend("Navigator");
    v11.router = v9;
    v11.navigationOptions = v10.navigationOptions;
    v11.init = function(v12)
        v12.state = {
            descriptors = {}, 
            transitioningDescriptors = {}, 
            screenProps = v12.props.screenProps
        };
    end;
    v11.getDerivedStateFromProps = function(v13, v14)
        local l_descriptors_0 = v14.descriptors;
        local l_transitioningDescriptors_0 = v14.transitioningDescriptors;
        local l_navigation_0 = v13.navigation;
        local l_screenProps_0 = v13.screenProps;
        v6(l_navigation_0 ~= nil, "The navigation prop is missing for this navigator. " .. "In react-navigation v3 and v4 you must set up your app container directly. " .. "More info: https://reactnavigation.org/docs/en/app-containers.html");
        local l_routes_0 = l_navigation_0.state.routes;
        v6(type(l_routes_0) == "table", "No \"routes\" found in navigation state. " .. "Did you try to pass the navigation prop of a React component to a Navigator child? " .. "See https://reactnavigation.org/docs/en/custom-navigators.html#navigator-navigation-prop");
        local v24 = l_Array_0.reduce(l_routes_0, function(v20, v21)
            if (not (not l_descriptors_0 or not l_descriptors_0[v21.key]) and v21 == l_descriptors_0[v21.key].state) and l_screenProps_0 == v14.screenProps then
                v20[v21.key] = l_descriptors_0[v21.key];
                return v20;
            else
                local function v22()
                    return v9.getComponentForRouteName(v21.routeName);
                end;
                local v23 = l_navigation_0.getChildNavigation(v21.key);
                v20[v21.key] = {
                    key = v21.key, 
                    getComponent = v22, 
                    options = v9.getScreenOptions(v23, l_screenProps_0), 
                    state = v21, 
                    navigation = v23
                };
                return v20;
            end;
        end, {});
        local v25 = {};
        if l_navigation_0.state.isTransitioning then
            v25 = l_Object_0.assign({}, l_transitioningDescriptors_0, l_descriptors_0, l_Array_0.reduce(l_routes_0, function(v26, v27)
                v26[v27.key] = l_Object_0.None;
                return v26;
            end, {}));
        end;
        return {
            descriptors = v24, 
            transitioningDescriptors = v25, 
            screenProps = l_screenProps_0
        };
    end;
    v11.render = function(v28)
        local l_navigation_1 = v28.props.navigation;
        local l_screenProps_1 = v28.state.screenProps;
        local l_descriptors_1 = v28.state.descriptors;
        local l_transitioningDescriptors_1 = v28.state.transitioningDescriptors;
        return v2.createElement(v2.Fragment, {}, {
            Events = v2.createElement(v7, {
                navigation = l_navigation_1, 
                onEvent = function(v33, v34, v35)
                    if not l_descriptors_1[v33] then
                        if l_transitioningDescriptors_1[v33] then
                            l_transitioningDescriptors_1[v33].navigation.emit(v34, v35);
                        end;
                        return ;
                    else
                        l_descriptors_1[v33].navigation.emit(v34, v35);
                        return ;
                    end;
                end
            }), 
            View = v2.createElement(v8, l_Object_0.assign(table.clone(v28.props), {
                screenProps = l_screenProps_1, 
                navigation = l_navigation_1, 
                navigationConfig = v10, 
                descriptors = l_descriptors_1
            }))
        });
    end;
    return v11;
end;
