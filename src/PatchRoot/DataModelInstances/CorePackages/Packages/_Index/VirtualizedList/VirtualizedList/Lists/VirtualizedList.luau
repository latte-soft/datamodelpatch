local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Map_0 = v2.Map;
local l_Object_0 = v2.Object;
local l_Set_0 = v2.Set;
local l_console_0 = v2.console;
local function _(v9)
    local v10 = false;
    if v9 ~= nil then
        v10 = v9 ~= 1;
    end;
    return v10;
end;
local v12 = require(l_Parent_0.Interaction.Batchinator);
local v13 = require(script.Parent.FillRateHelper);
local v15 = {
    findNodeHandle = function(_)
        warn("ReactNative.findNodeHandle is not implemented");
    end
};
local v16 = nil;
local v17 = require(l_Parent_0.Components.ScrollView.ScrollView);
local v18 = require(l_Parent_0.StyleSheet.StyleSheet);
local v19 = require(l_Parent_0.Components.View.View);
local v20 = require(script.Parent.ViewabilityHelper);
local function v21(...)
    return {};
end;
local v22 = require(l_Parent_0.Utilities.infoLog);
local v23 = require(l_Parent_0.jsUtils.invariant);
local v24 = require(script.Parent.VirtualizeUtils);
local l_keyExtractor_0 = v24.keyExtractor;
local l_computeWindowedRenderLimits_0 = v24.computeWindowedRenderLimits;
local v27 = require(l_Parent_1.React);
local _ = require(l_Parent_0.Components.ScrollView.ScrollView);
local v29 = require(script.Parent.VirtualizedListContext);
local l_VirtualizedListCellContextProvider_0 = v29.VirtualizedListCellContextProvider;
local l_VirtualizedListContext_0 = v29.VirtualizedListContext;
local l_VirtualizedListContextProvider_0 = v29.VirtualizedListContextProvider;
local v33 = nil;
local v34 = nil;
local v35 = nil;
v16 = function(v36)
    return v27.createElement("Frame", {
        Name = "RCTRefreshControl"
    }, v36.children);
end;
local v37 = false;
local v38 = "";
local function _(v39)
    if v39 == nil then
        return false;
    else
        return v39;
    end;
end;
local function _(v41)
    if v41 == nil then
        return 10;
    else
        return v41;
    end;
end;
local function _(v43)
    if v43 == nil then
        return 10;
    else
        return v43;
    end;
end;
local function _(v45)
    if v45 == nil then
        return 2;
    else
        return v45;
    end;
end;
local function _(v47)
    if v47 == nil then
        return 50;
    else
        return v47;
    end;
end;
local function _(v49)
    if v49 == nil then
        return 21;
    else
        return v49;
    end;
end;
local function _(v51)
    if v51 == nil then
        return function(v52, v53)
            return v52 == v53;
        end;
    else
        return v51;
    end;
end;
local v55 = v27.PureComponent:extend("VirtualizedList");
v55.contextType = l_VirtualizedListContext_0;
v55.init = function(v56, v57)
    v56.props = v57;
    v56._viewabilityTuples = {};
    v56._averageCellLength = 0;
    v56._cellKeysToChildListKeys = l_Map_0.new();
    v56._cellRefs = {};
    v56._frames = {};
    v56._footerLength = 0;
    v56._hasDoneInitialScroll = false;
    v56._hasInteracted = false;
    v56._hasMore = false;
    v56._hasWarned = {};
    v56._headerLength = 0;
    v56._hiPriInProgress = false;
    v56._highestMeasuredFrameIndex = 1;
    v56._indicesToKeys = l_Map_0.new();
    v56._nestedChildLists = l_Map_0.new();
    v56._offsetFromParentVirtualizedList = 0;
    v56._prevParentOffset = 0;
    v56._scrollMetrics = {
        contentLength = 0, 
        dOffset = 0, 
        dt = 10, 
        offset = 0, 
        timestamp = 0, 
        velocity = 0, 
        visibleLength = 0
    };
    v56._scrollRef = nil;
    v56._sentEndForContentLength = 0;
    v56._totalCellLength = 0;
    v56._totalCellsMeasured = 0;
    v56._canvasPosition = Vector2.new(0, 0);
    v56._canvasSize = UDim2.new(0, 0, 0, 0);
    v56._invertedCanvasLength = if not v56.props.getItemLayout then v56.props.invertedCanvasLength or 1000 else 0;
    v56._getFrameMetrics = function(v58)
        local l_data_0 = v56.props.data;
        local l_getItem_0 = v56.props.getItem;
        local l_getItemCount_0 = v56.props.getItemCount;
        local l_getItemLayout_0 = v56.props.getItemLayout;
        v23(v58 <= l_getItemCount_0(l_data_0), "Tried to get frame for out of range index " .. tostring(v58));
        local v63 = l_getItem_0(l_data_0, v58);
        local v64 = if v63 ~= nil then v56._frames[v56:_keyExtractor(v63, v58)] else v63;
        if not (not (not v64 or v64.index ~= v58) or not l_getItemLayout_0) then
            v64 = l_getItemLayout_0(l_data_0, v58);
        end;
        return v64;
    end;
    local l_v23_0 = v23;
    local l_windowSize_0 = v57.windowSize;
    l_v23_0((l_windowSize_0 == nil and 21 or l_windowSize_0) > 0, "VirtualizedList: The windowSize prop must be present and set to a value greater than 0.");
    v56._fillRateHelper = v13.new(v56._getFrameMetrics);
    v56._updateCellsToRender = function()
        local l_data_1 = v56.props.data;
        local l_getItemCount_1 = v56.props.getItemCount;
        local l_onEndReachedThreshold_0 = v56.props.onEndReachedThreshold;
        local v70 = l_onEndReachedThreshold_0 == nil and 2 or l_onEndReachedThreshold_0;
        local v71 = v56:_isVirtualizationDisabled();
        v56:_updateViewableItems(l_data_1);
        if l_Boolean_0.toJSBoolean(l_data_1) then
            v56:setState(function(v72)
                local v73 = nil;
                local l_contentLength_0 = v56._scrollMetrics.contentLength;
                local l_offset_0 = v56._scrollMetrics.offset;
                local l_visibleLength_0 = v56._scrollMetrics.visibleLength;
                if v71 then
                    local v77;
                    if (l_contentLength_0 - l_visibleLength_0) - l_offset_0 < v70 * l_visibleLength_0 then
                        local l_maxToRenderPerBatch_0 = v56.props.maxToRenderPerBatch;
                        v77 = l_maxToRenderPerBatch_0 == nil and 10 or l_maxToRenderPerBatch_0;
                    else
                        v77 = 0;
                    end;
                    v73 = {
                        first = 1, 
                        last = math.min(v72.last + v77, l_getItemCount_1(l_data_1))
                    };
                elseif l_visibleLength_0 > 0 and l_contentLength_0 > 0 then
                    local l_initialScrollIndex_0 = v56.props.initialScrollIndex;
                    local v80 = false;
                    if l_initialScrollIndex_0 ~= nil then
                        v80 = l_initialScrollIndex_0 ~= 1;
                    end;
                    if not (v80 and not l_Boolean_0.toJSBoolean(v56._scrollMetrics.offset)) then
                        v80 = l_computeWindowedRenderLimits_0;
                        l_initialScrollIndex_0 = v56.props.data;
                        local l_getItemCount_2 = v56.props.getItemCount;
                        local l_maxToRenderPerBatch_1 = v56.props.maxToRenderPerBatch;
                        local v83 = l_maxToRenderPerBatch_1 == nil and 10 or l_maxToRenderPerBatch_1;
                        local l_windowSize_1 = v56.props.windowSize;
                        v73 = v80(l_initialScrollIndex_0, l_getItemCount_2, v83, l_windowSize_1 == nil and 21 or l_windowSize_1, v72, v56._getFrameMetricsApprox, v56._scrollMetrics);
                    end;
                end;
                if v73 ~= nil and v56._nestedChildLists.size > 0 then
                    local l_first_0 = v73.first;
                    local l_last_0 = v73.last;
                    local l_l_first_0_0 = l_first_0;
                    while l_l_first_0_0 <= l_last_0 do
                        local v88 = v56._indicesToKeys:get(l_l_first_0_0);
                        local v89 = if not l_Boolean_0.toJSBoolean(v88) then v88 else v56._cellKeysToChildListKeys:get(v88);
                        if l_Boolean_0.toJSBoolean(v89) then
                            local v90 = false;
                            for _, v92 in ipairs(v89) do
                                local v93 = v56._nestedChildLists:get(v92);
                                if not ((not v93 or not v93.ref) or not v93.ref:hasMore()) then
                                    v90 = true;
                                    break;
                                end;
                            end;
                            if not v90 then
                                l_l_first_0_0 = l_l_first_0_0 + 1;
                            else
                                v73.last = l_l_first_0_0;
                                break;
                            end;
                        end;
                    end;
                end;
                if (v73 ~= nil and v73.first == v72.first) and v73.last == v72.last then
                    v73 = nil;
                end;
                return v73;
            end);
            return ;
        else
            return ;
        end;
    end;
    v56._updateCellsToRenderBatcher = v12.new(v56._updateCellsToRender, v56.props.updateCellsBatchingPeriod == nil and 50 or v56.props.updateCellsBatchingPeriod);
    if not v56.props.viewabilityConfigCallbackPairs then
        l_v23_0 = v56.props.onViewableItemsChanged;
        local l_viewabilityConfig_0 = v56.props.viewabilityConfig;
        if l_v23_0 then
            table.insert(v56._viewabilityTuples, {
                viewabilityHelper = v20.new(l_viewabilityConfig_0), 
                onViewableItemsChanged = l_v23_0
            });
        end;
    else
        v56._viewabilityTuples = l_Array_0.map(v56.props.viewabilityConfigCallbackPairs, function(v95)
            return {
                viewabilityHelper = v20.new(v95.viewabilityConfig), 
                onViewableItemsChanged = v95.onViewableItemsChanged
            };
        end);
    end;
    l_v23_0 = {};
    l_windowSize_0 = v56.props.initialScrollIndex;
    local v96 = false;
    if l_windowSize_0 ~= nil then
        v96 = l_windowSize_0 ~= 1;
    end;
    l_v23_0.first = not v96 and 1 or v56.props.initialScrollIndex;
    l_windowSize_0 = v56.props.getItemCount(v56.props.data) + 1;
    local l_initialScrollIndex_1 = v56.props.initialScrollIndex;
    local v98 = false;
    if l_initialScrollIndex_1 ~= nil then
        v98 = l_initialScrollIndex_1 ~= 1;
    end;
    local v99 = not v98 and 1 or v56.props.initialScrollIndex;
    l_initialScrollIndex_1 = v56.props.initialNumToRender;
    l_v23_0.last = math.min(l_windowSize_0, v99 + (l_initialScrollIndex_1 == nil and 10 or l_initialScrollIndex_1)) - 1;
    l_v23_0.firstItemTracked = if not not v56.props.data and v56.props.getItemCount(v56.props.data) > 0 then v56.props.getItem(v56.props.data, 1) else l_Object_0.None;
    l_v23_0.scrollPositionDelta = 0;
    if v56:_isNestedWithSameOrientation() then
        local v100 = v56.context.getNestedChildState(v56:_getListKey());
        if l_Boolean_0.toJSBoolean(v100) then
            l_v23_0 = v100;
            v56.state = v100;
            v56._frames = v100.frames;
        end;
    end;
    v56.state = l_v23_0;
    v56._getScrollMetrics = function()
        return v56._scrollMetrics;
    end;
    v56._getOutermostParentListRef = function()
        if not v56:_isNestedWithSameOrientation() then
            return v56;
        else
            return v56.context.getOutermostParentListRef();
        end;
    end;
    v56._getNestedChildState = function(v101)
        local v102 = v56._nestedChildLists:get(v101);
        if not v102 then
            return v102;
        else
            return v102.state;
        end;
    end;
    v56._registerAsNestedChild = function(v103)
        local v104 = v56._cellKeysToChildListKeys:get(v103.cellKey) or l_Set_0.new();
        v104:add(v103.key);
        v56._cellKeysToChildListKeys:set(v103.cellKey, v104);
        local v105 = v56._nestedChildLists:get(v103.key);
        if v105 and v105.ref ~= nil then
            l_console_0.error("A VirtualizedList contains a cell which itself contains " .. "more than one VirtualizedList of the same orientation as the parent " .. "list. You must pass a unique listKey prop to each sibling list.\n\n" .. v33(l_Object_0.assign({}, v103, {
                horizontal = l_Boolean_0.toJSBoolean(v103.ref.props.horizontal)
            })));
        end;
        v56._nestedChildLists:set(v103.key, {
            ref = v103.ref, 
            state = nil
        });
        if v56._hasInteracted then
            v103.ref:recordInteraction();
        end;
        return nil;
    end;
    v56._unregisterAsNestedChild = function(v106)
        v56._nestedChildLists:set(v106.key, {
            ref = nil, 
            state = v106.state
        });
    end;
    v56._onUpdateSeparators = function(v107, v108)
        l_Array_0.forEach(v107, function(v109)
            local v110 = false;
            if v109 ~= nil then
                v110 = v56._cellRefs[tostring(v109)];
            end;
            if not l_Boolean_0.toJSBoolean(v110) then
                return ;
            else
                return v110:updateSeparatorProps(v108);
            end;
        end);
    end;
    v56._getSpacerKey = function(v111)
        if not v111 then
            return "width";
        else
            return "height";
        end;
    end;
    v56._captureScrollRef = function(v112)
        v56._scrollRef = v112;
    end;
    v56._defaultRenderScrollComponent = function(v113)
        local l_onRefresh_0 = v113.onRefresh;
        if not v56:_isNestedWithSameOrientation() then
            if not l_onRefresh_0 then
                return v27.createElement(v17, v113);
            else
                v23(typeof(v113.refreshing) == "boolean", "`refreshing` prop must be set as a boolean in order to use `onRefresh`, but got `" .. (v113.refreshing == nil and "undefined" or tostring(v113.refreshing) .. "`"));
                return v27.createElement(v17, l_Object_0.assign(table.clone(v113), {
                    refreshControl = if v113.refreshControl == nil then v27.createElement(v16, {
                        refreshing = v113.refreshing, 
                        onRefresh = l_onRefresh_0, 
                        progressViewOffset = v113.progressViewOffset
                    }) else v113.refreshControl
                }));
            end;
        else
            return v27.createElement(v19, v113);
        end;
    end;
    v56._onCellUnmount = function(v115)
        local v116 = v56._frames[v115];
        if v116 ~= nil then
            v56._frames[v115] = l_Object_0.assign({}, v116, {
                inLayout = false
            });
        end;
    end;
    v56._onLayout = function(v117)
        if not v56:_isNestedWithSameOrientation() then
            v56._scrollMetrics.visibleLength = v56:_selectLength({
                width = v117.AbsoluteSize.X, 
                height = v117.AbsoluteSize.Y
            });
        else
            v56:measureLayoutRelativeToContainingList();
        end;
        if v56.props.onLayout then
            v56.props.onLayout(v117);
        end;
        v56:_scheduleCellsToRenderUpdate();
        v56:_maybeCallOnEndReached();
    end;
    v56._onLayoutEmpty = function(v118)
        if v56.props.onLayout then
            v56.props.onLayout(v118);
        end;
    end;
    v56._onLayoutFooter = function(v119)
        v56:_triggerRemeasureForChildListsInCell(v56:_getFooterCellKey());
        v56._footerLength = v56:_selectLength({
            height = v119.AbsoluteSize.Y, 
            width = v119.AbsoluteSize.X
        });
    end;
    v56._onLayoutHeader = function(v120)
        v56._headerLength = v56:_selectLength({
            height = v120.AbsoluteSize.Y, 
            width = v120.AbsoluteSize.X
        });
    end;
    v56._onContentSizeChange = function(v121, v122)
        if not (((v121 > 0 and v122 > 0) and v56.props.initialScrollIndex ~= nil) and v56.props.initialScrollIndex > 1) or v56._hasDoneInitialScroll then
            if not (not ((v56.props.inverted and v121 > 0) and v122 > 0) or v56._hasDoneInitialScroll) then
                v56._hasDoneInitialScroll = true;
                task.defer(function()
                    while v56:getScrollRef() == nil do
                        task.wait();
                    end;
                    if v56.props.contentOffset == nil then
                        local l_current_0 = v56:getScrollRef()._nativeRef.current;
                        if not v56.props.horizontal then
                            l_current_0.CanvasPosition = Vector2.new(l_current_0.CanvasPosition.X, l_current_0.AbsoluteCanvasSize.Y);
                        else
                            l_current_0.CanvasPosition = Vector2.new(l_current_0.AbsoluteCanvasSize.X, l_current_0.CanvasPosition.Y);
                            return ;
                        end;
                    end;
                end);
            end;
        else
            if v56.props.contentOffset == nil then
                v56:scrollToIndex({
                    animated = false, 
                    index = v56.props.initialScrollIndex
                });
            end;
            v56._hasDoneInitialScroll = true;
        end;
        if v56.props.onContentSizeChange then
            v56.props.onContentSizeChange(v121, v122);
        end;
        v56._scrollMetrics.contentLength = v56:_selectLength({
            height = v122, 
            width = v121
        });
        v56:_scheduleCellsToRenderUpdate();
        v56:_maybeCallOnEndReached();
    end;
    v56._convertParentScrollMetrics = function(v124)
        local v125 = v124.offset - v56._offsetFromParentVirtualizedList;
        return {
            visibleLength = v124.visibleLength, 
            contentLength = v56._scrollMetrics.contentLength, 
            offset = v125, 
            dOffset = v125 - v56._scrollMetrics.offset
        };
    end;
    v56._onScroll = function(v126)
        v56._nestedChildLists:forEach(function(v127)
            if v127.ref then
                v127.ref._onScroll(v126);
            end;
        end);
        if v56.props.onScroll then
            v56.props.onScroll(v126);
        end;
        local v128 = os.clock();
        local v129 = v126:GetChildren()[1];
        local v130 = v56:_selectLength({
            height = v126.AbsoluteSize.Y, 
            width = v126.AbsoluteSize.X
        });
        local v131 = v56:_selectLength({
            height = v129.AbsoluteSize.Y, 
            width = v129.AbsoluteSize.X
        });
        local v132 = if not v56.props.inverted then v56:_selectOffset({
            x = v126.CanvasPosition.X, 
            y = v126.CanvasPosition.Y
        }) else v56:_selectOffset({
            x = (v126.AbsoluteCanvasSize.X - v126.CanvasPosition.X) - v130, 
            y = (v126.AbsoluteCanvasSize.Y - v126.CanvasPosition.Y) - v130
        });
        local v133 = v132 - v56._scrollMetrics.offset;
        if v56:_isNestedWithSameOrientation() then
            if v56._scrollMetrics.contentLength == 0 then
                return ;
            else
                local v134 = v56._convertParentScrollMetrics({
                    v130, 
                    v132
                });
                v130 = v134.visibleLength;
                v131 = v134.contentLength;
                v132 = v134.offset;
                v133 = v134.dOffset;
            end;
        end;
        local v135 = not l_Boolean_0.toJSBoolean(v56._scrollMetrics.timestamp) and 1 or math.max(1, (v128 - v56._scrollMetrics.timestamp) * 1000);
        local v136 = v133 / v135;
        if not (not ((v135 > 500 and v56._scrollMetrics.dt > 500) and 5 * v130 < v131) or v56._hasWarned.perf) then
            v22("VirtualizedList: You have a large list that is slow to update - make sure your " .. "renderItem function renders components that follow React performance best practices " .. "like PureComponent, shouldComponentUpdate, etc.", {
                dt = v135, 
                prevDt = v56._scrollMetrics.dt, 
                contentLength = v131
            });
            v56._hasWarned.perf = true;
        end;
        v56._scrollMetrics = {
            contentLength = v131, 
            dt = v135, 
            dOffset = v133, 
            offset = v132, 
            timestamp = v128, 
            velocity = v136, 
            visibleLength = v130
        };
        local l_scrollPositionDelta_0 = v56.state.scrollPositionDelta;
        if l_scrollPositionDelta_0 > 0 then
            v56:setState(function(v138)
                return {
                    scrollPositionDelta = 0, 
                    first = v138.first + l_scrollPositionDelta_0, 
                    last = v138.last + l_scrollPositionDelta_0
                };
            end);
        end;
        v56:_updateViewableItems(v56.props.data);
        if v56.props then
            v56:_maybeCallOnEndReached();
            if v136 ~= 0 then
                v56._fillRateHelper:activate();
            end;
            v56:_computeBlankness();
            v56:_scheduleCellsToRenderUpdate();
            return ;
        else
            return ;
        end;
    end;
    v56._onScrollBeginDrag = function(v139)
        v56._nestedChildLists:forEach(function(v140)
            if v140.ref then
                v140.ref._onScrollBeginDrag(v139);
            end;
        end);
        l_Array_0.forEach(v56._viewabilityTuples, function(v141)
            v141.viewabilityHelper:recordInteraction();
        end);
        v56._hasInteracted = true;
        if v56.props.onScrollBeginDrag then
            v56.props.onScrollBeginDrag(v139);
        end;
    end;
    v56._onScrollEndDrag = function(v142)
        v56._nestedChildLists:forEach(function(v143)
            if v143.ref then
                v143.ref._onScrollEndDrag(v142);
            end;
        end);
        if l_Boolean_0.toJSBoolean(nil) then
            v56._scrollMetrics.velocity = v56:_selectOffset(nil);
        end;
        v56:_computeBlankness();
        if v56.props.onScrollEndDrag then
            v56.props.onScrollEndDrag(v142);
        end;
    end;
    v56._onMomentumScrollBegin = function(v144)
        v56._nestedChildLists:forEach(function(v145)
            if v145.ref then
                v145.ref._onMomentumScrollBegin(v144);
            end;
        end);
        if v56.props.onMomentumScrollBegin then
            v56.props.onMomentumScrollBegin(v144);
        end;
    end;
    v56._onMomentumScrollEnd = function(v146)
        v56._nestedChildLists:forEach(function(v147)
            if v147.ref then
                v147.ref._onMomentumScrollEnd(v146);
            end;
        end);
        v56._scrollMetrics.velocity = 0;
        v56:_computeBlankness();
        if v56.props.onMomentumScrollEnd then
            v56.props.onMomentumScrollEnd(v146);
        end;
    end;
    v56._createViewToken = function(v148, v149)
        local v150 = v56.props.getItem(v56.props.data, v148);
        return {
            index = v148, 
            item = v150, 
            key = v56:_keyExtractor(v150, v148), 
            isViewable = v149
        };
    end;
    v56._getFrameMetricsApprox = function(v151)
        local v152 = v56._getFrameMetrics(v151);
        if v152 ~= nil and v152.index == v151 then
            return v152;
        else
            v23(not v56.props.getItemLayout, "Should not have to estimate frames when a measurement metrics function is provided");
            return {
                length = v56._averageCellLength, 
                offset = v56._averageCellLength * (v151 - 1)
            };
        end;
    end;
end;
v55.scrollToEnd = function(v153, v154)
    local v155 = not (v154 ~= nil) or v154.animated;
    local v156 = v153._getFrameMetricsApprox((v153.props.getItemCount(v153.props.data)));
    local v157 = if not v153.props.inverted then math.max(0, ((v156.offset + v156.length) + v153._footerLength) - v153._scrollMetrics.visibleLength) else 0;
    if v153._scrollRef == nil then
        return ;
    elseif v153._scrollRef.scrollTo == nil then
        l_console_0.warn("No scrollTo method provided. This may be because you have two nested " .. "VirtualizedLists with the same orientation, or because you are " .. "using a custom component that does not implement scrollTo.");
        return ;
    else
        local l_scrollTo_0 = v153._scrollRef.scrollTo;
        local l_horizontal_0 = v153.props.horizontal;
        l_scrollTo_0(if not (not (l_horizontal_0 == nil) and l_horizontal_0) then {
            y = v157, 
            animated = v155
        } else {
            x = v157, 
            animated = v155
        });
        return ;
    end;
end;
v55.scrollToIndex = function(v160, v161)
    local l_data_2 = v160.props.data;
    local l_horizontal_1 = v160.props.horizontal;
    local l_getItemCount_3 = v160.props.getItemCount;
    local l_getItemLayout_1 = v160.props.getItemLayout;
    local l_onScrollToIndexFailed_0 = v160.props.onScrollToIndexFailed;
    local l_animated_0 = v161.animated;
    local l_index_0 = v161.index;
    local l_viewOffset_0 = v161.viewOffset;
    local l_viewPosition_0 = v161.viewPosition;
    v23(l_index_0 >= 1, ("scrollToIndex out of range: requested index %d but minimum is 1"):format(l_index_0));
    v23(l_getItemCount_3(l_data_2) >= 1, ("scrollToIndex out of range: item length %d but minimum is 1"):format(l_getItemCount_3(l_data_2)));
    v23(l_index_0 <= l_getItemCount_3(l_data_2), ("scrollToIndex out of range: requested index %d is out of 1 to %d"):format(l_index_0, l_getItemCount_3(l_data_2)));
    if not l_getItemLayout_1 and v160._highestMeasuredFrameIndex < l_index_0 then
        v23(l_Boolean_0.toJSBoolean(l_onScrollToIndexFailed_0), "scrollToIndex should be used in conjunction with getItemLayout or onScrollToIndexFailed, " .. "otherwise there is no way to know the location of offscreen indices or handle failures.");
        l_onScrollToIndexFailed_0({
            averageItemLength = v160._averageCellLength, 
            highestMeasuredFrameIndex = v160._highestMeasuredFrameIndex, 
            index = l_index_0
        });
        return ;
    else
        local v171 = if not v160:getScrollRef() then nil else v160:getScrollRef()._nativeRef.current;
        if v171 == nil then
            return ;
        else
            local l_AbsoluteCanvasSize_0 = v171.AbsoluteCanvasSize;
            local l_AbsoluteSize_0 = v171.AbsoluteSize;
            local v174 = v160._getFrameMetricsApprox(l_index_0);
            local v175 = math.max(0, if not v160.props.inverted then v174.offset - (not not l_Boolean_0.toJSBoolean(l_viewPosition_0) and l_viewPosition_0 or 0) * (v160._scrollMetrics.visibleLength - v174.length) else ((if not l_horizontal_1 then l_AbsoluteCanvasSize_0.Y else l_AbsoluteCanvasSize_0.X - if not l_horizontal_1 then l_AbsoluteSize_0.Y else l_AbsoluteSize_0.X) - v174.offset) - (not not l_Boolean_0.toJSBoolean(l_viewPosition_0) and l_viewPosition_0 or 0) * (v160._scrollMetrics.visibleLength - v174.length)) - (not not l_Boolean_0.toJSBoolean(l_viewOffset_0) and l_viewOffset_0 or 0);
            if v160._scrollRef == nil then
                return ;
            elseif v160._scrollRef.scrollTo == nil then
                l_console_0.warn("No scrollTo method provided. This may be because you have two nested " .. "VirtualizedLists with the same orientation, or because you are " .. "using a custom component that does not implement scrollTo.");
                return ;
            else
                v160._scrollRef.scrollTo(if not l_horizontal_1 then {
                    y = v175, 
                    animated = l_animated_0
                } else {
                    x = v175, 
                    animated = l_animated_0
                });
                return ;
            end;
        end;
    end;
end;
v55.scrollToItem = function(v176, v177)
    local l_item_0 = v177.item;
    local l_data_3 = v176.props.data;
    local l_getItem_1 = v176.props.getItem;
    local v181 = v176.props.getItemCount(l_data_3);
    local v182 = 1;
    while true do
        if v182 <= v181 then
            if l_getItem_1(l_data_3, v182) == l_item_0 then
                v176:scrollToIndex(l_Object_0.assign({}, v177, {
                    index = v182
                }));
                return ;
            else
                v182 = v182 + 1;
            end;
        else
            return ;
        end;
    end;
end;
v55.scrollToOffset = function(v183, v184)
    local v185 = if not v183:getScrollRef() then nil else v183:getScrollRef()._nativeRef.current;
    if v185 == nil then
        return ;
    else
        local l_animated_1 = v184.animated;
        local l_offset_1 = v184.offset;
        if v183._scrollRef == nil then
            return ;
        else
            if v183.props.inverted then
                local l_AbsoluteCanvasSize_1 = v185.AbsoluteCanvasSize;
                local l_AbsoluteSize_1 = v185.AbsoluteSize;
                l_offset_1 = (if not v183.props.horizontal then l_AbsoluteCanvasSize_1.Y else l_AbsoluteCanvasSize_1.X - l_offset_1) - if not v183.props.horizontal then l_AbsoluteSize_1.Y else l_AbsoluteSize_1.X;
            end;
            if v183._scrollRef.scrollTo == nil then
                l_console_0.warn("No scrollTo method provided. This may be because you have two nested " .. "VirtualizedLists with the same orientation, or because you are " .. "using a custom component that does not implement scrollTo.");
                return ;
            else
                local l_scrollTo_1 = v183._scrollRef.scrollTo;
                local l_horizontal_2 = v183.props.horizontal;
                l_scrollTo_1(if not (not (l_horizontal_2 == nil) and l_horizontal_2) then {
                    y = l_offset_1, 
                    animated = l_animated_1
                } else {
                    x = l_offset_1, 
                    animated = l_animated_1
                });
                return ;
            end;
        end;
    end;
end;
v55.recordInteraction = function(v192)
    v192._nestedChildLists:forEach(function(v193)
        if v193.ref then
            v193.ref:recordInteraction();
        end;
    end);
    l_Array_0.forEach(v192._viewabilityTuples, function(v194)
        v194.viewabilityHelper:recordInteraction();
    end);
    v192:_updateViewableItems(v192.props.data);
end;
v55.flashScrollIndicators = function(v195)
    if v195._scrollRef == nil then
        return ;
    else
        v195._scrollRef:flashScrollIndicators();
        return ;
    end;
end;
v55.getScrollResponder = function(v196)
    if not v196._scrollRef or not v196._scrollRef.getScrollResponder then
        return nil;
    else
        return v196._scrollRef:getScrollResponder();
    end;
end;
v55.getScrollableNode = function(v197)
    if not v197._scrollRef or not v197._scrollRef.getScrollableNode then
        return v15.findNodeHandle(v197._scrollRef);
    else
        return v197._scrollRef:getScrollableNode();
    end;
end;
v55.getScrollRef = function(v198)
    if not v198._scrollRef or not v198._scrollRef.getScrollRef then
        return v198._scrollRef;
    else
        return v198._scrollRef:getScrollRef();
    end;
end;
v55.setNativeProps = function(v199, v200)
    if v199._scrollRef then
        v199._scrollRef:setNativeProps(v200);
    end;
end;
v55._getCellKey = function(v201)
    if not v201.context or not v201.context.cellKey then
        return "rootList";
    else
        return v201.context.cellKey;
    end;
end;
v55._getListKey = function(v202)
    if not l_Boolean_0.toJSBoolean(v202.props.listKey) then
        return (v202:_getCellKey());
    else
        return v202.props.listKey;
    end;
end;
v55._getDebugInfo = function(v203)
    local v204 = {
        listKey = v203:_getListKey(), 
        cellKey = v203:_getCellKey()
    };
    local l_horizontal_3 = v203.props.horizontal;
    v204.horizontal = not (l_horizontal_3 == nil) and l_horizontal_3;
    v204.parent = if not v203.context then nil else v203.context.debugInfo;
    return v204;
end;
v55.hasMore = function(v206)
    return v206._hasMore;
end;
v55.componentDidMount = function(v207)
    if v207:_isNestedWithSameOrientation() then
        v207.context.registerAsNestedChild({
            cellKey = v207:_getCellKey(), 
            key = v207:_getListKey(), 
            ref = v207, 
            parentDebugInfo = v207.context.debugInfo
        });
    end;
end;
v55.componentWillUnmount = function(v208)
    if v208:_isNestedWithSameOrientation() then
        v208.context.unregisterAsNestedChild({
            key = v208:_getListKey(), 
            state = {
                first = v208.state.first, 
                last = v208.state.last, 
                frames = v208._frames
            }
        });
    end;
    v208:_updateViewableItems(nil);
    v208._updateCellsToRenderBatcher:dispose({
        abort = true
    });
    l_Array_0.forEach(v208._viewabilityTuples, function(v209)
        v209.viewabilityHelper:dispose();
    end);
    v208._fillRateHelper:deactivateAndFlush();
end;
v55.getDerivedStateFromProps = function(v210, v211)
    local l_data_4 = v210.data;
    local l_getItemCount_4 = v210.getItemCount;
    local l_maintainVisibleContentPosition_0 = v210.maintainVisibleContentPosition;
    local l_firstItemTracked_0 = v211.firstItemTracked;
    local l_scrollPositionDelta_1 = v211.scrollPositionDelta;
    local l_compareItemData_0 = v210.compareItemData;
    local v220 = l_compareItemData_0 == nil and function(v218, v219)
        return v218 == v219;
    end or l_compareItemData_0;
    l_compareItemData_0 = if not not l_data_4 and l_getItemCount_4(l_data_4) > 0 then v210.getItem(l_data_4, 1) else nil;
    local function v225(v221, v222)
        local v223 = nil;
        for v224 = 1, #v221 do
            if v220(v221[v224], v222) then
                v223 = v224;
                break;
            end;
        end;
        if v223 == nil then
            return 1;
        else
            return v223;
        end;
    end;
    if ((l_maintainVisibleContentPosition_0 and l_scrollPositionDelta_1 == 0) and l_firstItemTracked_0 ~= nil) and l_compareItemData_0 ~= nil then
        l_scrollPositionDelta_1 = if not v220(l_firstItemTracked_0, l_compareItemData_0) then v225(l_data_4, l_firstItemTracked_0) - 1 else 0;
    end;
    local v226 = l_getItemCount_4(l_data_4);
    local l_maxToRenderPerBatch_2 = v210.maxToRenderPerBatch;
    l_maxToRenderPerBatch_2 = math.max(1, (math.min(v211.first, v226 - (l_maxToRenderPerBatch_2 == nil and 10 or l_maxToRenderPerBatch_2))));
    if v226 > 0 and v226 < l_maxToRenderPerBatch_2 + l_scrollPositionDelta_1 then
        l_scrollPositionDelta_1 = 0;
        l_console_0.warn("WARNING: maintainVisibleContentPosition failed because scrollPositionDelta was out of bounds. " .. "This could indicate that items in `data` are getting removed, items are getting added " .. "to the middle of `data`, or a different `data` array is getting passed in. Consider " .. "changing the `key` prop of the List if the `data` prop is significantly altered.");
    end;
    if l_scrollPositionDelta_1 > 0 then
        for v228 = 1, math.min(l_scrollPositionDelta_1, v226) do
            v210.getItem(l_data_4, v228).shouldResizeOnMount = true;
        end;
    end;
    return {
        first = l_maxToRenderPerBatch_2, 
        last = math.max(1, (math.min(v211.last, v226))), 
        firstItemTracked = l_compareItemData_0 or l_Object_0.None, 
        scrollPositionDelta = l_scrollPositionDelta_1
    };
end;
v55._pushCells = function(v229, v230, v231, v232, v233, v234, v235)
    local l_CellRendererComponent_0 = v229.props.CellRendererComponent;
    local l_ItemSeparatorComponent_0 = v229.props.ItemSeparatorComponent;
    local l_data_5 = v229.props.data;
    local l_getItem_2 = v229.props.getItem;
    local l_getItemCount_5 = v229.props.getItemCount;
    local l_horizontal_4 = v229.props.horizontal;
    local v242 = not v229.props.ListHeaderComponent and 0 or 1;
    local v243 = l_getItemCount_5(l_data_5);
    local v244 = nil;
    v234 = math.min(v243, v234);
    local l_v233_0 = v233;
    while l_v233_0 <= v234 do
        local v246 = l_getItem_2(l_data_5, l_v233_0);
        local v247 = v229:_keyExtractor(v246, l_v233_0);
        v229._indicesToKeys:set(l_v233_0, v247);
        if v232:has(l_v233_0 + v242) then
            table.insert(v231, #v230);
        end;
        local l_l_v233_0_0 = l_v233_0;
        table.insert(v230, v27.createElement(v35, {
            CellRendererComponent = l_CellRendererComponent_0, 
            ItemSeparatorComponent = if l_v233_0 < v243 then l_ItemSeparatorComponent_0 else nil, 
            cellKey = v247, 
            fillRateHelper = v229._fillRateHelper, 
            horizontal = l_horizontal_4, 
            index = l_v233_0, 
            inversionStyle = v235, 
            item = v246, 
            key = v247, 
            prevCellKey = v244, 
            onUpdateSeparators = v229._onUpdateSeparators, 
            onLayout = function(v249)
                return v229:_onCellLayout(v249, v247, l_l_v233_0_0);
            end, 
            onUnmount = v229._onCellUnmount, 
            parentProps = v229.props, 
            ref = function(v250)
                v229._cellRefs[tostring(v247)] = v250;
            end
        }));
        v244 = v247;
        l_v233_0 = l_v233_0 + 1;
    end;
end;
v55._isVirtualizationDisabled = function(v251)
    if v251.props.disableVirtualization ~= nil then
        return v251.props.disableVirtualization;
    else
        return false;
    end;
end;
v55._isNestedWithSameOrientation = function(v252)
    local l_context_0 = v252.context;
    local v254 = false;
    if l_context_0 ~= nil then
        local v255 = l_Boolean_0.toJSBoolean(l_context_0.horizontal);
        local l_horizontal_5 = v252.props.horizontal;
        v254 = v255 == (not (l_horizontal_5 == nil) and l_horizontal_5);
    end;
    return v254;
end;
v55._keyExtractor = function(v257, v258, v259)
    if v257.props.keyExtractor ~= nil then
        return v257.props.keyExtractor(v258, v259);
    else
        local v260 = l_keyExtractor_0(v258, v259);
        if v260 == tostring(v259) then
            v37 = true;
            if not (not (v258.type ~= nil) or not l_Boolean_0.toJSBoolean(v258.type.displayName)) then
                v38 = v258.type.displayName;
            end;
        end;
        return v260;
    end;
end;
v55.render = function(v261)
    if _G.__DEV__ then
        local v262 = v21(v261.props.contentContainerStyle);
        if v262 ~= nil and v262.flexWrap == "wrap" then
            l_console_0.warn("`flexWrap: `wrap`` is not supported with the `VirtualizedList` components." .. "Consider using `numColumns` with `FlatList` instead.");
        end;
    end;
    local l_ListEmptyComponent_0 = v261.props.ListEmptyComponent;
    local l_ListFooterComponent_0 = v261.props.ListFooterComponent;
    local l_ListHeaderComponent_0 = v261.props.ListHeaderComponent;
    local l_data_6 = v261.props.data;
    local l_horizontal_6 = v261.props.horizontal;
    local v268 = v261:_isVirtualizationDisabled();
    local v269;
    if not v261.props.inverted then
        v269 = nil;
    else
        local l_horizontal_7 = v261.props.horizontal;
        v269 = if not (not (l_horizontal_7 == nil) and l_horizontal_7) then v34.verticallyInverted else v34.horizontallyInverted;
    end;
    local v271 = {};
    local v272 = l_Set_0.new(v261.props.stickyHeaderIndices);
    local v273 = {};
    if l_ListHeaderComponent_0 then
        if v272:has(0) then
            table.insert(v273, 0);
        end;
        table.insert(v271, v27.createElement(l_VirtualizedListCellContextProvider_0, {
            cellKey = v261:_getCellKey() .. "-header", 
            key = "$header", 
            Name = "$header"
        }, v27.createElement(v19, {
            Name = "ListHeaderComponent", 
            onLayout = v261._onLayoutHeader, 
            style = v18.compose(v269, v261.props.ListHeaderComponentStyle), 
            LayoutOrder = not v261.props.inverted and -999999998 or 999999998, 
            AutomaticSize = if not l_horizontal_6 then Enum.AutomaticSize.Y else Enum.AutomaticSize.X, 
            Size = if not l_horizontal_6 then UDim2.new(1, 0, 0, 0) else UDim2.new(0, 0, 1, 0)
        }, if not v27.isValidElement(l_ListHeaderComponent_0) then v27.createElement(l_ListHeaderComponent_0, nil) else l_ListHeaderComponent_0)));
    end;
    local v274 = v261.props.getItemCount(l_data_6);
    if v274 > 0 then
        v37 = false;
        v38 = "";
        local v275 = v261._getSpacerKey(not l_horizontal_6);
        local l_initialScrollIndex_2 = v261.props.initialScrollIndex;
        local v277 = false;
        if l_initialScrollIndex_2 ~= nil then
            v277 = l_initialScrollIndex_2 ~= 1;
        end;
        local v278;
        if not v277 then
            l_initialScrollIndex_2 = v261.props.initialNumToRender;
            v278 = (l_initialScrollIndex_2 == nil and 10 or l_initialScrollIndex_2) - 1;
        else
            v278 = -1;
        end;
        local v279 = v278 + 1;
        v278 = v261.state.first;
        v277 = v261.state.last;
        l_initialScrollIndex_2 = v261.state.scrollPositionDelta;
        if l_initialScrollIndex_2 > 0 then
            v278 = v278 + l_initialScrollIndex_2;
            v277 = v277 + l_initialScrollIndex_2;
        end;
        v261:_pushCells(v271, v273, v272, 1, v279, v269);
        local v280 = math.max(v279 + 1, v278);
        if not v268 and v279 + 1 < v278 then
            local v281 = false;
            if v272.size > 0 then
                local v282 = not l_ListHeaderComponent_0 and 0 or 1;
                local v283 = v280 - 1;
                while v279 < v283 do
                    if not v272:has(v283 + v282) then
                        v283 = v283 - 1;
                    else
                        local v284 = v261._getFrameMetricsApprox(v279);
                        local v285 = v261._getFrameMetricsApprox(v283);
                        local v286 = v285.offset - v284.offset;
                        local l_initialScrollIndex_3 = v261.props.initialScrollIndex;
                        local v288 = false;
                        if l_initialScrollIndex_3 ~= nil then
                            v288 = l_initialScrollIndex_3 ~= 1;
                        end;
                        local v289 = v286 - if not v288 then v284.length else 0;
                        table.insert(v271, v27.createElement(v19, {
                            key = "$sticky_lead", 
                            Name = "$sticky_lead", 
                            style = {
                                Size = if v275 == "height" then UDim2.new(1, 0, 0, v289) else UDim2.new(0, v289, 1, 0)
                            }
                        }));
                        v261:_pushCells(v271, v273, v272, v283, v283, v269);
                        v286 = (v261._getFrameMetricsApprox(v278).offset - v285.offset) + v285.length;
                        table.insert(v271, v27.createElement(v19, {
                            key = "$sticky_trail", 
                            Name = "$sticky_trail", 
                            style = {
                                Size = if v275 == "height" then UDim2.new(1, 0, 0, v286) else UDim2.new(0, v286, 1, 0)
                            }
                        }));
                        v281 = true;
                        break;
                    end;
                end;
            end;
            if not v281 then
                local v290 = v261._getFrameMetricsApprox(v279);
                local v291 = v261._getFrameMetricsApprox(v278).offset - (v290.offset + v290.length);
                table.insert(v271, v27.createElement(v19, {
                    key = "$lead_spacer", 
                    Name = "$lead_spacer", 
                    style = {
                        Size = if v275 == "height" then UDim2.new(1, 0, 0, v291) else UDim2.new(0, v291, 1, 0)
                    }, 
                    LayoutOrder = not v261.props.inverted and -999999999 or 999999999
                }));
            end;
        end;
        v261:_pushCells(v271, v273, v272, v280, v277, v269);
        if not (v261._hasWarned.keys or not v37) then
            l_console_0.warn("VirtualizedList: missing keys for items, make sure to specify a key or id property on each " .. "item or provide a custom keyExtractor.", v38);
            v261._hasWarned.keys = true;
        end;
        if not v268 and v277 < v274 then
            local v292 = v261._getFrameMetricsApprox(v277);
            local v293 = v261._getFrameMetricsApprox(if not v261.props.getItemLayout then math.min(v274, v261._highestMeasuredFrameIndex) else v274);
            local v294 = (v293.offset + v293.length) - (v292.offset + v292.length);
            table.insert(v271, v27.createElement(v19, {
                key = "$tail_spacer", 
                Name = "$tail_spacer", 
                style = {
                    Size = if v275 == "height" then UDim2.new(1, 0, 0, v294) else UDim2.new(0, v294, 1, 0)
                }, 
                LayoutOrder = not v261.props.inverted and 999999999 or -999999999
            }));
        end;
    elseif l_ListEmptyComponent_0 then
        local v295 = if not v27.isValidElement(l_ListEmptyComponent_0) then v27.createElement(l_ListEmptyComponent_0, nil) else l_ListEmptyComponent_0;
        local l_v295_0 = v295 --[[ copy: 12 -> 28 ]];
        table.insert(v271, v27.cloneElement(v295, {
            key = "$empty", 
            Name = "$empty", 
            onLayout = function(v297)
                v261._onLayoutEmpty(v297);
                if l_v295_0.props.onLayout then
                    l_v295_0.props.onLayout(v297);
                end;
            end, 
            style = v18.compose(v269, v295.props.style)
        }));
    end;
    if l_ListFooterComponent_0 then
        table.insert(v271, v27.createElement(l_VirtualizedListCellContextProvider_0, {
            cellKey = v261:_getFooterCellKey(), 
            key = "$footer", 
            Name = "$footer"
        }, v27.createElement(v19, {
            Name = "ListFooterComponent", 
            onLayout = v261._onLayoutFooter, 
            style = v18.compose(v269, v261.props.ListFooterComponentStyle), 
            LayoutOrder = not v261.props.inverted and 999999998 or -999999998, 
            AutomaticSize = if not l_horizontal_6 then Enum.AutomaticSize.Y else Enum.AutomaticSize.X, 
            Size = if not l_horizontal_6 then UDim2.new(1, 0, 0, 0) else UDim2.new(0, 0, 1, 0)
        }, if not v27.isValidElement(l_ListFooterComponent_0) then v27.createElement(l_ListFooterComponent_0, nil) else l_ListFooterComponent_0)));
    end;
    if not v261.props.inverted or v261.props.getItemLayout then
        if not (not v261.props.inverted or not v261.props.getItemLayout) then
            local v298 = v261._getFrameMetricsApprox(v274);
            if v261:getScrollRef() ~= nil and v261:getScrollRef()._nativeRef.current ~= nil then
                local l_current_1 = v261:getScrollRef()._nativeRef.current;
                local l_CanvasPosition_0 = l_current_1.CanvasPosition;
                local l__invertedCanvasLength_0 = v261._invertedCanvasLength;
                v261._invertedCanvasLength = v298.offset + v298.length;
                if l__invertedCanvasLength_0 ~= v261._invertedCanvasLength then
                    local v302 = v261._invertedCanvasLength - l__invertedCanvasLength_0;
                    l_current_1.CanvasPosition = if not v261.props.horizontal then l_CanvasPosition_0 + Vector2.new(0, v302) else l_CanvasPosition_0 + Vector2.new(v302, 0);
                end;
            else
                v261._invertedCanvasLength = v298.offset + v298.length;
            end;
        end;
    elseif v261:getScrollRef() ~= nil and v261:getScrollRef()._nativeRef.current ~= nil then
        local l_current_2 = v261:getScrollRef()._nativeRef.current;
        local l_CanvasPosition_1 = l_current_2.CanvasPosition;
        local v305 = v261._getFrameMetricsApprox((math.min(v261._highestMeasuredFrameIndex, v274)));
        local v306 = v305.offset + v305.length;
        local v307 = if not v261.props.optimizeInvertedCanvasResize then v306 ~= v261._invertedCanvasLength - v261._footerLength else v261._invertedCanvasLength - v261._footerLength < v306;
        if v274 <= v261._highestMeasuredFrameIndex and v306 ~= v261._invertedCanvasLength - v261._footerLength then
            local v308 = (v306 + v261._footerLength) - v261._invertedCanvasLength;
            v261._invertedCanvasLength = v306 + v261._footerLength;
            local v309 = if not v261.props.horizontal then UDim2.new(1, 0, 0, v261._invertedCanvasLength) else UDim2.new(0, v261._invertedCanvasLength, 1, 0);
            l_current_2.CanvasSize = v309;
            v261._canvasPosition = if not v261.props.horizontal then Vector2.new(l_CanvasPosition_1.X, l_CanvasPosition_1.Y + v308) else Vector2.new(l_CanvasPosition_1.X + v308, l_CanvasPosition_1.Y);
            v261._canvasSize = v309;
        elseif v307 and v261.state.scrollPositionDelta == 0 then
            local l__invertedCanvasLength_1 = v261._invertedCanvasLength;
            local l_visibleLength_1 = v261._scrollMetrics.visibleLength;
            local l_windowSize_2 = v261.props.windowSize;
            local v313 = (v305.offset + v261._scrollMetrics.visibleLength) + (l_visibleLength_1 * (l_windowSize_2 == nil and 21 or l_windowSize_2)) * 0.5;
            l_visibleLength_1 = v313 - l__invertedCanvasLength_1;
            v261._invertedCanvasLength = v313;
            local v314 = if not v261.props.horizontal then UDim2.new(1, 0, 0, v261._invertedCanvasLength) else UDim2.new(0, v261._invertedCanvasLength, 1, 0);
            l_current_2.CanvasSize = v314;
            l_current_2.CanvasPosition = if not v261.props.horizontal then Vector2.new(l_CanvasPosition_1.X, l_CanvasPosition_1.Y + l_visibleLength_1) else Vector2.new(l_CanvasPosition_1.X + l_visibleLength_1, l_CanvasPosition_1.Y);
            v261._canvasPosition = l_current_2.CanvasPosition;
            v261._canvasSize = v314;
        end;
    else
        v261._canvasPosition = if not v261.props.horizontal then Vector2.new(0, v261._invertedCanvasLength) else Vector2.new(v261._invertedCanvasLength, 0);
        v261._canvasSize = if not v261.props.horizontal then UDim2.new(1, 0, 0, v261._invertedCanvasLength) else UDim2.new(0, v261._invertedCanvasLength, 1, 0);
    end;
    local l_assign_0 = l_Object_0.assign;
    local v316 = table.clone(v261.props);
    local v317 = {
        onContentSizeChange = v261._onContentSizeChange, 
        onLayout = v261._onLayout, 
        onScroll = v261._onScroll, 
        onScrollBeginDrag = v261._onScrollBeginDrag, 
        onScrollEndDrag = v261._onScrollEndDrag, 
        onMomentumScrollBegin = v261._onMomentumScrollBegin, 
        onMomentumScrollEnd = v261._onMomentumScrollEnd
    };
    local l_scrollEventThrottle_0 = v261.props.scrollEventThrottle;
    v317.scrollEventThrottle = l_scrollEventThrottle_0 == nil and 50 or l_scrollEventThrottle_0;
    v317.invertStickyHeaders = if v261.props.invertStickyHeaders ~= nil then v261.props.invertStickyHeaders else v261.props.inverted;
    v317.stickyHeaderIndices = v273;
    v317.style = v261.props.style;
    v317.layoutStyle = v269 or nil;
    v317.AutomaticCanvasSize = if not v261.props.inverted or v261.props.getItemLayout then nil else Enum.AutomaticSize.None;
    v317.CanvasSize = if not v261.props.inverted then nil else v261._canvasSize;
    v317.CanvasPosition = if not v261.props.inverted then nil else v261._canvasPosition;
    l_assign_0 = l_assign_0(v316, v317);
    v261._hasMore = v261.state.last < v261.props.getItemCount(v261.props.data);
    v316 = v27.createElement;
    v317 = l_VirtualizedListContextProvider_0;
    local v319 = {};
    l_scrollEventThrottle_0 = {
        cellKey = nil, 
        getScrollMetrics = v261._getScrollMetrics
    };
    local l_horizontal_8 = v261.props.horizontal;
    l_scrollEventThrottle_0.horizontal = not (l_horizontal_8 == nil) and l_horizontal_8;
    l_scrollEventThrottle_0.getOutermostParentListRef = v261._getOutermostParentListRef;
    l_scrollEventThrottle_0.getNestedChildState = v261._getNestedChildState;
    l_scrollEventThrottle_0.registerAsNestedChild = v261._registerAsNestedChild;
    l_scrollEventThrottle_0.unregisterAsNestedChild = v261._unregisterAsNestedChild;
    l_scrollEventThrottle_0.debugInfo = v261:_getDebugInfo();
    v319.value = l_scrollEventThrottle_0;
    v316 = v316(v317, v319, v27.cloneElement((if not v261.props.renderScrollComponent then v261._defaultRenderScrollComponent else v261.props.renderScrollComponent)(l_assign_0), {
        ref = v261._captureScrollRef
    }, v271));
    v317 = v316;
    if _G.__DEV__ then
        v317 = v27.createElement(v17.Context.Consumer, nil, function(v321)
            if v321 ~= nil then
                local v322 = not v321.horizontal;
                local l_horizontal_9 = v261.props.horizontal;
                if not (not (v322 == not (not (l_horizontal_9 == nil) and l_horizontal_9)) or v261._hasWarned.nesting) and v261.context == nil then
                    l_console_0.error("VirtualizedLists should never be nested inside plain ScrollViews with the same " .. "orientation because it can break windowing and other functionality - use another " .. "VirtualizedList-backed container instead.");
                    v261._hasWarned.nesting = true;
                end;
            end;
            return v316;
        end);
    end;
    if not v261.props.debug then
        return v317;
    else
        return v27.createElement(v19, {
            style = v34.debug, 
            Name = "debug"
        }, v317, v261:_renderDebugOverlay());
    end;
end;
v55.componentDidUpdate = function(v324, v325)
    local l_data_7 = v324.props.data;
    local l_extraData_0 = v324.props.extraData;
    if not (l_data_7 == v325.data) or l_extraData_0 ~= v325.extraData then
        l_Array_0.forEach(v324._viewabilityTuples, function(v328)
            v328.viewabilityHelper:resetViewableIndices();
        end);
    end;
    local l__hiPriInProgress_0 = v324._hiPriInProgress;
    v324:_scheduleCellsToRenderUpdate();
    if l__hiPriInProgress_0 then
        v324._hiPriInProgress = false;
    end;
end;
v55._computeBlankness = function(v330)
    v330._fillRateHelper:computeBlankness(v330.props, v330.state, v330._scrollMetrics);
end;
v55._onCellLayout = function(v331, v332, v333, v334)
    local v335 = if not not v331:getScrollRef() and v331:getScrollRef()._nativeRef.current then v331:getScrollRef()._nativeRef.current else v332:FindFirstAncestorOfClass("ScrollingFrame");
    if v335 == nil then
        if _G.__DEV__ then
            l_console_0.warn("CellLayout failed for index " .. tostring(v334) .. ". this may cause layout issues");
        end;
        return ;
    else
        local l_AbsolutePosition_0 = v335.AbsolutePosition;
        local l_CanvasPosition_2 = v335.CanvasPosition;
        local l_AbsoluteCanvasSize_2 = v335.AbsoluteCanvasSize;
        local l_AbsoluteSize_2 = v332.AbsoluteSize;
        local l_AbsolutePosition_1 = v332.AbsolutePosition;
        local v341 = {
            width = v332.AbsoluteSize.X, 
            height = v332.AbsoluteSize.Y, 
            x = if not not v331.props.inverted and v331.props.horizontal then (((l_AbsoluteCanvasSize_2.X - l_CanvasPosition_2.X) - l_AbsolutePosition_1.X) - l_AbsoluteSize_2.X) + l_AbsolutePosition_0.X else (l_AbsolutePosition_1.X - l_AbsolutePosition_0.X) + l_CanvasPosition_2.X, 
            y = if not v331.props.inverted or v331.props.horizontal then (l_AbsolutePosition_1.Y - l_AbsolutePosition_0.Y) + l_CanvasPosition_2.Y else (((l_AbsoluteCanvasSize_2.Y - l_CanvasPosition_2.Y) - l_AbsolutePosition_1.Y) - l_AbsoluteSize_2.Y) + l_AbsolutePosition_0.Y
        };
        local v342 = {
            offset = v331:_selectOffset(v341), 
            length = v331:_selectLength(v341), 
            index = v334, 
            inLayout = true
        };
        local v343 = v331._frames[v333];
        if not ((v343 and math.abs(v342.offset - v343.offset) <= 1) and v342.length == v343.length) or v334 ~= v343.index then
            local v344 = v331.props.getItem(v331.props.data, v334);
            if not (not (not (v343 or v331.props.getItemLayout) and typeof(v344) == "table") or not v344.shouldResizeOnMount) then
                v331:recalculateFrames(v331:_selectLength(v341), v333, v334);
            end;
            if not (not v343 or v331.props.getItemLayout) and math.abs(v342.length - v343.length) >= 1 then
                if not v331.props.UNSTABLE_forceSiblingLayoutUpdate then
                    l_Array_0.forEach(l_Object_0.keys(v331._frames), function(v345)
                        if v331._frames[v345].index <= v334 then
                            return ;
                        else
                            local v346 = if not v331._cellRefs[v345] then nil else v331._cellRefs[v345]:getRef();
                            if not (not v346 or not v346.current) then
                                v331:_onCellLayout(v346.current, v345, v331._frames[v345].index);
                            end;
                            return ;
                        end;
                    end);
                else
                    local l_v332_FirstAncestorOfClass_0 = v332:FindFirstAncestorOfClass("Frame");
                    local v348 = if not l_v332_FirstAncestorOfClass_0 then {} else l_v332_FirstAncestorOfClass_0:GetChildren();
                    local v349 = v331.props.getItemCount(v331.props.data);
                    l_Array_0.forEach(v348, function(v350)
                        if v350:IsA("GuiObject") then
                            local v351 = math.abs(v350.LayoutOrder);
                            if not (v351 > v334) or v349 < v351 then
                                return ;
                            else
                                local v352 = v331.props.getItem(v331.props.data, v351);
                                if v352 == nil then
                                    return ;
                                else
                                    v331:_onCellLayout(v350, v331:_keyExtractor(v352, v351), v351);
                                    return ;
                                end;
                            end;
                        else
                            return ;
                        end;
                    end);
                end;
            end;
            v331._totalCellLength = v331._totalCellLength + (v342.length - (not l_Boolean_0.toJSBoolean(v343) and 0 or v343.length));
            v331._totalCellsMeasured = v331._totalCellsMeasured + (not l_Boolean_0.toJSBoolean(v343) and 1 or 0);
            v331._averageCellLength = v331._totalCellLength / v331._totalCellsMeasured;
            v331._frames[v333] = v342;
            v331._highestMeasuredFrameIndex = math.max(v331._highestMeasuredFrameIndex, v334);
            v331:_scheduleCellsToRenderUpdate();
            if (not (not v331.props.inverted or v331.props.getItemLayout) and v331.state.last == v331.props.getItemCount(v331.props.data)) and v331._highestMeasuredFrameIndex == v331.state.last then
                v331:forceUpdate();
            end;
        else
            v331._frames[v333].inLayout = true;
        end;
        v331:_triggerRemeasureForChildListsInCell(v333);
        v331:_computeBlankness();
        v331:_updateViewableItems(v331.props.data);
        return ;
    end;
end;
v55._triggerRemeasureForChildListsInCell = function(v353, v354)
    local v355 = v353._cellKeysToChildListKeys:get(v354);
    if v355 then
        v355:forEach(function(v356)
            local v357 = v353._nestedChildLists:get(v356);
            if not (not v357 or not v357.ref) then
                v357.ref:measureLayoutRelativeToContainingList();
            end;
        end);
    end;
end;
v55.recalculateFrames = function(v358, v359, v360, v361)
    l_Array_0.forEach(l_Object_0.keys(v358._frames), function(v362)
        if v362 == v360 and v361 <= v358._frames[v362].index then
            return ;
        else
            local v363 = v358._frames[v362];
            v363.index = v363.index + 1;
            v363 = v358._frames[v362];
            v363.offset = v363.offset + v359;
            return ;
        end;
    end);
    v358._highestMeasuredFrameIndex = v358._highestMeasuredFrameIndex + 1;
end;
v55.measureLayoutRelativeToContainingList = function(v364)
    local l_status_0, l_result_0 = pcall(function()
        if l_Boolean_0.toJSBoolean(v364._scrollRef) then
            v364._scrollRef:measureLayout(v364.context.getOutermostParentListRef():getScrollRef(), function(v365, v366, v367, v368)
                v364._offsetFromParentVirtualizedList = v364:_selectOffset({
                    x = v365, 
                    y = v366
                });
                v364._scrollMetrics.contentLength = v364:_selectLength({
                    width = v367, 
                    height = v368
                });
                local v369 = v364._convertParentScrollMetrics(v364.context.getScrollMetrics());
                local v370 = true;
                if v364._scrollMetrics.visibleLength == v369.visibleLength then
                    v370 = v364._scrollMetrics.offset ~= v369.offset;
                end;
                if v370 then
                    v364._scrollMetrics.visibleLength = v369.visibleLength;
                    v364._scrollMetrics.offset = v369.offset;
                    v364._cellKeysToChildListKeys:forEach(function(v371)
                        if v371 then
                            v371:forEach(function(v372)
                                local v373 = v364._nestedChildLists:get(v372);
                                if not (not v373 or not v373.ref) then
                                    v373.ref:measureLayoutRelativeToContainingList();
                                end;
                            end);
                        end;
                    end);
                end;
            end, function(_)
                l_console_0.warn("VirtualizedList: Encountered an error while measuring a list's" .. " offset from its containing VirtualizedList.");
            end);
            return nil;
        else
            return nil;
        end;
    end);
    if not l_status_0 then
        l_console_0.warn("measureLayoutRelativeToContainingList threw an error", l_result_0.stack);
    end;
end;
v55._getFooterCellKey = function(v377)
    return v377:_getCellKey() .. "-footer";
end;
v55._renderDebugOverlay = function(v378)
    local v379 = v378._scrollMetrics.visibleLength / (not l_Boolean_0.toJSBoolean(v378._scrollMetrics.contentLength) and 1 or v378._scrollMetrics.contentLength);
    local v380 = {};
    local v381 = v378.props.getItemCount(v378.props.data);
    local v382 = 1;
    while v382 <= v381 do
        local v383 = v378._getFrameMetricsApprox(v382);
        if l_Boolean_0.toJSBoolean(v383.inLayout) then
            table.insert(v380, v383);
        end;
        v382 = v382 + 1;
    end;
    local l_offset_2 = v378._getFrameMetricsApprox(v378.state.first).offset;
    local v385 = v378._getFrameMetricsApprox(v378.state.last);
    return v27.createElement(v19, {
        style = {
            v34.debugOverlayBase, 
            v34.debugOverlay
        }
    }, l_Array_0.map(v380, function(v386, v387)
        return v27.createElement(v19, {
            key = "f" .. tostring(v387), 
            Name = "f" .. tostring(v387), 
            style = {
                v34.debugOverlayBase, 
                v34.debugOverlayFrame, 
                {
                    top = v386.offset * v379, 
                    height = v386.length * v379
                }
            }
        });
    end), v27.createElement(v19, {
        Name = "DebugOverlayLast", 
        style = {
            v34.debugOverlayBase, 
            v34.debugOverlayFrameLast, 
            {
                top = l_offset_2 * v379, 
                height = ((v385.offset + v385.length) - l_offset_2) * v379
            }
        }
    }), v27.createElement(v19, {
        Name = "DebugOverlayVis", 
        style = {
            v34.debugOverlayBase, 
            v34.debugOverlayFrameVis, 
            {
                top = v378._scrollMetrics.offset * v379, 
                height = v378._scrollMetrics.visibleLength * v379
            }
        }
    }));
end;
v55._selectLength = function(v388, v389)
    local l_horizontal_10 = v388.props.horizontal;
    if not (l_horizontal_10 == nil) and l_horizontal_10 then
        return v389.width;
    else
        return v389.height;
    end;
end;
v55._selectOffset = function(v391, v392)
    local l_horizontal_11 = v391.props.horizontal;
    if not (l_horizontal_11 == nil) and l_horizontal_11 then
        return v392.x;
    else
        return v392.y;
    end;
end;
v55._maybeCallOnEndReached = function(v394)
    local l_data_8 = v394.props.data;
    local l_getItemCount_6 = v394.props.getItemCount;
    local l_onEndReached_0 = v394.props.onEndReached;
    local l_onEndReachedThreshold_1 = v394.props.onEndReachedThreshold;
    local l_contentLength_1 = v394._scrollMetrics.contentLength;
    local l_visibleLength_2 = v394._scrollMetrics.visibleLength;
    local v401 = (l_contentLength_1 - l_visibleLength_2) - v394._scrollMetrics.offset;
    local v402 = if l_onEndReachedThreshold_1 ~= nil then l_onEndReachedThreshold_1 * l_visibleLength_2 else 2;
    if ((l_onEndReached_0 and v394.state.last == l_getItemCount_6(l_data_8)) and v401 < v402) and v394._scrollMetrics.contentLength ~= v394._sentEndForContentLength then
        v394._sentEndForContentLength = v394._scrollMetrics.contentLength;
        l_onEndReached_0({
            distanceFromEnd = v401
        });
        return ;
    else
        if v402 < v401 then
            v394._sentEndForContentLength = 0;
        end;
        return ;
    end;
end;
v55._scheduleCellsToRenderUpdate = function(v403)
    local l_first_1 = v403.state.first;
    local l_last_1 = v403.state.last;
    if v403.state.scrollPositionDelta > 0 then
        return ;
    else
        local l_offset_3 = v403._scrollMetrics.offset;
        local l_visibleLength_3 = v403._scrollMetrics.visibleLength;
        local l_velocity_0 = v403._scrollMetrics.velocity;
        local v409 = v403.props.getItemCount(v403.props.data);
        local v410 = false;
        local l_onEndReachedThreshold_2 = v403.props.onEndReachedThreshold;
        l_onEndReachedThreshold_2 = ((l_onEndReachedThreshold_2 == nil and 2 or l_onEndReachedThreshold_2) * l_visibleLength_3) / 2;
        if l_first_1 > 1 then
            local v412 = l_offset_3 - v403._getFrameMetricsApprox(l_first_1).offset;
            local l_v410_0 = v410;
            if not l_v410_0 then
                l_v410_0 = true;
                if v412 >= 0 then
                    l_v410_0 = false;
                    if l_velocity_0 < -2 then
                        l_v410_0 = v412 < l_onEndReachedThreshold_2;
                    end;
                end;
            end;
            v410 = l_v410_0;
        end;
        if l_last_1 < v409 then
            local v414 = v403._getFrameMetricsApprox(l_last_1).offset - (l_offset_3 + l_visibleLength_3);
            local l_v410_1 = v410;
            if not l_v410_1 then
                l_v410_1 = true;
                if v414 >= 0 then
                    l_v410_1 = l_velocity_0 > 2;
                end;
            end;
            v410 = l_v410_1;
        end;
        if (not v410 or not l_Boolean_0.toJSBoolean(v403._averageCellLength) and not v403.props.getItemLayout) or v403._hiPriInProgress then
            v403._updateCellsToRenderBatcher:schedule();
            return ;
        else
            v403._hiPriInProgress = true;
            v403._updateCellsToRenderBatcher:dispose({
                abort = true
            });
            v403._updateCellsToRender();
            return ;
        end;
    end;
end;
v55._updateViewableItems = function(v416, v417)
    local l_getItemCount_7 = v416.props.getItemCount;
    l_Array_0.forEach(v416._viewabilityTuples, function(v419)
        v419.viewabilityHelper:onUpdate(l_getItemCount_7(v417), v416._scrollMetrics.offset, v416._scrollMetrics.visibleLength, v416._getFrameMetrics, v416._createViewToken, v419.onViewableItemsChanged, v416.state);
    end);
end;
v35 = v27.Component:extend("CellRenderer");
v35.init = function(v420, v421)
    v420.props = v421;
    v420.state = {
        separatorProps = {
            highlighted = false, 
            leadingItem = v420.props.item
        }
    };
    v420._separators = {
        highlight = function()
            v420.props.onUpdateSeparators({
                v420.props.cellKey, 
                v420.props.prevCellKey
            }, {
                highlighted = true
            });
        end, 
        unhighlight = function()
            v420.props.onUpdateSeparators({
                v420.props.cellKey, 
                v420.props.prevCellKey
            }, {
                highlighted = false
            });
        end, 
        updateProps = function(v422, v423)
            v420.props.onUpdateSeparators({
                if v422 == "leading" then v420.props.prevCellKey else v420.props.cellKey
            }, v423);
        end
    };
    v420._nativeRef = v27.createRef();
end;
v35.getDerivedStateFromProps = function(v424, v425)
    return {
        separatorProps = l_Object_0.assign({}, v425.separatorProps, {
            leadingItem = v424.item
        })
    };
end;
v35.updateSeparatorProps = function(v426, v427)
    v426:setState(function(v428)
        return {
            separatorProps = l_Object_0.assign({}, v428.separatorProps, v427)
        };
    end);
end;
v35.componentWillUnmount = function(v429)
    v429.props.onUnmount(v429.props.cellKey);
end;
v35._renderElement = function(v430, v431, v432, v433, v434)
    if not (not l_Boolean_0.toJSBoolean(v431) or not l_Boolean_0.toJSBoolean(v432)) then
        l_console_0.warn("VirtualizedList: Both ListItemComponent and renderItem props are present. ListItemComponent will take" .. " precedence over renderItem.");
    end;
    if not l_Boolean_0.toJSBoolean(v432) then
        if not l_Boolean_0.toJSBoolean(v431) then
            v23(false, "VirtualizedList: Either ListItemComponent or renderItem props are required but none were found.");
            return nil;
        else
            return v431({
                item = v433, 
                index = v434, 
                separators = v430._separators
            });
        end;
    else
        return v27.createElement(v432, {
            item = v433, 
            index = v434, 
            separators = v430._separators
        });
    end;
end;
v35.getRef = function(v435)
    return v435._nativeRef;
end;
v35.render = function(v436)
    local l_CellRendererComponent_1 = v436.props.CellRendererComponent;
    local l_ItemSeparatorComponent_1 = v436.props.ItemSeparatorComponent;
    local l_fillRateHelper_0 = v436.props.fillRateHelper;
    local l_horizontal_12 = v436.props.horizontal;
    local l_item_1 = v436.props.item;
    local l_index_1 = v436.props.index;
    local l_inversionStyle_0 = v436.props.inversionStyle;
    local l_parentProps_0 = v436.props.parentProps;
    local l_renderItem_0 = l_parentProps_0.renderItem;
    local l_getItemLayout_2 = l_parentProps_0.getItemLayout;
    local v447 = v436:_renderElement(l_renderItem_0, l_parentProps_0.ListItemComponent, l_item_1, l_index_1);
    local v448 = if (not l_getItemLayout_2 or l_parentProps_0.debug) or l_fillRateHelper_0:enabled() then v436.props.onLayout else nil;
    local v449 = l_ItemSeparatorComponent_1 and v27.createElement(l_ItemSeparatorComponent_1, l_Object_0.assign(v436.state.separatorProps, {
        LayoutOrder = not l_inversionStyle_0 and 1 or -1
    }));
    local v450 = if not l_Boolean_0.toJSBoolean(l_inversionStyle_0) then if l_horizontal_12 then {
        v34.row, 
        l_inversionStyle_0
    } else l_inversionStyle_0 else if l_horizontal_12 then {
        v34.rowReverse, 
        l_inversionStyle_0
    } else {
        v34.columnReverse, 
        l_inversionStyle_0
    };
    return v27.createElement(l_VirtualizedListCellContextProvider_0, {
        cellKey = v436.props.cellKey
    }, if l_Boolean_0.toJSBoolean(l_CellRendererComponent_1) then v27.createElement(l_CellRendererComponent_1, l_Object_0.assign(table.clone(v436.props), {
        style = v450, 
        onLayout = v448, 
        nativeRef = v436._nativeRef
    }), if not v449 then nil else v27.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        FillDirection = if not l_horizontal_12 then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal
    }), v447, v449) else v27.createElement(v19, {
        Name = "CellRendererView", 
        style = v450, 
        onLayout = v448, 
        LayoutOrder = if not l_inversionStyle_0 then l_index_1 else -l_index_1, 
        AutomaticSize = if not l_horizontal_12 then Enum.AutomaticSize.Y else Enum.AutomaticSize.X, 
        nativeRef = v436._nativeRef
    }, if not v449 then nil else v27.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        FillDirection = if not l_horizontal_12 then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal
    }), v447, v449));
end;
v33 = function(v451)
    local v452 = "VirtualizedList trace:\n" .. ("  Child (%s):\n"):format(not l_Boolean_0.toJSBoolean(v451.horizontal) and "vertical" or "horizontal") .. ("    listKey: %s\n"):format(v451.key) .. ("    cellKey: %s"):format(v451.cellKey);
    local l_parentDebugInfo_0 = v451.parentDebugInfo;
    while l_parentDebugInfo_0 do
        v452 = v452 .. ("\n  Parent (%s):\n"):format(not l_parentDebugInfo_0.horizontal and "vertical" or "horizontal") .. ("    listKey: %s\n"):format(l_parentDebugInfo_0.listKey) .. ("    cellKey: %s"):format(l_parentDebugInfo_0.cellKey);
        l_parentDebugInfo_0 = l_parentDebugInfo_0.parent;
    end;
    return v452;
end;
v34 = v18.create({
    verticallyInverted = {
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Bottom
    }, 
    horizontallyInverted = {
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, 
    row = {
        AutomaticSize = Enum.AutomaticSize.X, 
        Size = UDim2.new(0, 0, 1, 0)
    }, 
    column = {
        AutomaticSize = Enum.AutomaticSize.Y
    }, 
    rowReverse = {
        flexDirection = "row-reverse", 
        AutomaticSize = Enum.AutomaticSize.X, 
        Size = UDim2.new(0, 0, 1, 0)
    }, 
    columnReverse = {
        flexDirection = "column-reverse", 
        AutomaticSize = Enum.AutomaticSize.Y
    }, 
    debug = {
        flex = 1
    }, 
    debugOverlayBase = {
        position = "absolute", 
        top = 0, 
        right = 0
    }, 
    debugOverlay = {
        bottom = 0, 
        width = 20, 
        borderColor = "blue", 
        borderWidth = 1
    }, 
    debugOverlayFrame = {
        left = 0, 
        backgroundColor = "orange"
    }, 
    debugOverlayFrameLast = {
        left = 0, 
        borderColor = "green", 
        borderWidth = 2
    }, 
    debugOverlayFrameVis = {
        left = 0, 
        borderColor = "red", 
        borderWidth = 2
    }
});
return v55;
