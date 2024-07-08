local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").UIBlox);
local l_withStyle_0 = v1.Style.withStyle;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.Text);
local v5 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local l_ColorSystem_0 = v1.Common.Style.ColorSystem;
local v7 = Rect.new(12, 12, 13, 13);
local v8 = v3.PureComponent:extend("NumericalBadge");
v8.defaultProps = {
    AnchorPoint = Vector2.new(0.5, 0.5), 
    Position = UDim2.new(1, 0, 0, 0), 
    badgeCount = 0, 
    inAppChrome = false, 
    redBadgeVariant = false
};
v8.render = function(v9)
    local l_AnchorPoint_0 = v9.props.AnchorPoint;
    local l_Position_0 = v9.props.Position;
    local l_LayoutOrder_0 = v9.props.LayoutOrder;
    local l_badgeCount_0 = v9.props.badgeCount;
    if not (type(l_badgeCount_0) == "number") or l_badgeCount_0 <= 0 then
        return nil;
    else
        local function v22(v14, v15, v16)
            local v17 = l_badgeCount_0 > 99 and "99+" or tostring(l_badgeCount_0);
            local v18 = v4.GetTextWidth(v17, v16.Font, v16.TextSize);
            local v19 = math.max(24, (v18 + 6) + 4);
            local l_Color_0 = v15.Color;
            local l_TextColor3_0 = v16.TextColor3;
            if v9.props.redBadgeVariant then
                l_Color_0 = l_ColorSystem_0.Red[60];
                l_TextColor3_0 = l_ColorSystem_0.White;
            end;
            return v3.createElement(v5, {
                AnchorPoint = l_AnchorPoint_0, 
                Position = l_Position_0, 
                Size = UDim2.new(0, v19, 0, 24), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = "LuaApp/9-slice/notification_badge", 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v7, 
                ImageColor3 = v14.Color, 
                ImageTransparency = v14.Transparency, 
                LayoutOrder = l_LayoutOrder_0
            }, {
                InnerBadge = v3.createElement(v5, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(1, -4, 1, -4), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = "LuaApp/9-slice/notification_badge", 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v7, 
                    ImageColor3 = l_Color_0, 
                    ImageTransparency = v15.Transparency
                }, {
                    Count = v3.createElement("TextLabel", {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(0, v18, 1, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Font = v16.Font, 
                        Text = v17, 
                        TextSize = v16.TextSize, 
                        TextColor3 = l_TextColor3_0, 
                        TextTransparency = v16.TextTransparency
                    })
                })
            });
        end;
        return l_withStyle_0(function(v23)
            return v22(v23.Theme.BackgroundDefault, v23.Theme.Badge, {
                Font = v23.Font.CaptionHeader.Font, 
                TextSize = v23.Font.CaptionHeader.RelativeSize * v23.Font.BaseSize, 
                TextColor3 = v23.Theme.BadgeContent.Color, 
                TextTransparency = v23.Theme.BadgeContent.Transparency
            });
        end);
    end;
end;
return v8;
