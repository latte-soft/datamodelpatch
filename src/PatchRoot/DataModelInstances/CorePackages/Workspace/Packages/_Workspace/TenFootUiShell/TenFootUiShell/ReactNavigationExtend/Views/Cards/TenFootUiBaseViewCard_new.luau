local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SceneManagement);
local l_SurfaceGuiWithAdornee_new_0 = v4.SurfaceGuiWithAdornee_new;
local l_useCameraFacingGeometry_0 = v4.useCameraFacingGeometry;
local v7 = require(l_ReactNavigationExtend_0.Views.Constants);
local l_ScreenKind_0 = require(l_Parent_0.TenFootUiCommon).TenFootUiRNTypes.ScreenKind;
local v9 = require(script.Parent.SceneViewWithFocusRoot);
local v10 = require(l_script_FirstAncestor_0.Components.TenFootUiOverflowScreen);
local v11 = require(l_script_FirstAncestor_0.Hooks.useFocusGlobalNav);
local v12 = require(l_Parent_0.Navigation);
local l_getCurrentRouteKey_0 = v12.getCurrentRouteKey;
local l_getRouteKeyIsInNavigationState_0 = v12.getRouteKeyIsInNavigationState;
local l_getActiveChildNavigationOptionsRecursively_0 = v12.getActiveChildNavigationOptionsRecursively;
local l_useEarlyIsFocused_0 = require(l_Parent_0.RoactUtils).Hooks.useEarlyIsFocused;
local v17 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v17.Array;
local l_Object_0 = v17.Object;
local function v21(v20)
    return (Vector3.new(v20.X, v20.Y, v7.ADORNEE_DEPTH));
end;
local function _(v22)
    if (v22.options.screenKind or l_ScreenKind_0.Default) == l_ScreenKind_0.FullScreen then
        return v7.FULLSCREEN_CANVAS_SIZE;
    else
        return v7.DEFAULT_CANVAS_SIZE;
    end;
end;
local function v27(v24)
    return 1 - l_Array_0.reduce(v24, function(v25, v26)
        return v25 * (1 - (v26 or 0));
    end, 1);
end;
local function v29(...)
    local v28 = {
        ...
    };
    return v3.useMemo(function()
        return v3.joinBindings(v28):map(v27);
    end, v28);
end;
local function _(v30, v31)
    local v32 = l_getCurrentRouteKey_0(v30);
    if v31.options.hasSubNavigation and v32 ~= nil then
        return (l_getRouteKeyIsInNavigationState_0(v32, v31.state));
    else
        return v32 == v31.key;
    end;
end;
local function _(v34, v35)
    return (if not v35.options.hasSubNavigation then nil else l_getActiveChildNavigationOptionsRecursively_0(v34).screenKind or v35.options.screenKind) or l_ScreenKind_0.Default;
end;
return function(v37)
    local l_descriptor_0 = v37.descriptor;
    local l_screenProps_0 = v37.screenProps;
    local l_navigation_0 = v37.navigation;
    local v41 = v11(l_navigation_0);
    local v42 = l_useCameraFacingGeometry_0(v7.DEFAULT_SCREEN_DISTANCE_TO_CAMERA);
    local v43 = l_useEarlyIsFocused_0() and v37.isActiveCard;
    local v44 = l_getCurrentRouteKey_0(l_navigation_0);
    local v45 = if not not l_descriptor_0.options.hasSubNavigation and v44 ~= nil then l_getRouteKeyIsInNavigationState_0(v44, l_descriptor_0.state) else v44 == l_descriptor_0.key;
    v44 = (if not l_descriptor_0.options.hasSubNavigation then nil else l_getActiveChildNavigationOptionsRecursively_0(l_navigation_0).screenKind or l_descriptor_0.options.screenKind) or l_ScreenKind_0.Default;
    local v46 = v37.isVisible and (l_screenProps_0.isVisible == nil and true or l_screenProps_0.isVisible);
    local v47 = v29(v37.groupTransparency, l_screenProps_0.groupTransparency);
    return v3.createElement(l_SurfaceGuiWithAdornee_new_0, {
        name = l_descriptor_0.key, 
        adorneeSize = v42.viewportFillDimensions:map(v21), 
        adorneeCFrame = v37.adorneeCFrame, 
        adorneeParent = l_screenProps_0.worldContainer, 
        canvasSize = if (l_descriptor_0.options.screenKind or l_ScreenKind_0.Default) == l_ScreenKind_0.FullScreen then v7.FULLSCREEN_CANVAS_SIZE else v7.DEFAULT_CANVAS_SIZE, 
        isVisible = v46, 
        surfaceGuiParent = l_screenProps_0.surfaceGuiContainer
    }, (v3.createElement(v10, {
        screenKind = v44, 
        groupTransparency = v47
    }, {
        SceneView = v3.createElement(v9, {
            component = l_descriptor_0.getComponent(), 
            navigation = l_descriptor_0.navigation, 
            screenProps = v3.useMemo(function()
                return l_Object_0.assign({}, l_screenProps_0, {
                    isVisible = v46, 
                    groupTransparency = v47
                });
            end, {
                l_screenProps_0, 
                v46, 
                v47
            }), 
            isFocusable = v43 and v45, 
            onSelectUp = v41, 
            shouldRestoreFocus = l_descriptor_0.options.enableFocusRestoration
        })
    })));
end;
