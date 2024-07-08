local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v5 = require(l_Parent_0.UIBlox);
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Pillv2_0 = v5.App.Control.Pillv2;
local l_ShimmerPanel_0 = v5.App.Loading.ShimmerPanel;
local v9 = require(script.Parent.BaseCell);
local l_AvatarCircle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Components.AvatarCircle;
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v12 = {
    BackgroundColor3 = Color3.new(1, 1, 1), 
    BackgroundTransparency = 0, 
    onPressedBackgroundColor3 = Color3.new(0, 0.2, 0.3), 
    onPressedBackgroundTransparency = 1, 
    avatarCircleCellWidth = 60, 
    avatarCircleSize = 36, 
    avatarCircleBackgroundColor3 = Color3.new(0.4, 0.4, 0.4), 
    avatarCircleDividerColor3 = Color3.new(0.2, 0.2, 0.2), 
    avatarCircleDividerTransparency = 0, 
    avatarCirclePresenceImage = nil, 
    subTitleText = nil, 
    subTitleTextFont = Enum.Font.Gotham, 
    subTitleTextTransparency = 0, 
    subTitleTextColor3 = Color3.new(0.1, 0.1, 0.1), 
    subTitleTextSize = 15, 
    subTitlePadding = 2, 
    subTitleIconColor3 = Color3.new(0.1, 0.1, 0.1), 
    subTitleIconTransparency = 0, 
    titleText = "titleText", 
    titleFont = Enum.Font.Gotham, 
    titleTextTransparency = 0, 
    titleTextColor3 = Color3.new(0, 0, 0), 
    titleTextSize = 20, 
    secondaryTitleText = nil, 
    secondaryTitleFont = Enum.Font.Gotham, 
    secondaryTitleTextTransparency = 0, 
    secondaryTitleTextColor3 = Color3.new(0.2, 0.2, 0.2), 
    secondaryTitleTextSize = 16, 
    showDivider = true, 
    dividerTransparency = 0, 
    dividerColor3 = Color3.fromRGB(227, 227, 227), 
    thumbnails = {}, 
    childWidth = 0, 
    onActivated = nil, 
    onCircleActivated = nil, 
    Size = UDim2.new(1, 0, 1, 0), 
    isLoading = false, 
    hideLeftPadding = false
};
return v2.memo(function(v13)
    local v14 = v3.Dictionary.join(v12, v13);
    local v15, v16 = v2.useState(0);
    local l_subTitleTextSize_0 = v14.subTitleTextSize;
    local v18 = l_Text_0.GetTextWidth(v14.titleText, v14.titleFont, v14.titleTextSize);
    return v2.createElement(v9, {
        Size = v14.Size, 
        BackgroundTransparency = v14.BackgroundTransparency, 
        BackgroundColor3 = v14.BackgroundColor3, 
        dividerColor3 = v14.dividerColor3, 
        dividerTransparency = v14.dividerTransparency, 
        avatarCircleCellWidth = v14.avatarCircleCellWidth, 
        onPressedBackgroundColor3 = v14.onPressedBackgroundColor3, 
        onPressedBackgroundTransparency = v14.onPressedBackgroundTransparency, 
        BorderSizePixel = 0, 
        AutoButtonColor = false, 
        LayoutOrder = v14.LayoutOrder, 
        onActivated = v14.onActivated, 
        showDivider = v14.showDivider
    }, {
        leftAlign = v2.createElement("Frame", {
            Size = UDim2.new(1, -v14.childWidth, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            circleHolder = v2.createElement("Frame", {
                Size = UDim2.new(0, v14.avatarCircleCellWidth, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 0
            }, {
                layout = v2.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = if not v14.hideLeftPadding then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left
                }), 
                circleSizeContainer = not v14.isLoading and v2.createElement("Frame", {
                    Size = UDim2.new(0, v14.avatarCircleSize, 0, v14.avatarCircleSize), 
                    BackgroundTransparency = 1
                }, {
                    avatarCircle = v2.createElement(l_AvatarCircle_0, {
                        circleColor3 = v14.BackgroundColor3, 
                        circleTransparency = v14.BackgroundTransparency, 
                        circleInteriorBackgroundColor3 = v14.avatarCircleBackgroundColor3, 
                        circleDividerColor3 = v14.avatarCircleDividerColor3, 
                        circleDividerTransparency = v14.avatarCircleDividerTransparency, 
                        thumbnails = v14.thumbnails, 
                        presenceImage = v14.avatarCirclePresenceImage, 
                        presenceImageColor3 = v14.avatarCirclePresenceImageColor3, 
                        presenceImageTransparency = v14.avatarCirclePresenceImageTransparency, 
                        showNewPresenceImage = v14.showNewPresenceImage, 
                        onActivated = v14.onCircleActivated or v14.onActivated
                    })
                }) or v2.createElement(l_ShimmerPanel_0, {
                    Size = UDim2.new(0, v14.avatarCircleSize, 0, v14.avatarCircleSize), 
                    cornerRadius = UDim.new(1, 0)
                })
            }), 
            conversationInfo = v2.createElement("Frame", {
                Size = UDim2.new(1, -v14.avatarCircleCellWidth, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                layout = v2.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 2)
                }), 
                titleContainer = not v14.isLoading and v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v14.titleTextSize), 
                    LayoutOrder = 1, 
                    [v2.Change.AbsoluteSize] = function(v19)
                        v16(v19.AbsoluteSize.X);
                    end
                }, {
                    layout = v2.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 4)
                    }), 
                    title = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, math.min(v18, v15), 0, v14.titleTextSize), 
                        TextSize = v14.titleTextSize, 
                        TextColor3 = v14.titleTextColor3, 
                        TextTransparency = v14.titleTextTransparency, 
                        Font = v14.titleFont, 
                        Text = v14.titleText or "", 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 1
                    }), 
                    secondaryTitle = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, math.max((v15 - v18) - 4, 0), 0, v14.secondaryTitleTextSize), 
                        TextSize = v14.secondaryTitleTextSize, 
                        TextColor3 = v14.secondaryTitleTextColor3, 
                        TextTransparency = v14.secondaryTitleTextTransparency, 
                        Font = v14.secondaryTitleFont, 
                        Text = v14.secondaryTitleText or "", 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 2
                    })
                }) or v2.createElement(l_ShimmerPanel_0, {
                    Size = UDim2.new(1, 0, 0, v14.titleTextSize), 
                    cornerRadius = UDim.new(0, 4), 
                    LayoutOrder = 1
                }), 
                userPresenceLabelWithIcon = if not not v11() and v14.subTitleText then v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, l_subTitleTextSize_0), 
                    LayoutOrder = 2
                }, {
                    layout = v2.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, v14.subTitlePadding)
                    }), 
                    subTitleIcon = if not v14.subTitleIcon or v14.isLoading then nil else v2.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(0, l_subTitleTextSize_0, 0, l_subTitleTextSize_0), 
                        BackgroundTransparency = 1, 
                        Image = v14.subTitleIcon, 
                        ImageColor3 = v14.subTitleIconColor3, 
                        ImageTransparency = v14.subTitleIconTransparency, 
                        LayoutOrder = 1
                    }), 
                    userPresenceLabel = if not v14.isLoading then v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        TextSize = v14.subTitleTextSize + 1, 
                        TextColor3 = v14.subTitleTextColor3, 
                        TextTransparency = v14.subTitleTextTransparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Text = v14.subTitleText, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        Font = v14.subTitleTextFont, 
                        Size = UDim2.new(1, not v14.subTitleIcon and 0 or -l_subTitleTextSize_0 - v14.subTitlePadding, 0, v14.subTitleTextSize), 
                        LayoutOrder = 2
                    }) else v2.createElement(l_ShimmerPanel_0, {
                        Size = UDim2.new(0.6, 0, 0, v14.subTitleTextSize), 
                        cornerRadius = UDim.new(0, 4), 
                        LayoutOrder = 2
                    })
                }) else nil, 
                userPresenceLabel = (not (v11() or v14.isLoading) and v14.subTitleText) and v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    TextSize = v14.subTitleTextSize, 
                    TextColor3 = v14.subTitleTextColor3, 
                    TextTransparency = v14.subTitleTextTransparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = v14.subTitleText, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    Font = v14.subTitleTextFont, 
                    Size = UDim2.new(1, 0, 0, v14.subTitleTextSize), 
                    LayoutOrder = 2
                }) or (not v11() and v14.subTitleText) and v2.createElement(l_ShimmerPanel_0, {
                    Size = UDim2.new(0.6, 0, 0, v14.subTitleTextSize), 
                    cornerRadius = UDim.new(0, 4), 
                    LayoutOrder = 2
                }), 
                pill = if not not v11() and v14.pillText then v2.createElement(l_Pillv2_0, {
                    layoutOrder = 3, 
                    text = v14.pillText, 
                    isDisabled = true
                }) else nil
            })
        }), 
        rightAlign = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, v3.Dictionary.join({
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        }, (v3.Dictionary.join({
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        }, v14.children or {}))))
    });
end);
