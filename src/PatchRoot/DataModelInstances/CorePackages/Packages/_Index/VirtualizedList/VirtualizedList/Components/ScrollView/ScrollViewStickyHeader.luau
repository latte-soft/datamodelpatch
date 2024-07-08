local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v2.Boolean;
local l_clearTimeout_0 = v2.clearTimeout;
local l_setTimeout_0 = v2.setTimeout;
local v6 = {
    new = function(...)
        return nil;
    end
};
local v7 = {
    new = function(...)
        return nil;
    end
};
local v8 = require(l_Parent_1.React);
local v9 = require(l_Parent_0.StyleSheet.StyleSheet);
local v10 = {
    OS = "roblox"
};
local v11 = nil;
local v12 = v8.Component:extend("ScrollViewStickyHeader");
v12.init = function(v13, v14)
    warn("ScrollViewStickyHeader not fully implemented");
    v13.props = v14;
    v13.state = {
        measured = false, 
        layoutY = 0, 
        layoutHeight = 0, 
        nextHeaderLayoutY = v13.props.nextHeaderLayoutY, 
        translateY = nil
    };
    v13._translateY = nil;
    v13._shouldRecreateTranslateY = true;
    v13._haveReceivedInitialZeroTranslateY = true;
    v13._debounceTimeout = v10.OS == "android" and 15 or 64;
    v13.setNextHeaderY = function(_, v16)
        v13._shouldRecreateTranslateY = true;
        v13.setState({
            nextHeaderLayoutY = v16
        });
    end;
    v13._onLayout = function(_, v18)
        local l_y_0 = v18.nativeEvent.layout.y;
        local l_height_0 = v18.nativeEvent.layout.height;
        if not (l_y_0 == v13.state.layoutY and l_height_0 == v13.state.layoutHeight) or v13.state.measured ~= true then
            v13._shouldRecreateTranslateY = true;
        end;
        v13:setState({
            measured = true, 
            layoutY = l_y_0, 
            layoutHeight = l_height_0
        });
        v13.props:onLayout(v18);
        local v21 = v8.Children.only(v13.props.children);
        if v21.props.onLayout then
            v21.props:onLayout(v18);
        end;
    end;
    v13._setComponentRef = function(_, v23)
        v13._ref = v23;
    end;
end;
v12.componentWillUnmount = function(v24)
    if v24._translateY ~= nil and v24._animatedValueListenerId ~= nil then
        v24._translateY:removeListener(v24._animatedValueListenerId);
    end;
    if l_Boolean_0.toJSBoolean(v24._timer) then
        l_clearTimeout_0(v24._timer);
    end;
end;
v12.UNSAFE_componentWillReceiveProps = function(v25, v26)
    if not (v26.scrollViewHeight == v25.props.scrollViewHeight and v26.scrollAnimatedValue == v25.props.scrollAnimatedValue) or v26.inverted ~= v25.props.inverted then
        v25._shouldRecreateTranslateY = true;
    end;
end;
v12.updateTranslateListener = function(v27, v28, v29, v30)
    if v27._translateY ~= nil and v27._animatedValueListenerId ~= nil then
        v27._translateY:removeListener(v27._animatedValueListenerId);
    end;
    v27.translateY = if not l_Boolean_0.toJSBoolean(v30) then v28 else v6.new(v28, v30);
    v27._shouldRecreateTranslateY = false;
    if v29 then
        if not v27._animatedValueListener then
            v27._animatedValueListener = function(v31)
                local l_value_0 = v31.value;
                if not (l_value_0 == 0) or v27._haveReceivedInitialZeroTranslateY then
                    if l_Boolean_0.toJSBoolean(v27._timer) then
                        l_clearTimeout_0(v27._timer);
                    end;
                    v27._timer = l_setTimeout_0(function()
                        if l_value_0 ~= v27.state.translateY then
                            v27:setState({
                                translateY = l_value_0
                            });
                        end;
                    end, v27._debounceTimeout);
                    return ;
                else
                    v27._haveReceivedInitialZeroTranslateY = true;
                    return ;
                end;
            end;
        end;
        if v27.state.translateY ~= 0 and v27.state.translateY ~= nil then
            v27._haveReceivedInitialZeroTranslateY = false;
        end;
        v27._animatedValueListenerId = v28:addListener(v27._animatedValueListener);
        return ;
    else
        return ;
    end;
end;
v12.render = function(v33)
    local v34 = ((v33._ref and v33._ref._internalInstanceHandle) and v33._ref._internalInstanceHandle.stateNode) and l_Boolean_0.toJSBoolean(v33._ref._internalInstanceHandle.stateNode.canonical);
    if v33._shouldRecreateTranslateY then
        local l_inverted_0 = v33.props.inverted;
        local l_scrollViewHeight_0 = v33.props.scrollViewHeight;
        local l_measured_0 = v33.state.measured;
        local l_layoutHeight_0 = v33.state.layoutHeight;
        local l_layoutY_0 = v33.state.layoutY;
        local l_nextHeaderLayoutY_0 = v33.state.nextHeaderLayoutY;
        local v41 = {
            -1, 
            0
        };
        local v42 = {
            0, 
            0
        };
        if l_measured_0 then
            if not l_inverted_0 then
                table.insert(v41, l_layoutY_0);
                table.insert(v42, 0);
                local v43 = (l_nextHeaderLayoutY_0 or 0) - l_layoutHeight_0;
                if l_layoutY_0 <= v43 then
                    table.insert(v41, v43);
                    table.insert(v41, v43 + 1);
                    table.insert(v42, v43 - l_layoutY_0);
                    table.insert(v42, v43 - l_layoutY_0);
                else
                    table.insert(v41, l_layoutY_0 + 1);
                    table.insert(v42, 1);
                end;
            elseif l_scrollViewHeight_0 ~= nil then
                local v44 = (l_layoutY_0 + l_layoutHeight_0) - l_scrollViewHeight_0;
                if v44 > 0 then
                    table.insert(v41, v44);
                    table.insert(v42, 0);
                    table.insert(v41, v44 + 1);
                    table.insert(v42, 1);
                    local v45 = ((l_nextHeaderLayoutY_0 or 0) - l_layoutHeight_0) - l_scrollViewHeight_0;
                    if v44 < v45 then
                        table.insert(v41, v45);
                        table.insert(v41, v45 + 1);
                        table.insert(v42, v45 - v44);
                        table.insert(v42, v45 - v44);
                    end;
                end;
            end;
        end;
        v33:updateTranslateListener(v33.props.scrollAnimatedValue:interpolate({
            inputRange = v41, 
            outputRange = v42
        }), v34, if not v33.props.hiddenOnScroll then nil else v7.new(v33.props.scrollAnimatedValue:interpolate({
            extrapolateLeft = "clamp", 
            inputRange = {
                l_layoutY_0, 
                l_layoutY_0 + 1
            }, 
            outputRange = {
                0, 
                1
            }
        }):interpolate({
            inputRange = {
                0, 
                1
            }, 
            outputRange = {
                0, 
                -1
            }
        }), -v33.state.layoutHeight, 0));
    end;
    local v46 = v8.Children.only(v33.props.children);
    return v8.createElement("AnimatedView", {
        collapsable = false, 
        nativeID = v33.props.nativeID, 
        onLayout = v33._onLayout, 
        ref = v33._setComponentRef, 
        style = {
            v46.props.style, 
            v11.header, 
            {
                transform = {
                    {
                        translateY = v33._translateY
                    }
                }
            }
        }, 
        passthroughAnimatedPropExplicitValues = if not not v34 and v33.state.translateY ~= nil then {
            style = {
                transform = {
                    {
                        translateY = v33.state.translateY
                    }
                }
            }
        } else nil
    }, v8.cloneElement(v46, {
        style = v11.fill, 
        onLayout = nil
    }));
end;
v11 = v9.create({
    header = {
        zIndex = 10, 
        position = "relative"
    }, 
    fill = {
        flex = 1
    }
});
return v12;
