local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.RoactGamepad);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_1.App.SelectionImage.withSelectionCursorProvider);
local v8 = require(l_Parent_1.App.SelectionImage.CursorKind);
local v9 = require(l_Parent_0.SelectionCursor.withCursor);
local v10 = require(l_Parent_0.SelectionCursor.CursorType);
local v11 = require(l_Parent_1.UIBloxConfig);
local v12 = require(l_Parent_1.App.Cell.Small.SelectionGroup.SmallRadioButtonCell);
local v13 = v3.PureComponent:extend("SmallRadioButtonGroup");
v13.validateProps = v6.strictInterface({
    items = v6.optional(v6.array(v6.tuple((v6.strictInterface({
        text = v6.string, 
        id = v6.string, 
        isDisabled = v6.optional(v6.boolean)
    }))))), 
    selectedValue = v6.optional(v6.string), 
    onActivated = v6.callback, 
    layoutOrder = v6.optional(v6.number), 
    useDefaultControlState = v6.optional(v6.boolean), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    frameRef = v6.optional(v6.table)
});
v13.defaultProps = {
    selectedValue = nil
};
v13.init = function(v14)
    v14.gamepadRefs = v5.createRefCache();
end;
v13.render = function(v15)
    assert(v15.validateProps(v15.props));
    local v16 = {
        layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 1)
        })
    };
    for v17, v18 in ipairs(v15.props.items) do
        if not v11.migrateToNewSelectionCursor then
            v16["smallRadioButtonCell" .. v18.id] = v7(function(v19)
                return v3.createElement(v5.Focusable[v12], {
                    id = v18.id, 
                    text = v18.text, 
                    onActivated = v15.props.onActivated, 
                    isSelected = v15.props.selectedValue == v18.id, 
                    isDisabled = v18.isDisabled, 
                    layoutOrder = v17, 
                    useDefaultControlState = v15.props.useDefaultControlState, 
                    [v3.Ref] = v15.gamepadRefs[v17], 
                    NextSelectionUp = v17 > 1 and v15.gamepadRefs[v17 - 1] or nil, 
                    NextSelectionDown = v17 < #v15.props.items and v15.gamepadRefs[v17 + 1] or nil, 
                    SelectionImageObject = v19(v8.SelectionCell)
                });
            end);
        else
            v16["smallRadioButtonCell" .. v18.id] = v9(function(v20)
                return v3.createElement(v5.Focusable[v12], {
                    id = v18.id, 
                    text = v18.text, 
                    onActivated = v15.props.onActivated, 
                    isSelected = v15.props.selectedValue == v18.id, 
                    isDisabled = v18.isDisabled, 
                    layoutOrder = v17, 
                    useDefaultControlState = v15.props.useDefaultControlState, 
                    [v3.Ref] = v15.gamepadRefs[v17], 
                    NextSelectionUp = v17 > 1 and v15.gamepadRefs[v17 - 1] or nil, 
                    NextSelectionDown = v17 < #v15.props.items and v15.gamepadRefs[v17 + 1] or nil, 
                    SelectionImageObject = v20.getCursorByType(v10.SelectionCell)
                });
            end);
        end;
    end;
    local v21 = v15.props.items and #v15.props.items > 0;
    return v3.createElement(not not v21 and v5.Focusable.Frame or "Frame", {
        defaultChild = not not v21 and v15.gamepadRefs[1] or nil, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v15.props.layoutOrder, 
        NextSelectionLeft = v15.props.NextSelectionLeft, 
        NextSelectionRight = v15.props.NextSelectionRight, 
        NextSelectionDown = v15.props.NextSelectionDown, 
        NextSelectionUp = v15.props.NextSelectionUp, 
        [v3.Ref] = v15.props.frameRef
    }, v16);
end;
return v3.forwardRef(function(v22, v23)
    return v3.createElement(v13, v4.Dictionary.join(v22, {
        frameRef = v23
    }));
end);
