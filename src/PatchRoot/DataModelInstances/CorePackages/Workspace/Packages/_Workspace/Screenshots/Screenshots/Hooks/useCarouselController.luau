local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RunService_0 = game:GetService("RunService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_UserInputService_0 = game:GetService("UserInputService");
local v6 = require(l_Parent_1.Otter);
local v7 = require(l_Parent_1.React);
local v8 = require(l_Parent_1.RoactUtils);
local v9 = require(l_Parent_1.SocialCommon);
local v10 = require(l_Parent_1.UIBlox);
local v11 = require(l_Parent_0.Analytics.useAnalytics);
local l_useBinding_0 = v7.useBinding;
local l_useEffectOnce_0 = v8.Hooks.useEffectOnce;
local l_useExternalEvent_0 = v10.Core.Hooks.useExternalEvent;
local l_useIsHovered_0 = v9.Hooks.useIsHovered;
local l_useIsTouchDown_0 = v9.Hooks.useIsTouchDown;
local v17 = require(l_Parent_0.Analytics.EventNames);
local v18 = require(l_Parent_0.Utils.getClosestItemToCenter);
local v19 = require(l_Parent_0.Experimentation.getIsFeatureVisibleToDesktopUser);
local v20 = require(l_Parent_0.Flags.FFlagDecomposeDesktopCapturesEligibilityCheck);
local v21 = {
    dampingRatio = 1, 
    frequency = 4
};
local function _(v22, v23, v24)
    return math.abs(v22 - v23) < v24;
end;
local function v87(v26, v27, v28)
    local v29 = nil;
    local v30 = false;
    local v31 = nil;
    local v32 = false;
    local v33 = 0;
    local v34 = false;
    local function v35()
        return v34;
    end;
    local function v36()
        v30 = false;
        v34 = false;
    end;
    local function v37()
        return v32;
    end;
    local function _(v38)
        if v38 == true then
            v30 = false;
            v34 = false;
        end;
        v32 = v38;
    end;
    local function v46(v40, v41, v42)
        if v31 then
            v31:destroy();
            v31 = nil;
        end;
        local v43 = v6.createSingleMotor(v40);
        v31 = v43;
        v43:onStep(function(v44)
            if v31 ~= v43 then
                v43:destroy();
                return ;
            elseif not v30 then
                local v45 = if not (math.abs(v44 - v33) < 0.5) then v44 else v33;
                if not v41 or not v41(v40, v45) then
                    if v26.current then
                        v26.current.CanvasPosition = Vector2.new(v45, 0);
                    end;
                    return ;
                else
                    return ;
                end;
            else
                v43:destroy();
                v31 = nil;
                return ;
            end;
        end);
        if v42 then
            v43:onComplete(v42);
        end;
        v43:start();
    end;
    local function v50(v47, v48, v49)
        if v31 then
            assert(v31 ~= nil, "setGoal called before resetMotor");
            v33 = v47.X * (v48 - 1);
            if not v49 then
                v31:setGoal(v6.spring(v33, v21));
                return ;
            else
                v31:setGoal(v6.instant(v33));
                return ;
            end;
        else
            return ;
        end;
    end;
    local v86 = {
        carouselRef = v26, 
        getWasTouched = v35, 
        getIsNavigationLocked = v37, 
        handleDeleteTransition = function(v51, v52, v53, v54, v55, v56)
            local l_current_0 = v26.current;
            local l_current_1 = v27.current;
            if l_current_0 and l_current_1 then
                assert(l_current_0 ~= nil, "carousel should exist");
                assert(l_current_1 ~= nil, "selectedItem should exist");
                local l_ScrollingEnabled_0 = l_current_0.ScrollingEnabled;
                l_current_0.ScrollingEnabled = false;
                v30 = false;
                v34 = false;
                v32 = true;
                local function v62()
                    v46(l_current_0.CanvasPosition.X, function(v60, v61)
                        l_current_1.Size = UDim2.fromOffset(math.round(v53.X - math.abs(v60 - v61)), v53.Y);
                        return v54 == 1;
                    end, function()
                        v56();
                        l_current_1.Visible = false;
                        v51(1);
                        v32 = false;
                        l_current_0.ScrollingEnabled = l_ScrollingEnabled_0;
                    end);
                    v50(v53, v54 - 1, v55 or l_UserGameSettings_0.ReducedMotion);
                end;
                local function v67()
                    if v52 then
                        assert(v52 ~= nil, "setPostDeletionItemBinding should exist");
                        v46(l_current_0.CanvasPosition.X, function(_, _)
                            return v54 == 1;
                        end, function()
                            v56();
                            l_current_1.Visible = false;
                            local v65 = v6.createSingleMotor(0);
                            v65:onStep(function(v66)
                                v51(v66);
                                v52(1);
                            end);
                            v65:onComplete(function()
                                v32 = false;
                                l_current_0.ScrollingEnabled = l_ScrollingEnabled_0;
                            end);
                            v65:setGoal(v6.spring(1, {
                                frequency = 2
                            }));
                        end);
                        v50(v53, v54 - 1, true);
                        return ;
                    else
                        return ;
                    end;
                end;
                local function v69()
                    if v52 then
                        assert(v52 ~= nil, "setPostDeletionItemBinding should exist");
                        local v68 = v6.createSingleMotor(1);
                        v68:onStep(v52);
                        v68:onComplete(v67);
                        v68:setGoal(v6.spring(0, {
                            frequency = 6
                        }));
                        return ;
                    else
                        return ;
                    end;
                end;
                local v70 = v6.createSingleMotor(1);
                v70:onStep(v51);
                local v71 = nil;
                if not l_UserGameSettings_0.ReducedMotion then
                    v71 = 4;
                    v70:onComplete(v62);
                else
                    v71 = 6;
                    v70:onComplete(v69);
                end;
                v70:setGoal(v6.spring(0, {
                    frequency = v71
                }));
                return ;
            else
                return ;
            end;
        end, 
        handleInertialMove = function(v72, v73)
            local v74 = nil;
            local l_current_2 = v26.current;
            if not v30 and l_current_2 then
                assert(l_current_2 ~= nil, "carousel should not be nil");
                v74 = -l_current_2:GetSampledInertialVelocity().X;
                l_current_2:ClearInertialScrolling();
                local v76, v77 = v18(v72, l_current_2);
                if math.abs(v74) < 60 and v76 == v73 then
                    if v77 > 0.5 then
                        v46(l_current_2.CanvasPosition.X);
                        v50(v72, v73, false);
                    end;
                    return ;
                else
                    if v29 then
                        v29:Disconnect();
                        v29 = nil;
                    end;
                    v29 = l_RunService_0.RenderStepped:Connect(function(v78)
                        local l_current_3 = v26.current;
                        if l_current_3 and not v30 then
                            assert(l_current_3 ~= nil, "carousel should not be nil");
                            local v80, v81 = v18(v72, l_current_3);
                            if math.abs(v74) < 60 then
                                assert(v29 ~= nil, "handleInertialMoveConn should exist");
                                v29:Disconnect();
                                v29 = nil;
                                if v80 == v73 then
                                    v46(l_current_3.CanvasPosition.X);
                                    v50(v72, v73, false);
                                    return ;
                                else
                                    v28(v80);
                                    return ;
                                end;
                            else
                                l_current_3.CanvasPosition = l_current_3.CanvasPosition + Vector2.new(v74 * v78, 0);
                                local v82 = math.max((v81 / (v72.X / 2)) * 1.25, 0.85);
                                local _ = nil;
                                v74 = v74 * (math.abs(v74) < 120 and 0.7 or 0.95 * v82) ^ (v78 / 0.016666666666666666);
                                return ;
                            end;
                        else
                            assert(v29 ~= nil, "handleInertialMoveConn should exist");
                            v29:Disconnect();
                            v29 = nil;
                            return ;
                        end;
                    end);
                    return ;
                end;
            else
                return ;
            end;
        end, 
        onInputBegan = function(_, v85)
            if not v32 then
                if v85.UserInputType == Enum.UserInputType.Touch then
                    v30 = true;
                    v34 = true;
                end;
                return ;
            else
                return ;
            end;
        end, 
        resetMotor = v46, 
        resetTouchState = v36, 
        setGoal = v50
    };
    v86.resetMotor(0);
    return v86;
end;
return function(v88, v89, v90)
    local v91 = v11();
    local v92, v93 = l_useBinding_0(1);
    local v94, v95 = l_useBinding_0(1);
    local v96 = v7.useRef(nil);
    local v97, v98, v99 = l_useIsHovered_0();
    local v100 = l_useIsTouchDown_0();
    local v101 = v7.useRef(nil);
    local v102 = v7.useRef(nil);
    if v102.current == nil then
        v102.current = v87(v96, v101, v90);
    end;
    local l_current_4 = v102.current;
    assert(l_current_4 ~= nil, "carouselController should exist");
    v7.useEffect(function()
        local l_current_5 = v96.current;
        if l_current_5 then
            assert(l_current_5 ~= nil, "carousel should exist");
            local v105 = false;
            if l_UserGameSettings_0.ReducedMotion then
                v105 = true;
            end;
            l_current_4.resetMotor(l_current_5.CanvasPosition.X);
            l_current_4.setGoal(v88, v89, v105);
            return ;
        else
            return ;
        end;
    end, {
        v89
    });
    l_useEffectOnce_0(function()
        l_current_4.setGoal(v88, v89, true);
    end, v89 ~= nil);
    v7.useEffect(function()
        l_current_4.setGoal(v88, v89, true);
    end, {
        v88
    });
    v7.useEffect(function()
        if not (v100 or not l_current_4.getWasTouched()) then
            l_current_4.resetTouchState();
            l_current_4.handleInertialMove(v88, v89);
        end;
    end, {
        v100
    });
    l_useExternalEvent_0(l_UserInputService_0.PointerAction, (v7.useCallback(function(v106)
        local l_current_6 = v96.current;
        if l_current_6 then
            assert(l_current_6 ~= nil, "carousel should exist");
            if not l_current_4.getIsNavigationLocked() then
                local v108 = v18(v88, l_current_6);
                if v97 and v106 > 0 then
                    v90(v108 - 1);
                    return ;
                else
                    if v97 and v106 < 0 then
                        v90(v108 + 1);
                    end;
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end, {
        v97, 
        v88
    })));
    l_useExternalEvent_0(l_UserInputService_0.TouchSwipe, (v7.useCallback(function(v109)
        if l_UserGameSettings_0.ReducedMotion then
            local l_current_7 = v96.current;
            if l_current_7 then
                assert(l_current_7 ~= nil, "carousel should exist");
                if not l_current_4.getIsNavigationLocked() then
                    local v111 = v18(v88, l_current_7);
                    if v109 == Enum.SwipeDirection.Left then
                        v90(v111 + 1);
                        return ;
                    else
                        if v109 == Enum.SwipeDirection.Right then
                            v90(v111 - 1);
                        end;
                        return ;
                    end;
                else
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end, {})));
    v7.useEffect(function()
        if v19() or v20 then
            l_ContextActionService_0:BindCoreAction("CapturesCarouselNavigateShortcutAction", function(_, v113, v114)
                local l_current_8 = v96.current;
                if l_current_8 then
                    assert(l_current_8 ~= nil, "carousel should exist");
                    if not l_current_4.getIsNavigationLocked() then
                        if v113 == Enum.UserInputState.End then
                            v91.fireEvent(v17.CapturesCarouselNavigatedByKeyboard);
                            local v116 = v18(v88, l_current_8);
                            if v114.KeyCode == Enum.KeyCode.Left then
                                v90(v116 - 1);
                                return ;
                            elseif v114.KeyCode == Enum.KeyCode.Right then
                                v90(v116 + 1);
                            end;
                        end;
                        return ;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            end, false, Enum.KeyCode.Left, Enum.KeyCode.Right);
            return function()
                l_ContextActionService_0:UnbindCoreAction("CapturesCarouselNavigateShortcutAction");
            end;
        else
            return ;
        end;
    end, {});
    return {
        carouselInputBegan = v7.useCallback(function(v117, v118)
            if not l_current_4.getIsNavigationLocked() then
                if not l_UserGameSettings_0.ReducedMotion then
                    l_current_4.onInputBegan(v117, v118);
                    v98(v117, v118);
                    return ;
                else
                    v98(v117, v118);
                    return ;
                end;
            else
                return ;
            end;
        end, {
            l_current_4.onInputBegan, 
            v98
        }), 
        carouselInputEnded = v7.useCallback(function(v119, v120)
            v99(v119, v120);
        end, {
            v99
        }), 
        carouselRef = v96, 
        deleteSelectedItem = v7.useCallback(function(v121)
            l_current_4.handleDeleteTransition(v93, v95, v88, v89, false, v121);
        end, {
            v88, 
            v89, 
            v93
        }), 
        postDeletionItemBinding = v94, 
        selectedItemFadeOutBinding = v92, 
        selectedItemRef = v101
    };
end;
