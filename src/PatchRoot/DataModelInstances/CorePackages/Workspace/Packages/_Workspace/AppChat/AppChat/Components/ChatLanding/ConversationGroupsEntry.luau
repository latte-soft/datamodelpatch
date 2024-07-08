local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_script_FirstAncestor_0.LuaAppNavigationContext);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v7 = require(script.Parent.Utils.getBoldTextTheme);
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableAppChatPaddingConsistency);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v3.App.Constant.IconSize;
local v12 = l_Images_0["icons/navigation/pushRight"];
local v13 = l_Images_0["icons/menu/groups"];
ConversationGroupsEntry = function(v14)
    local v15 = l_useStyle_0();
    local v16 = v2.useContext(v4);
    local v17 = v7(v15);
    local v18 = l_useLocalization_0({
        groupsText = "Feature.SocialTab.Label.Groups", 
        createAndExploreGroupsText = "Feature.SocialTab.Label.CreateAndExploreGroups"
    });
    local l_groupsText_0 = v18.groupsText;
    local l_Font_0 = v17.Font.Header2.Font;
    local l_Transparency_0 = v17.Theme.TextEmphasis.Transparency;
    local l_Color_0 = v17.Theme.TextEmphasis.Color;
    local v23 = v17.Font.Header2.RelativeSize * v17.Font.BaseSize;
    local l_createAndExploreGroupsText_0 = v18.createAndExploreGroupsText;
    local l_Font_1 = v15.Font.CaptionBody.Font;
    local l_Transparency_1 = v15.Theme.TextDefault.Transparency;
    local l_Color_1 = v15.Theme.TextDefault.Color;
    local v28 = v15.Font.CaptionBody.RelativeSize * v15.Font.BaseSize;
    local v29 = l_IconSize_0.Regular + 12;
    local v30 = not v8() and 60 or 60 - (60 - l_IconSize_0.Regular) / 2;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v14.entryHeight), 
        BackgroundColor3 = v15.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v15.Theme.BackgroundDefault.Transprency, 
        BorderSizePixel = 0
    }, {
        overlay = v2.createElement("ImageButton", {
            AutoButtonColor = false, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            [v2.Event.Activated] = v16.navigateToGroups
        }), 
        leftAlign = v2.createElement("Frame", {
            Size = UDim2.new(1, -v29, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            iconHolder = v2.createElement("Frame", {
                Size = UDim2.new(0, v30, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 0
            }, {
                layout = v2.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = if not v8() then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left
                }), 
                icon = v2.createElement(l_ImageSetLabel_0, {
                    BackgroundColor3 = v17.Theme.BackgroundUIDefault.Color, 
                    BackgroundTransparency = v17.Theme.BackgroundUIDefault.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, l_IconSize_0.Regular, 0, l_IconSize_0.Regular), 
                    ScaleType = Enum.ScaleType.Stretch, 
                    Image = v13, 
                    ImageColor3 = v15.Theme.IconEmphasis.Color, 
                    ImageTransparency = v15.Theme.IconEmphasis.Transparency
                }, {
                    corner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                })
            }), 
            conversationInfo = v2.createElement("Frame", {
                Size = UDim2.new(1, -60, 1, 0), 
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
                title = v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v23), 
                    TextSize = v23, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    Font = l_Font_0, 
                    Text = l_groupsText_0 or "", 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 1
                }), 
                subTitle = v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v28), 
                    TextSize = v28, 
                    TextColor3 = l_Color_1, 
                    TextTransparency = l_Transparency_1, 
                    Font = l_Font_1, 
                    Text = l_createAndExploreGroupsText_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    LayoutOrder = 2
                })
            })
        }), 
        rightAlign = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            padding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 12)
            }), 
            icon = v2.createElement(l_ImageSetLabel_0, {
                LayoutOrder = 0, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, l_IconSize_0.Regular, 0, l_IconSize_0.Regular), 
                ScaleType = Enum.ScaleType.Stretch, 
                Image = v12, 
                ImageColor3 = v15.Theme.IconEmphasis.Color, 
                ImageTransparency = v15.Theme.IconEmphasis.Transparency
            })
        }), 
        divider = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            }), 
            divider = v2.createElement("Frame", {
                BackgroundTransparency = v15.Theme.Divider.Transparency, 
                BackgroundColor3 = v15.Theme.Divider.Color, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, -v30, 0, 1)
            })
        })
    });
end;
return ConversationGroupsEntry;
