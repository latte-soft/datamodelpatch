local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v6 = require(l_Modules_0.Common.Roact);
local v7 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local v10 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v11 = require(l_Modules_0.LuaApp.FitChildren);
local v12 = require(l_Modules_0.LuaApp.RoactMotion);
local v13 = require(l_Modules_0.LuaApp.LuaAppEvents);
local v14 = require(l_Modules_0.LuaApp.Components.EndOfScroll);
local v15 = game:DefineFastFlag("SetRSFNotSelectable", false);
local l_GetFFlagTenFootUiScrollBackFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiScrollBackFix;
local v17 = require(l_CorePackages_0.Cryo);
local v18 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v18.Style.withStyle;
local l_getIconSize_0 = v18.App.ImageSet.getIconSize;
local l_Images_0 = v18.App.ImageSet.Images;
local l_ImageSetLabel_0 = v18.Core.ImageSet.ImageSetLabel;
local v23 = l_getIconSize_0(v18.App.ImageSet.Enum.IconSize.Medium);
local function v33(v24)
    local l_activated_0 = v24.activated;
    local l_offset_0 = v24.offset;
    local l_Position_0 = v24.Position;
    local l_timer_0 = v24.timer;
    local l_tween_0 = v24.tween;
    local v30 = 0;
    local v31 = 1;
    local v32 = 0;
    if l_offset_0 > 0 then
        return ;
    else
        if not l_activated_0 then
            if not l_tween_0 then
                if l_offset_0 > -52 then
                    l_offset_0 = -l_offset_0;
                    v30 = 9.6 * l_offset_0 - 240;
                    v32 = 1 - 0.04 * l_offset_0;
                else
                    v31 = 1.1;
                    l_offset_0 = 52;
                end;
            else
                l_offset_0 = 0;
                v32 = 2 * l_timer_0;
            end;
        else
            v30 = l_timer_0 * 540;
            l_offset_0 = 0;
        end;
        return v6.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, v23 * v31, 0, v23 * v31), 
            Position = l_Position_0 + UDim2.new(0.5, 0, 0, l_offset_0 - v23 / 2), 
            ImageTransparency = v32, 
            Image = l_Images_0["icons/common/refresh"], 
            ImageColor3 = v24.ImageColor3, 
            BackgroundTransparency = 1, 
            Rotation = v30, 
            AnchorPoint = Vector2.new(0.5, 0.5)
        });
    end;
end;
local v34 = v6.Component:extend("RefreshScrollingFrame");
v34.defaultProps = {
    preloadDistance = 2000, 
    createEndOfScrollElement = false, 
    Selectable = if not v15 then nil else false
};
v34.startTweenBack = function(v35)
    v35:setState({
        activated = false, 
        tween = true, 
        timer = 0, 
        offset = 0
    });
end;
v34.startSpin = function(v36)
    v36:setState({
        activated = true, 
        tween = false, 
        timer = 0
    });
end;
v34.startTween = function(v37)
    v37:setState({
        activated = true, 
        tween = true, 
        timer = 0
    });
end;
v34.didMount = function(v38)
    v38._isMounted = true;
    v38.updateIsScrollable();
end;
v34.willUnmount = function(v39)
    v39._isMounted = false;
    if v39.luaAppReloadPageEventConnection ~= nil then
        v39.luaAppReloadPageEventConnection:disconnect();
        v39.luaAppReloadPageEventConnection = nil;
    end;
end;
v34.init = function(v40)
    v40._inputCount = 0;
    v40._isMounted = false;
    v40._isUserInteracting = false;
    v40._isRefreshing = false;
    v40._lastReloadEventTime = tick();
    v40.state = {
        activated = false, 
        tween = false, 
        timer = 0, 
        offset = 0, 
        isScrollable = false
    };
    v40.fitFieldCanvasSize = {
        CanvasSize = v11.FitAxis.Height
    };
    local l_forwardRef_0 = v40.props.forwardRef;
    assert(type(l_forwardRef_0) ~= "function", ("%s does not support function ref forwarding"):format((tostring(v34))));
    v40.scrollingFrameRef = l_forwardRef_0 or v6.createRef();
    v40.contentFrameRef = v6.createRef();
    v40.scrollBack = function()
        if v40.scrollingFrameRef.current then
            if not l_UserGameSettings_0.ReducedMotion then
                if not l_GetFFlagTenFootUiScrollBackFix_0() or not v40.props.onBackToTop then
                    v40.scrollingFrameRef.current:ScrollToTop();
                else
                    v40.props.onBackToTop(v40.scrollingFrameRef.current);
                    return ;
                end;
            else
                v40.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, 0);
                return ;
            end;
        end;
    end;
    v40.dispatchRefresh = function()
        local l_refresh_0 = v40.props.refresh;
        if not (not v40._isMounted or not v40.scrollingFrameRef.current) then
            local l_Y_0 = v40.scrollingFrameRef.current.CanvasPosition.Y;
            if not (not l_refresh_0 or v40._isRefreshing) then
                v40._isRefreshing = true;
                if l_Y_0 < -52 then
                    v40:startSpin();
                else
                    v40:startTween();
                end;
                l_refresh_0():andThen(function()
                    v40._isRefreshing = false;
                    if v40._isMounted then
                        v40:startTweenBack();
                    end;
                end, function()
                    v40._isRefreshing = false;
                    if v40._isMounted then
                        v40:startTweenBack();
                    end;
                end);
            end;
        end;
    end;
    v40.onCanvasPositionChanged = function(v44)
        local l_refresh_1 = v40.props.refresh;
        local l_onCanvasPositionChangedCallback_0 = v40.props.onCanvasPositionChangedCallback;
        local l_Y_1 = v44.CanvasPosition.Y;
        if l_refresh_1 and l_Y_1 < 52 then
            v40:setState({
                offset = l_Y_1
            });
        end;
        if l_onCanvasPositionChangedCallback_0 then
            l_onCanvasPositionChangedCallback_0(v44);
        end;
    end;
    v40.renderSteppedCallback = function(v48)
        if not (not v40.state.activated and not v40.state.tween) then
            local v49 = {
                timer = v40.state.timer + v48
            };
            if v40.state.tween and v40.state.timer > 0.5 then
                v49.tween = false;
            end;
            v40:setState(v49);
        end;
    end;
    v40.inputBeganCallback = function(v50)
        if v50.UserInputType ~= Enum.UserInputType.Touch then
            return ;
        else
            v40._isUserInteracting = true;
            v40._inputCount = v40._inputCount + 1;
            return ;
        end;
    end;
    v40.inputEndedCallback = function(v51)
        if v51.UserInputType ~= Enum.UserInputType.Touch then
            return ;
        else
            if v40._inputCount > 0 then
                v40._inputCount = v40._inputCount - 1;
            end;
            if v40._inputCount > 0 then
                return ;
            else
                v40._isUserInteracting = false;
                if not (not (v40.state.offset < -52) or v40.state.activated) then
                    v40.dispatchRefresh();
                end;
                return ;
            end;
        end;
    end;
    v40.statusBarTapCallback = function()
        v40.scrollBack();
    end;
    v40.onReloadPage = function()
        if not (not v40._isMounted or not v40.scrollingFrameRef.current) then
            local l_Y_2 = v40.scrollingFrameRef.current.CanvasPosition.Y;
            local v53 = tick();
            if l_Y_2 ~= 0 then
                v40.scrollBack();
                if v53 - v40._lastReloadEventTime < 0.5 then
                    v40.dispatchRefresh();
                end;
            else
                v40.dispatchRefresh();
            end;
            v40._lastReloadEventTime = v53;
        end;
    end;
    v40.onNavigationEventReceived = function(v54)
        local l_parentAppPage_0 = v40.props.parentAppPage;
        local l_currentRoute_0 = v40.props.currentRoute;
        if ((v54.namespace == "Navigations" and v54.detailType == "Reload") and l_HttpService_0:JSONDecode(v54.detail).appName == l_parentAppPage_0) and #l_currentRoute_0 == 1 then
            v40.onReloadPage();
        end;
    end;
    v40.luaAppReloadPageEventConnection = v13.ReloadPage:connect(function(v57)
        local l_parentAppPage_1 = v40.props.parentAppPage;
        local l_currentRoute_1 = v40.props.currentRoute;
        if v57 == l_parentAppPage_1 and #l_currentRoute_1 == 1 then
            v40.onReloadPage();
        end;
    end);
    v40.updateIsScrollable = function()
        if not ((not v40.scrollingFrameRef.current or not v40.contentFrameRef) or not v40.contentFrameRef.current) then
            local l_Y_3 = v40.scrollingFrameRef.current.AbsoluteSize.Y;
            local l_Y_4 = v40.contentFrameRef.current.AbsoluteSize.Y;
            local v62 = l_Y_3 < l_Y_4;
            if (l_Y_3 >= 0 and l_Y_4 >= 0) and v62 ~= v40.state.isScrollable then
                v40:setState({
                    isScrollable = v62
                });
            end;
        end;
    end;
    v40.onCanvasSizeChanged = function(v63)
        if v40.props.onCanvasSizeChangedCallback ~= nil then
            v40.props.onCanvasSizeChangedCallback(v63);
        end;
    end;
end;
v34.render = function(v64)
    local l_Size_0 = v64.props.Size;
    local l_BackgroundColor3_0 = v64.props.BackgroundColor3;
    local l_BackgroundTransparency_0 = v64.props.BackgroundTransparency;
    local l_ScrollBarImageColor3_0 = v64.props.ScrollBarImageColor3;
    local v69 = v64.props.ScrollBarThickness or 0;
    local v70 = v64.props.ScrollBarImageTransparency or 0;
    local l_Offset_0 = v64.props.Position.Y.Offset;
    local l_NotificationService_0 = v64.props.NotificationService;
    local l_createFooter_0 = v64.props.createFooter;
    local l_useAutomaticSizeContentFrame_0 = v64.props.useAutomaticSizeContentFrame;
    local l_activated_1 = v64.state.activated;
    local l_tween_1 = v64.state.tween;
    local l_offset_1 = v64.state.offset;
    local l_isScrollable_0 = v64.state.isScrollable;
    local v79 = (l_activated_1 or l_tween_1) or v64._isUserInteracting;
    if l_activated_1 then
        if l_offset_1 > 0 and l_offset_1 < 52 then
            l_Offset_0 = (l_Offset_0 - l_offset_1) + 52;
        elseif l_offset_1 <= 0 then
            l_Offset_0 = l_Offset_0 + 52;
        end;
    end;
    local function v85(v80, v81, v82, v83)
        return v6.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v80, 
            BackgroundTransparency = v81, 
            [v6.Change.AbsoluteSize] = v64.props.onAbsoluteSizeChangedCallback
        }, {
            layout = v6.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            spinnerFrame = v6.createElement(v12.SimpleMotion, {
                style = {
                    sizeY = v12.spring(l_Offset_0, 150, 18, 2)
                }, 
                render = function(v84)
                    return v6.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v84.sizeY), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        spinner = v79 and v33({
                            Position = UDim2.new(0, 0, 0, not not v64.state.tween and v84.sizeY or l_Offset_0), 
                            ImageColor3 = v82, 
                            offset = v64.state.offset, 
                            activated = v64.state.activated, 
                            timer = v64.state.timer, 
                            tween = v64.state.tween
                        })
                    });
                end
            }), 
            scrollingFrame = v6.createElement(v11.FitScrollingFrame, {
                Size = l_Size_0, 
                ScrollBarThickness = v69, 
                ScrollBarImageColor3 = v83, 
                ScrollBarImageTransparency = v70, 
                Selectable = if not v15 then nil else v64.props.Selectable, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                ScrollingEnabled = v64.props.ScrollingEnabled, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                fitFields = v64.fitFieldCanvasSize, 
                [v6.Ref] = v64.scrollingFrameRef, 
                [v6.Change.CanvasPosition] = v64.onCanvasPositionChanged, 
                [v6.Change.CanvasSize] = v64.onCanvasSizeChanged, 
                [v6.Change.AbsoluteWindowSize] = v64.props.onAbsoluteWindowSizeChangedCallback
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Content = v6.createElement(if not l_useAutomaticSizeContentFrame_0 then v11.FitFrame else "Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1, 
                    Size = if not l_useAutomaticSizeContentFrame_0 then UDim2.new(1, 0, 1, 0) else UDim2.new(1, 0, 0, 0), 
                    fitFields = if not l_useAutomaticSizeContentFrame_0 then {
                        Size = v11.FitAxis.Height
                    } else nil, 
                    AutomaticSize = if not l_useAutomaticSizeContentFrame_0 then nil else Enum.AutomaticSize.Y, 
                    [v6.Ref] = v64.contentFrameRef, 
                    [v6.Change.AbsoluteSize] = function()
                        spawn(v64.updateIsScrollable);
                    end
                }, v64.props[v6.Children]), 
                Footer = l_createFooter_0 and v6.createElement(v11.FitFrame, {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    fitFields = {
                        Size = v11.FitAxis.Height
                    }, 
                    LayoutOrder = 2
                }, {
                    FooterContent = l_createFooter_0()
                }), 
                EndOfScroll = (l_isScrollable_0 and v64.props.createEndOfScrollElement) and v6.createElement(v14, {
                    bottomPadding = v64.props.bottomPadding, 
                    backToTopCallback = v64.scrollBack, 
                    LayoutOrder = 3
                })
            }), 
            renderStepped = v6.createElement(v10, {
                event = l_RunService_0.renderStepped, 
                callback = v64.renderSteppedCallback
            }), 
            inputBegan = v6.createElement(v10, {
                event = l_UserInputService_0.InputBegan, 
                callback = v64.inputBeganCallback
            }), 
            inputEnded = v6.createElement(v10, {
                event = l_UserInputService_0.InputEnded, 
                callback = v64.inputEndedCallback
            }), 
            statusBarTapped = not _G.__TESTEZ_RUNNING_TEST__ and v6.createElement(v10, {
                event = l_UserInputService_0.StatusBarTapped, 
                callback = v64.statusBarTapCallback
            }), 
            bottomBarButtonPressed = v6.createElement(v10, {
                event = l_NotificationService_0.RobloxEventReceived, 
                callback = v64.onNavigationEventReceived
            })
        });
    end;
    return l_withStyle_0(function(v86)
        return v85(l_BackgroundColor3_0 or v86.Theme.BackgroundDefault.Color, l_BackgroundTransparency_0 or v86.Theme.BackgroundDefault.Transparency, v86.Theme.SystemPrimaryDefault.Color, l_ScrollBarImageColor3_0 or v86.Theme.UIEmphasis.Color);
    end);
end;
v34 = v7.connect(function(v87, _)
    return {
        currentRoute = v87.Navigation.history[#v87.Navigation.history]
    };
end)(v34);
v34 = l_RoactServices_0.connect({
    NotificationService = l_AppNotificationService_0
})(v34);
return v6.forwardRef(function(v89, v90)
    return v6.createElement(v34, v17.Dictionary.join(v89, {
        forwardRef = v90
    }));
end);
