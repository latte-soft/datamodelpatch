local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script:FindFirstAncestor("PeekView").Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_RunService_0 = game:GetService("RunService");
local v5 = require(l_Parent_0.Roact);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.Cryo);
local v8 = require(l_Parent_0.RoactGamepad);
local l_Focusable_0 = v8.Focusable;
local v10 = require(l_Parent_0.RoactRodux);
local v11 = require(script.Parent.FitChildren);
local v12 = require(script.Parent.PeekViewState);
local v13 = require(script.Parent.Scrim);
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ExternalEventConnection_0 = require(l_Parent_0.RoactUtils).ExternalEventConnection;
local v17 = require(l_Parent_0.ArgCheck);
local l_InputTypeConstants_0 = require(l_Parent_0.InputType).InputTypeConstants;
local l_GamepadUtils_0 = require(l_Parent_0.AppCommonLib).Utils.GamepadUtils;
local l_getInputGroup_0 = require(l_Parent_0.InputType).getInputGroup;
local v21 = require(l_Parent_0.RoactAppExperiment);
local v22 = require(script.Parent.analytics.peekViewDismissedEvent);
local l_GetFFlagPeekViewDeprecateFitChildren_0 = require(l_Parent_0.SharedFlags).GetFFlagPeekViewDeprecateFitChildren;
local l_GetFFlagEnablePeekViewStateOnMountParam_0 = require(l_Parent_0.SharedFlags).GetFFlagEnablePeekViewStateOnMountParam;
local l_GetFFlagPeekViewScrimEnabledIXP_0 = require(l_Parent_0.SharedFlags).GetFFlagPeekViewScrimEnabledIXP;
local l_GetFFlagPeekViewScrimEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagPeekViewScrimEnabled;
local l_GetFFlagHideDraggerPeekView_0 = require(l_Parent_0.SharedFlags).GetFFlagHideDraggerPeekView;
local l_GetFFlagPeekViewScrimLogging_0 = require(l_Parent_0.SharedFlags).GetFFlagPeekViewScrimLogging;
local l_GetFFlagPeekViewMinimizeToSuperBrief_0 = require(l_Parent_0.SharedFlags).GetFFlagPeekViewMinimizeToSuperBrief;
local l_GetFFlagEDPContextRedesign_0 = require(l_Parent_0.SharedFlags).GetFFlagEDPContextRedesign;
local v31 = game:DefineFastFlag("FixPeekViewScrimAssert", false);
local v32 = l_GetFFlagPeekViewDeprecateFitChildren_0() and game:GetEngineFeature("UseActualSizeToCalculateListMinSize");
local v33 = Rect.new(9, 9, 9, 9);
local v34 = l_Images_0["icons/navigation/swipe"];
local v35 = UDim.new(1, 0);
local l_Hidden_0 = v12.Hidden;
local l_Closed_0 = v12.Closed;
local l_SuperBrief_0 = v12.SuperBrief;
local l_Brief_0 = v12.Brief;
local l_Full_0 = v12.Full;
local l_Extended_0 = v12.Extended;
local v42 = v5.PureComponent:extend("PeekView");
v42.defaultProps = {
    superBriefViewContentHeight = nil, 
    briefViewContentHeight = UDim.new(0.5, 0), 
    fullViewContentHeight = if l_GetFFlagPeekViewScrimEnabled_0() or l_GetFFlagPeekViewScrimEnabledIXP_0() then UDim.new(1, 0) else nil, 
    bottomDockedContainerHeight = 0, 
    bottomDockedContainerContent = nil, 
    elasticBehavior = Enum.ElasticBehavior.Always, 
    hidden = false, 
    showDraggerInClosedState = true, 
    showDropShadow = true, 
    stateOnMount = nil, 
    mountAsFullView = false, 
    mountAnimation = true, 
    canDragFullViewToBrief = false, 
    withNewThemeProvider = true, 
    viewStateChanged = nil, 
    briefToFullTransitionPercent = nil, 
    peekHeaderClose = true, 
    peekHeaderPositionYChange = nil, 
    isScrollingEnabled = true, 
    closeSignal = nil, 
    hideDraggerInSuperBrief = if not l_GetFFlagHideDraggerPeekView_0() then nil else false, 
    minimizeToSuperBrief = if not l_GetFFlagPeekViewMinimizeToSuperBrief_0() then nil else false, 
    overlayDragger = if not l_GetFFlagEDPContextRedesign_0() then nil else false
};
v42.init = function(v43)
    v43.isMounted = false;
    v43.isTouched = false;
    v43.isInGoToState = false;
    v43.useReducedMotion = l_UserGameSettings_0.ReducedMotion;
    v43.viewType = l_Hidden_0;
    v43:setState({
        scrollableViewType = false, 
        absoluteWindowSizeX = 0, 
        absoluteWindowSizeY = 0, 
        lastInputGroup = l_getInputGroup_0(l_UserInputService_0:GetLastInputType()), 
        canvasGroupTransparency = 0
    });
    v43.containerFrameRef = v5.createRef();
    v43.clipFrameRef = v5.createRef();
    v43.shadowRef = v5.createRef();
    v43.fillingAreaRef = v5.createRef();
    v43.swipeScrollingFrameRef = v5.createRef();
    v43.bottomContainerRef = v5.createRef();
    if l_GetFFlagEDPContextRedesign_0() then
        local v44, v45 = v5.createBinding(0);
        v43.transitionPercent = v44;
        v43.setTransitionPercent = v45;
    end;
    v43.onAbsoluteWindowSizeChanged = function(v46)
        if not (v46.AbsoluteWindowSize.X == v43.state.absoluteWindowSizeX) or v46.AbsoluteWindowSize.Y ~= v43.state.absoluteWindowSizeY then
            v43:setState({
                absoluteWindowSizeX = v46.AbsoluteWindowSize.X, 
                absoluteWindowSizeY = v46.AbsoluteWindowSize.Y
            });
        end;
    end;
    v43.withStyle = function(v47)
        if not v43.props.withNewThemeProvider then
            return v47({
                Theme = {
                    BackgroundDefault = {
                        Color = Color3.fromRGB(35, 37, 39), 
                        Transparency = 0
                    }, 
                    UIEmphasis = {
                        Color = Color3.fromRGB(255, 255, 255), 
                        Transparency = 0.7
                    }, 
                    DropShadow = {
                        Color = Color3.fromRGB(0, 0, 0), 
                        Transparency = 0
                    }
                }, 
                Settings = {
                    ReducedMotion = false
                }
            });
        else
            return v6.Style.withStyle(v47);
        end;
    end;
    v43.inputBeganCallback = function(v48)
        if v43.isMounted then
            if v48.UserInputType ~= Enum.UserInputType.Touch then
                return ;
            else
                v43.isTouched = true;
                return ;
            end;
        else
            return ;
        end;
    end;
    v43.inputEndedCallback = function(v49)
        if v43.isMounted then
            if v49.UserInputType ~= Enum.UserInputType.Touch then
                return ;
            else
                v43.isTouched = false;
                v43.checkGoTo();
                return ;
            end;
        else
            return ;
        end;
    end;
    v43.getViewSize = function(v50)
        if v50 == l_Hidden_0 then
            return UDim.new(0, 0);
        elseif v50 == l_Closed_0 then
            if not v43.props.showDraggerInClosedState then
                return UDim.new(0, 0);
            else
                return UDim.new(0, 25);
            end;
        elseif v50 == l_SuperBrief_0 then
            if not v43.props.superBriefViewContentHeight then
                return nil;
            else
                local l_superBriefViewContentHeight_0 = v43.props.superBriefViewContentHeight;
                return UDim.new(l_superBriefViewContentHeight_0.Scale, l_superBriefViewContentHeight_0.Offset + 25);
            end;
        elseif v50 == l_Brief_0 then
            local l_briefViewContentHeight_0 = v43.props.briefViewContentHeight;
            return UDim.new(l_briefViewContentHeight_0.Scale, l_briefViewContentHeight_0.Offset + 25);
        elseif v50 == l_Full_0 then
            if not l_GetFFlagPeekViewScrimEnabled_0() and not v43.props.scrimEnabled then
                return v35;
            else
                return v43.props.fullViewContentHeight;
            end;
        else
            return nil;
        end;
    end;
    v43.reconcileRbxInstances = function()
        local l_current_0 = v43.swipeScrollingFrameRef.current;
        local v54 = not not l_current_0 and l_current_0.CanvasPosition.Y or 0;
        local l_current_1 = v43.containerFrameRef.current;
        local l_current_2 = v43.clipFrameRef.current;
        local l_current_3 = v43.shadowRef.current;
        local l_current_4 = v43.fillingAreaRef.current;
        local l_X_0 = l_current_1.AbsoluteSize.X;
        local l_Y_0 = l_current_1.AbsoluteSize.Y;
        l_current_2.Size = UDim2.new(0, l_X_0, 0, v54);
        l_current_3.Size = UDim2.new(0, l_X_0, 0, 36);
        l_current_2.Position = UDim2.new(0, 0, 1, -v54);
        l_current_3.Position = UDim2.new(0, 0, 1, -v54 - 30);
        l_current_0.Size = UDim2.new(0, l_X_0, 0, l_Y_0);
        l_current_0.Position = UDim2.new(0, 0, 0, -(l_Y_0 - v54));
        l_current_4.Size = UDim2.new(0, l_X_0, 0, l_Y_0);
        local l_current_5 = v43.bottomContainerRef.current;
        if l_current_5 then
            local l_bottomDockedContainerHeight_0 = v43.props.bottomDockedContainerHeight;
            if 25 + l_bottomDockedContainerHeight_0 < l_current_2.AbsoluteSize.Y then
                l_current_5.Active = true;
                l_current_5.Position = UDim2.new(0, 0, 1, -l_bottomDockedContainerHeight_0);
            else
                l_current_5.Active = false;
                l_current_5.Position = UDim2.new(0, 0, 1, -l_current_2.AbsoluteSize.Y + 25);
            end;
        end;
        v43.transitionCallbacks();
        if not (not l_GetFFlagEDPContextRedesign_0() or not v43.props.peekHeaderPositionYChange) then
            v43.props.peekHeaderPositionYChange(v54);
        end;
    end;
    v43.updateSwipeScrollingFrame = function()
        local v63 = v43.getViewSize(v43.viewType);
        local v64 = v43.containerFrameRef.current and v43.swipeScrollingFrameRef.current;
        if not (not v63 or not v64) then
            local l_Y_1 = v43.containerFrameRef.current.AbsoluteSize.Y;
            local l_current_6 = v43.swipeScrollingFrameRef.current;
            local v67 = l_Y_1 * v63.Scale + v63.Offset;
            if l_current_6.CanvasPosition.Y ~= v67 then
                l_current_6.CanvasPosition = Vector2.new(0, v67);
                if v43.props.peekHeaderPositionYChange then
                    v43.props.peekHeaderPositionYChange(v67);
                end;
            end;
        end;
    end;
    v43.onContainerFrameAbsoluteSizeChanged = function()
        if v43.isMounted then
            v43.reconcileRbxInstances();
            v43.updateSwipeScrollingFrame();
            return ;
        else
            return ;
        end;
    end;
    v43.onSwipeScrollingFrameCanvasPositionChanged = function()
        if v43.isMounted then
            local l_current_7 = v43.swipeScrollingFrameRef.current;
            local l_Y_2 = l_current_7.CanvasPosition.Y;
            if l_Y_2 ~= math.floor(l_Y_2) then
                l_current_7.CanvasPosition = Vector2.new(0, (math.floor(l_Y_2 + 0.5)));
                if v43.props.peekHeaderPositionYChange then
                    v43.props.peekHeaderPositionYChange(l_Y_2);
                end;
                return ;
            else
                v43.reconcileRbxInstances();
                if v43.state.lastInputGroup ~= l_InputTypeConstants_0.Gamepad then
                    v43.checkGoTo();
                end;
                return ;
            end;
        else
            return ;
        end;
    end;
    v43.getBriefViewY = function()
        local l_Y_3 = v43.containerFrameRef.current.AbsoluteSize.Y;
        local l_briefViewContentHeight_1 = v43.props.briefViewContentHeight;
        return (l_Y_3 * l_briefViewContentHeight_1.Scale + l_briefViewContentHeight_1.Offset) + 25;
    end;
    v43.getSuperBriefViewY = function()
        if v43.props.superBriefViewContentHeight and v43.containerFrameRef:getValue() then
            local l_Y_4 = v43.containerFrameRef:getValue().AbsoluteSize.Y;
            local l_superBriefViewContentHeight_1 = v43.props.superBriefViewContentHeight;
            return (l_Y_4 * l_superBriefViewContentHeight_1.Scale + l_superBriefViewContentHeight_1.Offset) + 25;
        else
            return nil;
        end;
    end;
    v43.getFullViewY = function()
        local l_Y_5 = v43.containerFrameRef.current.AbsoluteSize.Y;
        if not l_GetFFlagPeekViewScrimEnabled_0() and not v43.props.scrimEnabled then
            return l_Y_5 * v35.Scale + v35.Offset;
        else
            return l_Y_5 * v43.props.fullViewContentHeight.Scale + v43.props.fullViewContentHeight.Offset;
        end;
    end;
    v43.transitionCallbacks = function()
        local l_briefToFullTransitionPercent_0 = v43.props.briefToFullTransitionPercent;
        if not (not l_GetFFlagEDPContextRedesign_0() and not l_briefToFullTransitionPercent_0) then
            local l_Y_6 = v43.swipeScrollingFrameRef.current.CanvasPosition.Y;
            local v77 = v43.getBriefViewY();
            local v78 = v43.getFullViewY();
            local v79 = v78 - v77;
            local v80 = 0;
            if v77 < l_Y_6 and l_Y_6 <= v78 then
                v80 = (l_Y_6 - v77) / v79;
            elseif v78 < l_Y_6 then
                v80 = 1;
            end;
            if l_GetFFlagEDPContextRedesign_0() then
                v43.setTransitionPercent(v80);
            end;
            if not (not (l_GetFFlagEDPContextRedesign_0() and l_briefToFullTransitionPercent_0) and l_GetFFlagEDPContextRedesign_0()) then
                l_briefToFullTransitionPercent_0(v80);
            end;
        end;
    end;
    v43.checkGoTo = function()
        if not v43.isInGoToState then
            if not v43.isTouched then
                local l_current_8 = v43.swipeScrollingFrameRef.current;
                if (l_current_8 and v43.state.absoluteWindowSizeX == 0) and v43.state.absoluteWindowSizeY == 0 then
                    return ;
                else
                    local v82 = v43.getBriefViewY();
                    local v83 = v43.getSuperBriefViewY();
                    local v84 = v43.getFullViewY();
                    if v84 < v82 then
                        return ;
                    elseif v83 and v82 < v83 then
                        return ;
                    elseif (not not v32 and l_current_8.AbsoluteCanvasSize.Y or l_current_8.CanvasSize.Y.Offset) < (l_current_8.AbsoluteWindowSize.Y + 25) + v43.props.bottomDockedContainerHeight then
                        return ;
                    else
                        local l_Y_7 = l_current_8.ScrollVelocity.Y;
                        local v86 = l_Y_7 < 0;
                        local v87 = l_Y_7 > 0;
                        local l_Y_8 = l_current_8.CanvasPosition.Y;
                        local v89 = false;
                        if v43.viewType == v12.Brief then
                            v89 = l_Y_8 == v82;
                        end;
                        local v90 = false;
                        if v43.viewType == v12.Full then
                            v90 = l_Y_8 == v84;
                        end;
                        if not (not v89 and not v90) and l_Y_7 == 0 then
                            return ;
                        elseif v84 < l_Y_8 then
                            v43:handleCurYAboveFullViewY(v86);
                            return ;
                        elseif v82 < l_Y_8 and l_Y_8 <= v84 then
                            v43:handleCurYFromBriefToFull(l_Y_8, l_Y_7, v86, v87);
                            return ;
                        else
                            if not v83 then
                                if l_Y_8 <= v82 then
                                    v43:handleCurYFromClosedToBrief(l_Y_8, v87, v86);
                                end;
                            elseif v83 < l_Y_8 and l_Y_8 <= v82 then
                                v43:handleCurYFromSuperBriefToBrief(l_Y_8, v83, l_Y_7, v86, v87);
                                return ;
                            elseif l_Y_8 <= v83 then
                                v43:handleCurYFromClosedToSuperBrief(l_Y_8, v83, l_Y_7, v87, v86);
                                return ;
                            end;
                            return ;
                        end;
                    end;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v43.onPeekHeaderActivated = function()
        if v43.viewType == l_Closed_0 then
            v43.goTo(l_Brief_0);
            return ;
        elseif v43.viewType == l_Brief_0 then
            v43.goTo(l_Full_0);
            return ;
        elseif v43.viewType == l_SuperBrief_0 then
            v43.goTo(l_Brief_0);
            return ;
        else
            if v43.viewType == l_Full_0 then
                if not v43.props.peekHeaderClose then
                    v43.goTo(l_Brief_0);
                elseif not l_GetFFlagPeekViewScrimLogging_0() then
                    v43.goTo(l_Closed_0);
                    return ;
                else
                    v43.goTo(l_Closed_0, nil, nil, {
                        dismissMethod = v22.dismissMethodEnum.handleTap
                    });
                    return ;
                end;
            end;
            return ;
        end;
    end;
    v43.setViewType = function(v91, v92)
        if v43.goToAnimationConnection then
            v43.goToAnimationConnection:disconnect();
            v43.goToAnimationConnection = nil;
        end;
        v43.isInGoToState = false;
        v43.clipFrameRef.current.Active = false;
        local l_viewType_0 = v43.viewType;
        if l_viewType_0 ~= v91 then
            v43.viewType = v91;
            local v94 = true;
            if v43.viewType ~= l_Extended_0 then
                v94 = v43.viewType == l_Full_0;
            end;
            v43:setState({
                scrollableViewType = v94
            });
            local l_viewStateChanged_0 = v43.props.viewStateChanged;
            if l_viewStateChanged_0 then
                if not l_GetFFlagPeekViewScrimLogging_0() then
                    l_viewStateChanged_0(v91, l_viewType_0);
                else
                    l_viewStateChanged_0(v91, l_viewType_0, v92 or {});
                end;
            end;
        end;
        v43.updateSwipeScrollingFrame();
    end;
    v43.goTo = function(v96, v97, v98, v99)
        if v43.viewType == v96 then
            return ;
        elseif not v17.isEqual(v43.isInGoToState, false, "self.isInGoToState") then
            if not v17.isEqual(v43.goToAnimationConnection, nil, "self.goToAnimationConnection") then
                v43.isInGoToState = true;
                v43.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0);
                v43.clipFrameRef.current.Active = true;
                if v97 == false then
                    if not l_GetFFlagPeekViewScrimLogging_0() then
                        v43.setViewType(v96);
                    else
                        v43.setViewType(v96, v99);
                    end;
                    if v96 == l_Full_0 then
                        v43:adjustScrollingFramePosition();
                        return ;
                    end;
                else
                    local v100 = tick();
                    if v98 then
                        if v96 ~= l_Closed_0 then
                            if not l_GetFFlagPeekViewScrimLogging_0() then
                                v43.setViewType(v96);
                            else
                                v43.setViewType(v96, v99);
                            end;
                            if v96 == l_Full_0 then
                                v43:adjustScrollingFramePosition();
                            end;
                        end;
                        v43:setState({
                            canvasGroupTransparency = v96 == l_Closed_0 and 0 or 1
                        });
                        v43.goToAnimationConnection = l_RunService_0.RenderStepped:Connect(function()
                            if v43.isMounted then
                                if v96 == l_Full_0 then
                                    v43.updateSwipeScrollingFrame();
                                end;
                                local v101 = tick() - v100;
                                if v101 >= 0.35 then
                                    v43:setState({
                                        canvasGroupTransparency = v96 == l_Closed_0 and 1 or 0
                                    });
                                    if not l_GetFFlagPeekViewScrimLogging_0() then
                                        v43.setViewType(v96);
                                    else
                                        v43.setViewType(v96, v99);
                                    end;
                                    if v96 == l_Full_0 then
                                        v43:adjustScrollingFramePosition();
                                    end;
                                    return ;
                                else
                                    v43:setState({
                                        canvasGroupTransparency = if v96 == l_Closed_0 then v101 / 0.35 else 1 - v101 / 0.35
                                    });
                                    return ;
                                end;
                            else
                                return ;
                            end;
                        end);
                    else
                        v43:setState({
                            canvasGroupTransparency = v96 == l_Closed_0 and 1 or 0
                        });
                        v43.goToAnimationConnection = l_RunService_0.RenderStepped:Connect(function()
                            if v43.isMounted then
                                v43.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0);
                                local l_current_9 = v43.swipeScrollingFrameRef.current;
                                local l_Y_9 = v43.containerFrameRef.current.AbsoluteSize.Y;
                                local v104 = v17.isNotNil(v43.getViewSize(v96), "self.goTo.viewSize");
                                local v105 = l_Y_9 * v104.Scale + v104.Offset;
                                local v106 = tick() - v100;
                                if v106 >= 0.35 then
                                    if not l_GetFFlagPeekViewScrimLogging_0() then
                                        v43.setViewType(v96);
                                    else
                                        v43.setViewType(v96, v99);
                                    end;
                                    if v96 == l_Full_0 then
                                        v43:adjustScrollingFramePosition();
                                    end;
                                    return ;
                                else
                                    local l_Y_10 = l_current_9.CanvasPosition.Y;
                                    l_current_9.CanvasPosition = Vector2.new(0, l_Y_10 + (v105 - l_Y_10) * math.sin(v106 * 2.468394227820552));
                                    return ;
                                end;
                            else
                                return ;
                            end;
                        end);
                        return ;
                    end;
                end;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v43.selectedCoreObjectConnection = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):connect(function()
        if v43.swipeScrollingFrameRef.current and v43.state.lastInputGroup == l_InputTypeConstants_0.Gamepad then
            v43:adjustScrollingFramePosition();
        end;
    end);
end;
v42.handleCurYAboveFullViewY = function(v108, v109)
    if v108.viewType ~= l_Full_0 and v108.viewType ~= l_Extended_0 then
        if not v109 then
            v108.setViewType(l_Extended_0);
            return ;
        else
            v108.goTo(l_Full_0);
            return ;
        end;
    else
        if v108.viewType == l_Full_0 then
            v108.setViewType(l_Extended_0);
        end;
        return ;
    end;
end;
v42.handleCurYFromBriefToFull = function(v110, v111, v112, v113, v114)
    local l_canDragFullViewToBrief_0 = v110.props.canDragFullViewToBrief;
    local v116 = l_GetFFlagPeekViewMinimizeToSuperBrief_0() and v110.props.minimizeToSuperBrief;
    local v117 = v110.swipeScrollingFrameRef:getValue();
    local v118 = v110.getBriefViewY();
    local v119 = v110.getFullViewY() - v118;
    if v110.viewType == l_Full_0 then
        if (v117.AbsoluteCanvasSize.Y - v117.AbsoluteWindowSize.Y) - 1 < v111 then
            return ;
        elseif v114 or v111 < v118 + v119 * 0.8 then
            local v120 = v114 and v112 > 500;
            if not l_canDragFullViewToBrief_0 or v120 and not v116 then
                if not l_GetFFlagPeekViewScrimLogging_0() then
                    v110.goTo(l_Closed_0);
                    return ;
                else
                    v110.goTo(l_Closed_0, nil, nil, {
                        dismissMethod = v22.dismissMethodEnum.swipe
                    });
                    return ;
                end;
            else
                v110.goTo(l_Brief_0);
                return ;
            end;
        end;
    elseif v110.viewType == l_Extended_0 then
        if not (v114 and v111 >= v118 + v119 * 0.8) or v112 > -1 then
            v110.goTo(l_Full_0);
            return ;
        end;
    elseif v113 or v118 + v119 * 0.2 < v111 then
        v110.goTo(l_Full_0);
        return ;
    else
        v110.goTo(l_Brief_0);
    end;
end;
v42.handleCurYFromSuperBriefToBrief = function(v121, v122, v123, v124, v125, v126)
    local l_canDragFullViewToBrief_1 = v121.props.canDragFullViewToBrief;
    local v128 = l_GetFFlagPeekViewMinimizeToSuperBrief_0() and v121.props.minimizeToSuperBrief;
    local v129 = v121.getFullViewY() - v123;
    if v121.viewType == l_Full_0 then
        if v126 or v122 < v123 + v129 * 0.8 then
            local v130 = v126 and v124 > 500;
            if not l_canDragFullViewToBrief_1 or v130 and not v128 then
                if not l_GetFFlagPeekViewScrimLogging_0() then
                    v121.goTo(l_Closed_0);
                    return ;
                else
                    v121.goTo(l_Closed_0, nil, nil, {
                        dismissMethod = v22.dismissMethodEnum.swipe
                    });
                    return ;
                end;
            else
                v121.goTo(l_SuperBrief_0);
                return ;
            end;
        else
            v121.goTo(l_Brief_0);
            return ;
        end;
    else
        if v121.viewType == l_Extended_0 then
            if not (v126 and v122 >= v123 + v129 * 0.8) or v124 > -1 then
                v121.goTo(l_Brief_0);
                return ;
            end;
        elseif v125 or v123 + v129 * 0.2 < v122 then
            v121.goTo(l_Brief_0);
            return ;
        else
            local v131 = v126 and v124 > 500;
            if not l_canDragFullViewToBrief_1 or v131 and not v128 then
                if not l_GetFFlagPeekViewScrimLogging_0() then
                    v121.goTo(l_Closed_0);
                else
                    v121.goTo(l_Closed_0, nil, nil, {
                        dismissMethod = v22.dismissMethodEnum.swipe
                    });
                    return ;
                end;
            else
                v121.goTo(l_SuperBrief_0);
                return ;
            end;
        end;
        return ;
    end;
end;
v42.handleCurYFromClosedToSuperBrief = function(v132, v133, v134, v135, v136, v137)
    local v138 = v134 - 0;
    local v139 = l_GetFFlagPeekViewMinimizeToSuperBrief_0() and v132.props.minimizeToSuperBrief;
    if v132.viewType == l_SuperBrief_0 then
        if not (v136 or v133 < v138 * 0.8) or v139 then
            v132.goTo(l_SuperBrief_0);
            return ;
        elseif not l_GetFFlagPeekViewScrimLogging_0() then
            v132.goTo(l_Closed_0);
            return ;
        else
            v132.goTo(l_Closed_0, nil, nil, {
                dismissMethod = v22.dismissMethodEnum.swipe
            });
            return ;
        end;
    elseif (v136 and v135 > 500 or not v137 and v138 * 0.8 >= v133) and not v139 then
        if not l_GetFFlagPeekViewScrimLogging_0() then
            v132.goTo(l_Closed_0);
            return ;
        else
            v132.goTo(l_Closed_0, nil, nil, {
                dismissMethod = v22.dismissMethodEnum.swipe
            });
            return ;
        end;
    else
        v132.goTo(l_SuperBrief_0);
        return ;
    end;
end;
v42.handleCurYFromClosedToBrief = function(v140, v141, v142, v143)
    local v144 = v140.getBriefViewY() - 0;
    if v140.viewType == l_Brief_0 then
        if v142 or v141 < 0 + v144 * 0.8 then
            if not l_GetFFlagPeekViewScrimLogging_0() then
                v140.goTo(l_Closed_0);
                return ;
            else
                v140.goTo(l_Closed_0, nil, nil, {
                    dismissMethod = v22.dismissMethodEnum.swipe
                });
                return ;
            end;
        else
            v140.goTo(l_Brief_0);
            return ;
        end;
    elseif v143 or 0 + v144 * 0.2 < v141 then
        v140.goTo(l_Brief_0);
        return ;
    elseif not l_GetFFlagPeekViewScrimLogging_0() then
        v140.goTo(l_Closed_0);
        return ;
    else
        v140.goTo(l_Closed_0, nil, nil, {
            dismissMethod = v22.dismissMethodEnum.swipe
        });
        return ;
    end;
end;
v42.adjustScrollingFramePosition = function(v145)
    local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
    if not (not l_SelectedCoreObject_0 or not v145.props.contentFrameRef) and l_SelectedCoreObject_0:IsDescendantOf(v145.props.contentFrameRef.current) then
        local l_current_10 = v145.swipeScrollingFrameRef.current;
        if v145.viewType ~= l_Extended_0 and v145.viewType ~= l_Full_0 then
            l_current_10.CanvasPosition = Vector2.new(l_current_10.CanvasPosition.X, v17.isNotNil(v145.getViewSize(v145.viewType), "self.adjustScrollingFramePosition.viewSize").Offset);
            return ;
        else
            local v148 = l_SelectedCoreObject_0.AbsolutePosition.Y - v145.props.topBarHeight;
            local l_Y_11 = l_SelectedCoreObject_0.AbsoluteSize.Y;
            local l_Y_12 = l_current_10.AbsoluteWindowSize.Y;
            local v151 = l_Y_12 - (v148 + l_Y_11);
            local l_Y_13 = l_current_10.CanvasPosition.Y;
            if v151 < v145.props.bottomDockedContainerHeight then
                l_Y_13 = (l_Y_13 + v145.props.bottomDockedContainerHeight) - v151;
            elseif (v148 + l_Y_11) + (l_Y_13 - l_Y_12) < l_Y_12 - v145.props.bottomDockedContainerHeight then
                l_Y_13 = l_Y_12;
            end;
            l_current_10.CanvasPosition = Vector2.new(l_current_10.CanvasPosition.X, (math.max(0, (math.min(l_Y_13, (not not v32 and l_current_10.AbsoluteCanvasSize.Y or l_current_10.CanvasSize.Y.Offset) - l_current_10.AbsoluteWindowSize.Y)))));
            return ;
        end;
    else
        return ;
    end;
end;
v42.handleThumbstickInput = function(v153, v154, v155)
    local l_Position_0 = v154.Position;
    local v157 = v153.swipeScrollingFrameRef:getValue();
    if not (not v153.containerFrameRef:getValue() or not v157) then
        local v158 = v157.CanvasPosition.Y + (v155 * -l_GamepadUtils_0.normalizeStickByDeadzone(l_Position_0).Y) * 1000;
        if v153.getFullViewY() < v158 then
            v157.CanvasPosition = Vector2.new(0, v158);
        end;
    end;
end;
v42.renderWithStyle = function(v159, v160)
    local v161 = v159.props[v5.Children];
    if not (not l_GetFFlagEDPContextRedesign_0() or not v159.props.overlayDragger) then
        v161 = v7.Dictionary.join({
            Padding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, -25)
            })
        }, v161);
    end;
    local l_bottomDockedContainerHeight_1 = v159.props.bottomDockedContainerHeight;
    local l_bottomDockedContainerContent_0 = v159.props.bottomDockedContainerContent;
    local v164 = v159.props.thumbstickScrollEnabled and v159.state.scrollableViewType;
    local l_createFragment_0 = v5.createFragment;
    local v166 = {
        DropShadowBackground = v5.createElement("Frame", {
            ZIndex = 0, 
            Visible = v159.props.showDropShadow, 
            [v5.Ref] = v159.shadowRef
        }, {
            UIGradient = v5.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v160.Theme.DropShadow.Color), 
                    ColorSequenceKeypoint.new(1, v160.Theme.DropShadow.Color)
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0.7)
                })
            })
        })
    };
    local l_createElement_0 = v5.createElement;
    local l_Frame_0 = l_Focusable_0.Frame;
    local v171 = {
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        [v5.Ref] = v159.clipFrameRef, 
        restorePreviousChildFocus = true, 
        inputBindings = not not v164 and {
            ScrollPeekView = v8.Input.onStep(Enum.KeyCode.Thumbstick2, function(v169, v170)
                v159:handleThumbstickInput(v169, v170);
            end)
        } or nil
    };
    local v172 = {};
    local l_createElement_1 = v5.createElement;
    local v174 = if not v32 then v11.FitScrollingFrame else "ScrollingFrame";
    local v175 = {
        AutomaticCanvasSize = if not v32 then nil else Enum.AutomaticSize.Y, 
        CanvasSize = if not v32 then nil else UDim2.fromScale(1, 0), 
        Active = true, 
        BackgroundTransparency = 1, 
        ZIndex = 1, 
        BorderSizePixel = 0, 
        fitFields = if not v32 then {
            CanvasSize = v11.FitAxis.Height
        } else nil, 
        ScrollBarThickness = 0, 
        ClipsDescendants = false, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        ElasticBehavior = v159.props.elasticBehavior, 
        ScrollingEnabled = v159.props.isScrollingEnabled, 
        [v5.Ref] = v159.swipeScrollingFrameRef, 
        [v5.Change.CanvasPosition] = v159.onSwipeScrollingFrameCanvasPositionChanged, 
        [v5.Change.AbsoluteWindowSize] = v159.onAbsoluteWindowSizeChanged, 
        [v5.Change.AbsoluteSize] = if not l_GetFFlagEDPContextRedesign_0() then nil else v159.props.onScrollingFrameSizeChanged
    };
    local v178 = {
        UIListLayout = v5.createElement("UIListLayout", {
            Padding = UDim.new(0, 0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        FillingArea = v5.createElement("Frame", {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Active = false, 
            [v5.Ref] = v159.fillingAreaRef
        }), 
        BackgroundFrame = v5.createElement("Frame", {
            LayoutOrder = 2, 
            ZIndex = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            Active = false
        }, {
            BackgroundImage = v5.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(1, 0, 0, 9999), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v33, 
                BackgroundColor3 = v160.Theme.BackgroundDefault.Color, 
                Active = false
            })
        }), 
        PeekHeader = v5.createElement("TextButton", {
            Text = "", 
            LayoutOrder = 3, 
            ZIndex = not l_GetFFlagEDPContextRedesign_0() and 2 or 3, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 25), 
            [v5.Event.Activated] = v159.onPeekHeaderActivated, 
            Active = if not not l_GetFFlagEDPContextRedesign_0() and v159.props.overlayDragger then v159.transitionPercent:map(function(v176)
                return v176 < 1;
            end) else nil
        }, {
            Dragger = if (not not l_GetFFlagHideDraggerPeekView_0() and v159.props.hideDraggerInSuperBrief) and v159.props.peekViewState == l_SuperBrief_0 then nil else v5.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 36, 0, 36), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Image = v34, 
                ImageColor3 = v160.Theme.UIEmphasis.Color, 
                ImageTransparency = if not not l_GetFFlagEDPContextRedesign_0() and v159.props.overlayDragger then v159.transitionPercent:map(function(v177)
                    if v177 >= 0.9 then
                        return (v177 - 0.9) * 10;
                    else
                        return 0;
                    end;
                end) else v160.Theme.UIEmphasis.Transparency, 
                Active = false
            })
        }), 
        ContentFrame = v5.createElement(l_Focusable_0.Frame, {
            LayoutOrder = 4, 
            ZIndex = 2, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClipsDescendants = false, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            [v5.Ref] = v159.props.contentFrameRef, 
            restorePreviousChildFocus = true, 
            onFocusGained = function()
                if v159.viewType == l_Brief_0 and v159.props.peekViewState ~= l_Full_0 then
                    v159.goTo(l_Full_0);
                end;
            end
        }, v161)
    };
    local v179 = false;
    if l_bottomDockedContainerHeight_1 > 0 then
        v179 = v5.createElement("Frame", {
            LayoutOrder = 5, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_bottomDockedContainerHeight_1), 
            Active = false
        });
    end;
    v178.BottomContainerPlaceHolder = v179;
    v172.SwipeScrollingFrame = l_createElement_1(v174, v175, v178);
    l_createElement_1 = false;
    if l_bottomDockedContainerHeight_1 > 0 then
        l_createElement_1 = v5.createElement("Frame", {
            Active = true, 
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 0, l_bottomDockedContainerHeight_1), 
            BackgroundTransparency = 1, 
            [v5.Ref] = v159.bottomContainerRef
        }, l_bottomDockedContainerContent_0);
    end;
    v172.BottomContainer = l_createElement_1;
    v166.ClipFrame = l_createElement_0(l_Frame_0, v171, v172);
    v166.InputBegan = v5.createElement(l_ExternalEventConnection_0, {
        event = l_UserInputService_0.InputBegan, 
        callback = v159.inputBeganCallback
    });
    v166.InputEnded = v5.createElement(l_ExternalEventConnection_0, {
        event = l_UserInputService_0.InputEnded, 
        callback = v159.inputEndedCallback
    });
    return l_createFragment_0(v166);
end;
v42.render = function(v180)
    return v180.withStyle(function(v181)
        if not l_GetFFlagPeekViewScrimEnabled_0() and not v180.props.scrimEnabled then
            return v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = false, 
                [v5.Ref] = v180.containerFrameRef, 
                [v5.Change.AbsoluteSize] = v180.onContainerFrameAbsoluteSizeChanged
            }, {
                if not v180.useReducedMotion then v180:renderWithStyle(v181) else v5.createElement("CanvasGroup", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    GroupTransparency = v180.state.canvasGroupTransparency
                }, {
                    v180:renderWithStyle(v181)
                })
            });
        else
            local v182 = if not v180.useReducedMotion then v180:renderWithStyle(v181) else v5.createElement("CanvasGroup", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                GroupTransparency = v180.state.canvasGroupTransparency
            }, {
                v180:renderWithStyle(v181)
            });
            if not v180.props.hasScrim then
                return v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = false, 
                    [v5.Ref] = v180.containerFrameRef, 
                    [v5.Change.AbsoluteSize] = v180.onContainerFrameAbsoluteSizeChanged
                }, v182);
            else
                return v5.createElement(v13, {
                    [v5.Ref] = v180.containerFrameRef, 
                    onActivated = function()
                        if not v31 or not v180.isInGoToState then
                            if not l_GetFFlagPeekViewScrimLogging_0() then
                                v180.goTo(l_Closed_0);
                                return ;
                            else
                                v180.goTo(l_Closed_0, nil, nil, {
                                    dismissMethod = v22.dismissMethodEnum.scrimTap
                                });
                                return ;
                            end;
                        else
                            return ;
                        end;
                    end, 
                    onSizeChanged = v180.onContainerFrameAbsoluteSizeChanged
                }, v182);
            end;
        end;
    end);
end;
v42.didMount = function(v183)
    v183.isMounted = true;
    if v183.props.closeSignal then
        v183.closeSignalConnection = v183.props.closeSignal:connect(function()
            if not v183.isInGoToState then
                v183.goTo(l_Closed_0, true, v183.useReducedMotion);
            end;
        end);
    end;
    local l_hidden_0 = v183.props.hidden;
    local l_mountAsFullView_0 = v183.props.mountAsFullView;
    local l_mountAnimation_0 = v183.props.mountAnimation;
    local v187 = if not l_GetFFlagEnablePeekViewStateOnMountParam_0() then nil else v183.props.stateOnMount;
    if not l_hidden_0 then
        if not l_mountAsFullView_0 then
            if v187 ~= nil then
                v183.goTo(v187, l_mountAnimation_0, v183.useReducedMotion);
            else
                v183.goTo(l_Brief_0, l_mountAnimation_0, v183.useReducedMotion);
            end;
        else
            v183.goTo(l_Full_0, l_mountAnimation_0, v183.useReducedMotion);
        end;
    end;
    v183:setState({
        lastInputGroup = l_getInputGroup_0(l_UserInputService_0:GetLastInputType())
    });
    l_UserInputService_0.LastInputTypeChanged:Connect(function(v188)
        v183:setState({
            lastInputGroup = l_getInputGroup_0(v188)
        });
    end);
end;
v42.isAnimating = function(v189)
    return v189.goToAnimationConnection ~= nil;
end;
v42.didUpdate = function(v190, v191, v192)
    if not (v192.absoluteWindowSizeX == v190.state.absoluteWindowSizeX) or v192.absoluteWindowSizeY ~= v190.state.absoluteWindowSizeY then
        v190.reconcileRbxInstances();
        if not v190:isAnimating() then
            v190.updateSwipeScrollingFrame();
        end;
    end;
    if v191.bottomDockedContainerHeight ~= v190.props.bottomDockedContainerHeight then
        v190.onContainerFrameAbsoluteSizeChanged();
    end;
    if v191.hidden == false and v190.props.hidden == true then
        v190.goTo(l_Hidden_0);
    elseif v191.hidden == true and v190.props.hidden == false then
        v190.goTo(l_Brief_0);
    end;
    local l_peekViewState_0 = v190.props.peekViewState;
    local l_isInGoToState_0 = v190.isInGoToState;
    if not (not ((l_peekViewState_0 ~= v191.peekViewState and v190.viewType == v191.peekViewState) and l_peekViewState_0 ~= l_Extended_0) or l_isInGoToState_0) then
        v190.goTo(v190.props.peekViewState);
    end;
end;
v42.willUnmount = function(v195)
    v195.isMounted = false;
    if v195.closeSignalConnection then
        v195.closeSignalConnection:disconnect();
        v195.closeSignalConnection = nil;
    end;
    if v195.goToAnimationConnection then
        v195.goToAnimationConnection:disconnect();
        v195.goToAnimationConnection = nil;
    end;
    if v195.selectedCoreObjectConnection then
        v195.selectedCoreObjectConnection:disconnect();
        v195.selectedCoreObjectConnection = nil;
    end;
end;
if l_GetFFlagPeekViewScrimEnabledIXP_0() then
    v42 = v21.connectUserLayer({
        "PlatformExcellence.QualityImprovement.App"
    }, function(v196, _)
        local v198 = v196["PlatformExcellence.QualityImprovement.App"];
        return {
            scrimEnabled = v198 and v198.peekViewScrimEnabled
        };
    end)(v42);
end;
return v10.connect(function(v199, _)
    return {
        topBarHeight = not not v199.TopBar and v199.TopBar.topBarHeight or 0
    };
end, nil)(v42);
