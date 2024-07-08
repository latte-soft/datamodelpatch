local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_AppFonts_0 = require(l_Parent_0.Style).AppFonts;
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v5 = v1.PureComponent:extend("ChatDisabledIndicator");
v5.defaultProps = {
    LayoutOrder = 1, 
    chatEnabled = false, 
    chatDisabledText = "TRANSLATED To chat with your friends, turn on chat in your Privacy Settings.", 
    privacyButtonText = "TRANSLATED Privacy Settings", 
    navigateToPrivacy = function()
    end
};
v5.render = function(v6)
    return l_withStyle_0(function(v7)
        local v8 = v7.Font.SubHeader1.RelativeSize * v7.Font.BaseSize;
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            LayoutOrder = v6.props.LayoutOrder
        }, {
            IndicatorInner = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 160), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, {
                UIList = v1.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                Imagelabel = v1.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 72, 0, 72), 
                    LayoutOrder = 1, 
                    Image = "rbxasset://textures/ui/LuaChat/icons/ic-friends.png"
                }), 
                DisabledMessage = v1.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Font = l_AppFonts_0.default:getDefault(), 
                    TextColor3 = v7.Theme.TextDefault.Color, 
                    TextTransparency = v7.Theme.TextDefault.Transparency, 
                    TextSize = v7.Font.SubHeader1.RelativeSize * v7.Font.BaseSize, 
                    Size = UDim2.new(0.8, 0, 0.5, 0), 
                    Text = v6.props.chatDisabledText, 
                    TextWrapped = true
                }), 
                PrivacySettings = not v6.props.chatEnabled and v1.createElement("ImageButton", {
                    AutoButtonColor = false, 
                    Size = UDim2.new(0, l_Text_0.GetTextWidth(v6.props.privacyButtonText, l_AppFonts_0.default:getDefault(), v8) + 6, 0, 36), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3, 
                    BorderSizePixel = 0, 
                    ScaleType = "Slice", 
                    SliceCenter = Rect.new(3, 3, 4, 4), 
                    Image = "rbxasset://textures/ui/LuaChat/9-slice/input-default.png", 
                    ImageColor3 = Color3.fromRGB(0, 176, 111), 
                    [v1.Event.Activated] = v6.props.navigateToPrivacy
                }, {
                    Textlabel = v1.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Font = l_AppFonts_0.default:getDefault(), 
                        TextSize = v8, 
                        TextColor3 = Color3.fromRGB(255, 255, 255), 
                        Text = v6.props.privacyButtonText, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center
                    })
                })
            })
        });
    end);
end;
return v5;
