local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagDeprecatedSocialLibrariesCells);
local l_Roact_0 = v1.Roact;
local l_Cryo_0 = v1.Cryo;
local l_Text_0 = v1.Text;
local l_UIBlox_0 = v1.UIBlox;
local l_Config_0 = l_UIBlox_0.Config;
local l_ShimmerPanel_0 = l_UIBlox_0.App.Loading.ShimmerPanel;
local v9 = require(script.Parent.BaseCell);
local v10 = require(script:FindFirstAncestor("Components").AvatarCircle);
local v11 = l_Roact_0.PureComponent:extend("PresenceBubbleCell");
v11.defaultProps = {
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
    subTitleTextFont = if not l_Config_0.enableFontNameMapping then Enum.Font.Gotham else Enum.Font.BuilderSans, 
    subTitleTextTransparency = 0, 
    subTitleTextColor3 = Color3.new(0.1, 0.1, 0.1), 
    subTitleTextSize = 15, 
    titleText = "titleText", 
    titleFont = if not l_Config_0.enableFontNameMapping then Enum.Font.Gotham else Enum.Font.BuilderSans, 
    titleTextTransparency = 0, 
    titleTextColor3 = Color3.new(0, 0, 0), 
    titleTextSize = 20, 
    secondaryTitleText = nil, 
    secondaryTitleFont = if not l_Config_0.enableFontNameMapping then Enum.Font.Gotham else Enum.Font.BuilderSans, 
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
    isLoading = false
};
v11.init = function(v12)
    assert(not v2(), "social-libraries Cells are deprecated, please use Cell components from app-chat rotriever package");
    local v13, v14 = l_Roact_0.createBinding(0);
    v12.widthBinding = v13;
    v12.widthBindingUpdate = v14;
end;
v11.render = function(v15)
    local l_props_0 = v15.props;
    local v17 = l_Text_0.GetTextWidth(l_props_0.titleText, l_props_0.titleFont, l_props_0.titleTextSize);
    return l_Roact_0.createElement(v9, {
        Size = v15.props.Size, 
        BackgroundTransparency = l_props_0.BackgroundTransparency, 
        BackgroundColor3 = l_props_0.BackgroundColor3, 
        dividerColor3 = v15.props.dividerColor3, 
        dividerTransparency = v15.props.dividerTransparency, 
        onPressedBackgroundColor3 = l_props_0.onPressedBackgroundColor3, 
        onPressedBackgroundTransparency = l_props_0.onPressedBackgroundTransparency, 
        BorderSizePixel = 0, 
        AutoButtonColor = false, 
        LayoutOrder = l_props_0.LayoutOrder, 
        onActivated = l_props_0.onActivated, 
        showDivider = l_props_0.showDivider
    }, {
        leftAlign = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, -l_props_0.childWidth, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            circleHolder = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(0, l_props_0.avatarCircleCellWidth, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 0
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                circleSizeContainer = not l_props_0.isLoading and l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(0, l_props_0.avatarCircleSize, 0, l_props_0.avatarCircleSize), 
                    BackgroundTransparency = 1
                }, {
                    avatarCircle = l_Roact_0.createElement(v10, {
                        circleColor3 = l_props_0.BackgroundColor3, 
                        circleTransparency = l_props_0.BackgroundTransparency, 
                        circleInteriorBackgroundColor3 = l_props_0.avatarCircleBackgroundColor3, 
                        circleDividerColor3 = l_props_0.avatarCircleDividerColor3, 
                        circleDividerTransparency = l_props_0.avatarCircleDividerTransparency, 
                        thumbnails = l_props_0.thumbnails, 
                        presenceImage = l_props_0.avatarCirclePresenceImage, 
                        presenceImageColor3 = l_props_0.avatarCirclePresenceImageColor3, 
                        presenceImageTransparency = l_props_0.avatarCirclePresenceImageTransparency, 
                        showNewPresenceImage = l_props_0.showNewPresenceImage, 
                        onActivated = l_props_0.onCircleActivated or l_props_0.onActivated
                    })
                }) or l_Roact_0.createElement(l_ShimmerPanel_0, {
                    Size = UDim2.new(0, l_props_0.avatarCircleSize, 0, l_props_0.avatarCircleSize), 
                    cornerRadius = UDim.new(1, 0)
                })
            }), 
            conversationInfo = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, -l_props_0.avatarCircleCellWidth, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 2)
                }), 
                titleContainer = not l_props_0.isLoading and l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, l_props_0.titleTextSize), 
                    LayoutOrder = 1, 
                    [l_Roact_0.Change.AbsoluteSize] = function(v18)
                        v15.widthBindingUpdate(v18.AbsoluteSize.X);
                    end
                }, {
                    layout = l_Roact_0.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 4)
                    }), 
                    title = l_Roact_0.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = v15.widthBinding:map(function(v19)
                            return UDim2.new(0, math.min(v17, v19), 0, l_props_0.titleTextSize);
                        end), 
                        TextSize = l_props_0.titleTextSize, 
                        TextColor3 = l_props_0.titleTextColor3, 
                        TextTransparency = l_props_0.titleTextTransparency, 
                        Font = l_props_0.titleFont, 
                        Text = l_props_0.titleText or "", 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 1
                    }), 
                    secondaryTitle = l_Roact_0.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = v15.widthBinding:map(function(v20)
                            return UDim2.new(0, math.max((v20 - v17) - 4, 0), 0, l_props_0.secondaryTitleTextSize);
                        end), 
                        TextSize = l_props_0.secondaryTitleTextSize, 
                        TextColor3 = l_props_0.secondaryTitleTextColor3, 
                        TextTransparency = l_props_0.secondaryTitleTextTransparency, 
                        Font = l_props_0.secondaryTitleFont, 
                        Text = l_props_0.secondaryTitleText or "", 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 2
                    })
                }) or l_Roact_0.createElement(l_ShimmerPanel_0, {
                    Size = UDim2.new(1, 0, 0, l_props_0.titleTextSize), 
                    cornerRadius = UDim.new(0, 4), 
                    LayoutOrder = 1
                }), 
                userPresenceLabel = (not l_props_0.isLoading and l_props_0.subTitleText) and l_Roact_0.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    TextSize = l_props_0.subTitleTextSize, 
                    TextColor3 = l_props_0.subTitleTextColor3, 
                    TextTransparency = l_props_0.subTitleTextTransparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = l_props_0.subTitleText, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    Font = l_props_0.subTitleTextFont, 
                    Size = UDim2.new(1, 0, 0, l_props_0.subTitleTextSize), 
                    LayoutOrder = 2
                }) or l_props_0.subTitleText and l_Roact_0.createElement(l_ShimmerPanel_0, {
                    Size = UDim2.new(0.6, 0, 0, l_props_0.subTitleTextSize), 
                    cornerRadius = UDim.new(0, 4), 
                    LayoutOrder = 2
                })
            })
        }), 
        rightAlign = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, l_Cryo_0.Dictionary.join({
            layout = l_Roact_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        }, (l_Cryo_0.Dictionary.join({
            layout = l_Roact_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        }, l_props_0[l_Roact_0.Children] or {}))))
    });
end;
return v11;
