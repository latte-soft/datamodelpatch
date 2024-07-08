local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_ButtonStack_0 = v5.App.Button.ButtonStack;
local l_Enum_0 = v5.App.Button.Enum;
local l_IconButton_0 = v5.App.Button.IconButton;
local v10 = v5.App.ImageSet.Images["icons/navigation/close"];
local v11 = {
    titleText = "Placeholder title", 
    bodyText = "Placeholder body", 
    actionText = "Placeholder action", 
    paddingX = 12, 
    onActivated = function()
    end, 
    onDismissed = function()
    end
};
return function(v12)
    local v13 = v3.Dictionary.join(v11, v12);
    local v14 = v13.style or l_useStyle_0();
    local l_Space_100_0 = v14.Tokens.Global.Space_100;
    local l_Size_500_0 = v14.Tokens.Global.Size_500;
    local l_Medium_0 = v14.Tokens.Semantic.Icon.Size.Medium;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v13.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        ContentPadding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Space_100_0), 
            PaddingBottom = UDim.new(0, l_Space_100_0), 
            PaddingLeft = UDim.new(0, v13.paddingX), 
            PaddingRight = UDim.new(0, v13.paddingX)
        }), 
        Content = v4.createElement("Frame", {
            BackgroundTransparency = v14.Theme.SystemPrimaryContent.Transparency, 
            BackgroundColor3 = v14.Theme.SystemPrimaryContent.Color, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Layout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, l_Space_100_0 * 2)
            }), 
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v14.Tokens.Semantic.Radius.Medium)
            }), 
            UIStroke = v4.createElement("UIStroke", {
                Thickness = v14.Tokens.Global.Stroke_100, 
                Color = v14.Theme.Divider.Color, 
                Transparency = v14.Theme.Divider.Transparency
            }), 
            ContentPadding = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Space_100_0), 
                PaddingBottom = UDim.new(0, l_Space_100_0), 
                PaddingLeft = UDim.new(0, l_Space_100_0), 
                PaddingRight = UDim.new(0, l_Space_100_0)
            }), 
            IconAndTextFrame = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                HorizontalLayout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                TextFrame = v4.createElement("Frame", {
                    Size = UDim2.new(1, -l_Medium_0 - l_Space_100_0, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    Layout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, l_Space_100_0)
                    }), 
                    TitleTextLabel = v4.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 0), 
                        LayoutOrder = 1, 
                        Font = v14.Font.Title.Font, 
                        BorderSizePixel = 0, 
                        Text = v13.titleText, 
                        TextColor3 = v14.Theme.TextEmphasis.Color, 
                        TextSize = v14.Font.Header2.RelativeSize * v14.Font.BaseSize, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }), 
                    BodyTextLabel = v4.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 0), 
                        LayoutOrder = 2, 
                        Font = v14.Font.Body.Font, 
                        BorderSizePixel = 0, 
                        Text = v13.bodyText, 
                        TextColor3 = v14.Theme.TextDefault.Color, 
                        TextSize = v14.Font.CaptionBody.RelativeSize * v14.Font.BaseSize, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                }), 
                ImageIcon = v4.createElement(l_IconButton_0, {
                    size = UDim2.new(0, l_Medium_0, 0, l_Medium_0), 
                    icon = v10, 
                    onActivated = v13.onDismissed, 
                    layoutOrder = 2
                })
            }), 
            Buttons = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, l_Size_500_0)
            }, {
                ButtonStack = v4.createElement(l_ButtonStack_0, {
                    forcedFillDirection = Enum.FillDirection.Horizontal, 
                    buttons = {
                        {
                            buttonType = l_Enum_0.ButtonType.PrimarySystem, 
                            props = {
                                onActivated = v13.onActivated, 
                                text = v13.actionText
                            }
                        }
                    }
                })
            })
        })
    });
end;
