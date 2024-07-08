local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactOtter);
local v4 = require(l_script_FirstAncestor_0.ReactNavigationExtend.Views.Constants);
local v5 = require(l_script_FirstAncestor_0.Hooks.TenFootUiScene);
local v6 = require(script.Parent.TabAnimationStateEnum);
local l_useCameraFacingGeometry_0 = require(l_Parent_0.SceneManagement).useCameraFacingGeometry;
local function _(v8, v9)
    local v10 = true;
    if v8 ~= v6.TabOpening then
        v10 = v8 == v6.TabOpened;
    end;
    local function _(v11)
        if v9 == 0 then
            return 0;
        elseif not v10 then
            if v9 < 0 then
                return v11;
            else
                return -v11;
            end;
        elseif v9 < 0 then
            return -v11;
        else
            return v11;
        end;
    end;
    return function(v13)
        local v14 = (1 - v13.step) * (v13.viewportFillDimensions.X * 0.3333);
        return CFrame.new(v9 == 0 and 0 or if v10 then if v9 < 0 then -v14 else v14 else if v9 < 0 then v14 else -v14, 0, 0);
    end;
end;
local function v20(v16)
    local v17, v18 = v2.useState(v6.TabClosed);
    v2.useEffect(function()
        v18(function(v19)
            if v16 and (not (v19 ~= v6.TabClosed) or v19 == v6.TabClosing) then
                return v6.TabOpening;
            elseif not v16 and (not (v19 ~= v6.TabOpened) or v19 == v6.TabOpening) then
                return v6.TabClosing;
            else
                return v19;
            end;
        end);
    end, {
        v16
    });
    return v17, v18;
end;
return function(v21)
    local l_currentTabIndex_0 = v21.currentTabIndex;
    local v23 = l_currentTabIndex_0 - v21.previousTabIndex;
    local v24, v25 = v20(v21.isActiveTab);
    local v26 = l_useCameraFacingGeometry_0(v4.DEFAULT_SCREEN_DISTANCE_TO_CAMERA);
    local v28, v29 = v3.useAnimatedBinding(0, (v2.useCallback(function()
        v25(function(v27)
            if v27 == v6.TabOpening then
                return v6.TabOpened;
            elseif v27 == v6.TabClosing then
                return v6.TabClosed;
            else
                return v27;
            end;
        end);
    end, {})));
    v2.useEffect(function()
        if v24 == v6.TabOpening then
            v29(v3.spring(1, v4.X_DIRECTION_ANIMATION_SPRING_CONFIG));
            return ;
        else
            if v24 == v6.TabClosing then
                v29(v3.spring(0, v4.X_DIRECTION_ANIMATION_SPRING_CONFIG));
            end;
            return ;
        end;
    end, {
        v24
    });
    v2.useEffect(function()
        if not (v24 ~= v6.TabOpening) or v24 == v6.TabOpened then
            v5.updateXPosition(-((v26.viewportFillDimensions:getValue().X * 0.1634) * (l_currentTabIndex_0 - 1)));
        end;
    end, {
        v24, 
        v26.viewportFillDimensions, 
        l_currentTabIndex_0
    });
    return v2.useMemo(function()
        local l_v24_0 = v24;
        local l_v23_0 = v23;
        local v32 = true;
        if l_v24_0 ~= v6.TabOpening then
            v32 = l_v24_0 == v6.TabOpened;
        end;
        local function _(v33)
            if l_v23_0 == 0 then
                return 0;
            elseif not v32 then
                if l_v23_0 < 0 then
                    return v33;
                else
                    return -v33;
                end;
            elseif l_v23_0 < 0 then
                return -v33;
            else
                return v33;
            end;
        end;
        return {
            isVisible = v24 ~= v6.TabClosed, 
            cFrame = v2.joinBindings({
                step = v28, 
                viewportFillDimensions = v26.viewportFillDimensions
            }):map(function(v35)
                local v36 = (1 - v35.step) * (v35.viewportFillDimensions.X * 0.3333);
                return CFrame.new(l_v23_0 == 0 and 0 or if v32 then if l_v23_0 < 0 then -v36 else v36 else if l_v23_0 < 0 then v36 else -v36, 0, 0);
            end), 
            transparency = v28:map(function(v37)
                return 1 - v37;
            end)
        };
    end, {
        v28, 
        v26, 
        v24, 
        v23
    });
end;
