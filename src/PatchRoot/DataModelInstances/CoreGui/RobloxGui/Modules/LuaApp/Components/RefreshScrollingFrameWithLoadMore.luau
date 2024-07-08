local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_Modules_0.Common.Signal);
local v5 = require(l_Modules_0.LuaApp.Enum.ScrollMovementDirection);
local v6 = require(l_Modules_0.LuaApp.Components.LoadingBarWithTheme);
local v7 = require(l_Modules_0.LuaApp.Components.RefreshScrollingFrame);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFFlagRSFLoadMoreFix);
local v9 = require(l_Modules_0.LuaApp.Flags.GetFFlagOptScrollingEventing);
local v10 = v3.PureComponent:extend("RefreshScrollingFrameWithLoadMore");
v10.defaultProps = {
    preloadDistance = 2000
};
v10.init = function(v11)
    v11._isMounted = false;
    v11.scrollToTopSignal = v4.new();
    v11.scrollToTop = function()
        v11.scrollToTopSignal:fire();
    end;
    v11.state = {
        isLoadingMore = false, 
        isScrollable = false
    };
    v11.lastLoadMoreThreshold = 0;
    v11.lastCanvasHeight = 0;
    v11.loadMore = function()
        local l_onLoadMore_0 = v11.props.onLoadMore;
        v11:setState({
            isLoadingMore = true
        });
        l_onLoadMore_0():andThen(function()
            if v11._isMounted then
                v11:setState({
                    isLoadingMore = false
                });
            end;
        end, function()
            if v11._isMounted then
                v11:setState({
                    isLoadingMore = false
                });
            end;
            v11.lastLoadMoreThreshold = 0;
        end);
    end;
    v11.lastScrollPosition = 0;
    v11.scrollMovementDirection = v5.Backward;
    v11.checkScrollDirectionChanged = function(v13)
        local l_Y_0 = v13.CanvasPosition.Y;
        if not (l_Y_0 >= 0) or l_Y_0 == v11.lastScrollPosition then
            return ;
        else
            local v15 = nil;
            v15 = if v11.lastScrollPosition < l_Y_0 then v5.Forward else v5.Backward;
            if v15 ~= v11.scrollMovementDirection then
                if v11.props.onScrollDirectionChanged ~= nil then
                    v11.props.onScrollDirectionChanged(v15);
                end;
                v11.scrollMovementDirection = v15;
            end;
            v11.lastScrollPosition = l_Y_0;
            return ;
        end;
    end;
    v11.onCanvasPositionChanged = function(v16)
        local l_preloadDistance_0 = v11.props.preloadDistance;
        local l_onLoadMore_1 = v11.props.onLoadMore;
        local l_isLoadingMore_0 = v11.state.isLoadingMore;
        local l_Y_1 = v16.CanvasPosition.Y;
        if l_onLoadMore_1 and not l_isLoadingMore_0 then
            if v16.CanvasSize.Y.Scale ~= 0 then
                warn("RefreshScrollingFrame: Scrollingframe.CanvasSize.Y.Scale is not 0\n\t\t\t\tContent loading would not work properly.");
                return ;
            else
                local v21 = (v16.CanvasSize.Y.Offset - (v11._absoluteWindowSize or v16.AbsoluteWindowSize).Y) - l_preloadDistance_0;
                local v22 = false;
                if v21 < l_Y_1 then
                    v22 = false;
                    if v21 ~= v11.lastLoadMoreThreshold then
                        v22 = v21 ~= v11.lastLoadMoreThreshold + 56;
                    end;
                end;
                if v22 then
                    v11.lastLoadMoreThreshold = v21;
                    v11.loadMore();
                end;
            end;
        end;
        if v11.props.onCanvasPositionChangedCallback then
            v11.props.onCanvasPositionChangedCallback(l_Y_1);
        end;
        if v11.props.onScrollDirectionChanged ~= nil then
            v11.checkScrollDirectionChanged(v16);
        end;
    end;
    v11.onAbsoluteWindowSizeChanged = function(v23)
        v11._absoluteWindowSize = v23.AbsoluteWindowSize;
        v11.onCanvasSizeChanged(v23);
    end;
    v11.onCanvasSizeChanged = function(v24)
        local l_Offset_0 = v24.CanvasSize.Y.Offset;
        local l_Y_2 = (v11._absoluteWindowSize or v24.AbsoluteWindowSize).Y;
        if l_Offset_0 < v11.lastCanvasHeight and l_Offset_0 ~= v11.lastCanvasHeight - 56 then
            v11.lastLoadMoreThreshold = 0;
        end;
        v11.lastCanvasHeight = l_Offset_0;
        if l_Y_2 == 0 then
            return ;
        elseif v11._isMounted then
            local v27 = l_Y_2 < l_Offset_0;
            if v27 ~= v11.state.isScrollable then
                v11:setState({
                    isScrollable = v27
                });
            end;
            if not (not ((v11.props.onLoadMore and not v11.state.isLoadingMore) and not v27) or v11.props.initializing) then
                v11.loadMore();
            end;
            return ;
        else
            return ;
        end;
    end;
    v11.createFooter = function()
        return v11.state.isLoadingMore and v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 56)
        }, {
            LoadingBar = v3.createElement(v6)
        });
    end;
end;
v10.didMount = function(v28)
    v28._isMounted = true;
    if v8() then
        local v29 = if not v28.props.forwardRef then nil else v28.props.forwardRef.current;
        if v29 then
            v28.onCanvasSizeChanged(v29);
        end;
    end;
    if v9() then
        local v30 = if not v28.props.forwardRef then nil else v28.props.forwardRef.current;
        if v30 then
            v28._absoluteWindowSize = v30.AbsoluteWindowSize;
        end;
    end;
end;
v10.willUnmount = function(v31)
    v31._isMounted = false;
end;
v10.render = function(v32)
    return v3.createElement(v7, v2.Dictionary.join(v32.props, {
        onCanvasPositionChangedCallback = v32.onCanvasPositionChanged, 
        onCanvasSizeChangedCallback = v32.onCanvasSizeChanged, 
        onAbsoluteWindowSizeChangedCallback = if not v9() then nil else v32.onAbsoluteWindowSizeChanged, 
        createFooter = v32.createFooter, 
        onLoadMore = v2.None, 
        bottomPadding = v32.props.bottomPadding, 
        [v3.Children] = v2.None, 
        [v3.Ref] = v32.props.forwardRef
    }), v32.props[v3.Children]);
end;
return v3.forwardRef(function(v33, v34)
    return v3.createElement(v10, v2.Dictionary.join(v33, {
        forwardRef = v34
    }));
end);
