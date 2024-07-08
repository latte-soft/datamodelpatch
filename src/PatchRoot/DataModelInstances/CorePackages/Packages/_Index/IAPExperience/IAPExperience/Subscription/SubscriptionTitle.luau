local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.UIBlox);
local v2 = require(l_Parent_0.React);
local l_withStyle_0 = v1.Style.withStyle;
local l_ImageSetLabel_0 = v1.Core.ImageSet.ImageSetLabel;
local v5 = require(l_Parent_0.Roact);
local v6 = require(l_Parent_0.t);
local v7 = v5.PureComponent:extend("SubscriptionTitle");
v7.validateProps = v6.strictInterface({
    name = v6.string, 
    displayPrice = v6.string, 
    subscriptionProviderName = v6.string, 
    period = v6.string, 
    disclaimerText = v6.string, 
    layoutOrder = v6.number, 
    contentHeight = v6.number, 
    itemIcon = v6.any
});
local function _(v8, v9)
    return l_withStyle_0(function(v10)
        local l_Theme_0 = v10.Theme;
        local l_Font_0 = v10.Font.Body.Font;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v8.layoutOrder
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = not not v9 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 8)
            })
        }, {
            AppName = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 20), 
                BackgroundTransparency = 1, 
                Text = v8.subscriptionProviderName, 
                TextSize = 16, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                Font = l_Font_0, 
                TextXAlignment = not not v9 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                TextWrapped = true, 
                LayoutOrder = v8.layoutOrder
            })
        }, {
            Title = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 20), 
                BackgroundTransparency = 1, 
                Text = v8.name, 
                TextSize = 20, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                Font = l_Font_0, 
                TextXAlignment = not not v9 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                TextWrapped = true, 
                LayoutOrder = v8.layoutOrder + 1
            })
        }, {
            PriceFrame = v2.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundColor3 = Color3.fromRGB(255, 0, 0), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v8.layoutOrder + 2
            }, {
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = not not v9 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Horizontal
                }), 
                Price = v2.createElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 16), 
                    BackgroundTransparency = 1, 
                    Text = v8.displayPrice, 
                    TextSize = 16, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    Font = l_Font_0, 
                    RichText = true, 
                    TextXAlignment = not not v9 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                    TextWrapped = true, 
                    LayoutOrder = v8.layoutOrder + 1, 
                    AutomaticSize = Enum.AutomaticSize.X
                }), 
                Period = v2.createElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 16), 
                    BackgroundTransparency = 1, 
                    Text = v8.period, 
                    TextSize = 16, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    Font = l_Font_0, 
                    RichText = true, 
                    TextXAlignment = not not v9 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                    TextWrapped = true, 
                    LayoutOrder = v8.layoutOrder + 1, 
                    AutomaticSize = Enum.AutomaticSize.X
                })
            })
        }, {
            DisclaimerText = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 16), 
                BackgroundTransparency = 1, 
                Text = v8.disclaimerText, 
                TextSize = 16, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                Font = l_Font_0, 
                TextXAlignment = not not v9 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                TextWrapped = true, 
                LayoutOrder = v8.layoutOrder + 3
            })
        });
    end);
end;
local function v24(v14)
    local l_createElement_0 = v2.createElement;
    local v16 = "Frame";
    local v17 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 1
    };
    local v18 = {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 24)
        }), 
        Icon = v2.createElement(l_ImageSetLabel_0, {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 96, 0, 96), 
            ScaleType = Enum.ScaleType.Fit, 
            AutomaticSize = Enum.AutomaticSize.X, 
            Image = v14.itemIcon
        })
    };
    local l_l_withStyle_0_0 = l_withStyle_0;
    local v20 = true;
    v18.SubscriptionInfo = l_l_withStyle_0_0(function(v21)
        local l_Theme_1 = v21.Theme;
        local l_Font_1 = v21.Font.Body.Font;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v14.layoutOrder
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = not not v20 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 8)
            })
        }, {
            AppName = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 20), 
                BackgroundTransparency = 1, 
                Text = v14.subscriptionProviderName, 
                TextSize = 16, 
                TextColor3 = l_Theme_1.TextEmphasis.Color, 
                TextTransparency = l_Theme_1.TextEmphasis.Transparency, 
                Font = l_Font_1, 
                TextXAlignment = not not v20 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                TextWrapped = true, 
                LayoutOrder = v14.layoutOrder
            })
        }, {
            Title = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 20), 
                BackgroundTransparency = 1, 
                Text = v14.name, 
                TextSize = 20, 
                TextColor3 = l_Theme_1.TextEmphasis.Color, 
                TextTransparency = l_Theme_1.TextEmphasis.Transparency, 
                Font = l_Font_1, 
                TextXAlignment = not not v20 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                TextWrapped = true, 
                LayoutOrder = v14.layoutOrder + 1
            })
        }, {
            PriceFrame = v2.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundColor3 = Color3.fromRGB(255, 0, 0), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v14.layoutOrder + 2
            }, {
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = not not v20 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Horizontal
                }), 
                Price = v2.createElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 16), 
                    BackgroundTransparency = 1, 
                    Text = v14.displayPrice, 
                    TextSize = 16, 
                    TextColor3 = l_Theme_1.TextEmphasis.Color, 
                    TextTransparency = l_Theme_1.TextDefault.Transparency, 
                    Font = l_Font_1, 
                    RichText = true, 
                    TextXAlignment = not not v20 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                    TextWrapped = true, 
                    LayoutOrder = v14.layoutOrder + 1, 
                    AutomaticSize = Enum.AutomaticSize.X
                }), 
                Period = v2.createElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 16), 
                    BackgroundTransparency = 1, 
                    Text = v14.period, 
                    TextSize = 16, 
                    TextColor3 = l_Theme_1.TextDefault.Color, 
                    TextTransparency = l_Theme_1.TextDefault.Transparency, 
                    Font = l_Font_1, 
                    RichText = true, 
                    TextXAlignment = not not v20 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                    TextWrapped = true, 
                    LayoutOrder = v14.layoutOrder + 1, 
                    AutomaticSize = Enum.AutomaticSize.X
                })
            })
        }, {
            DisclaimerText = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 16), 
                BackgroundTransparency = 1, 
                Text = v14.disclaimerText, 
                TextSize = 16, 
                TextColor3 = l_Theme_1.TextDefault.Color, 
                Font = l_Font_1, 
                TextXAlignment = not not v20 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                TextWrapped = true, 
                LayoutOrder = v14.layoutOrder + 3
            })
        });
    end);
    return l_createElement_0(v16, v17, v18);
end;
local function v35(v25)
    local l_createElement_1 = v2.createElement;
    local v27 = "Frame";
    local v28 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 1
    };
    local v29 = {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 24)
        }), 
        Icon = v2.createElement(l_ImageSetLabel_0, {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 96, 0, 96), 
            ScaleType = Enum.ScaleType.Fit, 
            AutomaticSize = Enum.AutomaticSize.X, 
            Image = v25.itemIcon
        })
    };
    local l_l_withStyle_0_1 = l_withStyle_0;
    local v31 = false;
    v29.SubscriptionInfo = l_l_withStyle_0_1(function(v32)
        local l_Theme_2 = v32.Theme;
        local l_Font_2 = v32.Font.Body.Font;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v25.layoutOrder
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = not not v31 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 8)
            })
        }, {
            AppName = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 20), 
                BackgroundTransparency = 1, 
                Text = v25.subscriptionProviderName, 
                TextSize = 16, 
                TextColor3 = l_Theme_2.TextEmphasis.Color, 
                TextTransparency = l_Theme_2.TextEmphasis.Transparency, 
                Font = l_Font_2, 
                TextXAlignment = not not v31 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                TextWrapped = true, 
                LayoutOrder = v25.layoutOrder
            })
        }, {
            Title = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 20), 
                BackgroundTransparency = 1, 
                Text = v25.name, 
                TextSize = 20, 
                TextColor3 = l_Theme_2.TextEmphasis.Color, 
                TextTransparency = l_Theme_2.TextEmphasis.Transparency, 
                Font = l_Font_2, 
                TextXAlignment = not not v31 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                TextWrapped = true, 
                LayoutOrder = v25.layoutOrder + 1
            })
        }, {
            PriceFrame = v2.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundColor3 = Color3.fromRGB(255, 0, 0), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v25.layoutOrder + 2
            }, {
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = not not v31 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Horizontal
                }), 
                Price = v2.createElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 16), 
                    BackgroundTransparency = 1, 
                    Text = v25.displayPrice, 
                    TextSize = 16, 
                    TextColor3 = l_Theme_2.TextEmphasis.Color, 
                    TextTransparency = l_Theme_2.TextDefault.Transparency, 
                    Font = l_Font_2, 
                    RichText = true, 
                    TextXAlignment = not not v31 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                    TextWrapped = true, 
                    LayoutOrder = v25.layoutOrder + 1, 
                    AutomaticSize = Enum.AutomaticSize.X
                }), 
                Period = v2.createElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 16), 
                    BackgroundTransparency = 1, 
                    Text = v25.period, 
                    TextSize = 16, 
                    TextColor3 = l_Theme_2.TextDefault.Color, 
                    TextTransparency = l_Theme_2.TextDefault.Transparency, 
                    Font = l_Font_2, 
                    RichText = true, 
                    TextXAlignment = not not v31 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                    TextWrapped = true, 
                    LayoutOrder = v25.layoutOrder + 1, 
                    AutomaticSize = Enum.AutomaticSize.X
                })
            })
        }, {
            DisclaimerText = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 16), 
                BackgroundTransparency = 1, 
                Text = v25.disclaimerText, 
                TextSize = 16, 
                TextColor3 = l_Theme_2.TextDefault.Color, 
                Font = l_Font_2, 
                TextXAlignment = not not v31 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                TextWrapped = true, 
                LayoutOrder = v25.layoutOrder + 3
            })
        });
    end);
    return l_createElement_1(v27, v28, v29);
end;
v7.getTitleHeight = function(_, v37)
    if v37 > 216 then
        return 216;
    else
        return 96;
    end;
end;
v7.render = function(v38)
    if v38.props.contentHeight > 216 then
        return v35(v38.props);
    else
        return v24(v38.props);
    end;
end;
return v7;
