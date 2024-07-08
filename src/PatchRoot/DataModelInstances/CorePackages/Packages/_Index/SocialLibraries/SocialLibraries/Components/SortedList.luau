local l_Roact_0 = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact;
local v1 = l_Roact_0.PureComponent:extend("SortedList");
v1.defaultProps = {
    entries = {}, 
    renderEntry = nil, 
    entryHeight = 48, 
    sortComparator = function(_, _)
        return true;
    end, 
    LayoutOrder = 0
};
v1.sortEntries = function(v4)
    local v5 = {};
    for _, v7 in pairs(v4.props.entries) do
        table.insert(v5, v7);
    end;
    table.sort(v5, v4.props.sortComparator);
    return v5;
end;
v1.render = function(v8)
    local v9 = v8:sortEntries();
    local v10 = {
        layout = l_Roact_0.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    for v11, v12 in pairs(v9) do
        table.insert(v10, l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v8.props.entryHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = v11
        }, {
            entry = v8.props.renderEntry(v12, v11 == #v9)
        }));
    end;
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, #v8.props.entries * v8.props.entryHeight), 
        BackgroundTransparency = 1, 
        LayoutOrder = v8.props.LayoutOrder
    }, v10);
end;
return v1;
