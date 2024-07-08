local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_2.RoactFitComponents);
local l_FitFrameVertical_0 = v5.FitFrameVertical;
local l_FitTextLabel_0 = v5.FitTextLabel;
local v8 = require(l_Parent_2.UIBlox);
local l_InteractiveAlert_0 = v8.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local l_Images_0 = v8.App.ImageSet.Images;
local l_ImageSetLabel_0 = v8.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v8.App.Constant.IconSize;
local l_withStyle_0 = v8.Core.Style.withStyle;
local v15 = require(l_Parent_1.Locale.MultiTextLocalizer);
local v16 = require(l_Parent_0.ProductDetails);
local v17 = l_Images_0["icons/common/robux"];
local v18 = v3.Component:extend(script.Name);
v18.validateProps = v4.strictInterface({
    anchorPoint = v4.optional(v4.Vector2), 
    position = v4.optional(v4.UDim2), 
    screenSize = v4.Vector2, 
    isLoading = v4.optional(v4.boolean), 
    isDisabled = v4.optional(v4.boolean), 
    isDelayedInput = v4.optional(v4.boolean), 
    enableInputDelayed = v4.optional(v4.boolean), 
    model = v4.optional(v4.table), 
    itemIcon = v4.table, 
    itemName = v4.string, 
    itemRobuxCost = v4.number, 
    robuxPurchaseAmount = v4.number, 
    balanceAmount = v4.number, 
    buyItemControllerIcon = v4.optional(v4.table), 
    cancelControllerIcon = v4.optional(v4.table), 
    buyItemActivated = v4.callback, 
    cancelPurchaseActivated = v4.callback, 
    isLuobu = v4.optional(v4.boolean)
});
v18.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0), 
    isLoading = false, 
    isDisabled = false, 
    isDelayedInput = false, 
    enableInputDelayed = false, 
    isLuobu = false
};
v18.init = function(v19)
    v19.contentRef = v3.createRef();
    v19.footerRef = v3.createRef();
    v19.state = {
        contentSize = Vector2.new(0, 0), 
        footerSize = Vector2.new(0, 0)
    };
    v19.changeContentSize = function(v20)
        if v19.state.contentSize ~= v20.AbsoluteSize then
            v19:setState({
                contentSize = v20.AbsoluteSize
            });
        end;
    end;
    v19.changeFooterSize = function(v21)
        if v19.state.footerSize ~= v21.AbsoluteSize then
            v19:setState({
                footerSize = v21.AbsoluteSize
            });
        end;
    end;
end;
v18.render = function(v22)
    return v3.createElement(v15, {
        keys = {
            InsufficientFundsTitle = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Title.InsufficientFunds")
            }, 
            BuyRobuxQuestion = {
                key = ("IAPExperience.RobuxUpsell.%s"):format(not v22.props.isLuobu and "Text.BuyRobuxQuestion" or "Text.BuyRobuxQuestionWithWarning")
            }, 
            DisclosurePayment = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.DisclosurePayment")
            }, 
            DisclosureTerms = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.DisclosureTerms")
            }, 
            RemainingBalance = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.RemainingBalance")
            }, 
            BuyRobuxButton = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Action.BuyRobux")
            }, 
            ButtonCancel = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Action.Cancel")
            }, 
            LoadingText = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.Loading")
            }
        }, 
        render = function(v23)
            return v22:renderAlert(v23);
        end
    });
end;
v18.renderAlert = function(v24, v25)
    return l_withStyle_0(function(v26)
        local l_Theme_0 = v26.Theme;
        local l_Font_0 = v26.Font;
        local v29 = (v24.props.balanceAmount + v24.props.robuxPurchaseAmount) - v24.props.itemRobuxCost;
        return v3.createElement(l_InteractiveAlert_0, {
            screenSize = v24.props.screenSize, 
            position = v24.props.position, 
            anchorPoint = v24.props.anchorPoint, 
            title = v25.InsufficientFundsTitle, 
            middleContent = function()
                return v3.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    contentPadding = UDim.new(0, 15), 
                    [v3.Ref] = v24.contentRef, 
                    [v3.Change.AbsoluteSize] = v24.changeContentSize
                }, {
                    ItemDetails = v3.createElement(v16, {
                        layoutOrder = 1, 
                        model = v24.props.model, 
                        itemIcon = v24.props.itemIcon, 
                        itemName = v24.props.itemName, 
                        itemRobuxCost = v24.props.itemRobuxCost
                    }), 
                    Underline = v3.createElement("Frame", {
                        LayoutOrder = 2, 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        Size = UDim2.new(1, 0, 0, 1)
                    }), 
                    ConfirmationFrame = v3.createElement(l_FitFrameVertical_0, {
                        LayoutOrder = 3, 
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 1)
                    }, {
                        WouldYouLikeText = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            TextWrapped = true, 
                            maximumWidth = v24.state.contentSize.X * 0.8, 
                            Font = l_Font_0.Body.Font, 
                            Text = v25.BuyRobuxQuestion, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        }), 
                        RobuxIcon = v3.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            Position = UDim2.new(0, 5, 0, 5), 
                            Size = UDim2.new(0, 24, 0, 24), 
                            ScaleType = Enum.ScaleType.Stretch, 
                            Image = v17, 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = l_Theme_0.IconEmphasis.Transparency
                        }), 
                        RemainingRobux = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 3, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Font = l_Font_0.Body.Font, 
                            Text = tostring(v24.props.robuxPurchaseAmount), 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color
                        })
                    }), 
                    DisclosureFrame = v3.createElement(l_FitFrameVertical_0, {
                        LayoutOrder = 4, 
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 1)
                    }, {
                        DisclosurePayment = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Font = l_Font_0.Footer.Font, 
                            Text = v25.DisclosurePayment, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        }), 
                        DisclosureTerms = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Font = l_Font_0.Footer.Font, 
                            Text = v25.DisclosureTerms, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        })
                    })
                });
            end, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            isDisabled = v24.props.isDisabled, 
                            onActivated = v24.props.cancelPurchaseActivated, 
                            text = v25.ButtonCancel, 
                            inputIcon = v24.props.cancelControllerIcon
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = v24.props.isLoading, 
                            isDisabled = v24.props.isDisabled, 
                            isDelayedInput = v24.props.isDelayedInput, 
                            enableInputDelayed = v24.props.enableInputDelayed, 
                            delayInputSeconds = 3, 
                            onActivated = v24.props.buyItemActivated, 
                            text = v25.BuyRobuxButton, 
                            inputIcon = v24.props.buyItemControllerIcon
                        }
                    }
                }
            }, 
            footerContent = function()
                local v30 = string.split(v25.RemainingBalance, " {robux} ");
                return v3.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    contentPadding = UDim.new(0, 1), 
                    [v3.Ref] = v24.footerRef, 
                    [v3.Change.AbsoluteSize] = v24.changeFooterSize
                }, {
                    RemainingBalanceBefore = v3.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        Font = l_Font_0.Footer.Font, 
                        Text = v30[1], 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color
                    }), 
                    RobuxIcon = v3.createElement(l_ImageSetLabel_0, {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 5, 0, 5), 
                        Size = UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
                        ScaleType = Enum.ScaleType.Stretch, 
                        Image = v17, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency
                    }), 
                    RemainingRobux = v3.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 3, 
                        BackgroundTransparency = 1, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        Font = l_Font_0.Footer.Font, 
                        Text = v29, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color
                    }), 
                    RemainingBalanceAfter = v3.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 4, 
                        BackgroundTransparency = 1, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        Font = l_Font_0.Footer.Font, 
                        Text = v30[2], 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color
                    })
                });
            end
        });
    end);
end;
return v18;
