local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.RoactGamepad);
local v3 = require(l_Parent_0.Utility.isCallable);
local v4 = require(l_Parent_1.Roact);
local v5 = require(l_Parent_1.Cryo);
local v6 = require(l_Parent_1.t);
local v7 = require(l_Parent_0.Utility.isPositiveVector2);
local v8 = v4.PureComponent:extend("GridView");
v8.validateProps = v6.strictInterface({
    renderItem = v3, 
    itemSize = v7, 
    itemPadding = v6.Vector2, 
    items = v6.table, 
    maxHeight = v6.numberMin(0), 
    windowHeight = v6.optional(v6.numberMin(0)), 
    LayoutOrder = v6.optional(v6.integer), 
    onWidthChanged = v6.optional(v3), 
    onNumItemsPerRowChanged = v6.optional(v3), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    frameRef = v6.optional(v6.table), 
    restorePreviousChildFocus = v6.optional(v6.boolean), 
    onFocusGained = v6.optional(v6.callback), 
    defaultChildIndex = v6.optional(v6.numberMin(1))
});
v8.itemsAreVisible = function(v9)
    local l_isInDataModel_0 = v9.state.isInDataModel;
    if l_isInDataModel_0 then
        l_isInDataModel_0 = false;
        if v9.state.containerWidth ~= 0 then
            l_isInDataModel_0 = v9.props.itemSize.X ~= 0;
        end;
    end;
    return l_isInDataModel_0;
end;
v8.defaultProps = {
    maxHeight = math.huge, 
    restorePreviousChildFocus = true
};
v8.init = function(v11)
    v11.currentItemsPerRow = -1;
    v11.frameRef = v4.createRef();
    v11.isMounted = false;
    v11.state = {
        containerWidth = 0, 
        containerYPosition = 0, 
        isInDataModel = false
    };
    v11.focusableRefs = v2.createRefCache();
    v11.onAncestryChanged = function(v12)
        if v12:IsDescendantOf(game) then
            v11:setState(function(v13)
                if not v13.isInDataModel or v13.containerWidth ~= v12.AbsoluteSize.X then
                    return {
                        isInDataModel = true, 
                        containerWidth = v12.AbsoluteSize.X
                    };
                else
                    return nil;
                end;
            end);
        end;
    end;
end;
v8.render = function(v14)
    local l_items_0 = v14.props.items;
    local v16 = #l_items_0;
    local l_itemSize_0 = v14.props.itemSize;
    local l_itemPadding_0 = v14.props.itemPadding;
    local l_maxHeight_0 = v14.props.maxHeight;
    local l_containerWidth_0 = v14.state.containerWidth;
    local l_containerYPosition_0 = v14.state.containerYPosition;
    local l_defaultChildIndex_0 = v14.props.defaultChildIndex;
    local l_onNumItemsPerRowChanged_0 = v14.props.onNumItemsPerRowChanged;
    local v24 = 1;
    local l_v16_0 = v16;
    local v26 = {};
    local v27 = 0;
    local v28 = 0;
    local v29 = nil;
    local v30 = nil;
    local v31 = math.max(1, l_itemSize_0.X + l_itemPadding_0.X);
    local v32 = math.max(1, l_itemSize_0.Y + l_itemPadding_0.Y);
    v29 = math.floor((l_containerWidth_0 + l_itemPadding_0.X) / v31);
    v30 = math.floor((l_maxHeight_0 + l_itemPadding_0.Y) / v32);
    if v29 ~= v14.currentItemsPerRow then
        v14.currentItemsPerRow = v29;
        if l_onNumItemsPerRowChanged_0 then
            l_onNumItemsPerRowChanged_0(v29);
        end;
    end;
    local v33 = math.min(v30, (math.ceil(v16 / v29)));
    local v34 = v33 * l_itemSize_0.Y + math.max(v33 - 1, 0) * l_itemPadding_0.Y;
    if v14.props.windowHeight ~= nil then
        local v35 = math.floor((v14.props.windowHeight + l_itemPadding_0.Y) / (l_itemSize_0.Y + l_itemPadding_0.Y)) + 2;
        local v36 = math.floor((l_containerYPosition_0 + l_itemPadding_0.Y) / (l_itemSize_0.Y + l_itemPadding_0.Y));
        local v37 = math.min(v33, v36 + v35) + 1;
        v24 = math.max(1, v36 * v29 + 1);
        l_v16_0 = math.min(v16, v37 * v29);
        v28 = v36 * l_itemSize_0.Y + v36 * l_itemPadding_0.Y;
    end;
    local function _(v38, v39)
        local v40 = false;
        if v38 > 0 then
            v40 = false;
            if v39 > 0 then
                v40 = v39 <= v29;
            end;
        end;
        local v41 = 1 + ((v38 - 1) * v29 + (v39 - 1));
        local v42 = false;
        if v24 <= v41 then
            v42 = v41 <= l_v16_0;
        end;
        return (not not v42 and v40) and v14.focusableRefs[v41] or nil;
    end;
    local function v55(v44)
        local v45 = 1 + math.floor((v44 - 1) / v29);
        local v46 = 1 + (v44 - 1) % v29;
        local v47 = v14:itemsAreVisible();
        local l_createElement_0 = v4.createElement;
        local l_Frame_0 = v2.Focusable.Frame;
        local v50 = {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, v27, 0, v28), 
            Size = UDim2.new(0, l_itemSize_0.X, 0, l_itemSize_0.Y)
        };
        local v51 = v46 - 1;
        local v52 = false;
        if v45 > 0 then
            v52 = false;
            if v51 > 0 then
                v52 = v51 <= v29;
            end;
        end;
        local v53 = 1 + ((v45 - 1) * v29 + (v51 - 1));
        local v54 = false;
        if v24 <= v53 then
            v54 = v53 <= l_v16_0;
        end;
        v50.NextSelectionLeft = (not not v54 and v52) and v14.focusableRefs[v53] or nil;
        v51 = v46 + 1;
        v52 = false;
        if v45 > 0 then
            v52 = false;
            if v51 > 0 then
                v52 = v51 <= v29;
            end;
        end;
        v53 = 1 + ((v45 - 1) * v29 + (v51 - 1));
        v54 = false;
        if v24 <= v53 then
            v54 = v53 <= l_v16_0;
        end;
        v50.NextSelectionRight = (not not v54 and v52) and v14.focusableRefs[v53] or nil;
        v51 = v45 - 1;
        v52 = false;
        if v51 > 0 then
            v52 = false;
            if v46 > 0 then
                v52 = v46 <= v29;
            end;
        end;
        v53 = 1 + ((v51 - 1) * v29 + (v46 - 1));
        v54 = false;
        if v24 <= v53 then
            v54 = v53 <= l_v16_0;
        end;
        v50.NextSelectionUp = (not not v54 and v52) and v14.focusableRefs[v53] or nil;
        v51 = v45 + 1;
        v52 = false;
        if v51 > 0 then
            v52 = false;
            if v46 > 0 then
                v52 = v46 <= v29;
            end;
        end;
        v53 = 1 + ((v51 - 1) * v29 + (v46 - 1));
        v54 = false;
        if v24 <= v53 then
            v54 = v53 <= l_v16_0;
        end;
        v50.NextSelectionDown = (not not v54 and v52) and v14.focusableRefs[v53] or nil;
        v50[v4.Ref] = v14.focusableRefs[v44];
        v50.onFocusGained = v14.props.onFocusGained;
        return l_createElement_0(l_Frame_0, v50, {
            Content = v47 and v14.props.renderItem(l_items_0[v44], v44)
        });
    end;
    if v34 < l_maxHeight_0 then
        local v56 = false;
        local v57 = l_defaultChildIndex_0 and l_defaultChildIndex_0 <= v16;
        for v58 = v24, l_v16_0 do
            if v58 == l_defaultChildIndex_0 then
                v56 = true;
            end;
            v26[tostring(v58)] = v55(v58);
            v27 = math.floor((v27 + l_itemSize_0.X) + l_itemPadding_0.X);
            if l_containerWidth_0 < v27 + l_itemSize_0.X and v58 < l_v16_0 then
                v27 = 0;
                v28 = (v28 + l_itemPadding_0.Y) + l_itemSize_0.Y;
            end;
        end;
        if not (not v57 or v56) then
            v27 = ((l_defaultChildIndex_0 - 1) % v29) * (l_itemSize_0.X + l_itemPadding_0.X);
            v28 = math.floor((l_defaultChildIndex_0 - 1) / v29) * (l_itemPadding_0.Y + l_itemSize_0.Y);
            v26[tostring(l_defaultChildIndex_0)] = v55(l_defaultChildIndex_0);
        end;
    end;
    return v4.createElement(v2.Focusable.Frame, {
        BackgroundTransparency = 1, 
        LayoutOrder = v14.props.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v34), 
        [v4.Change.AbsolutePosition] = v14.props.windowHeight ~= nil and function(v59)
            if v14.isMounted then
                v14:setState({
                    containerYPosition = -math.min(0, v59.AbsolutePosition.Y)
                });
            end;
        end or nil, 
        [v4.Change.AbsoluteSize] = function(v60)
            if v14.isMounted then
                if v14.state.isInDataModel then
                    v14:setState({
                        containerWidth = v60.AbsoluteSize.X
                    });
                end;
                if v14.props.onWidthChanged ~= nil then
                    v14.props.onWidthChanged(v60.AbsoluteSize.X);
                end;
            end;
        end, 
        [v4.Event.AncestryChanged] = v14.onAncestryChanged, 
        NextSelectionLeft = v14.props.NextSelectionLeft, 
        NextSelectionRight = v14.props.NextSelectionRight, 
        NextSelectionUp = v14.props.NextSelectionUp, 
        NextSelectionDown = v14.props.NextSelectionDown, 
        [v4.Ref] = v14.props.frameRef or v14.frameRef, 
        defaultChild = not not l_defaultChildIndex_0 and v14.focusableRefs[l_defaultChildIndex_0] or nil, 
        restorePreviousChildFocus = v14.props.restorePreviousChildFocus
    }, v26);
end;
v8.didMount = function(v61)
    v61.isMounted = true;
    local v62 = v61.props.frameRef or v61.frameRef;
    if v62:getValue() and v62:getValue().AbsoluteSize.X ~= 0 then
        if v62:getValue():IsDescendantOf(game) then
            v61:setState(function(_)
                if not v62:getValue() then
                    return nil;
                else
                    return {
                        isInDataModel = true, 
                        containerWidth = v62:getValue().AbsoluteSize.X
                    };
                end;
            end);
        end;
        if v61.props.onWidthChanged ~= nil then
            delay(0, function()
                if v62:getValue() then
                    v61.props.onWidthChanged(v62:getValue().AbsoluteSize.X);
                end;
            end);
        end;
    end;
end;
v8.willUnmount = function(v64)
    v64.isMounted = false;
end;
return v4.forwardRef(function(v65, v66)
    return v4.createElement(v8, v5.Dictionary.join(v65, {
        frameRef = v66
    }));
end);
