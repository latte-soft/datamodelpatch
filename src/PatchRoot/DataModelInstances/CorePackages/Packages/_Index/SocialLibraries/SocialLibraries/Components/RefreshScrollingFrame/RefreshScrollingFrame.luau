local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v2 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_Otter_0 = v2.Otter;
local l_t_0 = v2.t;
local l_Cryo_0 = v2.Cryo;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_getIconSize_0 = l_UIBlox_0.App.ImageSet.getIconSize;
local v10 = require(script.Parent.ExternalEventConnection);
local v11 = require(script.Parent.Spinner);
local v12 = l_getIconSize_0(l_UIBlox_0.App.ImageSet.Enum.IconSize.Medium);
local v13 = {
    Start = -240, 
    End = 0
};
local v14 = {
    Start = 1, 
    End = 0
};
local v15 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local function _(v16, v17, v18)
    v18 = math.min(1, (math.max(0, v18)));
    return v16 * (1 - v18) + v17 * v18;
end;
local v20 = l_Roact_0.PureComponent:extend("RefreshScrollingFrameNew");
v20.defaultProps = {
    ScrollingElement = "ScrollingFrame", 
    refreshThreshold = 52, 
    scrollingElementProps = {}
};
v20.validateProps = l_t_0.interface({
    ScrollingElement = l_t_0.union(l_t_0.string, l_t_0.callback, l_t_0.table), 
    scrollingElementProps = l_t_0.optional(l_t_0.table), 
    refreshThreshold = l_t_0.number, 
    forwardRef = l_t_0.optional(l_t_0.table), 
    onCanvasPositionChangedCallback = l_t_0.optional(l_t_0.callback), 
    onStatusBarTapped = l_t_0.optional(l_t_0.callback), 
    refresh = l_t_0.optional(l_t_0.callback), 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.any)
});
v20.init = function(v21)
    v21.state = {
        isRefreshing = false
    };
    v21.startHeight = 0;
    v21.isUserInteracting = false;
    local l_forwardRef_0 = v21.props.forwardRef;
    assert(type(l_forwardRef_0) ~= "function", ("%s does not support function ref forwarding"):format((tostring(v20))));
    v21.scrollingFrameRef = l_forwardRef_0 or l_Roact_0.createRef();
    v21.spinnerFrameRef = l_Roact_0.createRef();
    v21.spinnerRef = l_Roact_0.createRef();
    v21.updateSpinner = function(v23)
        if v21.spinnerFrameRef.current then
            v21.spinnerFrameRef.current.Size = UDim2.new(1, 0, 0, v23);
            local v24 = v23 / v21.props.refreshThreshold;
            local l_current_0 = v21.spinnerRef.current;
            local l_Start_0 = v14.Start;
            local l_End_0 = v14.End;
            local v28 = math.min(1, (math.max(0, v24)));
            l_current_0.ImageTransparency = l_Start_0 * (1 - v28) + l_End_0 * v28;
            if not v21.state.isRefreshing then
                local l_current_1 = v21.spinnerRef.current;
                l_End_0 = v13.Start;
                v28 = v13.End;
                local v30 = math.min(1, (math.max(0, v24)));
                l_current_1.Rotation = l_End_0 * (1 - v30) + v28 * v30;
            end;
        end;
    end;
    v21.motor = l_Otter_0.createSingleMotor(0);
    v21.motor:onStep(v21.updateSpinner);
    v21.resetSpinner = function()
        v21.motor:setGoal(l_Otter_0.spring(0, v15));
    end;
    v21.scrollBack = function()
        if v21.scrollingFrameRef.current then
            if not l_UserGameSettings_0.ReducedMotion then
                v21.scrollingFrameRef.current:ScrollToTop();
            else
                v21.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, 0);
                return ;
            end;
        end;
    end;
    v21.dispatchRefresh = function()
        local l_refresh_0 = v21.props.refresh;
        local l_refreshThreshold_0 = v21.props.refreshThreshold;
        local l_isRefreshing_0 = v21.state.isRefreshing;
        if l_refresh_0 == nil then
            return ;
        else
            if not l_isRefreshing_0 then
                v21:setState({
                    isRefreshing = true
                });
                v21.motor:setGoal(l_Otter_0.spring(l_refreshThreshold_0, v15));
                local function v34()
                    if v21.isMounted then
                        v21:setState({
                            isRefreshing = false
                        });
                        v21.resetSpinner();
                    end;
                end;
                l_refresh_0():andThen(v34, v34);
            end;
            return ;
        end;
    end;
    v21.onInputBegan = function(_)
        if not v21.isUserInteracting then
            v21.startHeight = v21.scrollingFrameRef.current.CanvasPosition.Y;
        end;
        v21.isUserInteracting = true;
    end;
    v21.onInputEnded = function(_)
        v21.isUserInteracting = false;
        local l_startHeight_0 = v21.startHeight;
        v21.startHeight = 0;
        if not (not (v21.props.refresh ~= nil) or not v21.scrollingFrameRef.current) then
            local v38 = -v21.scrollingFrameRef.current.CanvasPosition.Y;
            if v21.props.refreshThreshold < v38 and l_startHeight_0 < v38 then
                v21.dispatchRefresh();
                return ;
            elseif v38 > 0 then
                v21.resetSpinner();
            end;
        end;
    end;
    v21.statusBarTapCallback = function()
        if v21.props.onStatusBarTapped then
            v21.props.onStatusBarTapped();
        end;
        v21.scrollBack();
    end;
    v21.onCanvasPositionChanged = function(v39)
        if v21.props.onCanvasPositionChangedCallback ~= nil then
            v21.props.onCanvasPositionChangedCallback(v39);
        end;
        if not ((not (v21.props.refresh ~= nil) or not v21.isUserInteracting) or v21.state.isRefreshing) then
            local v40 = -v39.CanvasPosition.Y;
            local l_refreshThreshold_1 = v21.props.refreshThreshold;
            if v40 >= 0 and v40 <= l_refreshThreshold_1 then
                v21.motor:setGoal(l_Otter_0.instant(v40));
            end;
        end;
    end;
    v21.onCanvasSizeChanged = function(v42)
        if v21.props.onCanvasSizeChangedCallback ~= nil then
            v21.props.onCanvasSizeChangedCallback(v42);
        end;
    end;
end;
v20.didMount = function(v43)
    v43.isMounted = true;
    v43.resetSpinner();
end;
v20.willUnmount = function(v44)
    v44.isMounted = false;
    v44.motor:destroy();
    v44.motor = nil;
end;
v20.render = function(v45)
    local v46 = v45.props[l_Roact_0.Children];
    local l_isRefreshing_1 = v45.state.isRefreshing;
    return l_withStyle_0(function(_)
        return l_Roact_0.createElement(v45.props.ScrollingElement, l_Cryo_0.Dictionary.join({
            [l_Roact_0.Change.CanvasPosition] = v45.onCanvasPositionChanged, 
            [l_Roact_0.Change.CanvasSize] = v45.onCanvasSizeChanged, 
            [l_Roact_0.Ref] = v45.scrollingFrameRef
        }, v45.props.scrollingElementProps), {
            Layout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            SpinnerFrame = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                ClipsDescendants = false, 
                [l_Roact_0.Ref] = v45.spinnerFrameRef
            }, {
                Spinner = l_Roact_0.createElement(v11, {
                    Size = UDim2.new(0, v12, 0, v12), 
                    AnchorPoint = Vector2.new(0.5, 1), 
                    Position = UDim2.new(0.5, 0, 1, 0), 
                    isSpinning = l_isRefreshing_1, 
                    [l_Roact_0.Ref] = v45.spinnerRef
                })
            }), 
            Content = l_Roact_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 1, 0)
            }, v46), 
            inputBegan = l_Roact_0.createElement(v10, {
                event = l_UserInputService_0.InputBegan, 
                callback = v45.onInputBegan
            }), 
            inputEnded = l_Roact_0.createElement(v10, {
                event = l_UserInputService_0.InputEnded, 
                callback = v45.onInputEnded
            }), 
            statusBarTapped = l_Roact_0.createElement(v10, {
                event = l_UserInputService_0.StatusBarTapped, 
                callback = v45.statusBarTapCallback
            })
        });
    end);
end;
return l_Roact_0.forwardRef(function(v49, v50)
    return l_Roact_0.createElement(v20, l_Cryo_0.Dictionary.join(v49, {
        forwardRef = v50
    }));
end);
