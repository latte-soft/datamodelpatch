local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_UIBlox_0 = l_Parent_0.UIBlox;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactGamepad);
local v4 = require(l_Parent_0.t);
local v5 = require(script.Parent.RadioButton);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider);
local v8 = require(l_UIBlox_0.App.SelectionImage.CursorKind);
local v9 = require(l_UIBlox_0.App.SelectionCursor.withCursor);
local v10 = require(l_UIBlox_0.App.SelectionCursor.CursorType);
local v11 = require(l_UIBlox_0.UIBloxConfig);
local v12 = v2.PureComponent:extend("RadioButtonList");
v12.validateProps = v4.strictInterface({
    radioButtons = v4.array(v4.union(v4.string, (v4.strictInterface({
        label = v4.string, 
        isDisabled = v4.optional(v4.boolean)
    })))), 
    onActivated = v4.callback, 
    elementSize = v4.UDim2, 
    initialValue = v4.optional(v4.number), 
    currentValue = v4.optional(v4.number), 
    layoutOrder = v4.optional(v4.number), 
    padding = v4.optional(v4.UDim), 
    automaticSize = v4.optional(v4.boolean), 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    forwardRef = v4.optional(v4.table)
});
v12.init = function(v13)
    v13.state = {
        currentValue = v13.props.initialValue or 0
    };
    local v14 = {};
    for v15, v16 in ipairs(v13.props.radioButtons) do
        v14[v15] = type(v16) == "table" and (v16.isDisabled or false);
    end;
    v13.state.disabledIndices = v14;
    v13.doLogic = function(v17)
        if not v13.state.disabledIndices[v17] then
            v13:setState({
                currentValue = v17
            });
            v13.props.onActivated(v17);
            return ;
        else
            return ;
        end;
    end;
    v13.gamepadRefs = v3.createRefCache();
end;
v12.renderWithProviders = function(v18, v19, v20)
    local v21 = {
        layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = v18.props.padding
        })
    };
    for v22, v23 in ipairs(v18.props.radioButtons) do
        v21["RadioButton" .. v22] = v2.createElement(v3.Focusable[v5], {
            text = type(v23) == "table" and v23.label or v23, 
            isSelected = if v18.props.currentValue ~= nil then v22 == v18.props.currentValue else v22 == v18.state.currentValue, 
            isDisabled = v18.state.disabledIndices[v22], 
            onActivated = v18.doLogic, 
            size = v18.props.elementSize, 
            layoutOrder = v22, 
            id = v22, 
            [v2.Ref] = v18.gamepadRefs[v22], 
            NextSelectionUp = v22 > 1 and v18.gamepadRefs[v22 - 1] or nil, 
            NextSelectionDown = v22 < #v18.props.radioButtons and v18.gamepadRefs[v22 + 1] or nil, 
            SelectionImageObject = if not v11.migrateToNewSelectionCursor then v19(v8.RoundedRect) else v20, 
            inputBindings = {
                OnActivatedButton = v3.Input.onBegin(Enum.KeyCode.ButtonA, function()
                    v18.doLogic(v22);
                end)
            }
        });
    end;
    return v2.createElement(v3.Focusable.Frame, {
        Size = if not v18.props.automaticSize then UDim2.fromScale(1, 1) else UDim2.fromScale(1, 0), 
        AutomaticSize = if not v18.props.automaticSize then nil else Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v18.props.layoutOrder, 
        NextSelectionLeft = v18.props.NextSelectionLeft, 
        NextSelectionRight = v18.props.NextSelectionRight, 
        NextSelectionDown = v18.props.NextSelectionDown, 
        NextSelectionUp = v18.props.NextSelectionUp, 
        [v2.Ref] = v18.props.forwardRef
    }, v21);
end;
v12.render = function(v24)
    return v7(function(v25)
        if not v11.migrateToNewSelectionCursor then
            return v24:renderWithProviders(v25);
        else
            return v9(function(v26)
                return v24:renderWithProviders(v25, (v26.getCursorByType(v10.RoundedRect)));
            end);
        end;
    end);
end;
return v2.forwardRef(function(v27, v28)
    return v2.createElement(v12, v6.Dictionary.join(v27, {
        forwardRef = v28
    }));
end);
