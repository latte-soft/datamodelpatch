local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v4 = require(l_Parent_0.Core.Style.useStyle);
local v5 = require(script.Parent.Constants);
local _ = require(script.Parent.Types);
return function(v7, v8)
    local v9 = v4();
    return v2.createElement("Frame", {
        Size = if not v7.size then UDim2.new(1, 0, 1, 0) else v7.size, 
        AutomaticSize = v7.automaticSize, 
        BackgroundTransparency = 1, 
        LayoutOrder = 1
    }, {
        RoundedBackgroundWithTopAlignedToContent = if not v7.showRoundedBackground then nil else v2.createElement("Frame", {
            Size = v7.roundedBackgroundSize or UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v7.roundedBackgroundTransparency or 1, 
            BackgroundColor3 = v7.roundedBackgroundColor or v9.Theme.BackgroundUIDefault.Color, 
            Position = v7.roundedBackgroundPosition or UDim2.fromOffset(0, 0), 
            ZIndex = 1
        }, {
            Corner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }), 
        Overlay = if not v7.showOverlay then nil else v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v9.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = v5.ICON_TAB_PRESSED_TRANSPARENCY, 
            ZIndex = 3
        }, {
            Corner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }), 
        Content = v2.createElement("Frame", {
            Size = if not v7.size then UDim2.new(1, 0, 1, 0) else v7.size, 
            AutomaticSize = v7.automaticSize, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            ZIndex = 2
        }, l_Object_0.assign({}, {
            Layout = v2.createElement("UIListLayout", l_Object_0.assign({}, {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v7.spacing or 0)
            })), 
            Padding = if not v7.padding then nil else v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v7.padding.left or 0), 
                PaddingRight = UDim.new(0, v7.padding.right or 0), 
                PaddingTop = UDim.new(0, v7.padding.top or 0), 
                PaddingBottom = UDim.new(0, v7.padding.bottom or 0)
            })
        }, v8))
    });
end;
