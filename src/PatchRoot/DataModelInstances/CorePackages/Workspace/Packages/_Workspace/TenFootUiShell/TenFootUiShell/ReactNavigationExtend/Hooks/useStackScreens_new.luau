local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.LuauPolyfill);
local _ = require(l_Parent_0.Navigation);
local l_Array_0 = v4.Array;
local l_Object_0 = v4.Object;
local l_StackActions_0 = require(l_Parent_0.RoactNavigation).StackActions;
local l_ViewState_0 = require(l_ReactNavigationExtend_0.Views.RouteViewState).ViewState;
local _ = require(l_Parent_0.TenFootUiCommon);
local v11 = {
    SetCurrent = "SetCurrent", 
    SetOpening = "SetOpening", 
    SetOpened = "SetOpened", 
    SetClosing = "SetClosing", 
    SetClosed = "SetClosed"
};
local function v12(v13, v14)
    local v16 = l_Array_0.findIndex(v13, function(v15)
        return v15.descriptor.key == v14.key;
    end);
    if v14.type == v11.SetCurrent then
        for _, v18 in v14.navigationState.routes, nil, nil do
            v13 = v12(v13, {
                type = v11.SetOpening, 
                key = v18.key, 
                descriptor = v14.descriptors[v18.key]
            });
        end;
        for _, v20 in v13, nil, nil do
            if not (v14.descriptors[v20.descriptor.key] ~= nil) then
                v13 = v12(v13, {
                    type = v11.SetClosing, 
                    key = v20.descriptor.key
                });
            end;
        end;
        return v13;
    else
        if v14.type == v11.SetOpening then
            if v16 == -1 then
                v13 = table.clone(v13);
                table.insert(v13, {
                    viewState = l_ViewState_0.Opening, 
                    descriptor = v14.descriptor
                });
                return v13;
            elseif v13[v16].viewState == l_ViewState_0.Closing then
                v13 = table.clone(v13);
                v13[v16] = l_Object_0.assign({}, v13[v16], {
                    viewState = l_ViewState_0.Opening, 
                    descriptor = v14.descriptor
                });
                return v13;
            elseif v13[v16].descriptor ~= v14.descriptor then
                v13 = table.clone(v13);
                v13[v16] = l_Object_0.assign({}, v13[v16], {
                    descriptor = v14.descriptor
                });
                return v13;
            end;
        elseif v14.type == v11.SetOpened then
            if v16 ~= -1 and v13[v16].viewState == l_ViewState_0.Opening then
                v13 = table.clone(v13);
                v13[v16] = l_Object_0.assign({}, v13[v16], {
                    viewState = l_ViewState_0.Opened
                });
                return v13;
            end;
        elseif v14.type == v11.SetClosing then
            if v16 ~= -1 and v13[v16].viewState ~= l_ViewState_0.Closing then
                v13 = table.clone(v13);
                v13[v16] = l_Object_0.assign({}, v13[v16], {
                    viewState = l_ViewState_0.Closing
                });
                return v13;
            end;
        elseif (v14.type == v11.SetClosed and v16 ~= -1) and v13[v16].viewState == l_ViewState_0.Closing then
            v13 = table.clone(v13);
            table.remove(v13, v16);
        end;
        return v13;
    end;
end;
return function(v21)
    local l_navigation_0 = v21.navigation;
    local l_state_0 = l_navigation_0.state;
    local l_descriptors_0 = v21.descriptors;
    local v25, v26 = v3.useReducer(v12, {});
    v3.useLayoutEffect(function()
        v26({
            type = v11.SetCurrent, 
            navigationState = l_state_0, 
            descriptors = l_descriptors_0
        });
    end, {
        l_state_0, 
        l_descriptors_0
    });
    local v28 = v3.useCallback(function(v27)
        l_navigation_0.dispatch(l_StackActions_0.completeTransition({
            key = l_navigation_0.state.key, 
            toChildKey = v27
        }));
    end, {
        l_navigation_0
    });
    local v30 = v3.useCallback(function(v29)
        v26({
            type = v11.SetOpened, 
            key = v29.descriptor.key
        });
        v28(v29.descriptor.key);
    end, {
        v28
    });
    local v32 = v3.useCallback(function(v31)
        v26({
            type = v11.SetClosed, 
            key = v31.descriptor.key
        });
    end, {});
    return (v3.useMemo(function()
        return l_Array_0.map(v25, function(v33)
            return l_Object_0.assign({}, v33, {
                setOpened = function()
                    v30(v33);
                end, 
                setClosed = function()
                    v32(v33);
                end
            });
        end);
    end, {
        v25, 
        v30, 
        v32
    }));
end;
