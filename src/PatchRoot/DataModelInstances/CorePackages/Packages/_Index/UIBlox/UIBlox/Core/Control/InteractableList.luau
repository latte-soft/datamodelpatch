local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.Cryo);
local v5 = require(l_Parent_0.Core.Control.Enum.ControlState);
local v6 = require(script.Parent.InteractableListItem);
local v7 = require(script.Parent.Enum.SelectionMode);
local v8 = v2.PureComponent:extend("InteractableList");
v8.validateProps = v3.strictInterface({
    itemList = v3.table, 
    renderItem = v3.callback, 
    renderList = v3.optional(v3.callback), 
    selection = v3.optional(v3.table), 
    selectionMode = v3.optional(v7.isEnumValue), 
    onSelectionChanged = v3.optional(v3.callback), 
    size = v3.optional(v3.UDim2), 
    position = v3.optional(v3.UDim2), 
    layoutOrder = v3.optional(v3.integer), 
    padding = v3.optional(v3.UDim), 
    fillDirection = v3.optional(v3.enum(Enum.FillDirection)), 
    horizontalAlignment = v3.optional(v3.enum(Enum.HorizontalAlignment)), 
    verticalAlignment = v3.optional(v3.enum(Enum.VerticalAlignment)), 
    sortOrder = v3.optional(v3.enum(Enum.SortOrder)), 
    automaticSize = v3.optional(v3.enum(Enum.AutomaticSize)), 
    itemSize = v3.optional(v3.UDim2)
});
v8.defaultProps = {
    renderList = function(v9, v10, v11)
        local v12 = {
            v2.createElement("UIListLayout", {
                Padding = v11.padding, 
                FillDirection = v11.fillDirection, 
                HorizontalAlignment = v11.horizontalAlignment, 
                VerticalAlignment = v11.verticalAlignment, 
                SortOrder = v11.sortOrder, 
                key = "$layout"
            })
        };
        for v13 in pairs(v9) do
            table.insert(v12, v10(v13));
        end;
        return v2.createElement("Frame", {
            Size = v11.size, 
            Position = v11.position, 
            BackgroundTransparency = 1, 
            AutomaticSize = v11.automaticSize, 
            BorderSizePixel = 0
        }, v12);
    end, 
    size = UDim2.fromScale(1, 1), 
    itemSize = UDim2.fromScale(1, 1), 
    selectionMode = v7.Single
};
v8.init = function(v14)
    local v15 = {
        interactable = {}, 
        selection = {}
    };
    if v14.props.selectionMode == v7.Single then
        local v16 = next(v14.props.itemList);
        if v16 ~= nil then
            v15.selection = {
                v16
            };
        end;
    end;
    v14:setState(v15);
    v14.setInteractableState = function(v17, v18)
        v14:setState(function(v19)
            return {
                interactable = v4.Dictionary.join(v19.interactable, {
                    [v17] = v18
                })
            };
        end);
    end;
    v14.setSelection = function(v20)
        v14:setState({
            selection = v20
        });
    end;
end;
v8.getSelection = function(v21)
    if not v21.props.selection then
        if v21.props.selectionMode == v7.None then
            return {};
        else
            local v23 = v4.List.filter(v21.state.selection, function(v22)
                return v21.props.itemList[v22] ~= nil;
            end);
            if v21.props.selectionMode == v7.Single then
                local v24 = v23[#v23];
                if v24 == nil then
                    v24 = next(v21.props.itemList);
                end;
                if v24 ~= nil then
                    return {
                        v24
                    };
                else
                    return {};
                end;
            else
                return v23;
            end;
        end;
    else
        return v21.props.selection;
    end;
end;
v8.didMount = function(v25)
    if not (not (v25.props.selection == nil) or not v25.props.onSelectionChanged) then
        v25.props.onSelectionChanged(v25:getSelection());
    end;
end;
v8.render = function(v26)
    return v26.props.renderList(v26.props.itemList, function(v27)
        return v2.createElement(v6, {
            id = v27, 
            item = v26.props.itemList[v27], 
            interactableState = v26.state.interactable[v27] or v5.Default, 
            selection = v26:getSelection(), 
            renderItem = v26.props.renderItem, 
            itemSize = not not v26.props.itemList[v27] and v26.props.itemList[v27].itemSize or v26.props.itemSize, 
            selectionMode = v26.props.selectionMode, 
            onSelectionChanged = v26.props.onSelectionChanged, 
            setInteractableState = v26.setInteractableState, 
            setSelection = v26.setSelection, 
            key = tostring(v27)
        });
    end, v26.props);
end;
return v8;
