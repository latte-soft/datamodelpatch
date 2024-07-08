local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_1.Core;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_2.Roact);
local v7 = require(l_Parent_2.enumerate);
local v8 = require(l_Core_0.Utility.bindingValidator);
local v9 = require(l_Core_0.Style.withStyle);
local v10 = require(l_Parent_0.SelectionImage.withSelectionCursorProvider);
local v11 = require(l_Parent_0.SelectionImage.CursorKind);
local v12 = require(l_Core_0.Control.Interactable);
local v13 = require(l_Core_0.Control.Enum.ControlState);
local v14 = require(l_Parent_0.SelectionCursor.useCursorByType);
local v15 = require(l_Parent_0.SelectionCursor.CursorType);
local v16 = require(l_Parent_1.UIBloxConfig);
local v17 = v6.PureComponent:extend("Cell");
v17.debugProps = v7("debugProps", {
    "controlState"
});
v17.validateProps = v5.strictInterface({
    head = v5.table, 
    tail = v5.optional(v5.table), 
    background = v5.optional(v5.table), 
    layoutOrder = v5.optional(v5.union(v5.integer, v8(v5.number))), 
    size = v5.optional(v5.UDim2), 
    anchorPoint = v5.optional(v5.Vector2), 
    position = v5.optional(v5.UDim2), 
    horizontalPadding = v5.optional(v5.number), 
    selectable = v5.optional(v5.boolean), 
    isDisabled = v5.optional(v5.boolean), 
    userInteractionEnabled = v5.optional(v5.boolean), 
    onStateChanged = v5.optional(v5.callback), 
    onActivated = v5.optional(v5.callback), 
    onTouchTapped = v5.optional(v5.callback), 
    [v17.debugProps.controlState] = v5.optional(v13.isEnumValue), 
    [v6.Change.AbsolutePosition] = v5.optional(v5.callback), 
    [v6.Ref] = v5.optional(v5.union(v5.callback, v5.table)), 
    forwardRef = v5.optional(v5.union(v5.callback, v5.table)), 
    selectionCursor = if not v16.migrateToNewSelectionCursor then nil else v5.optional(v5.any)
});
v17.defaultProps = {
    isDisabled = false, 
    userInteractionEnabled = true, 
    horizontalPadding = 24
};
v17.init = function(v18)
    v18:setState({
        controlState = v13.Initialize
    });
    v18.stateStyleMap = {
        [v13.Default] = "BackgroundDefault", 
        [v13.Hover] = "BackgroundOnHover", 
        [v13.Pressed] = "BackgroundOnPress"
    };
    v18.getBackgroundStyle = function(v19, v20)
        local v21 = v18.stateStyleMap[v19] or v18.stateStyleMap[v13.Default];
        local v22 = {
            Color = v20.Theme[v21].Color, 
            Transparency = v20.Theme[v21].Transparency
        };
        if v19 == v13.Disabled then
            v22.Transparency = 1;
        end;
        return v22;
    end;
    v18.onStateChanged = function(v23, v24)
        v18:setState({
            controlState = v24
        });
        if v18.props.onStateChanged then
            v18.props.onStateChanged(v23, v24);
        end;
    end;
end;
v17.render = function(v25)
    return v9(function(v26)
        return v10(function(v27)
            return v25:renderWithProviders(v26, v27);
        end);
    end);
end;
v17.renderWithProviders = function(v28, v29, v30)
    local l_anchorPoint_0 = v28.props.anchorPoint;
    local l_layoutOrder_0 = v28.props.layoutOrder;
    local l_position_0 = v28.props.position;
    local v34 = v28.props.size or UDim2.fromScale(1, 1);
    local l_head_0 = v28.props.head;
    local l_tail_0 = v28.props.tail;
    local l_background_0 = v28.props.background;
    local v38 = not not l_tail_0 and (v28.props.userInteractionEnabled and true or false);
    local l_isDisabled_0 = v28.props.isDisabled;
    local l_onActivated_0 = v28.props.onActivated;
    local l_onTouchTapped_0 = v28.props.onTouchTapped;
    local v42 = v28.props[v17.debugProps.controlState] or v28.state.controlState;
    local v43 = v28.getBackgroundStyle(v42, v29);
    return v6.createElement(v12, {
        AnchorPoint = l_anchorPoint_0, 
        LayoutOrder = l_layoutOrder_0, 
        Position = l_position_0, 
        Size = v34, 
        BackgroundTransparency = 1, 
        AutoButtonColor = false, 
        Selectable = v28.props.selectable, 
        SelectionImageObject = if not v16.migrateToNewSelectionCursor then v30 and v30(v11.RoundedRectNoInset) else v28.props.selectionCursor, 
        isDisabled = l_isDisabled_0, 
        onStateChanged = v28.onStateChanged, 
        userInteractionEnabled = v38, 
        [v6.Event.Activated] = l_onActivated_0, 
        [v6.Event.TouchTap] = l_onTouchTapped_0, 
        [v6.Change.AbsolutePosition] = v28.props[v6.Change.AbsolutePosition], 
        [v6.Ref] = v28.props.forwardRef
    }, {
        CellBackground = v6.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            ZIndex = -1
        }, {
            Background = l_background_0 or v6.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = v43.Color, 
                BackgroundTransparency = v43.Transparency, 
                BorderSizePixel = 0
            })
        }), 
        CellContent = v6.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            Padding = v6.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v28.props.horizontalPadding), 
                PaddingRight = UDim.new(0, v28.props.horizontalPadding)
            }), 
            CellHead = v6.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.fromScale(0, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                Head = l_head_0
            }), 
            CellTail = not not l_tail_0 and v6.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.fromScale(1, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                Tail = l_tail_0
            }) or nil
        }), 
        DisabledMask = v42 == v13.Disabled and v6.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v43.Color, 
            BackgroundTransparency = 0.5, 
            ZIndex = 100
        }) or nil
    });
end;
return v6.forwardRef(function(v44, v45)
    local v46 = v14(v15.RoundedRectNoInset);
    if v16.migrateToNewSelectionCursor then
        v44 = v4.Dictionary.join({
            selectionCursor = v46
        }, v44);
    end;
    return v6.createElement(v17, v4.Dictionary.join(v44, {
        forwardRef = v45
    }));
end);
