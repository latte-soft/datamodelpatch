local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactOtter);
local l_useEarlyIsFocused_0 = require(l_Parent_0.RoactUtils).Hooks.useEarlyIsFocused;
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v6 = require(l_ReactNavigationExtend_0.Views.RouteViewState);
local v7 = require(l_ReactNavigationExtend_0.Views.Constants);
local v8 = require(l_script_FirstAncestor_0.Hooks.TenFootUiScene);
local v9 = {
    FRONT_HIDDEN = -1, 
    CENTER_VISIBLE = 0, 
    BACK_HIDDEN = 1
};
local l_FRONT_HIDDEN_0 = v9.FRONT_HIDDEN;
local function _(v11)
    if not v11 then
        return v9.BACK_HIDDEN;
    else
        return v9.CENTER_VISIBLE;
    end;
end;
return function(v13)
    local l_isTopOfStack_0 = v13.isTopOfStack;
    local l_totalInStack_0 = v13.totalInStack;
    local l_viewState_0 = v13.viewState;
    local v17, v18 = v2.useState(false);
    local v19 = l_isTopOfStack_0 or v17;
    local v20, v21 = v3.useAnimatedBinding(l_FRONT_HIDDEN_0, (v2.useCallback(function()
        v13.onAnimationComplete();
        v18(false);
    end, {
        v13.onAnimationComplete
    })));
    v2.useEffect(function()
        if not (l_viewState_0 ~= v6.ViewState.Opening) or l_viewState_0 == v6.ViewState.Opened then
            v18(true);
            v21(v3.spring(if not l_isTopOfStack_0 then v9.BACK_HIDDEN else v9.CENTER_VISIBLE, v7.Z_DIRECTION_ANIMATION_SPRING_CONFIG));
            return ;
        else
            if l_viewState_0 == v6.ViewState.Closing then
                v18(true);
                v21(v3.spring(v9.FRONT_HIDDEN, v7.Z_DIRECTION_ANIMATION_SPRING_CONFIG));
            end;
            return ;
        end;
    end, {
        l_viewState_0, 
        l_isTopOfStack_0
    });
    local v22 = l_useEarlyIsFocused_0();
    v2.useEffect(function()
        if not (not v22 or not l_isTopOfStack_0) then
            v8.updateZPosition(-((l_totalInStack_0 - 1) * (v7.DEFAULT_SCREEN_DISTANCE_TO_CAMERA * v7.Z_DIRECTION_ZOOM_FACTOR)));
        end;
    end, {
        v22, 
        l_isTopOfStack_0, 
        l_totalInStack_0
    });
    return v2.useMemo(function()
        return {
            isVisible = v19, 
            cFrame = v20:map(function(v23)
                return CFrame.new(0, 0, -((v7.DEFAULT_SCREEN_DISTANCE_TO_CAMERA * v7.Z_DIRECTION_ZOOM_FACTOR) * v23));
            end), 
            transparency = v20:map(function(v24)
                return (math.abs(v24));
            end)
        };
    end, {
        v19, 
        v20
    });
end;
