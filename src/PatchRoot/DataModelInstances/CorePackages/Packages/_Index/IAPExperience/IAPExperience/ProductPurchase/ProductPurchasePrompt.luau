local _ = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.RoactFitComponents);
local l_FitFrameVertical_0 = v5.FitFrameVertical;
local l_FitTextLabel_0 = v5.FitTextLabel;
local v8 = require(l_Parent_1.UIBlox);
local l_InteractiveAlert_0 = v8.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local l_Images_0 = v8.App.ImageSet.Images;
local l_ImageSetLabel_0 = v8.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v8.App.Constant.IconSize;
local l_withStyle_0 = v8.Core.Style.withStyle;
local v15 = require(script.Parent.Parent.Generic.HumanoidViewport);
local v16 = require(l_Parent_0.Locale.MultiTextLocalizer);
local v17 = require(l_Parent_0.Flags.getEnableHumanoidViewportItemIcon);
local v18 = l_Images_0["icons/common/robux_small"];
local v19 = l_Images_0["icons/common/robux"];
local v20 = v3.Component:extend(script.Name);
v20.validateProps = v4.strictInterface({
    anchorPoint = v4.optional(v4.Vector2), 
    position = v4.optional(v4.UDim2), 
    screenSize = v4.Vector2, 
    isLoading = v4.optional(v4.boolean), 
    isDisabled = v4.optional(v4.boolean), 
    isDelayedInput = v4.optional(v4.boolean), 
    enableInputDelayed = v4.optional(v4.boolean), 
    itemIcon = v4.table, 
    model = v4.optional(v4.table), 
    itemName = v4.string, 
    itemRobuxCost = v4.number, 
    currentBalance = v4.number, 
    isGamePass = v4.optional(v4.boolean), 
    testPurchase = v4.optional(v4.boolean), 
    buyItemControllerIcon = v4.optional(v4.table), 
    cancelControllerIcon = v4.optional(v4.table), 
    buyItemActivated = v4.callback, 
    cancelPurchaseActivated = v4.callback, 
    isLuobu = v4.optional(v4.boolean)
});
v20.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0), 
    isLoading = false, 
    isDisabled = false, 
    testPurchase = false, 
    isDelayedInput = false, 
    enableInputDelayed = false, 
    isLuobu = false, 
    isGamePass = false
};
v20.init = function(v21)
    v21.contentRef = v3.createRef();
    v21.footerRef = v3.createRef();
    v21.state = {
        contentSize = Vector2.new(0, 0), 
        footerSize = Vector2.new(0, 0)
    };
    v21.changeContentSize = function(v22)
        if v21.state.contentSize ~= v22.AbsoluteSize then
            v21:setState({
                contentSize = v22.AbsoluteSize
            });
        end;
    end;
    v21.changeFooterSize = function(v23)
        if v21.state.footerSize ~= v23.AbsoluteSize then
            v21:setState({
                footerSize = v23.AbsoluteSize
            });
        end;
    end;
end;
v20.render = function(v24)
    return v3.createElement(v16, {
        keys = {
            BuyItemTitle = {
                key = not not v24.props.isGamePass and ("IAPExperience.PurchasePrompt.%s"):format("Title.BuyGamepass") or ("IAPExperience.PurchasePrompt.%s"):format("Title.BuyItem")
            }, 
            BuyItemQuestion = {
                key = ("IAPExperience.PurchasePrompt.%s"):format(not v24.props.isLuobu and "Text.BuyItemQuestion" or "Text.BuyItemQuestionWithWarning"), 
                params = {
                    name = v24.props.itemName
                }
            }, 
            RemainingBalance = {
                key = ("IAPExperience.PurchasePrompt.%s"):format("Text.RemainingBalance")
            }, 
            TestPurchaseText = {
                key = ("IAPExperience.PurchasePrompt.%s"):format("Text.TestPurchase")
            }, 
            ButtonCancel = {
                key = ("IAPExperience.PurchasePrompt.%s"):format("Action.Cancel")
            }, 
            LoadingText = {
                key = ("IAPExperience.PurchasePrompt.%s"):format("Text.Loading")
            }
        }, 
        render = function(v25)
            return v24:renderAlert(v25);
        end
    });
end;
v20.renderAlert = function(v26, v27)
    return l_withStyle_0(function(v28)
        local l_Theme_0 = v28.Theme;
        local l_Font_0 = v28.Font;
        local v31 = if not not v17() and v26.props.model then v3.createElement(v15, {
            model = v26.props.model, 
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(85, 85), 
            Position = UDim2.fromOffset(5, 5)
        }) else v3.createElement(l_ImageSetLabel_0, {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 5, 0, 5), 
            Size = UDim2.new(0, 85, 0, 85), 
            ScaleType = Enum.ScaleType.Stretch, 
            Image = v26.props.itemIcon, 
            ImageTransparency = 0
        });
        return v3.createElement(l_InteractiveAlert_0, {
            screenSize = v26.props.screenSize, 
            position = v26.props.position, 
            anchorPoint = v26.props.anchorPoint, 
            title = v27.BuyItemTitle, 
            middleContent = function()
                return v3.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    contentPadding = UDim.new(0, 24), 
                    [v3.Ref] = v26.contentRef, 
                    [v3.Change.AbsoluteSize] = v26.changeContentSize
                }, {
                    ItemIcon = v31, 
                    ItemName = v3.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        TextWrapped = true, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        maximumWidth = v26.state.contentSize.X, 
                        Font = l_Font_0.Footer.Font, 
                        Text = v27.BuyItemQuestion, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color
                    })
                });
            end, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            isDisabled = v26.props.isDisabled or v26.props.isLoading, 
                            onActivated = v26.props.cancelPurchaseActivated, 
                            text = v27.ButtonCancel, 
                            inputIcon = v26.props.cancelControllerIcon
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = v26.props.isLoading, 
                            isDisabled = v26.props.isDisabled, 
                            isDelayedInput = v26.props.isDelayedInput, 
                            enableInputDelayed = v26.props.enableInputDelayed, 
                            delayInputSeconds = 3, 
                            onActivated = v26.props.buyItemActivated, 
                            icon = v19, 
                            text = tostring(v26.props.itemRobuxCost), 
                            inputIcon = v26.props.buyItemControllerIcon
                        }
                    }
                }
            }, 
            footerContent = function()
                if v26.props.testPurchase then
                    return v3.createElement(l_FitFrameVertical_0, {
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 2), 
                        [v3.Ref] = v26.footerRef, 
                        [v3.Change.AbsoluteSize] = v26.changeFooterSize
                    }, {
                        TestPurchaseTest = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Font = l_Font_0.Footer.Font, 
                            Text = v27.TestPurchaseText, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        })
                    });
                else
                    return v3.createElement(l_FitFrameVertical_0, {
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 2), 
                        [v3.Ref] = v26.footerRef, 
                        [v3.Change.AbsoluteSize] = v26.changeFooterSize
                    }, {
                        RemainingBalanceText = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Font = l_Font_0.Footer.Font, 
                            Text = v27.RemainingBalance, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        }), 
                        RobuxIcon = v3.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            Position = UDim2.new(0, 5, 0, 5), 
                            Size = UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
                            ScaleType = Enum.ScaleType.Stretch, 
                            Image = v18, 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = l_Theme_0.IconEmphasis.Transparency
                        }), 
                        BalanceAmount = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 3, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Font = l_Font_0.Footer.Font, 
                            Text = tostring(v26.props.currentBalance - v26.props.itemRobuxCost), 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        })
                    });
                end;
            end
        });
    end);
end;
return v20;
