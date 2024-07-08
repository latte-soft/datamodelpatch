local v0 = require(script:FindFirstAncestor("FriendsLanding").AddFriends.dependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_Colors_0 = l_UIBlox_0.App.Style.Colors;
local v9 = UDim2.new(0, -8, 0, 8);
local v10 = l_Images_0["icons/actions/info_small"];
return function(v11)
    local v12 = l_useStyle_0();
    return l_Roact_0.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Banner = l_Roact_0.createElement(l_ImageSetButton_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            LayoutOrder = 1, 
            BackgroundColor3 = v12.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = v12.Theme.BackgroundUIDefault.Transparency, 
            [l_Roact_0.Event.Activated] = v11.onActivated
        }, {
            UIPadding = l_Roact_0.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12), 
                PaddingTop = UDim.new(0, 12)
            }), 
            UICorner = l_Roact_0.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            UIStroke = l_Roact_0.createElement("UIStroke", {
                Color = v12.Theme.Divider.Color, 
                Transparency = v12.Theme.Divider.Transparency, 
                Thickness = 1
            }), 
            Layout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 12)
            }), 
            BannerIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                ImageColor3 = l_Colors_0.White, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 48, 0, 48), 
                Image = v11.bannerIcon, 
                LayoutOrder = 1
            }), 
            BannerTextFrame = l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -76, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                TextUIListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 4)
                }), 
                BannerTitle = l_Roact_0.createElement(l_StyledTextLabel_0, {
                    automaticSize = Enum.AutomaticSize.Y, 
                    size = UDim2.fromScale(1, 0), 
                    text = v11.bannerTitle, 
                    fontStyle = v12.Font.Header2, 
                    colorStyle = v12.Theme.TextEmphasis, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Top, 
                    lineHeight = 1, 
                    layoutOrder = 1
                }), 
                BannerText = l_Roact_0.createElement(l_StyledTextLabel_0, {
                    automaticSize = Enum.AutomaticSize.Y, 
                    size = UDim2.fromScale(1, 0), 
                    text = v11.bannerText, 
                    fontStyle = v12.Font.CaptionBody, 
                    colorStyle = v12.Theme.TextDefault, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Top, 
                    lineHeight = 1, 
                    layoutOrder = 2
                })
            })
        }), 
        BannerInfoButton = v11.hasInfoButton and l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            Position = v9
        }, {
            Layout = l_Roact_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            }), 
            InfoIcon = l_Roact_0.createElement(l_ImageSetButton_0, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 16, 0, 16), 
                Image = v10, 
                ImageColor3 = v12.Theme.IconEmphasis.Color, 
                ImageTransparency = v12.Theme.IconEmphasis.Transparency, 
                ZIndex = 2, 
                [l_Roact_0.Event.Activated] = v11.onInfoButtonActivated
            })
        })
    });
end;
