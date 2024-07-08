local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SceneManagement);
local v4 = require(l_Parent_0.FocusNavigationUtils);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_FocusNavigableSurfaceRegistry_0 = v4.FocusNavigableSurfaceRegistry;
local l_useFocusRegistryEntry_0 = l_FocusNavigableSurfaceRegistry_0.useFocusRegistryEntry;
local l_useRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useRegisterFocusNavigableSurface;
local l_useDeRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useDeRegisterFocusNavigableSurface;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v4.FocusNavigableSurfaceIdentifierEnum;
local v11 = require(l_script_FirstAncestor_0.Hooks.useRootFocusNavigationBindings);
local v12 = require(l_Components_0.FocusNavigableWrapper);
local v13 = require(l_script_FirstAncestor_0.ReactNavigationExtend.Views.Constants);
local l_SurfaceGuiWithAdornee_new_0 = v3.SurfaceGuiWithAdornee_new;
local l_useCameraFacingGeometry_0 = v3.useCameraFacingGeometry;
local function _(v16)
    return function(v17)
        return (Vector3.new(v17.X, v17.Y * v16, v13.ADORNEE_DEPTH));
    end;
end;
local v19 = 1;
local l_v19_0 = v19 --[[ copy: 18 -> 25 ]];
local function v22(v21)
    return (Vector3.new(v21.X, v21.Y * l_v19_0, v13.ADORNEE_DEPTH));
end;
local l_TOP_BAR_HEIGHT_RATIO_0 = v13.TOP_BAR_HEIGHT_RATIO;
local l_l_TOP_BAR_HEIGHT_RATIO_0_0 = l_TOP_BAR_HEIGHT_RATIO_0 --[[ copy: 19 -> 26 ]];
v19 = function(v25)
    return (Vector3.new(v25.X, v25.Y * l_l_TOP_BAR_HEIGHT_RATIO_0_0, v13.ADORNEE_DEPTH));
end;
local l_CONTROLLER_BAR_HEIGHT_RATIO_0 = v13.CONTROLLER_BAR_HEIGHT_RATIO;
local l_l_CONTROLLER_BAR_HEIGHT_RATIO_0_0 = l_CONTROLLER_BAR_HEIGHT_RATIO_0 --[[ copy: 20 -> 27 ]];
l_TOP_BAR_HEIGHT_RATIO_0 = function(v28)
    return (Vector3.new(v28.X, v28.Y * l_l_CONTROLLER_BAR_HEIGHT_RATIO_0_0, v13.ADORNEE_DEPTH));
end;
l_CONTROLLER_BAR_HEIGHT_RATIO_0 = function(v29)
    local l_Y_0 = v29.viewportFillDimensions.Y;
    return v29.cFrame * CFrame.new(0, l_Y_0 / 2 - (l_Y_0 * v13.TOP_BAR_HEIGHT_RATIO) / 2, 0);
end;
local function v33(v31)
    local l_Y_1 = v31.viewportFillDimensions.Y;
    return v31.cFrame * CFrame.new(0, (l_Y_1 * v13.CONTROLLER_BAR_HEIGHT_RATIO) / 2 - l_Y_1 / 2, 0);
end;
local function v36(v34)
    local v35 = l_useCameraFacingGeometry_0(v13.DEFAULT_SCREEN_DISTANCE_TO_CAMERA);
    return v2.createElement(l_SurfaceGuiWithAdornee_new_0, {
        name = "RootViewSurface", 
        adorneeSize = v35.viewportFillDimensions:map(v22), 
        adorneeCFrame = v35.cFrame, 
        adorneeParent = v34.adorneeParent, 
        isVisible = true, 
        canvasSize = v13.FULLSCREEN_CANVAS_SIZE, 
        surfaceGuiParent = v34.surfaceGuiParent
    }, v34.content);
end;
local function v47(v37)
    local v38 = l_useFocusRegistryEntry_0(l_FocusNavigableSurfaceIdentifierEnum_0.RouterView);
    local v39 = l_useRegisterFocusNavigableSurface_0();
    local v40 = l_useDeRegisterFocusNavigableSurface_0();
    local v41, v42 = v2.useState(nil);
    local v43 = v11(v42);
    local v44 = l_useCameraFacingGeometry_0(v13.DEFAULT_SCREEN_DISTANCE_TO_CAMERA);
    local v45 = v44.viewportFillDimensions:map(v19);
    local v46 = v2.joinBindings({
        viewportFillDimensions = v44.viewportFillDimensions, 
        cFrame = v44.cFrame
    }):map(l_CONTROLLER_BAR_HEIGHT_RATIO_0);
    v2.useEffect(function()
        if v41 then
            v39(l_FocusNavigableSurfaceIdentifierEnum_0.NavBar, v41);
        end;
        return function()
            v40(l_FocusNavigableSurfaceIdentifierEnum_0.NavBar, nil);
        end;
    end, {
        v39, 
        v41
    });
    return v2.createElement(l_SurfaceGuiWithAdornee_new_0, {
        adorneeSize = v45, 
        adorneeCFrame = v46, 
        canvasSize = v13.TOP_BAR_CANVAS_SIZE, 
        isVisible = true, 
        name = "GlobalNavBarSurface", 
        adorneeParent = v37.adorneeParent, 
        surfaceGuiParent = v37.surfaceGuiParent
    }, (v2.createElement(v12, {
        ref = v43, 
        onSelectDown = v38
    }, v37.content)));
end;
local function v50(v48)
    local v49 = l_useCameraFacingGeometry_0(v13.DEFAULT_SCREEN_DISTANCE_TO_CAMERA - 1);
    return v2.createElement(l_SurfaceGuiWithAdornee_new_0, {
        adorneeSize = v49.viewportFillDimensions:map(l_TOP_BAR_HEIGHT_RATIO_0), 
        adorneeCFrame = v2.joinBindings({
            viewportFillDimensions = v49.viewportFillDimensions, 
            cFrame = v49.cFrame
        }):map(v33), 
        canvasSize = v13.CONTROLLER_BAR_CANVAS_SIZE, 
        isVisible = true, 
        name = "ControllerBarSurface", 
        adorneeParent = v48.adorneeParent, 
        surfaceGuiParent = v48.surfaceGuiParent
    }, v48.content);
end;
return function(v51)
    return v2.createElement(v2.Fragment, nil, {
        RootViewSlot = if not v51.rootViewSlot then nil else v2.createElement(v36, {
            adorneeParent = v51.adorneeParent, 
            surfaceGuiParent = v51.surfaceGuiParent, 
            content = v51.rootViewSlot
        }), 
        GlobalNavBarSlot = if not v51.globalNavSlot then nil else v2.createElement(v47, {
            adorneeParent = v51.adorneeParent, 
            surfaceGuiParent = v51.surfaceGuiParent, 
            content = v51.globalNavSlot
        }), 
        ControllerBarSlot = if not v51.controllerBarSlot then nil else v2.createElement(v50, {
            adorneeParent = v51.adorneeParent, 
            surfaceGuiParent = v51.surfaceGuiParent, 
            content = v51.controllerBarSlot
        })
    });
end;
