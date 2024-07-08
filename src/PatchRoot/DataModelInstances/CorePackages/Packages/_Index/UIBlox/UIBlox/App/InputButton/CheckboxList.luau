local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.Checkbox);
local v5 = v1.PureComponent:extend("CheckboxList");
v5.validateProps = v2.strictInterface({
    checkboxes = v2.array(v2.union(v2.string, (v2.strictInterface({
        label = v2.string, 
        isSelected = v2.optional(v2.boolean), 
        isDisabled = v2.optional(v2.boolean)
    })))), 
    onActivated = v2.callback, 
    elementSize = v2.UDim2, 
    atMost = v2.optional(v2.number), 
    layoutOrder = v2.optional(v2.number)
});
local _ = function(v6)
    local v7 = 0;
    for _, v9 in pairs(v6) do
        if v9 then
            v7 = v7 + 1;
        end;
    end;
    return v7;
end;
v5.init = function(v11)
    local v12 = v11.props.atMost or #v11.props.checkboxes;
    local v13 = {};
    local v14 = {};
    for v15, v16 in ipairs(v11.props.checkboxes) do
        if type(v16) == "table" then
            v13[v15] = v16.isSelected or false;
            v14[v15] = v16.isDisabled or false;
        end;
    end;
    local v17 = 0;
    for _, v19 in pairs(v13) do
        if v19 then
            v17 = v17 + 1;
        end;
    end;
    assert(v17 < v12, "number of 'isSelected' must be less than atMost");
    v11.state = {
        selectedIndices = v13, 
        disabledIndices = v14
    };
    v11.doLogic = function(v20)
        local l_v11_0 = v11;
        local v22 = {};
        local l_join_0 = v3.Dictionary.join;
        local l_selectedIndices_0 = v11.state.selectedIndices;
        local v25 = {};
        local v26 = not v11.state.selectedIndices[v20];
        if v26 then
            local l_selectedIndices_1 = v11.state.selectedIndices;
            local v28 = 0;
            for _, v30 in pairs(l_selectedIndices_1) do
                if v30 then
                    v28 = v28 + 1;
                end;
            end;
            v26 = v28 < v12;
        end;
        v25[v20] = v26;
        v22.selectedIndices = l_join_0(l_selectedIndices_0, v25);
        l_v11_0:setState(v22);
        v11.props.onActivated(v11.state.selectedIndices);
    end;
end;
v5.render = function(v31)
    local v32 = {
        layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    for v33, v34 in ipairs(v31.props.checkboxes) do
        v32["Checkbox" .. v33] = v1.createElement(v4, {
            text = type(v34) == "table" and v34.label or v34, 
            isSelected = v31.state.selectedIndices[v33], 
            isDisabled = v31.state.disabledIndices[v33], 
            onActivated = function()
                v31.doLogic(v33);
            end, 
            size = v31.props.elementSize, 
            layoutOrder = v33
        });
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v31.props.layoutOrder
    }, v32);
end;
return v5;
