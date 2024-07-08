local v0 = require(script:FindFirstAncestor("FriendsLanding").AddFriends.dependencies);
local l_llama_0 = v0.llama;
local l_Roact_0 = v0.Roact;
local l_Signal_0 = v0.Signal;
local v4 = l_Roact_0.PureComponent:extend("AddFriendsScrollingFrame");
v4.defaultProps = {
    preloadDistance = 2000
};
v4.init = function(v5)
    v5._isMounted = false;
    v5.scrollToTopSignal = l_Signal_0.new();
    v5.scrollToTop = function()
        v5.scrollToTopSignal:fire();
    end;
    v5.state = {
        isLoadingMore = false, 
        isScrollable = false
    };
    v5.lastLoadMoreThreshold = 0;
    v5.loadMore = function()
        local l_onLoadMore_0 = v5.props.onLoadMore;
        v5:setState({
            isLoadingMore = true
        });
        l_onLoadMore_0():andThen(function()
            if v5._isMounted then
                v5:setState({
                    isLoadingMore = false
                });
            end;
        end, function()
            if v5._isMounted then
                v5:setState({
                    isLoadingMore = false
                });
            end;
            v5.lastLoadMoreThreshold = 0;
        end);
    end;
    v5.lastScrollPosition = 0;
    v5.scrollMovementDirection = v5.props.deps.ScrollMovementDirection.Backward;
    v5.checkScrollDirectionChanged = function(v7)
        local l_Y_0 = v7.CanvasPosition.Y;
        if not (l_Y_0 >= 0) or l_Y_0 == v5.lastScrollPosition then
            return ;
        else
            local v9 = nil;
            v9 = if v5.lastScrollPosition < l_Y_0 then v5.props.deps.ScrollMovementDirection.Forward else v5.props.deps.ScrollMovementDirection.Backward;
            if v9 ~= v5.scrollMovementDirection then
                if v5.props.onScrollDirectionChanged ~= nil then
                    v5.props.onScrollDirectionChanged(v9);
                end;
                v5.scrollMovementDirection = v9;
            end;
            v5.lastScrollPosition = l_Y_0;
            return ;
        end;
    end;
    v5.onCanvasPositionChanged = function(v10)
        local l_onLoadMore_1 = v5.props.onLoadMore;
        local l_isLoadingMore_0 = v5.state.isLoadingMore;
        local l_Y_1 = v10.CanvasPosition.Y;
        if l_onLoadMore_1 and not l_isLoadingMore_0 then
            v5.loadMore();
        end;
        if v5.props.onCanvasPositionChangedCallback then
            v5.props.onCanvasPositionChangedCallback(l_Y_1);
        end;
        if v5.props.onScrollDirectionChanged ~= nil then
            v5.checkScrollDirectionChanged(v10);
        end;
    end;
    v5.onCanvasSizeChanged = function(v14)
        local l_Offset_0 = v14.CanvasSize.Y.Offset;
        local l_Y_2 = v14.AbsoluteWindowSize.Y;
        if l_Y_2 ~= 0 and v5._isMounted then
            local v17 = v5._isMounted and l_Y_2 < l_Offset_0;
            if not (not (v17 ~= v5.state.isScrollable) or not v5._isMounted) then
                v5:setState({
                    isScrollable = v17
                });
            end;
            if not (not ((v5.props.onLoadMore and not v5.state.isLoadingMore) and not v17) or v5.props.initializing) then
                v5.loadMore();
            end;
            return ;
        else
            return ;
        end;
    end;
    v5.createFooter = function()
        return v5.state.isLoadingMore and l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 56)
        }, {
            LoadingBar = l_Roact_0.createElement(v5.props.deps.LoadingBarWithTheme)
        });
    end;
end;
v4.didMount = function(v18)
    v18._isMounted = true;
end;
v4.willUnmount = function(v19)
    v19._isMounted = false;
end;
v4.render = function(v20)
    return l_Roact_0.createElement(v20.props.deps.RefreshScrollingFrame, l_llama_0.Dictionary.join(v20.props, {
        onCanvasPositionChangedCallback = v20.onCanvasPositionChanged, 
        onCanvasSizeChangedCallback = v20.onCanvasSizeChanged, 
        createFooter = v20.createFooter, 
        onLoadMore = l_llama_0.None, 
        [l_Roact_0.Children] = l_llama_0.None
    }), v20.props[l_Roact_0.Children]);
end;
return v4;
