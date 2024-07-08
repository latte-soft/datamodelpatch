local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.Utility.SpringAnimatedItem);
local v5 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v6 = v2.PureComponent:extend("AccordionView");
v6.validateProps = v3.strictInterface({
    items = v3.table, 
    itemWidth = v3.number, 
    itemHeight = v3.number, 
    renderItem = v3.callback, 
    placeholderColor = v3.Color3, 
    placeholderBaseTransparency = v3.number, 
    collapseButtonSize = v3.number, 
    renderCollapseButton = v3.callback, 
    LayoutOrder = v3.optional(v3.integer), 
    maxItemsInCompactView = v3.numberPositive
});
v6.defaultProps = {
    maxItemsInCompactView = 3
};
v6.init = function(v7)
    v7.state = {
        expanded = false, 
        isExpandButtonPressed = false
    };
    v7.onExpandButtonActivated = function()
        v7:setState({
            expanded = true, 
            isExpandButtonPressed = false
        });
    end;
    v7.onCollapseButtonActivated = function()
        v7:setState({
            expanded = false
        });
    end;
    v7.onExpandButtonInputBegan = function(_, v9)
        if v9.UserInputState == Enum.UserInputState.Begin and (not (v9.UserInputType ~= Enum.UserInputType.Touch) or v9.UserInputType == Enum.UserInputType.MouseButton1) then
            v7:setState({
                isExpandButtonPressed = true
            });
        end;
    end;
    v7.onExpandButtonInputEnded = function()
        if v7.state.isExpandButtonPressed then
            v7:setState({
                isExpandButtonPressed = false
            });
        end;
    end;
    v7.rootFrameRef = v2.createRef();
    v7.onListLayoutAbsoluteContentSizeChanged = function(v10)
        if v7.rootFrameRef.current then
            v7.rootFrameRef.current.Size = UDim2.new(0, v7.props.itemWidth, 0, (math.max(v10.AbsoluteContentSize.Y, (v7:getCompactTotalHeight()))));
        end;
    end;
end;
v6.getCompactTotalHeight = function(v11)
    local l_items_0 = v11.props.items;
    local l_itemHeight_0 = v11.props.itemHeight;
    local l_maxItemsInCompactView_0 = v11.props.maxItemsInCompactView;
    local v15 = #l_items_0;
    if v15 == 0 then
        return 0;
    else
        return l_itemHeight_0 + (math.min(l_maxItemsInCompactView_0, v15) - 1) * 10;
    end;
end;
v6.getLayoutInfo = function(v16)
    local l_items_1 = v16.props.items;
    local l_itemWidth_0 = v16.props.itemWidth;
    local l_itemHeight_1 = v16.props.itemHeight;
    local l_placeholderBaseTransparency_0 = v16.props.placeholderBaseTransparency;
    local l_maxItemsInCompactView_1 = v16.props.maxItemsInCompactView;
    local l_expanded_0 = v16.state.expanded;
    local v23 = {};
    local v24 = #l_items_1;
    local v25 = math.min(l_maxItemsInCompactView_1, v24);
    local v26 = 0;
    if v25 > 1 then
        v26 = (1 - l_placeholderBaseTransparency_0) / (v25 - 1);
    end;
    for v27 = 1, v24 do
        if not l_expanded_0 then
            if v27 == 1 then
                v23[v27] = {
                    width = l_itemWidth_0, 
                    height = l_itemHeight_1, 
                    placeholderTransparency = 1, 
                    itemTransparency = 0
                };
            elseif v27 <= l_maxItemsInCompactView_1 then
                v23[v27] = {
                    width = l_itemWidth_0 - 20 * (v27 - 1), 
                    height = 10, 
                    placeholderTransparency = l_placeholderBaseTransparency_0 + v26 * (v27 - 2), 
                    itemTransparency = 1
                };
            else
                v23[v27] = {
                    width = l_itemWidth_0 - 20 * (v27 - 1), 
                    height = 0, 
                    placeholderTransparency = 1, 
                    itemTransparency = 1
                };
            end;
        else
            v23[v27] = {
                width = l_itemWidth_0, 
                height = l_itemHeight_1, 
                placeholderTransparency = 1, 
                itemTransparency = 0
            };
        end;
    end;
    return v23;
end;
v6.render = function(v28)
    local l_items_2 = v28.props.items;
    local v30 = #l_items_2;
    if v30 == 0 then
        return nil;
    else
        local l_LayoutOrder_0 = v28.props.LayoutOrder;
        local l_itemWidth_1 = v28.props.itemWidth;
        local l_renderItem_0 = v28.props.renderItem;
        local l_placeholderColor_0 = v28.props.placeholderColor;
        local l_collapseButtonSize_0 = v28.props.collapseButtonSize;
        local l_renderCollapseButton_0 = v28.props.renderCollapseButton;
        local l_expanded_1 = v28.state.expanded;
        local l_isExpandButtonPressed_0 = v28.state.isExpandButtonPressed;
        local v39 = v28:getLayoutInfo();
        local v43 = {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, not l_expanded_1 and 0 or 10), 
                [v2.Change.AbsoluteContentSize] = v28.onListLayoutAbsoluteContentSizeChanged
            }), 
            Scaler = v2.createElement(v4.AnimatedUIScale, {
                springOptions = v5, 
                animatedValues = {
                    scale = not l_isExpandButtonPressed_0 and 1 or 0.9
                }, 
                mapValuesToProps = function(v40)
                    return {
                        Scale = v40.scale
                    };
                end
            }), 
            CollapseButton = v2.createElement(v4.AnimatedFrame, {
                springOptions = v5, 
                animatedValues = {
                    sizeOffsetY = not not l_expanded_1 and l_collapseButtonSize_0 + 1 or 0
                }, 
                mapValuesToProps = function(v41)
                    return {
                        Size = UDim2.new(0, l_collapseButtonSize_0, 0, v41.sizeOffsetY)
                    };
                end, 
                regularProps = {
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    [v2.Children] = {
                        ButtonMoveContainer = v2.createElement(v4.AnimatedFrame, {
                            springOptions = v5, 
                            animatedValues = {
                                positionOffsetY = if not l_expanded_1 then l_collapseButtonSize_0 / 2 else 0
                            }, 
                            mapValuesToProps = function(v42)
                                return {
                                    Position = UDim2.new(0, 0, 0, v42.positionOffsetY)
                                };
                            end, 
                            regularProps = {
                                Size = UDim2.new(0, l_collapseButtonSize_0, 0, l_collapseButtonSize_0), 
                                BackgroundTransparency = 1, 
                                [v2.Children] = {
                                    Button = l_renderCollapseButton_0(v28.onCollapseButtonActivated)
                                }
                            }
                        })
                    }
                }
            })
        };
        for v44, _ in ipairs(l_items_2) do
            local v46 = v39[v44];
            v43["Item" .. tostring(v44)] = v2.createElement(v4.AnimatedFrame, {
                springOptions = v5, 
                animatedValues = {
                    width = v46.width, 
                    height = v46.height
                }, 
                mapValuesToProps = function(v47)
                    return {
                        Size = UDim2.new(0, v47.width, 0, v47.height)
                    };
                end, 
                regularProps = {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = v44 + 1, 
                    ZIndex = (v30 + 1) - v44, 
                    ClipsDescendants = true, 
                    [v2.Children] = {
                        Item = l_renderItem_0(l_items_2[v44], v46.itemTransparency, v5), 
                        Placeholder = v2.createElement(v4.AnimatedFrame, {
                            key = "Placeholder", 
                            springOptions = v5, 
                            animatedValues = {
                                transparency = v46.placeholderTransparency
                            }, 
                            mapValuesToProps = function(v48)
                                return {
                                    BackgroundTransparency = v48.transparency
                                };
                            end, 
                            regularProps = {
                                Size = UDim2.new(1, 0, 1, 0), 
                                BackgroundColor3 = l_placeholderColor_0, 
                                BorderSizePixel = 0
                            }
                        })
                    }
                }
            });
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(0, l_itemWidth_1, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = l_LayoutOrder_0, 
            [v2.Ref] = v28.rootFrameRef
        }, {
            ContentFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1
            }, v43), 
            ClickToExpandButton = (v30 > 1 and not l_expanded_1) and v2.createElement("TextButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ZIndex = v30 + 1, 
                Text = "", 
                [v2.Event.Activated] = v28.onExpandButtonActivated, 
                [v2.Event.InputBegan] = v28.onExpandButtonInputBegan, 
                [v2.Event.InputEnded] = v28.onExpandButtonInputEnded
            })
        });
    end;
end;
return v6;
