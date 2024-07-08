local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.UIBlox);
local l_PartialPageModal_0 = v4.App.Dialog.Modal.PartialPageModal;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local _ = v4.App.ImageSet.Images;
local _ = v4.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v4.Style.withStyle;
local v10 = require(l_Parent_0.Locale.MultiTextLocalizer);
local v11 = require(l_Parent_0.Subscription.SubscriptionTitle);
local v12 = require(l_Parent_0.Flags.GetFFlagEnableRobloxCreditPurchase);
local function v18(v13, v14, v15, v16, v17)
    if v13 then
        return v3.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0, 16), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, -48, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            DisclaimerText = v3.createElement("TextLabel", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, l_TextService_0:GetTextSize(v14, 12, v15.Footer.Font, Vector2.new(v17, math.huge)).Y + 2), 
                Font = v15.Footer.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                Text = v14, 
                TextSize = 12, 
                TextColor3 = v16.TextDefault.Color
            })
        });
    else
        return nil;
    end;
end;
local function _(v19, v20, v21, v22)
    return v3.createElement("TextLabel", {
        LayoutOrder = 3, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, v22, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Font = v20.Body.Font, 
        Text = v19.description, 
        TextSize = 16, 
        TextWrapped = true, 
        TextColor3 = v21.TextDefault.Color, 
        TextTransparency = v21.TextDefault.Transparency, 
        RichText = true
    });
end;
local function v30(v24, v25, v26, v27, v28)
    return v3.createElement("TextLabel", {
        LayoutOrder = 2, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, v27, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Font = v25.Body.Font, 
        Text = v24.description, 
        TextSize = 16, 
        TextWrapped = true, 
        TextColor3 = v26.TextDefault.Color, 
        TextTransparency = v26.TextDefault.Transparency, 
        RichText = true, 
        [v3.Change.AbsoluteSize] = function(v29)
            v28(l_TextService_0:GetTextSize(v29.Text, v29.TextSize, v29.Font, Vector2.new(v29.AbsoluteSize.X, math.huge)).Y);
        end
    });
end;
local function v34(v31, v32)
    if v12() then
        if not (v31.secondaryPaymentMethod ~= nil) or v31.secondaryPaymentMethod == "" then
            return {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = function()
                            v31.purchaseSubscriptionActivated(v31.primaryPaymentMethod);
                        end, 
                        text = v32.subscribe, 
                        layoutOrder = 0
                    }
                }
            };
        else
            local v33 = nil;
            if v31.primaryPaymentMethod == "Stripe" then
                v33 = v32.subscribeWithCreditDebitCard;
            elseif v31.primaryPaymentMethod == "CreditBalance" then
                v33 = v32.subscribeWithRobloxCredit;
            end;
            return {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = function()
                            v31.purchaseSubscriptionActivated(v31.primaryPaymentMethod);
                        end, 
                        text = v33, 
                        layoutOrder = 0
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = function()
                            v31.purchaseSubscriptionActivated(v31.secondaryPaymentMethod);
                        end, 
                        text = v32.payAnotherWay, 
                        layoutOrder = 1
                    }
                }
            };
        end;
    else
        return {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = v31.purchaseSubscriptionActivated, 
                    text = v32.subscribe, 
                    layoutOrder = 0
                }
            }
        };
    end;
end;
return function(v35)
    local v36, v37 = v3.useState(0);
    local _, _ = v3.useState(false);
    local function v41(v40)
        v37(((24 + v11:getTitleHeight(v35.screenSize.Y - 240)) + 24) + v40);
    end;
    return v3.createElement(v10, {
        keys = {
            titleText = {
                key = "IAPExperience.SubscriptionPurchasePrompt.Label.GetSubscription"
            }, 
            subscribe = if not v12() then {
                key = "IAPExperience.PremiumUpsell.Action.Subscribe"
            } else {
                key = "Feature.Subscription.Action.Subscribe"
            }, 
            subscribeWithCreditDebitCard = {
                key = "Feature.Subscription.Action.SubscribeWithCreditDebitCard"
            }, 
            subscribeWithRobloxCredit = {
                key = "Feature.Subscription.Action.SubscribeWithRobloxCredit"
            }, 
            payAnotherWay = {
                key = "Feature.Subscription.Action.SubscribePayAnotherWay"
            }, 
            footerText = {
                key = "IAPExperience.SubscriptionPurchasePrompt.Label.TestFlowDisclaimer"
            }
        }, 
        render = function(v42)
            return l_withStyle_0(function(v43)
                local l_Theme_0 = v43.Theme;
                local l_Font_0 = v43.Font;
                local v46 = l_PartialPageModal_0:getMiddleContentWidth(v35.screenSize.X);
                local l_createElement_0 = v3.createElement;
                local l_l_PartialPageModal_0_0 = l_PartialPageModal_0;
                local v49 = {
                    title = v42.titleText, 
                    screenSize = v35.screenSize, 
                    contentPadding = UDim.new(0, 24), 
                    buttonStackProps = {
                        buttons = v34(v35, v42), 
                        buttonHeight = 48, 
                        forcedFillDirection = if not v12() then nil else Enum.FillDirection.Vertical
                    }, 
                    onCloseClicked = v35.cancelPurchaseActivated, 
                    footerContent = function()
                        return v18(v35.isTestingMode, v42.footerText, l_Font_0, l_Theme_0, v46);
                    end
                };
                local v50 = {};
                local l_createElement_1 = v3.createElement;
                local v52 = "Frame";
                local v53 = {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                };
                local v54 = {};
                local l_createElement_2 = v3.createElement;
                local v56 = "ScrollingFrame";
                local v57 = {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, 0, (math.min(v36, v35.screenSize.Y - 240))), 
                    BorderSizePixel = 0, 
                    ZIndex = 2, 
                    ScrollingEnabled = v35.screenSize.Y - 240 < v36
                };
                local v58 = false;
                if v35.screenSize.Y - 240 < v36 then
                    v58 = 5;
                end;
                v57.ScrollBarThickness = v58;
                v57.ScrollingDirection = Enum.ScrollingDirection.Y;
                v57.Selectable = false;
                v57.CanvasSize = UDim2.new(1, 0, 0, v36);
                v54.PromptScroll = l_createElement_2(v56, v57, {
                    Padding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 24)
                    }), 
                    Layout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 24)
                    }), 
                    SubscriptionTitleSection = v3.createElement(v11, {
                        subscriptionProviderName = v35.subscriptionProviderName, 
                        name = v35.name, 
                        displayPrice = v35.displayPrice, 
                        period = v35.period, 
                        disclaimerText = v35.disclaimerText, 
                        layoutOrder = 2, 
                        contentHeight = v35.screenSize.Y - 240, 
                        itemIcon = v35.itemIcon
                    }); 
                    v30(v35, l_Font_0, l_Theme_0, v46, v41)
                });
                ??? = l_createElement_1(v52, v53, v54);
                setlist { ['R007[1 to ???]'] = 'R008 to ???' };
                return l_createElement_0(l_l_PartialPageModal_0_0, v49, v50);
            end);
        end
    });
end;
