local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v6.App.ImageSet.Images;
local l_useInitializedValue_0 = v6.Core.Hooks.useInitializedValue;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_useSignal_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useSignal;
local v13 = require(l_Modules_0.AvatarExperience.Common.Context.AdaptiveScrollingContext);
local v14 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v15 = require(l_Modules_0.AvatarExperience.Common.Hooks.useFullView);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v17 = require(l_CorePackages_0.Otter);
local v18 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v19 = require(l_Modules_0.AvatarExperience.Flags.AXAdaptiveScrollingImprovementIXPTest);
local v20 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXPortraitSplitAdaptiveScrollingFix);
local v21 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXAdaptiveScrollingItemResetFix);
local v22 = {
    dampingRatio = 1, 
    frequency = 5
};
local v23 = game:DefineFastInt("AXAdaptiveScrollingJustSelectedMillis", 500) / 1000;
local v24 = l_Images_0["icons/navigation/swipe"];
local l_SceneFullView_0 = v14.SceneFullView;
local l_None_0 = v14.None;
local l_UIFullView_0 = v14.UIFullView;
local function _(v28, v29)
    return math.abs(v28 - v29) < 1.0E-4;
end;
local function v137(v31)
    local v32 = v5.useRef(nil);
    local l_fullHeight_0 = v31.fullHeight;
    local l_midHeight_0 = v31.midHeight;
    local l_alwaysShowingHeight_0 = v31.alwaysShowingHeight;
    local v36 = v5.useRef(nil);
    local v37 = l_fullHeight_0 - l_alwaysShowingHeight_0;
    local v38 = v5.useRef(false);
    local v39 = not not v20() and v31.enableMidViewScrolling;
    local v40 = 20;
    if not (not v20() or not v39) then
        v40 = 0;
    end;
    local v41 = v5.useRef(nil);
    local v42 = if not v20() then nil else v5.useRef(nil);
    local v43, v44 = v5.useState({
        instance = nil, 
        time = 0
    });
    local v45, v46 = v5.useState(0);
    local v47, v48 = v5.useState(0);
    local function v49()
        if v41.current then
            v41.current:destroy();
            v41.current = nil;
        end;
    end;
    local v50 = nil;
    if not (not v20() or not v39) then
        v50 = function()
            if not (not v42 or not v42.current) then
                v42.current:destroy();
                v42.current = nil;
            end;
        end;
    end;
    v5.useEffect(function()
        if not v20() or not v39 then
            return v49;
        else
            return function()
                if v41.current then
                    v41.current:destroy();
                    v41.current = nil;
                end;
                v50();
            end;
        end;
    end, {});
    local v51 = l_useStyle_0();
    local l_Theme_0 = v51.Theme;
    local function _(v53)
        if v53 == l_UIFullView_0 then
            return l_fullHeight_0;
        elseif v53 == l_SceneFullView_0 then
            return l_alwaysShowingHeight_0;
        else
            return l_midHeight_0;
        end;
    end;
    local v55, v56 = v5.useBinding(0);
    local v57, v58 = v15();
    local v59 = v5.useRef(v57);
    v59.current = v57;
    local l_useState_0 = v5.useState;
    local v61 = true;
    if v57 ~= l_UIFullView_0 then
        v61 = (v20() and v39) and v57 == l_None_0;
    end;
    l_useState_0, v61 = l_useState_0(v61);
    local v62 = v5.useCallback(function()
        v61(false);
    end);
    local function _()
        return v41.current ~= nil;
    end;
    local function v74()
        if v21() and v57 ~= l_None_0 then
            return ;
        else
            if not v20() or not v39 then
                if v23 < v43.time - tick() then
                    return ;
                end;
            elseif v23 < tick() - v43.time then
                return ;
            end;
            local l_instance_0 = v43.instance;
            if l_instance_0 then
                assert(l_instance_0, "");
                local l_l_instance_0_FirstAncestorWhichIsA_0 = l_instance_0:FindFirstAncestorWhichIsA("ScrollingFrame");
                if not l_l_instance_0_FirstAncestorWhichIsA_0 or l_l_instance_0_FirstAncestorWhichIsA_0 == v36.current then
                    return ;
                else
                    assert(l_l_instance_0_FirstAncestorWhichIsA_0, "");
                    if not v21() and v57 ~= l_None_0 then
                        return ;
                    else
                        local l_Y_0 = l_instance_0.AbsolutePosition.Y;
                        local l_Y_1 = l_l_instance_0_FirstAncestorWhichIsA_0.CanvasPosition.Y;
                        if not v20() or not v39 then
                            local v68 = l_Y_0 + l_instance_0.AbsoluteSize.Y;
                            local v69 = l_l_instance_0_FirstAncestorWhichIsA_0.AbsolutePosition.Y + v45;
                            local v70 = ((l_l_instance_0_FirstAncestorWhichIsA_0.AbsolutePosition.Y + l_midHeight_0) - v4.PeekHeaderHeight) - v47;
                            if l_Y_0 < v69 then
                                l_Y_1 = l_Y_1 - (v69 - l_Y_0);
                            elseif v70 < v68 then
                                l_Y_1 = l_Y_1 + (v68 - v70);
                            end;
                        else
                            local v71 = l_Y_0 - l_l_instance_0_FirstAncestorWhichIsA_0.AbsolutePosition.Y;
                            if math.abs(v71) > 5 then
                                l_Y_1 = l_Y_1 + v71;
                            end;
                        end;
                        l_Y_1 = math.clamp(l_Y_1, 0, l_l_instance_0_FirstAncestorWhichIsA_0.AbsoluteCanvasSize.Y - l_l_instance_0_FirstAncestorWhichIsA_0.AbsoluteWindowSize.Y);
                        if not v20() or not v39 then
                            l_l_instance_0_FirstAncestorWhichIsA_0.CanvasPosition = Vector2.new(l_l_instance_0_FirstAncestorWhichIsA_0.CanvasPosition.X, l_Y_1);
                        elseif v42 then
                            local v72 = v17.createSingleMotor(l_l_instance_0_FirstAncestorWhichIsA_0.CanvasPosition.Y);
                            v42.current = v72;
                            v72:onStep(function(v73)
                                l_l_instance_0_FirstAncestorWhichIsA_0.ScrollVelocity = Vector2.new(0, 0);
                                l_l_instance_0_FirstAncestorWhichIsA_0.CanvasPosition = Vector2.new(0, v73);
                            end);
                            v72:onComplete(function()
                                v50();
                            end);
                            v72:setGoal(v17.spring(l_Y_1, v22));
                            return ;
                        end;
                        return ;
                    end;
                end;
            else
                return ;
            end;
        end;
    end;
    local v85 = v5.useCallback(function(v75, v76)
        local l_current_0 = v36.current;
        if l_current_0 then
            assert(l_current_0, "");
            local l_Y_2 = l_current_0.CanvasPosition.Y;
            local v79 = if v75 == l_UIFullView_0 then l_fullHeight_0 else if v75 == l_SceneFullView_0 then l_alwaysShowingHeight_0 else l_midHeight_0 - l_alwaysShowingHeight_0;
            if not (v41.current ~= nil) then
                if not v20() or not v39 then
                    v61(v75 == l_UIFullView_0);
                else
                    local l_v61_0 = v61;
                    local v81 = true;
                    if v75 ~= l_UIFullView_0 then
                        v81 = v75 == l_None_0;
                    end;
                    l_v61_0(v81);
                end;
                if not (v75 == v57) or not (math.abs(v79 - l_Y_2) < 1.0E-4) then
                    v58(v75);
                    local v82 = v17.createSingleMotor(l_Y_2);
                    v41.current = v82;
                    v82:onStep(function(v83)
                        l_current_0.ScrollVelocity = Vector2.new(0, 0);
                        l_current_0.CanvasPosition = Vector2.new(0, v83);
                    end);
                    v82:onComplete(function(_)
                        if v41.current then
                            v41.current:destroy();
                            v41.current = nil;
                        end;
                        v74();
                    end);
                    if not v76 then
                        v82:setGoal(v17.instant(v79));
                        return ;
                    else
                        v82:setGoal(v17.spring(v79, v22));
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
    end, {
        v57, 
        v58, 
        l_alwaysShowingHeight_0, 
        l_midHeight_0, 
        l_fullHeight_0
    });
    v5.useEffect(function()
        v85(v59.current, false);
    end, {
        l_alwaysShowingHeight_0, 
        l_midHeight_0, 
        l_fullHeight_0
    });
    v5.useEffect(function()
        v85(v57, true);
    end, {
        v57
    });
    v5.useEffect(function()
        if not (not (not ((not v20() or not v39) or not v43.instance) and v57 == l_None_0) or v41.current ~= nil) then
            v74();
        end;
    end, {
        v43.instance, 
        v57, 
        v39
    });
    local v86 = l_useInitializedValue_0(l_Signal_0.new);
    l_useSignal_0(v86, v62);
    local v95 = v5.useMemo(function()
        local function _(v87)
            if not (not (v86 and v87 < -v40) or not v38.current) then
                v86:fire();
            end;
        end;
        return {
            scrollingEnabled = l_useState_0, 
            overscrollSignal = v86, 
            onCanvasYChanged = function(v89)
                if not (not (v86 and v89 < -v40) or not v38.current) then
                    v86:fire();
                end;
            end, 
            onCanvasPositionChanged = function(v90)
                local l_Y_3 = v90.CanvasPosition.Y;
                if not (not (v86 and l_Y_3 < -v40) or not v38.current) then
                    v86:fire();
                end;
            end, 
            setSelectedItemInstance = function(v92)
                if not v21() or v92 then
                    v44({
                        instance = v92, 
                        time = tick()
                    });
                    return ;
                else
                    v44({
                        instance = nil, 
                        time = 0
                    });
                    return ;
                end;
            end, 
            setTopAndBottomPanelHeights = function(v93, v94)
                if v93 ~= v45 then
                    v46(v93);
                end;
                if v94 ~= v47 then
                    v48(v94);
                end;
            end
        };
    end, {
        l_useState_0, 
        v86
    });
    local function v97(v96)
        v56(v96.CanvasPosition.Y);
    end;
    local function _(v98, v99, v100, v101)
        local v102 = if v100 == l_UIFullView_0 then l_fullHeight_0 else if v100 == l_SceneFullView_0 then l_alwaysShowingHeight_0 else l_midHeight_0;
        local v103 = if v99 == l_UIFullView_0 then l_fullHeight_0 else if v99 == l_SceneFullView_0 then l_alwaysShowingHeight_0 else l_midHeight_0;
        local v104 = v102 - v103;
        local v105 = v101 < 0;
        local v106 = v101 > 0;
        if v57 == v100 then
            if v106 or v98 < v103 + v104 * 0.8 then
                return v99;
            else
                return v100;
            end;
        elseif v105 or v103 + v104 * 0.2 < v98 then
            return v100;
        else
            return v99;
        end;
    end;
    local v128 = v5.useCallback(function()
        local l_current_1 = v36.current;
        if l_current_1 then
            assert(l_current_1, "");
            local v109 = l_alwaysShowingHeight_0 + l_current_1.CanvasPosition.Y;
            local l_Y_4 = l_current_1.ScrollVelocity.Y;
            local v111 = false;
            if v57 == l_SceneFullView_0 then
                v111 = v109 == l_alwaysShowingHeight_0;
            end;
            local v112 = false;
            if v57 == l_UIFullView_0 then
                v112 = v109 == l_fullHeight_0;
            end;
            local v113;
            if not v20() or not v39 then
                v113 = false;
            else
                v113 = false;
                if v57 == l_None_0 then
                    v113 = v109 == l_midHeight_0;
                end;
            end;
            if not (not (v111 or v112) and not v113) and l_Y_4 == 0 then
                return nil;
            elseif l_midHeight_0 < v109 then
                local l_l_None_0_0 = l_None_0;
                local l_l_UIFullView_0_0 = l_UIFullView_0;
                local v116 = if l_l_UIFullView_0_0 == l_UIFullView_0 then l_fullHeight_0 else if l_l_UIFullView_0_0 == l_SceneFullView_0 then l_alwaysShowingHeight_0 else l_midHeight_0;
                local v117 = if l_l_None_0_0 == l_UIFullView_0 then l_fullHeight_0 else if l_l_None_0_0 == l_SceneFullView_0 then l_alwaysShowingHeight_0 else l_midHeight_0;
                local v118 = v116 - v117;
                local v119 = l_Y_4 < 0;
                local v120 = l_Y_4 > 0;
                if v57 == l_l_UIFullView_0_0 then
                    if v120 or v109 < v117 + v118 * 0.8 then
                        return l_l_None_0_0;
                    else
                        return l_l_UIFullView_0_0;
                    end;
                elseif v119 or v117 + v118 * 0.2 < v109 then
                    return l_l_UIFullView_0_0;
                else
                    return l_l_None_0_0;
                end;
            else
                local l_l_SceneFullView_0_0 = l_SceneFullView_0;
                local l_l_None_0_1 = l_None_0;
                local v123 = if l_l_None_0_1 == l_UIFullView_0 then l_fullHeight_0 else if l_l_None_0_1 == l_SceneFullView_0 then l_alwaysShowingHeight_0 else l_midHeight_0;
                local v124 = if l_l_SceneFullView_0_0 == l_UIFullView_0 then l_fullHeight_0 else if l_l_SceneFullView_0_0 == l_SceneFullView_0 then l_alwaysShowingHeight_0 else l_midHeight_0;
                local v125 = v123 - v124;
                local v126 = l_Y_4 < 0;
                local v127 = l_Y_4 > 0;
                if v57 == l_l_None_0_1 then
                    if v127 or v109 < v124 + v125 * 0.8 then
                        return l_l_SceneFullView_0_0;
                    else
                        return l_l_None_0_1;
                    end;
                elseif v126 or v124 + v125 * 0.2 < v109 then
                    return l_l_None_0_1;
                else
                    return l_l_SceneFullView_0_0;
                end;
            end;
        else
            return nil;
        end;
    end, {
        v57, 
        l_fullHeight_0, 
        l_midHeight_0, 
        l_alwaysShowingHeight_0
    });
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = if not not v20() and v39 then UDim2.new(1, 1, 1, 0) else UDim2.fromScale(1, 1), 
        ref = v32
    }, {
        DropShadowBackground = v5.createElement("Frame", {
            ZIndex = 0, 
            Size = UDim2.new(1, 0, 0, 36), 
            Position = v55:map(function(v129)
                return UDim2.new(0, 0, 1, (-v129 - l_alwaysShowingHeight_0) - 30);
            end)
        }, {
            UIGradient = v5.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v51.Theme.DropShadow.Color), 
                    ColorSequenceKeypoint.new(1, v51.Theme.DropShadow.Color)
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0.7)
                })
            })
        }), 
        ClipFrame = v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            AnchorPoint = Vector2.new(0.5, 1), 
            Position = UDim2.fromScale(0.5, 1), 
            Size = v55:map(function(v130)
                return UDim2.new(1, 0, 0, v130 + l_alwaysShowingHeight_0);
            end)
        }, {
            ScrollingFrame = v5.createElement("ScrollingFrame", {
                ref = v36, 
                AnchorPoint = Vector2.new(0.5, 1), 
                Position = UDim2.fromScale(0.5, 1), 
                Size = UDim2.new(1, 0, 0, l_fullHeight_0), 
                CanvasSize = UDim2.new(1, 0, 0, l_fullHeight_0 + v37), 
                BackgroundTransparency = 1, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                ScrollBarThickness = 0, 
                ElasticBehavior = Enum.ElasticBehavior.Never, 
                [v5.Change.CanvasPosition] = v97
            }, {
                VerticalLayout = v5.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                Spacer = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Active = false, 
                    Size = UDim2.new(1, 0, 0, v37), 
                    LayoutOrder = 1
                }), 
                PeekHeader = v5.createElement("TextButton", {
                    Text = "", 
                    LayoutOrder = 2, 
                    ZIndex = 2, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v4.PeekHeaderHeight), 
                    BorderSizePixel = 0, 
                    [v5.Event.Activated] = v5.useCallback(function()
                        if not (v57 ~= l_UIFullView_0) or v57 == l_SceneFullView_0 then
                            v85(l_None_0, true);
                            return ;
                        else
                            v85(l_UIFullView_0, true);
                            return ;
                        end;
                    end, {
                        v57, 
                        v85
                    })
                }, {
                    PeekHeaderBackground = v5.createElement("Frame", {
                        LayoutOrder = 2, 
                        ZIndex = 1, 
                        Size = UDim2.new(1, 0, 0, v4.PeekHeaderHeight + 12), 
                        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                        BorderSizePixel = 0, 
                        Active = false
                    }, {
                        UICorner = v5.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 12)
                        })
                    }), 
                    Dragger = v5.createElement(l_ImageSetLabel_0, {
                        ZIndex = 2, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 36, 1, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Image = v24, 
                        ImageColor3 = v51.Theme.UIEmphasis.Color, 
                        ImageTransparency = v51.Theme.UIEmphasis.Transparency, 
                        Active = false
                    })
                }), 
                ExpandingContent = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = if not not v20() and v39 then v55:map(function(v131)
                        return UDim2.new(1, 0, 0, v131 + l_alwaysShowingHeight_0);
                    end) else UDim2.new(1, 0, 0, l_fullHeight_0 - v4.PeekHeaderHeight), 
                    LayoutOrder = 3, 
                    ZIndex = 3
                }, {
                    AdaptiveScrollingProvider = v5.createElement(v13.Provider, {
                        value = v95
                    }, v31.children)
                }), 
                OnInputBegan = v5.createElement(l_ExternalEventConnection_0, {
                    event = l_UserInputService_0.InputBegan, 
                    callback = v5.useCallback(function(v132)
                        if v132.UserInputType ~= Enum.UserInputType.Touch then
                            return ;
                        else
                            v38.current = true;
                            if v41.current then
                                v41.current:destroy();
                                v41.current = nil;
                            end;
                            return ;
                        end;
                    end)
                }), 
                OnInputEnded = v5.createElement(l_ExternalEventConnection_0, {
                    event = l_UserInputService_0.InputEnded, 
                    callback = v5.useCallback(function(v133)
                        if v133.UserInputType ~= Enum.UserInputType.Touch then
                            return ;
                        else
                            v38.current = false;
                            local v134 = v128();
                            if not v134 then
                                if not v20() or not v39 then
                                    v61(v59.current == l_UIFullView_0);
                                    return ;
                                else
                                    local l_v61_1 = v61;
                                    local v136 = true;
                                    if v59.current ~= l_UIFullView_0 then
                                        v136 = v59.current == l_None_0;
                                    end;
                                    l_v61_1(v136);
                                    return ;
                                end;
                            else
                                v85(v134, true);
                                return ;
                            end;
                        end;
                    end, {
                        v85, 
                        v128
                    })
                })
            })
        })
    });
end;
if v20() then
    v137 = v18.connectTestVariables({
        enableMidViewScrolling = v19.EnableMidViewScrolling
    })(v137);
end;
return v137;
