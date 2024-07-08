local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v3 = require(l_Parent_1.Promise);
local v4 = {};
local v5 = require(l_Parent_1.React);
local l_useRef_0 = v5.useRef;
local l_useState_0 = v5.useState;
local v8 = require(l_Parent_0.Components.View.View);
local v9 = require(script.Parent.FlatList);
local function _(v10)
    return function(v11)
        if not v10 then
            return v11.Y;
        else
            return v11.X;
        end;
    end;
end;
v4.BidirectionalFlatList = v5.forwardRef(function(v13, v14)
    local function v15()
        return v3.resolve();
    end;
    local _ = v13.activityIndicatorColor == nil and "black" or v13.activityIndicatorColor;
    local v17 = v13.autoscrollToTopThreshold == nil and 100 or v13.autoscrollToTopThreshold;
    local l_data_0 = v13.data;
    local l_enableAutoscrollToTop_0 = v13.enableAutoscrollToTop;
    local l_FooterLoadingIndicator_0 = v13.FooterLoadingIndicator;
    local l_HeaderLoadingIndicator_0 = v13.HeaderLoadingIndicator;
    local l_ListHeaderComponent_0 = v13.ListHeaderComponent;
    local l_ListFooterComponent_0 = v13.ListFooterComponent;
    local v24 = if v13.onEndReached == nil then v15 else v13.onEndReached;
    local v25 = v13.onEndReachedThreshold == nil and 10 or v13.onEndReachedThreshold;
    local l_onScroll_0 = v13.onScroll;
    local v27 = if v13.onStartReached == nil then v15 else v13.onStartReached;
    local v28 = v13.onStartReachedThreshold == nil and 10 or v13.onStartReachedThreshold;
    local v29 = v13.showDefaultLoadingIndicators == nil and true or v13.showDefaultLoadingIndicators;
    local v30 = not (v13.enableRetryOnStartReached == nil) and v13.enableRetryOnStartReached;
    local v31 = not (v13.enableRetryOnEndReached == nil) and v13.enableRetryOnEndReached;
    local v32, v33 = l_useState_0(false);
    local v34, v35 = l_useState_0(false);
    local v36, v37 = l_useState_0(0);
    local v38 = l_useRef_0({});
    local v39 = l_useRef_0({});
    local v40 = l_useRef_0(nil);
    local v41 = l_useRef_0(nil);
    local function v45()
        if not (l_data_0 and #l_data_0 > 0) or not v38.current[#l_data_0] then
            local v42 = if not v13.inverted then v36 >= 1 else v36 >= 3;
            if v42 then
                if not (not (l_data_0 and #l_data_0 > 0) or not v42) then
                    v38.current[#l_data_0] = true;
                end;
                v33(true);
                local function v44()
                    return v3.new(function(v43)
                        v40.current = nil;
                        v33(false);
                        v43();
                    end);
                end;
                if not v41.current then
                    v40.current = v27():andThen(v44);
                    return ;
                else
                    v41.current:andThen(function()
                        v40.current = v27():andThen(v44);
                    end);
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    local function v49()
        if not (l_data_0 and #l_data_0 > 0) or not v39.current[#l_data_0] then
            local v46 = if not v13.inverted then v36 >= 1 else v36 >= 3;
            if v46 then
                if not (not (l_data_0 and #l_data_0 > 0) or not v46) then
                    v39.current[#l_data_0] = true;
                end;
                v35(true);
                local function v48()
                    return v3.new(function(v47)
                        v41.current = nil;
                        v35(false);
                        v47();
                    end);
                end;
                if not v40.current then
                    v41.current = v24():andThen(v48);
                    return ;
                else
                    v40.current:andThen(function()
                        v41.current = v24():andThen(v48);
                    end);
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    return v5.createElement(v5.Fragment, nil, v5.createElement(v9, l_Object_0.assign(table.clone(v13), {
        renderItem = function(v50)
            local l_item_0 = v50.item;
            return v5.createElement(v8, {
                onLayout = function(v52)
                    local v53 = if not not v14 and v14.current then v14.current._listRef._scrollRef.getNativeScrollRef()._nativeRef.current else nil;
                    local l_horizontal_0 = v13.horizontal;
                    local l_l_horizontal_0_0 = l_horizontal_0 --[[ copy: 3 -> 9 ]];
                    local function v57(v56)
                        if not l_l_horizontal_0_0 then
                            return v56.Y;
                        else
                            return v56.X;
                        end;
                    end;
                    if not (not l_item_0.shouldResizeOnMount or not v53) then
                        l_horizontal_0 = v57(v52.AbsoluteSize);
                        if not (l_horizontal_0 > 0) or v53 == nil then
                            l_item_0.shouldResizeOnMount = false;
                            return ;
                        else
                            local l_CanvasPosition_0 = v53.CanvasPosition;
                            local l_AbsoluteSize_0 = v53.AbsoluteSize;
                            local l_AbsoluteCanvasSize_0 = v53.AbsoluteCanvasSize;
                            local v61 = if not l_enableAutoscrollToTop_0 then nil else v17;
                            if v61 and if not v13.inverted then v57(l_CanvasPosition_0) else (v57(l_AbsoluteCanvasSize_0) - v57(l_CanvasPosition_0)) - v57(l_AbsoluteSize_0) < v61 then
                                l_item_0.shouldResizeOnMount = false;
                                v53.CanvasPosition = if not v13.inverted then if v13.horizontal then Vector2.new(0, v53.CanvasPosition.Y) else Vector2.new(v53.CanvasPosition.X, 0) else if v13.horizontal then Vector2.new(v57(l_AbsoluteCanvasSize_0) - v57(l_AbsoluteSize_0), v53.CanvasPosition.Y) else Vector2.new(v53.CanvasPosition.X, v57(l_AbsoluteCanvasSize_0) - v57(l_AbsoluteSize_0));
                                return ;
                            else
                                local v62 = if not v13.inverted then if v13.horizontal then Vector2.new(l_CanvasPosition_0.X + l_horizontal_0, l_CanvasPosition_0.Y) else Vector2.new(l_CanvasPosition_0.X, l_CanvasPosition_0.Y + l_horizontal_0) else if v13.horizontal then Vector2.new(l_CanvasPosition_0.X - l_horizontal_0, l_CanvasPosition_0.Y) else Vector2.new(l_CanvasPosition_0.X, l_CanvasPosition_0.Y - l_horizontal_0);
                                l_item_0.shouldResizeOnMount = false;
                                v53.CanvasPosition = v62;
                            end;
                        end;
                    end;
                end, 
                AutomaticSize = if not v13.horizontal then Enum.AutomaticSize.Y else Enum.AutomaticSize.X, 
                Size = if not v13.horizontal then UDim2.new(1, 0, 0, 0) else UDim2.new(0, 0, 1, 0), 
                BorderSizePixel = 0, 
                name = "resize"
            }, {
                child = v13.renderItem(v50)
            });
        end, 
        ref = v14, 
        ListHeaderComponent = function()
            if v29 then
                if v32 then
                    if not l_HeaderLoadingIndicator_0 then
                        if _G.__DEV__ then
                            warn("default activity indicator not available");
                        end;
                        return nil;
                    else
                        return v5.createElement(l_HeaderLoadingIndicator_0, nil);
                    end;
                else
                    return nil;
                end;
            elseif not l_ListHeaderComponent_0 then
                return nil;
            else
                return v5.createElement(l_ListHeaderComponent_0, nil);
            end;
        end, 
        ListFooterComponent = function()
            if v29 then
                if v34 then
                    if not l_FooterLoadingIndicator_0 then
                        if _G.__DEV__ then
                            warn("default activity indicator not available");
                        end;
                        return nil;
                    else
                        return v5.createElement(l_FooterLoadingIndicator_0, nil);
                    end;
                else
                    return nil;
                end;
            elseif not l_ListFooterComponent_0 then
                return nil;
            else
                return v5.createElement(l_ListFooterComponent_0, nil);
            end;
        end, 
        onEndReached = l_Object_0.None, 
        onScroll = function(v63)
            v37(function(v64)
                return v64 + 1;
            end);
            if l_onScroll_0 then
                l_onScroll_0(v63);
            end;
            local v65 = v63:GetChildren()[1];
            local l_horizontal_1 = v13.horizontal;
            local l_l_horizontal_1_0 = l_horizontal_1 --[[ copy: 3 -> 8 ]];
            local function v69(v68)
                if not l_l_horizontal_1_0 then
                    return v68.Y;
                else
                    return v68.X;
                end;
            end;
            l_horizontal_1 = v69(v63.AbsoluteSize);
            local v70 = v69(v65.AbsoluteSize);
            local v71 = if not v13.inverted then v69(v63.CanvasPosition) else (v69(v63.AbsoluteCanvasSize) - v69(v63.CanvasPosition)) - l_horizontal_1;
            local v72 = v71 < v28;
            local v73 = (v70 - l_horizontal_1) - v71 < v25;
            if not v72 then
                if not (not (not (not v30 or not l_data_0) and #l_data_0 > 0) or not v38.current[#l_data_0]) then
                    v38.current[#l_data_0] = false;
                end;
            else
                v45();
            end;
            if not v73 then
                if not (not (not (not v31 or not l_data_0) and #l_data_0 > 0) or not v39.current[#l_data_0]) then
                    v39.current[#l_data_0] = false;
                end;
                return ;
            else
                v49();
                return ;
            end;
        end, 
        maintainVisibleContentPosition = {
            autoscrollToTopThreshold = if not l_enableAutoscrollToTop_0 then nil else v17, 
            minIndexForVisible = 1
        }
    })));
end);
return v4;
