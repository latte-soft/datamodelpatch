local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_Modules_0.LuaApp.FitChildren);
local v5 = v3.PureComponent:extend("ItemListLayout");
local v6 = {
    [v4.FitAxis.Height] = UDim2.new(1, 0, 0, 0), 
    [v4.FitAxis.Width] = UDim2.new(0, 0, 1, 0), 
    [v4.FitAxis.Both] = UDim2.new(0, 0, 0, 0)
};
local function v8(v7)
    return v3.createElement(v4.FitFrame, {
        Size = v7.size, 
        LayoutOrder = v7.layoutOrder, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        fitAxis = v7.fitAxis
    }, {
        RenderedItem = v7.renderItem
    });
end;
v5.render = function(v9)
    local v10 = v9.props.renderItemList or {};
    local l_fitAxis_0 = v9.props.fitAxis;
    local v12 = v9.props.size or v6[l_fitAxis_0];
    local v13 = {
        ListLayout = v3.createElement("UIListLayout", (v2.Dictionary.join(v9.props, {
            renderItemList = v2.None, 
            fitAxis = v2.None, 
            size = v2.None, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })))
    };
    for v14, v15 in ipairs(v10) do
        v13["Item" .. v14] = v8({
            layoutOrder = v14, 
            fitAxis = l_fitAxis_0, 
            size = v12, 
            renderItem = v15
        });
    end;
    return v3.createElement(v4.FitFrame, {
        Size = v12, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        fitAxis = l_fitAxis_0
    }, v13);
end;
return v5;
