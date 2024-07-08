local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v5 = require(l_CorePackages_0.UIBlox);
local l_Button_0 = v5.App.Button.Button;
local l_StyledTextLabel_0 = v5.App.Text.StyledTextLabel;
local v8 = require(l_Modules_0.LuaApp.Components.Subscriptions.MoreMenu);
return function(v9)
    local v10, v11 = v2.useState(0);
    local v12, v13 = v2.useState(0);
    local v14 = l_useDesignTokens_0();
    local l_Semantic_0 = v14.Semantic;
    local l_Subheader_0 = l_Semantic_0.Typography.Subheader;
    local l_CaptionBody_0 = l_Semantic_0.Typography.CaptionBody;
    local l_Color_0 = l_Semantic_0.Color;
    local l_Medium_0 = l_Semantic_0.Radius.Medium;
    local l_XLarge_0 = l_Semantic_0.Icon.Size.XLarge;
    local l_Global_0 = v14.Global;
    local l_Size_450_0 = l_Global_0.Size_450;
    local l_Space_300_0 = l_Global_0.Space_300;
    local l_Space_300_1 = l_Global_0.Space_300;
    local l_Space_150_0 = l_Global_0.Space_150;
    local l_Space_150_1 = l_Global_0.Space_150;
    local l_LineHeight_0 = l_Subheader_0.LineHeight;
    local l_LineHeight_1 = l_CaptionBody_0.LineHeight;
    local l_FontSize_0 = l_Subheader_0.FontSize;
    local l_FontSize_1 = l_CaptionBody_0.FontSize;
    local v31 = l_LineHeight_0 * l_FontSize_0;
    local v32 = v31 * 2;
    local v33 = l_LineHeight_1 * l_FontSize_1;
    local l_subscriptionProduct_0 = v9.subscriptionProduct;
    local v35 = l_useLocalization_0({
        subscribed = "Feature.Subscription.Text.Subscribed", 
        perMonth = "Feature.Subscription.Text.PerMonth", 
        seeMore = "Feature.Subscription.Action.SeeMore", 
        reportSubscription = "Feature.Subscription.Action.ReportSubscription", 
        disclaimerText = "Feature.Subscription.Text.DisclaimerTextMonthly"
    });
    local l_isSubscribed_0 = v9.isSubscribed;
    local v37 = if not l_isSubscribed_0 then l_subscriptionProduct_0.displayPrice .. " " .. v35.perMonth else v35.subscribed;
    local v38, v39 = v2.useState(false);
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = l_Color_0.BackgroundUi.Default.Color3, 
        BackgroundTransparency = l_Color_0.BackgroundUi.Default.Transparency
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Space_300_1), 
            PaddingBottom = UDim.new(0, l_Space_300_1), 
            PaddingLeft = UDim.new(0, l_Space_300_1), 
            PaddingRight = UDim.new(0, l_Space_300_1)
        }), 
        UICorners = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_Medium_0)
        }), 
        TileContent = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, l_Space_150_1)
            }), 
            SubscriptionInfoFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 128), 
                BackgroundTransparency = 1, 
                LayoutOrder = 0
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, l_Space_300_0)
                }), 
                Thumbnail = v2.createElement("ImageLabel", {
                    Size = UDim2.fromOffset(l_XLarge_0, l_XLarge_0), 
                    BackgroundTransparency = 1, 
                    Image = v9.thumbnailString
                }, {
                    UICorners = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, l_Medium_0)
                    })
                }), 
                TextContent = v2.createElement("Frame", {
                    Size = UDim2.new(1, -l_XLarge_0 - l_Space_300_0, 0, 0), 
                    BackgroundTransparency = 1, 
                    [v2.Change.AbsoluteSize] = function(v40)
                        v11(v40.AbsoluteSize.X);
                    end
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        Padding = UDim.new(0, l_Space_150_0)
                    }), 
                    SubscriptionTitle = v2.createElement(l_StyledTextLabel_0, {
                        maxSize = Vector2.new(v10, v32), 
                        fontStyle = l_Subheader_0, 
                        colorStyle = l_Color_0.Text.Emphasis, 
                        fluidSizing = false, 
                        richText = false, 
                        textWrapped = true, 
                        lineHeight = l_Subheader_0.LineHeight, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        text = l_subscriptionProduct_0.name, 
                        layoutOrder = 0, 
                        onAbsoluteSizeChange = function(v41)
                            v13(v41.AbsoluteSize.Y / v31);
                        end
                    }), 
                    Description = v2.createElement(l_StyledTextLabel_0, {
                        maxSize = Vector2.new(v10, v33 * (5 - v12)), 
                        fontStyle = l_CaptionBody_0, 
                        colorStyle = l_Color_0.Text.Emphasis, 
                        fluidSizing = false, 
                        richText = false, 
                        textWrapped = true, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        lineHeight = l_CaptionBody_0.LineHeight, 
                        text = l_subscriptionProduct_0.description, 
                        layoutOrder = 1
                    }), 
                    SeeMore = v2.createElement("TextButton", {
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v35.seeMore, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BackgroundTransparency = 1, 
                        TextColor3 = l_Color_0.Text.Emphasis.Color, 
                        TextSize = l_CaptionBody_0.FontSize, 
                        Font = l_CaptionBody_0.Font, 
                        LayoutOrder = 2, 
                        [v2.Event.Activated] = function()
                        end
                    })
                })
            }), 
            PurchaseButton = v2.createElement(l_Button_0, {
                size = UDim2.new(1, 0, 0, l_Size_450_0), 
                text = v37, 
                isDisabled = l_isSubscribed_0, 
                onActivated = function()
                end, 
                layoutOrder = 1
            })
        }), 
        MoreMenuButton = v2.createElement(v8, {
            buttonProps = {
                {
                    text = v35.reportSubscription, 
                    onActivated = function()
                        v39(false);
                    end, 
                    fontStyle = {
                        Font = l_CaptionBody_0.Font, 
                        RelativeSize = 0.625, 
                        RelativeMinSize = 0.625
                    }, 
                    textOnlyPadding = l_Space_150_0
                }
            }, 
            screenSize = v9.screenSize, 
            showMenu = v38, 
            onDismiss = function()
                v39(false);
            end, 
            onActivated = function()
                v39(not v38);
            end
        })
    });
end;
