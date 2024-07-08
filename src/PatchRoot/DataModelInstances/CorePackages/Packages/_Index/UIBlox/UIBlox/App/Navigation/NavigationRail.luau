local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Cryo);
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_2.ReactOtter);
local _ = require(l_Parent_0.Style.StyleTypes);
local v7 = require(l_Parent_1.Core.Style.useStyle);
local v8 = require(l_Parent_1.Core.Control.InteractableList);
local v9 = require(l_Parent_0.Navigation.Enum.NavigationRailAlignment);
local v10 = {
    visible = true, 
    isVisible = true, 
    zIndex = 1, 
    position = UDim2.new(0, 0, 0, 0), 
    animationConfig = {
        dampingRatio = 1, 
        frequency = 3
    }
};
return function(v11)
    local v12 = v3.Dictionary.join(v10, v11);
    local v13 = v7();
    local v14, v15 = v5.useAnimatedBinding(0);
    v4.useEffect(function()
        if not v12.isVisible then
            v15(v5.spring(-v12.width, v12.animationConfig));
        else
            v15(v5.spring(0, v12.animationConfig));
        end;
        return nil;
    end, {
        v12.width, 
        v12.isVisible, 
        v12.animationConfig
    });
    local v16 = if v12.alignment == v9.Centered then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Top;
    local v26 = v4.useCallback(function(v17, v18)
        local v21 = v3.List.map(v17, function(v19, v20)
            if not v19.isSecondary then
                return v18(v20);
            else
                return nil;
            end;
        end);
        local v24 = if not v12.hasSecondaryNavigation then nil else v3.List.map(v17, function(v22, v23)
            if not v22.isSecondary then
                return nil;
            else
                return v18(v23);
            end;
        end);
        return v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v12.width, 1, 0), 
            Position = v12.position, 
            Visible = v12.visible
        }, {
            AnimatedNavigationRail = v4.createElement("Frame", {
                Position = v14:map(function(v25)
                    return UDim2.new(0, v25, 0, 0);
                end), 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = if not v12.backgroundColor then v13.Theme.BackgroundUIContrast.Color else v12.backgroundColor.Color, 
                BackgroundTransparency = if not v12.backgroundColor then v13.Theme.BackgroundUIContrast.Transparency else v12.backgroundColor.Transparency, 
                Selectable = false, 
                Visible = v12.visible, 
                ZIndex = v12.zIndex
            }, {
                MainFrame = v4.createElement("Frame", {
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = v16, 
                        Padding = UDim.new(0, v13.Tokens.Global.Space_200)
                    }), 
                    UIPadding = v4.createElement("UIPadding", {
                        PaddingTop = if not not v12.paddings and v12.paddings.Top then UDim.new(0, v12.paddings.Top) else UDim.new(0, v13.Tokens.Global.Space_75), 
                        PaddingBottom = if not not v12.paddings and v12.paddings.Bottom then UDim.new(0, v12.paddings.Bottom) else UDim.new(0, v13.Tokens.Global.Space_75), 
                        PaddingLeft = if not not v12.paddings and v12.paddings.Left then UDim.new(0, v12.paddings.Left) else UDim.new(0, v13.Tokens.Global.Space_75), 
                        PaddingRight = if not not v12.paddings and v12.paddings.Right then UDim.new(0, v12.paddings.Right) else UDim.new(0, v13.Tokens.Global.Space_75)
                    }), 
                    PrimaryItems = v4.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 1
                    }, {
                        v3.Dictionary.join({
                            Layout = v4.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Center
                            })
                        }, v21)
                    }), 
                    CenteredSeondaryItems = if not not v12.hasSecondaryNavigation and v12.alignment == v9.Centered then v4.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 2
                    }, {
                        v3.Dictionary.join({
                            Layout = v4.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Center
                            })
                        }, v24)
                    }) else nil
                }), 
                BottomAlignedSecondaryItems = if not not v12.hasSecondaryNavigation and v12.alignment == v9.Justified then v4.createElement("Frame", {
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    v3.Dictionary.join({
                        Layout = v4.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center
                        })
                    }, v24)
                }) else nil
            })
        });
    end, {
        v16, 
        v12.width, 
        v12.alignment, 
        v12.hasSecondaryNavigation, 
        v12.visible, 
        v12.zIndex, 
        v12.paddings
    });
    local v27;
    v27 = v12.selection and if v12.items[v27] == nil then nil else {
        v27
    };
    return v4.createElement(v8, {
        fillDirection = Enum.FillDirection.Horizontal, 
        horizontalAlignment = Enum.HorizontalAlignment.Left, 
        sortOrder = Enum.SortOrder.LayoutOrder, 
        size = v12.size, 
        itemList = v12.items, 
        selection = v27, 
        itemSize = v12.itemSize, 
        renderItem = v12.renderItem, 
        renderList = v26, 
        onSelectionChanged = v4.useCallback(function(v28)
            local v29 = v12.items[v28[1]];
            if v29 ~= nil and v29.onActivated ~= nil then
                v29.onActivated();
            end;
        end, {
            v12.items
        })
    });
end;
