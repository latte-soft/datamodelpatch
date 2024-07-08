local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Map_0 = v2.Map;
local l_Object_0 = v2.Object;
local l_console_0 = v2.console;
local l_setTimeout_0 = v2.setTimeout;
local l_HttpService_0 = game:GetService("HttpService");
local v13 = {
    Value = {
        new = function(...)
            return {
                setOffset = function(_, _)
                end, 
                interpolate = function(_, ...)
                end
            };
        end
    }, 
    attachNativeEvent = function(...)
        return nil;
    end
};
local v14 = {
    get = function(...)
        return {
            height = 100
        };
    end
};
local v15 = nil;
v15 = {
    OS = "roblox", 
    select = function(v16)
        return v16[v15.OS];
    end
};
local v17 = require(l_Parent_1.React);
local v18 = {
    findNodeHandle = function(...)
        return nil;
    end
};
local v19 = require(script.Parent.ScrollViewStickyHeader);
local v20 = require(l_Parent_0.StyleSheet.StyleSheet);
local v21 = require(script.Parent.Parent.View.View);
local v22 = {
    measureLayout = function(...)
    end
};
local v23 = {
    addListener = function(...)
        return nil;
    end
};
local v24 = {
    beginScroll = function(...)
        warn("FrameRateLogger.beginScroll not implemented");
    end, 
    endScroll = function(...)
        warn("FrameRateLogger.endScroll not implemented");
    end
};
local v25 = {
    blurTextInput = function(...)
        warn("TextInputState.blurTextInput not implemented");
    end, 
    currentlyFocusedInput = function(...)
        warn("TextInputState.currentlyFocusedInput not implemented");
        return nil;
    end, 
    isTextInput = function(...)
        warn("TextInputState.isTextInput not implemented");
        return nil;
    end
};
local function _()
    warn("dismissKeyboard not implemented");
end;
local function _(v27)
    return v27;
end;
local v29 = require(l_Parent_0.jsUtils.invariant);
local v30 = require(script.Parent.processDecelerationRate);
local function _(v31)
    return {
        outer = v31, 
        inner = v31
    };
end;
local v33 = require(script.Parent.Parent.Parent.Utilities.setAndForwardRef);
local v34 = require(script.Parent.ScrollViewContext);
local l_default_0 = v34.default;
local l_HORIZONTAL_0 = v34.HORIZONTAL;
local l_VERTICAL_0 = v34.VERTICAL;
local _ = require(script.Parent.ScrollViewStickyHeader);
local l_default_1 = require(script.Parent.ScrollViewCommands).default;
local v40 = require(script.Parent.ScrollContentViewNativeComponent);
local v41 = require(script.Parent.ScrollViewNativeComponent);
local v42 = nil;
local v43 = nil;
local v44 = nil;
local v45 = if v15.OS == "android" then {
    NativeHorizontalScrollViewTuple = {
        "Frame", 
        "Frame"
    }, 
    NativeVerticalScrollViewTuple = {
        v41, 
        v21
    }
} else {
    NativeHorizontalScrollViewTuple = {
        v41, 
        v40
    }, 
    NativeVerticalScrollViewTuple = {
        v41, 
        v40
    }
};
v43 = v45.NativeHorizontalScrollViewTuple;
v44 = v45.NativeVerticalScrollViewTuple;
local v46 = v17.Component:extend("ScrollView");
v46.Context = l_default_0;
v46.init = function(v47, v48)
    v47.props = v48;
    v47._scrollAnimatedValueAttachment = nil;
    v47._stickyHeaderRefs = l_Map_0.new();
    v47._headerLayoutYs = l_Map_0.new();
    v47._keyboardWillOpenTo = nil;
    v47._additionalScrollOffset = 0;
    v47._isTouching = false;
    v47._lastMomentumScrollBeginTime = 0;
    v47._lastMomentumScrollEndTime = 0;
    v47._observedScrollSinceBecomingResponder = false;
    v47._becameResponderWhileAnimating = false;
    v47._preventNegativeScrollOffset = nil;
    v47._animated = nil;
    v47._subscriptionKeyboardWillShow = nil;
    v47._subscriptionKeyboardWillHide = nil;
    v47._subscriptionKeyboardDidShow = nil;
    v47._subscriptionKeyboardDidHide = nil;
    v47.state = {
        layoutHeight = nil
    };
    v47._listLayoutRef = v17.createRef();
    v47._setNativeRef = v33({
        getForwardedRef = function()
            return v47.props.scrollViewRef;
        end, 
        setLocalRef = function(v49)
            v47._scrollViewRef = v49;
            if v49 ~= nil then
                v49.getScrollResponder = v47.getScrollResponder;
                v49.getScrollableNode = v47.getScrollableNode;
                v49.getInnerViewNode = v47.getInnerViewNode;
                v49.getInnerViewRef = v47.getInnerViewRef;
                v49.getNativeScrollRef = v47.getNativeScrollRef;
                v49.scrollTo = v47.scrollTo;
                v49.scrollToEnd = v47.scrollToEnd;
                v49.flashScrollIndicators = v47.flashScrollIndicators;
                v49.scrollResponderZoomTo = v47.scrollResponderZoomTo;
                v49.scrollResponderScrollNativeHandleToKeyboard = v47.scrollResponderScrollNativeHandleToKeyboard;
            end;
            return nil;
        end
    });
    v47.getScrollResponder = function()
        return v47;
    end;
    v47.getScrollableNode = function()
        return v18:findNodeHandle(v47._scrollViewRef);
    end;
    v47.getInnerViewNode = function()
        return v18:findNodeHandle(v47._innerViewRef);
    end;
    v47.getInnerViewRef = function()
        return v47._innerViewRef;
    end;
    v47.getNativeScrollRef = function()
        return v47._scrollViewRef;
    end;
    v47.scrollTo = function(v50)
        local v51 = nil;
        local v52 = nil;
        local v53 = nil;
        if v50 ~= nil then
            v52 = v50.y;
            v51 = v50.x;
            v53 = v50.animated;
        end;
        if not (v47._scrollViewRef ~= nil) or v47._scrollViewRef._nativeRef.current == nil then
            return ;
        else
            l_default_1.scrollTo(v47._scrollViewRef, not not l_Boolean_0.toJSBoolean(v51) and v51 or 0, not not l_Boolean_0.toJSBoolean(v52) and v52 or 0, not not v53);
            return ;
        end;
    end;
    v47.scrollToEnd = function(v54)
        local v55 = false;
        if v54 ~= nil then
            v55 = v54.animated;
        end;
        local v56 = v55 ~= false;
        if v47._scrollViewRef == nil then
            return ;
        else
            l_default_1.scrollToEnd(v47._scrollViewRef, v56);
            return ;
        end;
    end;
    v47.flashScrollIndicators = function()
        if v47._scrollViewRef == nil then
            return ;
        else
            l_default_1.flashScrollIndicators(v47._scrollViewRef);
            return ;
        end;
    end;
    v47.scrollResponderScrollNativeHandleToKeyboard = function(v57, v58, v59)
        v47._additionalScrollOffset = not not l_Boolean_0.toJSBoolean(v58) and v58 or 0;
        v47._preventNegativeScrollOffset = l_Boolean_0.toJSBoolean(v59);
        if v47._innerViewRef == nil then
            return ;
        elseif typeof(v57) == "number" then
            v22:measureLayout(v57, v18:findNodeHandle(v47), v47._textInputFocusError, v47._inputMeasureAndScrollToKeyboard);
            return ;
        else
            v57:measureLayout(v47._innerViewRef, v47._inputMeasureAndScrollToKeyboard, v47._textInputFocusError);
            return ;
        end;
    end;
    v47.scrollResponderZoomTo = function(v60, v61)
        v29(v15.OS == "ios", "zoomToRect is not implemented");
        if l_Array_0.indexOf(l_Object_0.keys(v60), "animated") ~= -1 then
            v47._animated = v60.animated;
            v60.animated = nil;
        elseif typeof(v61) ~= "nil" then
            l_console_0.warn("`scrollResponderZoomTo` `animated` argument is deprecated. Use `options.animated` instead");
        end;
        if v47._scrollViewRef == nil then
            return ;
        else
            l_default_1.zoomToRect(v47._scrollViewRef, v60, v61 ~= false);
            return ;
        end;
    end;
    v47._inputMeasureAndScrollToKeyboard = function(_, v63, _, v65)
        local l_height_0 = v14:get("window").height;
        local function v68()
            if v47._keyboardWillOpenTo ~= nil then
                l_height_0 = v47._keyboardWillOpenTo.endCoordinates.screenY;
            end;
            local v67 = ((v63 - l_height_0) + v65) + v47._additionalScrollOffset;
            if v47._preventNegativeScrollOffset == true then
                v67 = math.max(0, v67);
            end;
            v47.scrollTo({
                x = 0, 
                y = v67, 
                animated = true
            });
            v47._additionalScrollOffset = 0;
            v47._preventNegativeScrollOffset = false;
        end;
        if v47._keyboardWillOpenTo == nil then
            l_setTimeout_0(function()
                v68();
            end, 0);
        else
            v68();
        end;
    end;
    v47._handleScroll = function(v69)
        if (not (not _G.__DEV__ or not v47.props.onScroll) and v47.props.scrollEventThrottle == nil) and v15.OS == "ios" then
            l_console_0.log("You specified `onScroll` on a <ScrollView> but not " .. "`scrollEventThrottle`. You will only receive one event. " .. "Using `16` you get all the events but be aware that it may " .. "cause frame drops, use a bigger number if you don't need as " .. "much precision.");
        end;
        v47._observedScrollSinceBecomingResponder = true;
        if v47.props.onScroll then
            v47.props.onScroll(v69);
        end;
    end;
    v47._handleLayout = function(v70)
        if v47.props.invertStickyHeaders == true then
            v47:setState({
                layoutHeight = v70.AbsoluteWindowSize.Y
            });
        end;
        if v47.props.onLayout then
            v47.props.onLayout(v70);
        end;
    end;
    v47._overrideAutomaticCanvasSize = function(v71, v72)
        if v47._scrollViewRef == nil then
            return ;
        else
            local l_current_0 = v47._scrollViewRef._nativeRef.current;
            if l_current_0 == nil then
                return ;
            elseif not (v47.props.AutomaticCanvasSize ~= Enum.AutomaticSize.XY) or v47.props.AutomaticCanvasSize == nil then
                l_current_0.CanvasSize = UDim2.new(0, v71, 0, v72);
                return ;
            elseif v47.props.AutomaticCanvasSize == Enum.AutomaticSize.X then
                l_current_0.CanvasSize = UDim2.new(0, v71, 0, l_current_0.AbsoluteCanvasSize.Y);
                return ;
            else
                if v47.props.AutomaticCanvasSize == Enum.AutomaticSize.Y then
                    l_current_0.CanvasSize = UDim2.new(0, l_current_0.AbsoluteCanvasSize.X, 0, v72);
                end;
                return ;
            end;
        end;
    end;
    v47._handleContentOnLayout = function(v74)
        local l_X_0 = v74.AbsoluteSize.X;
        local l_Y_0 = v74.AbsoluteSize.Y;
        if v47.props.overrideAutomaticCanvasSize then
            v47._overrideAutomaticCanvasSize(l_X_0, l_Y_0);
        end;
        if v47.props.onContentSizeChange then
            v47.props.onContentSizeChange(l_X_0, l_Y_0);
        end;
    end;
    v47._scrollViewRef = nil;
    v47._innerViewRef = nil;
    v47._setInnerViewRef = v33({
        getForwardedRef = function()
            return v47.props.innerViewRef;
        end, 
        setLocalRef = function(v77)
            v47._innerViewRef = v77;
            return nil;
        end
    });
    v47.scrollResponderKeyboardWillShow = function(v78)
        v47._keyboardWillOpenTo = v78;
        if v47.props.onKeyboardWillShow then
            v47.props.onKeyboardWillShow(v78);
        end;
    end;
    v47.scrollResponderKeyboardWillHide = function(v79)
        v47._keyboardWillOpenTo = nil;
        if v47.props.onKeyboardWillHide then
            v47.props.onKeyboardWillHide(v79);
        end;
    end;
    v47.scrollResponderKeyboardDidShow = function(v80)
        if l_Boolean_0.toJSBoolean(v80) then
            v47._keyboardWillOpenTo = v80;
        end;
        if v47.props.onKeyboardDidShow then
            v47.props.onKeyboardDidShow(v80);
        end;
    end;
    v47.scrollResponderKeyboardDidHide = function(v81)
        v47._keyboardWillOpenTo = nil;
        if v47.props.onKeyboardDidHide then
            v47.props.onKeyboardDidHide(v81);
        end;
    end;
    v47._handleMomentumScrollBegin = function(v82)
        v47._lastMomentumScrollBeginTime = os.clock() * 1000;
        if v47.props.onMomentumScrollBegin then
            v47.props.onMomentumScrollBegin(v82);
        end;
    end;
    v47._handleMomentumScrollEnd = function(v83)
        v24:endScroll();
        v47._lastMomentumScrollEndTime = os.clock() * 1000;
        if v47.props.onMomentumScrollEnd then
            v47.props.onMomentumScrollEnd(v83);
        end;
    end;
    v47._handleScrollBeginDrag = function(v84)
        v24:beginScroll();
        if v15.OS == "android" and v47.props.keyboardDismissMode == "on-drag" then
            warn("dismissKeyboard not implemented");
        end;
        if v47.props.onScrollBeginDrag then
            v47.props.onScrollBeginDrag(v84);
        end;
    end;
    v47._handleScrollEndDrag = function(v85, v86)
        if not v47:_isAnimating() and (not l_Boolean_0.toJSBoolean(nil) or (nil).x == 0 and (nil).y == 0) then
            v24:endScroll();
        end;
        if v47.props.onScrollEndDrag then
            v47.props.onScrollEndDrag(v85, v86);
        end;
    end;
    v47._isAnimating = function()
        return os.clock() * 1000 - v47._lastMomentumScrollEndTime < 16;
    end;
    v47._handleResponderGrant = function(v87)
        v47._observedScrollSinceBecomingResponder = false;
        if v47.props.onResponderGrant then
            v47.props.onResponderGrant(v87);
        end;
        v47._becameResponderWhileAnimating = v47:_isAnimating();
    end;
    v47._handleResponderReject = function()
    end;
    v47._handleResponderRelease = function(v88)
        v47._isTouching = #v88.nativeEvent.touches ~= 0;
        if v47.props.onResponderRelease then
            v47.props.onResponderRelease(v88);
        end;
        if typeof(v88.target) == "number" then
            if _G.__DEV__ then
                l_console_0.error("Did not expect event target to be a number. Should have been a native component");
            end;
            return ;
        else
            local v89 = v25:currentlyFocusedInput();
            if not ((not (not (not (v47.props.keyboardShouldPersistTaps ~= true and v47.props.keyboardShouldPersistTaps ~= "always") or not v47:_keyboardIsDismissible()) and v88.target ~= v89) or v47._observedScrollSinceBecomingResponder) or v47._becameResponderWhileAnimating) then
                v25:blurTextInput(v89);
            end;
            return ;
        end;
    end;
    v47._handleResponderTerminationRequest = function()
        return not v47._observedScrollSinceBecomingResponder;
    end;
    v47._handleScrollShouldSetResponder = function()
        if v47.props.disableScrollViewPanResponder == true then
            return false;
        else
            return v47._isTouching;
        end;
    end;
    v47._handleStartShouldSetResponder = function(v90)
        if v47.props.disableScrollViewPanResponder == true then
            return false;
        else
            local v91 = v25:currentlyFocusedInput();
            if not (not (v47.props.keyboardShouldPersistTaps == "handled") or not v47:_keyboardIsDismissible()) and v90.target ~= v91 then
                return true;
            else
                return false;
            end;
        end;
    end;
    v47._handleStartShouldSetResponderCapture = function(v92)
        if not v47:_isAnimating() then
            if v47.props.disableScrollViewPanResponder == true then
                return false;
            else
                local l_keyboardShouldPersistTaps_0 = v47.props.keyboardShouldPersistTaps;
                local v94 = not l_Boolean_0.toJSBoolean(l_keyboardShouldPersistTaps_0) or l_keyboardShouldPersistTaps_0 == "never";
                if typeof(v92.target) == "number" then
                    if _G.__DEV__ then
                        l_console_0.error("Did not expect event target to be a number. Should have been a native component");
                    end;
                    return false;
                elseif not (not (not v94 or not v47:_keyboardIsDismissible()) and v92.target ~= nil) or l_Boolean_0.toJSBoolean(v25:isTextInput(v92.target)) then
                    return false;
                else
                    return true;
                end;
            end;
        else
            return true;
        end;
    end;
    v47._keyboardIsDismissible = function()
        local v95 = v25:currentlyFocusedInput();
        local v96 = false;
        if v95 ~= nil then
            v96 = v25:isTextInput(v95);
        end;
        local v97 = true;
        if v47._keyboardWillOpenTo == nil then
            v97 = v15.OS == "android";
        end;
        return v96 and v97;
    end;
    v47._handleTouchEnd = function(v98, v99)
        v47._isTouching = false;
        if v47.props.onTouchEnd then
            v47.props.onTouchEnd(v98, v99);
        end;
    end;
    v47._handleTouchCancel = function(v100, v101)
        v47._isTouching = false;
        if v47.props.onTouchCancel then
            v47.props.onTouchCancel(v100, v101);
        end;
    end;
    v47._handleTouchStart = function(v102, v103)
        v47._isTouching = true;
        if v47.props.onTouchStart then
            v47.props.onTouchStart(v102, v103);
        end;
    end;
    v47._handleTouchMove = function(v104, v105)
        if v47.props.onTouchMove then
            v47.props.onTouchMove(v104, v105);
        end;
    end;
    v47._scrollAnimatedValue = v13.Value.new(if not not v47.props.contentOffset and l_Boolean_0.toJSBoolean(v47.props.contentOffset.y) then v47.props.contentOffset.y else 0);
    v47._scrollAnimatedValue:setOffset(if not not v47.props.contentInset and l_Boolean_0.toJSBoolean(v47.props.contentInset.top) then v47.props.contentInset.top else 0);
end;
v46.componentDidMount = function(v106)
    if typeof(v106.props.keyboardShouldPersistTaps) == "boolean" then
        l_console_0.warn(("'keyboardShouldPersistTaps={%s}' is deprecated. "):format(v106.props.keyboardShouldPersistTaps == true and "true" or "false") .. ("Use 'keyboardShouldPersistTaps=\"%s\"' instead"):format(not l_Boolean_0.toJSBoolean(v106.props.keyboardShouldPersistTaps) and "never" or "always"));
    end;
    v106._keyboardWillOpenTo = nil;
    v106._additionalScrollOffset = 0;
    v106._subscriptionKeyboardWillShow = v23:addListener("keyboardWillShow", v106.scrollResponderKeyboardWillShow);
    v106._subscriptionKeyboardWillHide = v23:addListener("keyboardWillHide", v106.scrollResponderKeyboardWillHide);
    v106._subscriptionKeyboardDidShow = v23:addListener("keyboardDidShow", v106.scrollResponderKeyboardDidShow);
    v106._subscriptionKeyboardDidHide = v23:addListener("keyboardDidHide", v106.scrollResponderKeyboardDidHide);
    v106:_updateAnimatedNodeAttachment();
end;
v46.componentDidUpdate = function(v107, v108)
    local v109 = not v108.contentInset and 0 or v108.contentInset.top;
    local v110 = not v107.props.contentInset and 0 or v107.props.contentInset.top;
    if v109 ~= v110 then
        v107._scrollAnimatedValue:setOffset(not not l_Boolean_0.toJSBoolean(v110) and v110 or 0);
    end;
    v107:_updateAnimatedNodeAttachment();
end;
v46.componentWillUnmount = function(v111)
    if v111._subscriptionKeyboardWillShow ~= nil then
        v111._subscriptionKeyboardWillShow:remove();
    end;
    if v111._subscriptionKeyboardWillHide ~= nil then
        v111._subscriptionKeyboardWillHide:remove();
    end;
    if v111._subscriptionKeyboardDidShow ~= nil then
        v111._subscriptionKeyboardDidShow:remove();
    end;
    if v111._subscriptionKeyboardDidHide ~= nil then
        v111._subscriptionKeyboardDidHide:remove();
    end;
    if v111._scrollAnimatedValueAttachment then
        v111._scrollAnimatedValueAttachment:detach();
    end;
end;
v46._textInputFocusError = function()
    l_console_0.warn("Error measuring text field.");
end;
v46._getKeyForIndex = function(v112, v113)
    local v114 = v113[v112];
    if not v114 then
        return v114;
    else
        return v114.key;
    end;
end;
v46._updateAnimatedNodeAttachment = function(v115)
    if v115._scrollAnimatedValueAttachment then
        v115._scrollAnimatedValueAttachment:detach();
    end;
    if v115.props.stickyHeaderIndices and #v115.props.stickyHeaderIndices > 0 then
        v115._scrollAnimatedValueAttachment = v13:attachNativeEvent(v115._scrollViewRef, "onScroll", {
            {
                nativeEvent = {
                    contentOffset = {
                        y = v115._scrollAnimatedValue
                    }
                }
            }
        });
    end;
end;
v46._setStickyHeaderRef = function(v116, v117, v118)
    if not l_Boolean_0.toJSBoolean(v118) then
        v116._stickyHeaderRefs:delete(v117);
        return ;
    else
        v116._stickyHeaderRefs:set(v117, v118);
        return ;
    end;
end;
v46._onStickyHeaderLayout = function(v119, v120, v121, v122)
    local l_stickyHeaderIndices_0 = v119.props.stickyHeaderIndices;
    if l_stickyHeaderIndices_0 then
        local v124 = v17.Children.toArray(v119.props.children);
        if v122 ~= v119._getKeyForIndex(v120, v124) then
            return ;
        else
            local l_y_0 = v121.nativeEvent.layout.y;
            v119._headerLayoutYs:set(v122, l_y_0);
            local v126 = l_stickyHeaderIndices_0[l_Array_0.indexOf(l_stickyHeaderIndices_0, v120) - 1];
            if v126 ~= nil then
                local v127 = v119._stickyHeaderRefs:get(v119._getKeyForIndex(v126, v124));
                if not (not l_Boolean_0.toJSBoolean(v127) or not v127.setNextHeaderY) then
                    v127:setNextHeaderY(l_y_0);
                end;
            end;
            return ;
        end;
    else
        return ;
    end;
end;
v46.render = function(v128)
    local v129, v130 = table.unpack(if v128.props.horizontal == true then v43 else v44, 1, 2);
    local l_contentContainerStyle_0 = v128.props.contentContainerStyle;
    if _G.__DEV__ and v128.props.style ~= nil then
        local l_style_0 = v128.props.style;
        local l_l_style_0_0 = l_style_0 --[[ copy: 4 -> 20 ]];
        local v136 = l_Array_0.filter({
            "alignItems", 
            "justifyContent"
        }, function(v134)
            local v135 = false;
            if type(l_l_style_0_0) == "table" then
                v135 = l_l_style_0_0[v134] ~= nil;
            end;
            return v135;
        end);
        v29(#v136 == 0, "ScrollView child layout (" .. l_HttpService_0:JSONEncode(v136) .. ") must be applied through the contentContainerStyle prop.");
    end;
    local v137 = if v128.props.onContentSizeChange == nil then nil else {
        onLayout = v128._handleContentOnLayout
    };
    local l_stickyHeaderIndices_1 = v128.props.stickyHeaderIndices;
    local l_children_0 = v128.props.children;
    if l_stickyHeaderIndices_1 ~= nil and #l_stickyHeaderIndices_1 > 0 then
        local v140 = v17.Children.toArray(v128.props.children);
        local l_v140_0 = v140 --[[ copy: 7 -> 19 ]];
        l_children_0 = l_Array_0.map(v140, function(v142, v143)
            local v144 = not l_Boolean_0.toJSBoolean(v142) and -1 or l_Array_0.indexOf(l_stickyHeaderIndices_1, v143);
            if v144 > -1 then
                local l_key_0 = v142.key;
                return (v17.createElement(if not v128.props.StickyHeaderComponent then v19 else v128.props.StickyHeaderComponent, {
                    Name = "StickyHeaderComponent", 
                    key = l_key_0, 
                    nativeID = "StickyHeader-" .. tostring(l_key_0), 
                    ref = function(v146)
                        return v128:_setStickyHeaderRef(l_key_0, v146);
                    end, 
                    nextHeaderLayoutY = v128._headerLayoutYs:get(v128._getKeyForIndex(l_stickyHeaderIndices_1[v144 + 1], l_v140_0)), 
                    onLayout = function(v147)
                        return v128:_onStickyHeaderLayout(v143, v147, l_key_0);
                    end, 
                    scrollAnimatedValue = v128._scrollAnimatedValue, 
                    inverted = v128.props.invertStickyHeaders, 
                    hiddenOnScroll = v128.props.stickyHeaderHiddenOnScroll, 
                    scrollViewHeight = v128.state.layoutHeight
                }, v142));
            else
                return v142;
            end;
        end);
    end;
    l_children_0 = v17.createElement(l_default_0.Provider, {
        value = if v128.props.horizontal == true then l_HORIZONTAL_0 else l_VERTICAL_0
    }, v17.createElement("UIListLayout", {
        ref = v128._listLayoutRef, 
        key = "layout", 
        Name = not v128.props.horizontal and "VerticalLayout" or "HorizontalLayout", 
        FillDirection = if not v128.props.horizontal then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal, 
        VerticalAlignment = if not v128.props.horizontal then if v128.props.layoutStyle then v128.props.layoutStyle.VerticalAlignment else Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Center, 
        HorizontalAlignment = if not v128.props.horizontal then Enum.HorizontalAlignment.Center else if v128.props.layoutStyle then v128.props.layoutStyle.HorizontalAlignment else Enum.HorizontalAlignment.Left, 
        SortOrder = Enum.SortOrder.LayoutOrder
    }), l_children_0);
    local v148 = l_Array_0.isArray(l_stickyHeaderIndices_1) and #l_stickyHeaderIndices_1 > 0;
    local v149 = v17.createElement(v130, l_Object_0.assign({}, v137, {
        ref = v128._setInnerViewRef
    }, {
        style = l_contentContainerStyle_0, 
        Size = if not v128.props.horizontal then UDim2.new(1, 0, 0, 0) else UDim2.new(0, 0, 1, 0), 
        AutomaticSize = if not v128.props.horizontal then Enum.AutomaticSize.Y else Enum.AutomaticSize.X, 
        removeClippedSubviews = (not (v15.OS == "android") or not v148) and v128.props.removeClippedSubviews, 
        collapsable = false
    }), l_children_0);
    local v150 = if v128.props.alwaysBounceHorizontal ~= nil then v128.props.alwaysBounceHorizontal else v128.props.horizontal;
    local v151 = if v128.props.alwaysBounceVertical ~= nil then v128.props.alwaysBounceVertical else not v128.props.horizontal;
    local v152 = if v128.props.horizontal == true then v42.baseHorizontal else v42.baseVertical;
    local l_assign_0 = l_Object_0.assign;
    local v154 = table.clone(v128.props);
    local v155 = {
        alwaysBounceHorizontal = v150, 
        alwaysBounceVertical = v151, 
        style = v20.compose(v152, v128.props.style), 
        onContentSizeChange = l_Object_0.None, 
        onLayout = v128._handleLayout, 
        onMomentumScrollBegin = v128._handleMomentumScrollBegin, 
        onMomentumScrollEnd = v128._handleMomentumScrollEnd, 
        onResponderGrant = v128._handleResponderGrant, 
        onResponderReject = v128._handleResponderReject, 
        onResponderRelease = v128._handleResponderRelease, 
        onResponderTerminationRequest = v128._handleResponderTerminationRequest, 
        onScrollBeginDrag = v128._handleScrollBeginDrag, 
        onScrollEndDrag = v128._handleScrollEndDrag, 
        onScrollShouldSetResponder = v128._handleScrollShouldSetResponder, 
        onStartShouldSetResponder = v128._handleStartShouldSetResponder, 
        onStartShouldSetResponderCapture = v128._handleStartShouldSetResponderCapture, 
        onTouchEnd = v128._handleTouchEnd, 
        onTouchMove = v128._handleTouchMove, 
        onTouchStart = v128._handleTouchStart, 
        onTouchCancel = v128._handleTouchCancel, 
        onScroll = v128._handleScroll, 
        scrollEventThrottle = if not v148 then v128.props.scrollEventThrottle else 1, 
        sendMomentumEvents = (v128.props.onMomentumScrollBegin or v128.props.onMomentumScrollEnd) and true or false, 
        snapToStart = v128.props.snapToStart ~= false, 
        snapToEnd = v128.props.snapToEnd ~= false
    };
    local l_select_0 = v15.select;
    local v157 = {};
    local v158 = false;
    if v128.props.pagingEnabled == true then
        v158 = false;
        if v128.props.snapToInterval == nil then
            v158 = v128.props.snapToOffsets == nil;
        end;
    end;
    v157.ios = v158;
    v158 = true;
    if v128.props.pagingEnabled ~= true then
        v158 = true;
        if v128.props.snapToInterval == nil then
            v158 = v128.props.snapToOffsets ~= nil;
        end;
    end;
    v157.android = v158;
    v155.pagingEnabled = l_select_0(v157);
    v155.AutomaticCanvasSize = if not v128.props.overrideAutomaticCanvasSize then nil else Enum.AutomaticSize.None;
    l_assign_0 = l_assign_0(v154, v155);
    v154 = v128.props.decelerationRate;
    if v154 ~= nil then
        l_assign_0.decelerationRate = v30(v154);
    end;
    v155 = v128.props.refreshControl;
    if l_Boolean_0.toJSBoolean(v155) then
        if not (v15.OS ~= "ios") or v15.OS == "roblox" then
            return v17.createElement(v129, l_Object_0.assign(table.clone(l_assign_0), {
                ref = v128._setNativeRef
            }), v155, v149);
        elseif v15.OS == "android" then
            l_select_0 = nil;
            v157 = nil;
            local l_style_1 = l_assign_0.style;
            v158 = {
                outer = l_style_1, 
                inner = l_style_1
            };
            return v17.cloneElement(v155, l_Object_0.assign({
                style = v20.compose(v152, v158.outer)
            }), v17.createElement(v129, l_Object_0.assign({}, l_assign_0, {
                style = v20.compose(v152, v158.inner), 
                ref = v128._setNativeRef
            }), v149));
        end;
    end;
    l_assign_0.ref = v128._setNativeRef;
    return v17.createElement(v129, l_assign_0, v149);
end;
v42 = v20.create({
    baseVertical = {
        ScrollingDirection = Enum.ScrollingDirection.Y
    }, 
    baseHorizontal = {
        ScrollingDirection = Enum.ScrollingDirection.X
    }
});
local v162 = v17.forwardRef(function(v160, v161)
    return v17.createElement(v46, l_Object_0.assign(table.clone(v160), {
        scrollViewRef = v161
    }));
end);
v162.Context = l_default_0;
v162.displayName = "ScrollView";
return v162;
