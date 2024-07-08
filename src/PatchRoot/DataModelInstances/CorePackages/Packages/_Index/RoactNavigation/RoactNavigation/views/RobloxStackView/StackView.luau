local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_1.routers.StackActions);
local v6 = require(l_Parent_0.StackViewLayout);
local v7 = require(l_Parent_0.Transitioner);
local v8 = require(l_Parent_0.StackViewTransitionConfigs);
local v9 = {
    mode = require(l_Parent_0.StackPresentationStyle).Default
};
local v10 = v4.Component:extend("StackView");
v10.init = function(v11)
    v11._doRender = function(...)
        return v11:_render(...);
    end;
    v11._doConfigureTransition = function(...)
        return v11:_configureTransition(...);
    end;
    v11._doOnTransitionStart = function(...)
        return v11:_onTransitionStart(...);
    end;
    v11._doOnTransitionEnd = function(...)
        return v11:_onTransitionEnd(...);
    end;
    v11._doOnTransitionStep = function(...)
        return v11:_onTransitionStep(...);
    end;
end;
v10.render = function(v12)
    return v4.createElement(v7, {
        render = v12._doRender, 
        configureTransition = v12._doConfigureTransition, 
        screenProps = v12.props.screenProps, 
        navigation = v12.props.navigation, 
        descriptors = v12.props.descriptors, 
        onTransitionStart = v12._doOnTransitionStart, 
        onTransitionEnd = v12._doOnTransitionEnd, 
        onTransitionStep = v12._doOnTransitionStep
    });
end;
v10.didMount = function(v13)
    local l_navigation_0 = v13.props.navigation;
    if l_navigation_0.state.isTransitioning then
        l_navigation_0.dispatch(v5.completeTransition({
            key = l_navigation_0.state.key
        }));
    end;
end;
v10._render = function(v15, v16, v17)
    return v4.createElement(v6, l_Object_0.assign(l_Object_0.assign(table.clone(v9), v15.props.navigationConfig), {
        screenProps = v15.props.screenProps, 
        descriptors = v15.props.descriptors, 
        transitionProps = v16, 
        lastTransitionProps = v17
    }));
end;
v10._configureTransition = function(v18, v19, v20)
    return v8.getTransitionConfig(v18.props.navigationConfig.transitionConfig, v19, v20, v18.props.navigationConfig.mode).transitionSpec;
end;
v10._onTransitionStart = function(v21, v22, v23)
    local v24 = v21.props.onTransitionStart or v21.props.navigationConfig.onTransitionStart;
    if v24 and v22.index ~= v23.index then
        v24(v22.navigation, v23.navigation);
    end;
end;
v10._onTransitionEnd = function(v25, v26, v27)
    local l_navigationConfig_0 = v25.props.navigationConfig;
    local l_navigation_1 = v25.props.navigation;
    local v30 = v25.props.onTransitionEnd or l_navigationConfig_0.onTransitionEnd;
    local l_key_0 = v26.scene.route.key;
    local v32 = l_navigation_1.state.routes[l_navigation_1.state.index].key == l_key_0;
    if not (not v26.navigation.state.isTransitioning or not v32) then
        l_navigation_1.dispatch(v5.completeTransition({
            key = l_navigation_1.state.key, 
            toChildKey = l_key_0
        }));
    end;
    if v30 and v26.index ~= v27.index then
        v30(v26.navigation, v27.navigation);
    end;
end;
v10._onTransitionStep = function(v33, v34, v35, v36)
    local v37 = v33.props.onTransitionStep or v33.props.navigationConfig.onTransitionStep;
    if v37 and v34.index ~= v35.index then
        v37(v34.navigation, v35.navigation, v36);
    end;
end;
return v10;
