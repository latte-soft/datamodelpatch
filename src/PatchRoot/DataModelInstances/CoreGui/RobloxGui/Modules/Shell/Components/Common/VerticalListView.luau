local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact);
return function(v1)
    local l_PaddingTop_0 = v1.PaddingTop;
    local l_PaddingBottom_0 = v1.PaddingBottom;
    local l_Spacing_0 = v1.Spacing;
    local l_HorizontalAlignment_0 = v1.HorizontalAlignment;
    local l_ScrollBarThickness_0 = v1.ScrollBarThickness;
    local l_ScrollingEnabled_0 = v1.ScrollingEnabled;
    local v8 = {
        UIPadding = v0.createElement("UIPadding", {
            PaddingTop = l_PaddingTop_0, 
            PaddingBottom = l_PaddingBottom_0
        }), 
        UIListLayout = v0.createElement("UIListLayout", {
            Padding = l_Spacing_0, 
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = l_HorizontalAlignment_0, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        })
    };
    for v9, v10 in pairs(v1.Items) do
        v8[v9] = v10;
    end;
    return v0.createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0), 
        ScrollBarThickness = l_ScrollBarThickness_0, 
        BackgroundTransparency = 1, 
        Selectable = false, 
        ScrollingEnabled = l_ScrollingEnabled_0
    }, v8);
end;
