local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Cryo);
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_2.ReactOtter);
local _ = require(l_Parent_0.Style.StyleTypes);
local v7 = require(l_Parent_1.Core.Style.useStyle);
local v8 = require(l_Parent_1.Core.Control.InteractableList);
local v9 = require(l_Parent_0.Navigation.Enum.NavigationBarAlignment);
local v10 = {
    visible = true, 
    zIndex = 1, 
    position = UDim2.new(0, 0, 0, 0), 
    size = UDim2.new(1, 0, 1, 0), 
    maxWidth = 600, 
    animationConfig = {
        dampingRatio = 1, 
        frequency = 3
    }, 
    showAnimation = false
};
local function v30(v11)
    local v12 = v7();
    local v13, v14 = v4.useState(UDim2.new(0, 0, 0, 0));
    local l_Offset_0 = v11.size.Y.Offset;
    local v16 = if not not v11.paddings and v11.paddings.Top then v11.paddings.Top else v12.Tokens.Global.Space_75;
    local v17 = if not not v11.paddings and v11.paddings.Bottom then v11.paddings.Bottom else v12.Tokens.Global.Space_75;
    local v18 = if not not v11.paddings and v11.paddings.Left then v11.paddings.Left else v12.Tokens.Global.Space_75;
    local v19 = if not not v11.paddings and v11.paddings.Right then v11.paddings.Right else v12.Tokens.Global.Space_75;
    local v21 = v4.useCallback(function(v20)
        if v11.alignment == v9.EvenlyDistributed then
            v14(UDim2.new(0, ((if v11.maxWidth < v20.AbsoluteSize.X then v11.maxWidth else v20.AbsoluteSize.X - v18) - v19) / #v11.items, v11.size.Y.Scale, (l_Offset_0 - v16) - v17));
        end;
    end, {
        v12, 
        l_Offset_0, 
        v16, 
        v17, 
        v18, 
        v19, 
        v11.maxWidth, 
        v11.alignment, 
        v11.size, 
        v11.items
    });
    local v22, v23 = v5.useAnimatedBinding(0);
    v4.useEffect(function()
        if not v11.isVisible then
            v23(v5.spring(l_Offset_0, v11.animationConfig));
        else
            v23(v5.spring(0, v11.animationConfig));
        end;
        return nil;
    end, {
        l_Offset_0, 
        v11.isVisible, 
        v11.animationConfig
    });
    local v29 = v4.useCallback(function(v24, v25)
        return v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_Offset_0), 
            Position = v11.position, 
            [v4.Change.AbsoluteSize] = v21
        }, {
            AnimatedNavigationBar = v4.createElement("Frame", {
                Position = v22:map(function(v26)
                    return UDim2.new(0, 0, 0, v26);
                end), 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = if not v11.backgroundColor then v12.Theme.BackgroundUIContrast.Color else v11.backgroundColor.Color, 
                BackgroundTransparency = if not v11.backgroundColor then v12.Theme.BackgroundUIContrast.Transparency else v11.backgroundColor.Transparency, 
                Selectable = false, 
                Visible = v11.visible, 
                ZIndex = v11.zIndex
            }, {
                Layout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                InnerFrame = v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0)
                }, v3.Dictionary.join({
                    Constraint = v4.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v11.maxWidth, l_Offset_0)
                    }), 
                    UIPadding = v4.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v16), 
                        PaddingBottom = UDim.new(0, v17), 
                        PaddingLeft = UDim.new(0, v18), 
                        PaddingRight = UDim.new(0, v19)
                    }), 
                    Layout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    })
                }, (v3.List.map(v24, function(_, v28)
                    return v25(v28);
                end))))
            })
        });
    end, {
        v12, 
        l_Offset_0, 
        v16, 
        v17, 
        v18, 
        v19, 
        v11.maxWidth, 
        v11.visible, 
        v11.zIndex
    });
    if v11.alignment == v9.Left then
        return {
            itemSize = UDim2.fromScale(0, 0), 
            automaticSize = Enum.AutomaticSize.X, 
            padding = v11.spacing, 
            renderList = if not v11.showAnimation then nil else v29
        };
    elseif v11.alignment == v9.EvenlyDistributed then
        return {
            itemSize = v13, 
            renderList = if not v11.showAnimation then nil else v29
        };
    else
        error("NavigationBar Alignment type is incorrect");
        return ;
    end;
end;
return function(v31)
    assert(#v31.items > 0, "At least one item should be present");
    local v32 = v3.Dictionary.join(v10, v31);
    local v33 = v30(v32);
    local v34;
    v34 = v32.selection and if v32.items[v34] == nil then nil else {
        v34
    };
    return v4.createElement(v8, v3.Dictionary.join({
        fillDirection = Enum.FillDirection.Horizontal, 
        horizontalAlignment = Enum.HorizontalAlignment.Left, 
        verticalAlignment = Enum.VerticalAlignment.Center, 
        sortOrder = Enum.SortOrder.LayoutOrder, 
        size = v32.size, 
        itemList = v32.items, 
        selection = v34, 
        renderItem = v32.renderItem, 
        onSelectionChanged = v4.useCallback(function(v35)
            local v36 = v32.items[v35[1]];
            if v36 ~= nil and v36.onActivated ~= nil then
                v36.onActivated();
            end;
        end, {
            v32.items
        })
    }, v33));
end;
