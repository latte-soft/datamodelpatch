local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local l_FitFrameVertical_0 = require(l_Parent_2.RoactFitComponents).FitFrameVertical;
local v5 = require(l_Parent_2.UIBlox);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_withStyle_0 = v5.Core.Style.withStyle;
local v9 = require(l_Parent_1.Locale.MultiTextLocalizer);
local v10 = require(l_Parent_0.ProductDetails);
local v11 = require(l_Parent_1.Generic.Constants);
local v12 = require(l_Parent_1.Flags.getEnableCondenseRobuxUpsell);
local v13 = v3.Component:extend(script.Name);
v13.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0), 
    isLoading = false, 
    isDisabled = false, 
    isDelayedInput = false, 
    isQuest = false, 
    enableInputDelayed = false, 
    inputDelaySec = 3
};
v13.init = function(v14)
    v14.contentRef = v3.createRef();
    v14.state = {
        contentSize = Vector2.new(0, 0), 
        footerSize = Vector2.new(0, 0), 
        isCondensed = false
    };
    v14.validateCondensedCondition = function(v15)
        if v12() then
            local v16 = ((v15.AbsoluteSize.Y + v11.MODAL_HEIGHT_WITHOUT_CONTENT) + v11.MODAL_NORMAL_SECTION_PADDING * 2) + v11.MODAL_NORMAL_BUTTON_HEIGHT * 2;
            if not v14.state.isCondensed then
                v14:setState({
                    isCondensed = v14.props.screenSize.Y < v16 + v11.MODAL_NORMAL_BUTTON_MARGIN
                });
                return ;
            else
                v14:setState({
                    isCondensed = v14.props.screenSize.Y < ((v16 + (v11.MODAL_NORMAL_CONTENT_PADDING - v11.MODAL_CONDENSED_CONTENT_PADDING) * 6) + (v11.MODAL_NORMAL_BUTTON_MARGIN - v11.MODAL_CONDENSED_BUTTON_MARGIN)) + (v11.NORMAL_ICON_SIZE - v11.CONDENSED_ICON_SIZE)
                });
                return ;
            end;
        else
            return ;
        end;
    end;
    v14.changeContentSize = function(v17)
        v14.validateCondensedCondition(v17);
        if v14.state.contentSize ~= v17.AbsoluteSize then
            v14:setState({
                contentSize = v17.AbsoluteSize
            });
        end;
    end;
end;
v13.render = function(v18)
    return v3.createElement(v9, {
        keys = {
            InsufficientRobuxTitle = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Title.InsufficientRobux")
            }, 
            AdditionalRobux = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.AdditionalRobux")
            }, 
            WouldYouBuy = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.WouldYouBuy")
            }, 
            DisclosurePayment = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.DisclosurePayment")
            }, 
            DisclosureTermsURL = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.DisclosureTermsURL")
            }, 
            TermsOfUse = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.TermsOfUse")
            }, 
            BuyRobuxButton = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Action.BuyRobuxAndItem")
            }, 
            ButtonCancel = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Action.Cancel")
            }, 
            LoadingText = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.Loading")
            }, 
            PurchaseNotAvialableForQuest = {
                key = ("IAPExperience.RobuxUpsell.%s"):format("Text.PurchaseNotAvailableOnHeadSet")
            }
        }, 
        render = function(v19)
            return v18:renderAlert(v19);
        end
    });
end;
v13.renderAlert = function(v20, v21)
    local l_props_0 = v20.props;
    local l_state_0 = v20.state;
    return l_withStyle_0(function(v24)
        local l_Theme_0 = v24.Theme;
        local l_Font_0 = v24.Font;
        local v27 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        if v12() then
            v27 = not not l_state_0.isCondensed and v27 * 0.9 or v27;
        end;
        local v28 = v21.AdditionalRobux:gsub("{robux}", utf8.char(57346) .. tostring(l_props_0.itemRobuxCost - l_props_0.balanceAmount));
        local v29 = v21.WouldYouBuy:gsub("{robux}", (string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring((Color3.new(math.round(l_Theme_0.TextEmphasis.Color.R * 255), math.round(l_Theme_0.TextEmphasis.Color.G * 255), (math.round(l_Theme_0.TextEmphasis.Color.B * 255))))), utf8.char(57346), (tostring(l_props_0.robuxPurchaseAmount)))));
        local v30 = string.split(v21.DisclosureTermsURL, "{termsofuse}");
        local l_TermsOfUse_0 = v21.TermsOfUse;
        if l_props_0.termsOfUseActivated then
            l_TermsOfUse_0 = "<u>" .. l_TermsOfUse_0 .. "</u>";
        end;
        return v3.createElement(l_InteractiveAlert_0, {
            screenSize = l_props_0.screenSize, 
            position = l_props_0.position, 
            anchorPoint = l_props_0.anchorPoint, 
            title = v21.InsufficientRobuxTitle, 
            middleContent = function()
                return v3.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    contentPadding = if not v12() then UDim.new(0, v11.MODAL_NORMAL_CONTENT_PADDING) else UDim.new(0, not not l_state_0.isCondensed and v11.MODAL_CONDENSED_CONTENT_PADDING or v11.MODAL_NORMAL_CONTENT_PADDING), 
                    [v3.Ref] = v20.contentRef, 
                    [v3.Change.AbsoluteSize] = v20.changeContentSize
                }, {
                    ProductDetails = v3.createElement(v10, {
                        layoutOrder = 1, 
                        model = l_props_0.model, 
                        itemIcon = l_props_0.itemIcon, 
                        itemName = l_props_0.itemName, 
                        itemRobuxCost = l_props_0.itemRobuxCost, 
                        itemIconWidth = if not v12() then nil else l_state_0.isCondensed and v11.CONDENSED_ICON_SIZE or nil, 
                        itemIconHeight = if not v12() then nil else l_state_0.isCondensed and v11.CONDENSED_ICON_SIZE or nil
                    }), 
                    Underline = v3.createElement("Frame", {
                        LayoutOrder = 2, 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        Size = UDim2.new(1, 0, 0, 1)
                    }), 
                    AdditionalBuyText = v3.createElement("TextLabel", {
                        LayoutOrder = 3, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, v20.state.contentSize.X, 0, 0), 
                        RichText = true, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextWrapped = true, 
                        Font = l_Font_0.Body.Font, 
                        Text = if not v20.props.isQuest then v28 .. " " .. v29 else v28, 
                        TextSize = v27, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextTransparency = l_Theme_0.TextDefault.Transparency
                    }), 
                    Underline2 = v3.createElement("Frame", {
                        LayoutOrder = 4, 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        Size = UDim2.new(1, 0, 0, 1)
                    }), 
                    DisclosureFrame = v3.createElement(l_FitFrameVertical_0, {
                        LayoutOrder = 5, 
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 1)
                    }, {
                        DisclosurePayment = v3.createElement("TextLabel", {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Font = l_Font_0.Body.Font, 
                            Text = if not v20.props.isQuest then v21.DisclosurePayment else v21.PurchaseNotAvailableOnHeadSet, 
                            TextSize = v27, 
                            TextColor3 = l_Theme_0.TextDefault.Color, 
                            TextTransparency = l_Theme_0.TextDefault.Transparency
                        }), 
                        DisclosureTermsFrame = if not v20.props.isQuest then v3.createElement(l_FitFrameVertical_0, {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            width = UDim.new(1, 0), 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            contentPadding = UDim.new(0, 1)
                        }, {
                            BeforeDisclosureText = v3.createElement("TextLabel", {
                                LayoutOrder = 0, 
                                BackgroundTransparency = 1, 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Font = l_Font_0.Body.Font, 
                                Text = v30[1], 
                                TextSize = v27, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextTransparency = l_Theme_0.TextDefault.Transparency
                            }), 
                            TermsOfUse = v3.createElement("TextButton", {
                                LayoutOrder = 1, 
                                BackgroundTransparency = 1, 
                                RichText = true, 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Font = l_Font_0.Body.Font, 
                                Text = l_TermsOfUse_0, 
                                TextSize = v27, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                                Selectable = l_props_0.termsOfUseActivated ~= nil, 
                                [v3.Event.Activated] = l_props_0.termsOfUseActivated
                            }), 
                            AfterDisclosureText = v3.createElement("TextLabel", {
                                LayoutOrder = 2, 
                                BackgroundTransparency = 1, 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Font = l_Font_0.Body.Font, 
                                Text = v30[2], 
                                TextSize = v27, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextTransparency = l_Theme_0.TextDefault.Transparency
                            })
                        }) else nil
                    })
                });
            end, 
            buttonStackInfo = {
                forcedFillDirection = Enum.FillDirection.Vertical, 
                marginBetween = if not v12() then v11.MODAL_NORMAL_BUTTON_MARGIN else l_state_0.isCondensed and v11.MODAL_CONDENSED_BUTTON_MARGIN or v11.MODAL_NORMAL_BUTTON_MARGIN, 
                buttons = if not v20.props.isQuest then {
                    {
                        props = {
                            isDisabled = l_props_0.isDisabled, 
                            onActivated = l_props_0.cancelPurchaseActivated, 
                            text = v21.ButtonCancel, 
                            inputIcon = l_props_0.cancelControllerIcon
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = l_props_0.isLoading, 
                            isDisabled = l_props_0.isDisabled, 
                            isDelayedInput = l_props_0.isDelayedInput, 
                            enableInputDelayed = l_props_0.enableInputDelayed, 
                            delayInputSeconds = l_props_0.inputDelaySec, 
                            onActivated = l_props_0.buyItemActivated, 
                            text = if not l_props_0.enableInputDelayed then if l_props_0.robuxCostStr ~= nil then l_props_0.robuxCostStr else v21.BuyRobuxButton else v21.LoadingText, 
                            inputIcon = l_props_0.buyItemControllerIcon
                        }
                    }
                } else {
                    {
                        props = {
                            isDisabled = l_props_0.isDisabled, 
                            onActivated = l_props_0.cancelPurchaseActivated, 
                            text = v21.ButtonCancel, 
                            inputIcon = l_props_0.cancelControllerIcon
                        }
                    }
                }
            }
        });
    end);
end;
return v13;
