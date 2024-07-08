local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_Images_0 = v2.App.ImageSet.Images;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_ShimmerPanel_0 = v2.App.Loading.ShimmerPanel;
return function(v8)
    local v9 = l_useStyle_0();
    local l_Font_0 = v9.Font;
    local l_Theme_0 = v9.Theme;
    return v1.createElement("Frame", {
        LayoutOrder = v8.layoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BackgroundColor3 = Color3.new(0, 1, 0), 
        Size = UDim2.new(1, 0, 0, 0), 
        BorderSizePixel = 0
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 12)
        }), 
        Title = v1.createElement(l_StyledTextLabel_0, {
            layoutOrder = 1, 
            text = v8.title, 
            fontStyle = l_Font_0.Header2, 
            colorStyle = l_Theme_0.TextEmphasis
        }), 
        Description = v1.createElement(l_StyledTextLabel_0, {
            layoutOrder = 2, 
            text = v8.description, 
            fontStyle = l_Font_0.CaptionBody, 
            colorStyle = l_Theme_0.TextDefault, 
            automaticSize = Enum.AutomaticSize.Y, 
            size = UDim2.new(1, 0, 0, 0), 
            lineHeight = 1
        }), 
        EditButton = if v8.shouldShimmerName then nil else v1.createElement("ImageButton", {
            AutomaticSize = if not v8.expandSizing then nil else Enum.AutomaticSize.Y, 
            LayoutOrder = 3, 
            BackgroundTransparency = 0, 
            Size = UDim2.new(1, 0, 0, 52), 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            [v1.Event.Activated] = v8.onActivated
        }, {
            UICorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            InititialTextContainer = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -40, 0, 28), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                InitialText = v1.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v8.placeHolderText, 
                    Font = l_Font_0.Body.Font, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = true, 
                    TextTransparency = if not v8.transparentText then nil else 0.5
                }, {
                    UISizeConstraint = v1.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(math.huge, 60)
                    })
                })
            }), 
            Padding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 12)
            }), 
            Icon = v1.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Image = l_Images_0["icons/actions/edit/edit"], 
                ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 28, 0, 28), 
                Position = UDim2.new(1, 0, 0, 12)
            })
        }), 
        ShimmerButton = if not v8.shouldShimmerName then nil else v1.createElement(l_ShimmerPanel_0, {
            LayoutOrder = 3, 
            Size = UDim2.new(1, 0, 0, 52), 
            cornerRadius = UDim.new(0, 8)
        })
    });
end;
