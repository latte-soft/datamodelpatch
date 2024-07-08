local v0 = require(script:FindFirstAncestor("ContactImporter").dependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_ShimmerPanel_0 = l_UIBlox_0.App.Loading.ShimmerPanel;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v5 = l_Roact_0.PureComponent:extend("ContactsGlimmer");
v5.render = function(v6)
    local l_props_0 = v6.props;
    return l_withStyle_0(function(v8)
        return l_Roact_0.createElement("Frame", {
            LayoutOrder = l_props_0.layoutOrder, 
            Size = UDim2.new(1, 0, 0, 72), 
            BackgroundTransparency = 1
        }, {
            entryContent = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 0)
                }), 
                middleGroup = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, -68, 1, 0), 
                    BackgroundTransparency = 1, 
                    [l_Roact_0.Event.Activated] = v6.openBlankProfileView, 
                    LayoutOrder = 2, 
                    BackgroundColor3 = Color3.fromRGB(222, 22, 222)
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 10)
                    }), 
                    Padding = l_Roact_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 12)
                    }), 
                    PlayerName = l_Roact_0.createElement(l_ShimmerPanel_0, {
                        LayoutOrder = 1, 
                        Size = UDim2.fromOffset(90, 14)
                    }), 
                    ContextualInfo = l_Roact_0.createElement(l_ShimmerPanel_0, {
                        LayoutOrder = 2, 
                        Size = UDim2.fromOffset(160, 14)
                    })
                })
            }), 
            Divider = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundColor3 = v8.Theme.Divider.Color, 
                BackgroundTransparency = v8.Theme.Divider.Transparency
            })
        });
    end);
end;
return v5;
