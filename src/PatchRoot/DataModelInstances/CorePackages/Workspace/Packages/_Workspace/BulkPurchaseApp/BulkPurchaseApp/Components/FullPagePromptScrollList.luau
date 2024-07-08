local l_Parent_0 = script:FindFirstAncestor("BulkPurchaseApp").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useCursor_0 = require(l_Parent_0.UIBlox).App.SelectionCursor.useCursor;
return function(v4)
    local v5 = l_useDesignTokens_0();
    local v6 = l_useCursor_0(UDim.new(0, v5.Semantic.Radius.Small), v5.Global.Space_100);
    local l_Space_175_0 = v5.Global.Space_175;
    local v8, v9 = v1.useBinding(false);
    return v1.createElement("ScrollingFrame", {
        LayoutOrder = v4.LayoutOrder, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Size = v4.size, 
        ScrollBarThickness = v5.Global.Size_50, 
        ScrollBarImageColor3 = v5.Semantic.Color.Ui.Emphasis.Color3, 
        ScrollBarImageTransparency = v5.Semantic.Color.Ui.Emphasis.Transparency, 
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        CanvasSize = UDim2.new(1, -l_Space_175_0, 0, 0), 
        SelectionImageObject = v6, 
        Selectable = v8, 
        [v1.Change.AbsoluteCanvasSize] = function(v10)
            v9(v10.AbsoluteWindowSize.Y < v10.AbsoluteCanvasSize.Y);
        end
    }, v1.createElement("UIPadding", {
        PaddingRight = UDim.new(0, l_Space_175_0)
    }), v1.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = UDim.new(0, v5.Global.Space_300)
    }), v4.children);
end;
