local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local l_withStyle_0 = v3.Style.withStyle;
local v6 = v2.PureComponent:extend("DevSubGame");
local v7 = {
    LEFT = 24, 
    TOP = 13, 
    BOTTOM = 13, 
    RIGHT = 22
};
v6.defaultProps = {
    layoutOrder = 0
};
v6.render = function(v8)
    local l_props_0 = v8.props;
    local l_game_0 = l_props_0.game;
    local l_subNames_0 = l_props_0.subNames;
    local l_activeSubs_0 = l_props_0.activeSubs;
    local l_active_0 = l_props_0.active;
    local l_dividerDisabled_0 = l_props_0.dividerDisabled;
    local l_onActivated_0 = l_props_0.onActivated;
    local l_layoutOrder_0 = l_props_0.layoutOrder;
    local l_maxSize_0 = l_props_0.maxSize;
    return l_withStyle_0(function(v18)
        return v2.createElement("TextButton", {
            Size = UDim2.new(1, 0, 0, l_maxSize_0.Y), 
            LayoutOrder = l_layoutOrder_0, 
            BackgroundTransparency = 1, 
            Text = "", 
            [v2.Event.Activated] = l_onActivated_0
        }, {
            SizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = l_maxSize_0
            }), 
            ContentFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v7.LEFT), 
                    PaddingTop = UDim.new(0, v7.TOP), 
                    PaddingBottom = UDim.new(0, v7.BOTTOM), 
                    PaddingRight = UDim.new(0, v7.RIGHT)
                }), 
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                Icon = v2.createElement("ImageLabel", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, 44, 0, 44), 
                    BackgroundTransparency = l_game_0.icon ~= nil and 1 or 0, 
                    Image = l_game_0.icon, 
                    ImageTransparency = not l_active_0 and 0.5 or 0
                }), 
                TextFrame = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -64, 1, 0), 
                    LayoutOrder = 2
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 12), 
                        PaddingRight = UDim.new(0, 12)
                    }), 
                    Title = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 22), 
                        Font = v18.Font.Header2.Font, 
                        TextSize = v18.Font.BaseSize * v18.Font.Header2.RelativeSize, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = v18.Theme.TextEmphasis.Color, 
                        TextTransparency = not not l_active_0 and v18.Theme.TextEmphasis.Transparency or v18.Theme.TextEmphasis.Transparency * 0.5, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        Text = l_game_0.name
                    }), 
                    List = v2.createElement("TextLabel", {
                        AnchorPoint = Vector2.new(0, 1), 
                        Position = UDim2.new(0, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 17), 
                        Font = v18.Font.Body.Font, 
                        TextSize = v18.Font.BaseSize * v18.Font.Body.RelativeSize, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = v18.Theme.TextDefault.Color, 
                        TextTransparency = not not l_active_0 and v18.Theme.TextDefault.Transparency or v18.Theme.TextDefault.Transparency * 0.5, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        Text = table.concat(l_subNames_0, ", ")
                    })
                }), 
                Circle = v2.createElement(v4, {
                    Size = UDim2.new(0, 20, 0, 20), 
                    LayoutOrder = 3, 
                    Image = "LuaApp/graphic/gr-counter-slot-32x32", 
                    BackgroundTransparency = 1, 
                    ImageTransparency = if not l_active_0 then v18.Theme.UIDefault.Transparency else 0, 
                    ImageColor3 = v18.Theme.UIDefault.Color
                }, {
                    v2.createElement("TextLabel", {
                        Visible = l_active_0, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Font = v18.Font.Footer.Font, 
                        TextSize = v18.Font.BaseSize * v18.Font.Footer.RelativeSize, 
                        TextColor3 = v18.Theme.TextDefault.Color, 
                        TextTransparency = v18.Theme.TextDefault.Transparency, 
                        Text = l_activeSubs_0
                    })
                })
            }), 
            Divider = not l_dividerDisabled_0 and v2.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundColor3 = v18.Theme.Divider.Color, 
                BackgroundTransparency = not not l_active_0 and v18.Theme.Divider.Transparency or 0.5, 
                Size = UDim2.new(1, -((v7.LEFT + 44) + 12), 0, 1), 
                AnchorPoint = Vector2.new(1, 1), 
                Position = UDim2.new(1, 0, 1, 0)
            })
        });
    end);
end;
return v6;
