local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Core.Style.withStyle);
return function(v3)
    return v2(function(v4)
        return v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, -3), 
            Size = UDim2.new(1, 0, 0, 3), 
            BorderSizePixel = 1, 
            BackgroundColor3 = v4.Theme.SelectionCursor.Color, 
            BorderColor3 = v4.Theme.SelectionCursor.Color, 
            BackgroundTransparency = v4.Theme.SelectionCursor.Transparency, 
            [v1.Ref] = v3.cursorRef
        });
    end);
end;
