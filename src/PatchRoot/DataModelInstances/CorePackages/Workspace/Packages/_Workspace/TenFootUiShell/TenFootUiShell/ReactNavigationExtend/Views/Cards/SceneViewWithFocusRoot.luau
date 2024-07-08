local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.TenFootUiCommon);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactNavigation);
local v5 = require(l_Parent_0.ReactFocusNavigation);
local v6 = require(l_Parent_0.FocusNavigationUtils);
local v7 = require(l_script_FirstAncestor_0.Components.FocusNavigableWrapper);
local l_FocusNavigableSurfaceRegistry_0 = v6.FocusNavigableSurfaceRegistry;
local l_useRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useRegisterFocusNavigableSurface;
local l_useDeRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useDeRegisterFocusNavigableSurface;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v6.FocusNavigableSurfaceIdentifierEnum;
local v12 = require(l_script_FirstAncestor_0.Hooks.useRootFocusNavigationBindings);
local l_SceneView_0 = v4.SceneView;
local _ = require(l_Parent_0.Navigation);
return function(v15)
    local v16, v17 = v3.useState(nil);
    local v18 = l_useRegisterFocusNavigableSurface_0();
    local v19 = l_useDeRegisterFocusNavigableSurface_0();
    local v20 = v12(v17);
    local v21 = if not (not (v15.shouldRestoreFocus ~= nil) or v15.shouldRestoreFocus) then v20 else v5.useMostRecentFocusBehavior(v20);
    local l_isFocusable_0 = v15.isFocusable;
    v3.useEffect(function()
        if not v16 or not l_isFocusable_0 then
            v19(l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, v16);
        else
            v18(l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, v16);
        end;
        return function()
            v19(l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, v16);
        end;
    end, {
        v16, 
        l_isFocusable_0
    });
    return v3.createElement(v7, {
        ref = v21, 
        onSelectUp = v15.onSelectUp
    }, v3.createElement(l_SceneView_0, {
        navigation = v15.navigation, 
        component = v15.component, 
        screenProps = v15.screenProps
    }));
end;
