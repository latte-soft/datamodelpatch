local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.RoactGamepad);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_1.Core.Style.withStyle);
local v8 = require(l_Parent_1.Utility.SpringAnimatedItem);
local v9 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v10 = require(l_Parent_1.App.ImageSet.Images);
local v11 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v12 = require(l_Parent_1.Core.Text.ExpandableText.ExpandableTextUtils);
local v13 = require(l_Parent_0.SelectionImage.CursorKind);
local v14 = require(l_Parent_0.SelectionImage.withSelectionCursorProvider);
local v15 = require(l_Parent_0.SelectionCursor.useCursorByType);
local v16 = require(l_Parent_0.SelectionCursor.CursorType);
local v17 = require(l_Parent_1.UIBloxConfig);
local v18 = 30;
local v19 = 5;
local v20 = UDim2.new(0, 36, 0, 36);
local v21 = UDim2.new(1, 0, 0, 36);
local v22 = v10["gradient/gradient_0_100"];
local v23 = v10["truncate_arrows/actions_truncationExpand"];
local v24 = v10["truncate_arrows/actions_truncationCollapse"];
local v25 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v26 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v27 = v8.wrap(v9.Label);
local v28 = v3.PureComponent:extend("ExpandableTextArea");
v28.validateProps = v6.strictInterface({
    Text = v6.optional(v6.string), 
    Position = v6.optional(v6.UDim2), 
    compactNumberOfLines = v6.optional(v6.number), 
    LayoutOrder = v6.optional(v6.number), 
    width = v6.optional(v6.UDim), 
    padding = v6.optional(v6.Vector2), 
    onClick = v6.optional(v6.callback), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    frameRef = v6.optional(v6.table), 
    selectionCursor = if not v17.migrateToNewSelectionCursor then nil else v6.optional(v6.any)
});
v28.defaultProps = {
    compactNumberOfLines = 2, 
    Text = ""
};
v28.init = function(v29)
    v29.state = {
        isExpanded = false, 
        frameWidth = 0
    };
    v29.onClick = function()
        v29:setState(function(v30)
            return {
                isExpanded = not v30.isExpanded
            };
        end);
        if v29.props.onClick then
            v29.props.onClick(v29.state.isExpanded);
        end;
    end;
    v29.ref = v3.createRef();
    v29.layoutRef = v3.createRef();
end;
v28.getRef = function(v31)
    return v31.props.frameRef or v31.ref;
end;
v28.applyFit = function(v32, v33)
    local v34 = v32:getRef();
    if v34.current then
        local l_current_0 = v34.current;
        local v36 = (v33 + v18) + v19;
        local l_width_0 = v32.props.width;
        if not l_width_0 then
            l_current_0.Size = UDim2.new(1, 0, 0, v36);
            return ;
        else
            l_current_0.Size = UDim2.new(l_width_0.Scale, l_width_0.Offset, 0, v36);
            return ;
        end;
    else
        return ;
    end;
end;
v28.didMount = function(v38)
    v38.isMounted = true;
    local l_current_1 = v38.layoutRef.current;
    if l_current_1 then
        v38:applyFit(l_current_1.AbsoluteContentSize.y);
    end;
end;
v28.willUnmount = function(v40)
    v40.isMounted = false;
end;
v28.render = function(v41)
    local l_Text_0 = v41.props.Text;
    local l_Position_0 = v41.props.Position;
    local l_compactNumberOfLines_0 = v41.props.compactNumberOfLines;
    local l_LayoutOrder_0 = v41.props.LayoutOrder;
    local l_width_1 = v41.props.width;
    local l_padding_0 = v41.props.padding;
    local v48 = v41:getRef();
    v18 = not not l_padding_0 and l_padding_0.Y or 30;
    v19 = not not l_padding_0 and l_padding_0.X or 5;
    return v7(function(v49)
        return v14(function(v50)
            local l_Theme_0 = v49.Theme;
            local l_Font_0 = v49.Font;
            local v53 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
            local v54, v55 = v12.getExpandableTextHeights(l_Font_0, v41.state.frameWidth, l_Text_0, l_compactNumberOfLines_0);
            local v56 = UDim2.new(1, 0, 0, v55 + v19);
            local v57 = UDim2.new(1, 0, 0, v54 + v19);
            local v58 = v55 < v54;
            local v59 = not v58 or v41.state.isExpanded;
            local v60 = not not v59 and v57 or v56;
            return v3.createElement(not not v58 and v5.Focusable.Frame or "Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = l_LayoutOrder_0, 
                Position = l_Position_0, 
                Size = not not l_width_1 and UDim2.new(l_width_1.Scale, l_width_1.Offset, 0, 0) or UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                SelectionImageObject = if not v17.migrateToNewSelectionCursor then v50(v13.RoundedRect) else v41.props.selectionCursor, 
                [v3.Ref] = v48, 
                [v3.Change.AbsoluteSize] = function(v61)
                    if v41.state.frameWidth ~= v61.AbsoluteSize.X then
                        v41:setState({
                            frameWidth = v61.AbsoluteSize.X
                        });
                    end;
                end, 
                NextSelectionUp = v41.props.NextSelectionUp, 
                NextSelectionDown = v41.props.NextSelectionDown, 
                NextSelectionLeft = v41.props.NextSelectionLeft, 
                NextSelectionRight = v41.props.NextSelectionRight, 
                inputBindings = not not v58 and {
                    Activated = v5.Input.onBegin(Enum.KeyCode.ButtonA, v41.onClick)
                } or nil
            }, {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 10), 
                    [v3.Change.AbsoluteContentSize] = function(v62)
                        v41:applyFit(v62.AbsoluteContentSize.y);
                    end, 
                    [v3.Ref] = v41.layoutRef
                }), 
                UIPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v18)
                }), 
                ExpandableContainer = v3.createElement(v8.AnimatedFrame, {
                    animatedValues = {
                        height = v60.Y.Offset
                    }, 
                    mapValuesToProps = function(v63)
                        return {
                            Size = UDim2.new(1, 0, v60.Y.Scale, v63.height)
                        };
                    end, 
                    regularProps = {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        ClipsDescendants = true, 
                        Size = v60, 
                        LayoutOrder = 0
                    }, 
                    springOptions = v25
                }, {
                    DescriptionText = v3.createElement(v11, {
                        colorStyle = l_Theme_0.TextDefault, 
                        fontStyle = l_Font_0.Body, 
                        Size = v60, 
                        Text = l_Text_0, 
                        TextSize = v53, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        BackgroundTransparency = 1
                    }), 
                    Gradient = v58 and v3.createElement(v27, {
                        animatedValues = {
                            height = not v59 and 30 or 0
                        }, 
                        mapValuesToProps = function(v64)
                            return {
                                Size = UDim2.new(1, 0, 0, v64.height)
                            };
                        end, 
                        regularProps = {
                            Size = UDim2.new(1, 0, 0, 30), 
                            Position = UDim2.new(0, 0, 1, 0), 
                            AnchorPoint = Vector2.new(0, 1), 
                            BackgroundTransparency = 1, 
                            Image = v22, 
                            ImageColor3 = l_Theme_0.BackgroundDefault.Color
                        }, 
                        springOptions = v26
                    })
                }), 
                ButtonContainer = v58 and v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 10), 
                    LayoutOrder = 1
                }, {
                    PressableButton = v3.createElement("TextButton", {
                        Position = UDim2.new(0, 0, 0, -24), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = v21, 
                        Text = "", 
                        [v3.Event.Activated] = v41.onClick
                    }, {
                        DownArrow = v3.createElement(v9.Label, {
                            AnchorPoint = Vector2.new(0.5, 0), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Position = UDim2.new(0.5, 0, 0, 0), 
                            Image = v60 == v57 and v24 or v23, 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                            Size = v20
                        })
                    })
                })
            });
        end);
    end);
end;
return v3.forwardRef(function(v65, v66)
    local v67 = v15(v16.RoundedRect);
    if v17.migrateToNewSelectionCursor then
        v65 = v4.Dictionary.join({
            selectionCursor = v67
        }, v65);
    end;
    return v3.createElement(v28, v4.Dictionary.join(v65, {
        frameRef = v66
    }));
end);
