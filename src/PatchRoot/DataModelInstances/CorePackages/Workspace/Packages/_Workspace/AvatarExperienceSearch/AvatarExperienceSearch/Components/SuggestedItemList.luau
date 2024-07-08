local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Components.SuggestedItem);
local v3 = require(l_script_FirstAncestor_0.Components.Divider);
return function(v4)
    return v1.createElement("ScrollingFrame", {
        BorderSizePixel = 0, 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        CanvasSize = UDim2.fromScale(1, 1), 
        ScrollBarThickness = 0, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        Size = UDim2.fromScale(1, 1)
    }, (v1.useMemo(function()
        local v5 = {
            Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            })
        };
        for v6, v7 in ipairs(v4.items) do
            v5[("SuggestedItem%*"):format(v6)] = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = v6
            }, {
                ItemLayout = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                Item = v1.createElement(v2, {
                    text = v7.text, 
                    type = v7.type, 
                    onActivate = v7.onActivate, 
                    onTrailingButtonActivate = v7.onRemove, 
                    layoutOrder = 0
                }), 
                Divider = if v6 < #v4.items then v1.createElement(v3, {
                    layoutOrder = 1
                }) else nil
            });
        end;
        return v5;
    end, {
        v4.items
    })));
end;
