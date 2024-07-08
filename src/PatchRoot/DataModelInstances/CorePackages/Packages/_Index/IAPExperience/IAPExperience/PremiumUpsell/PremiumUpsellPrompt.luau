local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local _ = require(l_Parent_2.t);
local l_FitFrameVertical_0 = require(l_Parent_2.RoactFitComponents).FitFrameVertical;
local v6 = require(l_Parent_2.UIBlox);
local l_PartialPageModal_0 = v6.App.Dialog.Modal.PartialPageModal;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v6.Style.withStyle;
local v12 = require(l_Parent_1.Locale.MultiTextLocalizer);
local v13 = require(l_Parent_0.BulletPoint);
local v14 = v3.Component:extend(script.Name);
v14.init = function(v15)
    v15.isCondensed = false;
    v15.contentSize = Vector2.new(0, 0);
    v15.state = {
        padding = UDim.new(0, 24), 
        iconSize = UDim2.new(1, 0, 0, 80)
    };
    v15.updateContentSizes = function(v16, v17)
        if not (v17.X >= 200) or v17.Y > 1000 then
            return ;
        else
            local l_contentSize_0 = v15.contentSize;
            v15.contentSize = v17;
            if v17.X == 0 and v17.Y == 0 then
                return ;
            elseif v16.X == 0 and v16.Y == 0 then
                return ;
            elseif v17 == l_contentSize_0 and v16 == v15.props.screenSize then
                return ;
            else
                local v19 = if not v15.isCondensed then v16.Y < v17.Y + 120 else v16.Y < (((v17.Y + 120) + 80) - 48) + 24;
                v15.isCondensed = v19;
                v15:setState({
                    padding = UDim.new(0, not v19 and 24 or 12), 
                    iconSize = UDim2.new(1, 0, 0, not v19 and 80 or 48)
                });
                return ;
            end;
        end;
    end;
end;
v14.willUpdate = function(v20, v21)
    if v20.props.screenSize ~= v21.screenSize then
        v20.updateContentSizes(v21.screenSize, v20.contentSize);
    end;
end;
v14.render = function(v22)
    local l_props_0 = v22.props;
    return v3.createElement(v12, {
        keys = {
            titleLocalizedText = if not l_props_0.isCatalog then {
                key = ("IAPExperience.PremiumUpsell.%s"):format("Title.PremiumRequired")
            } else {
                key = ("IAPExperience.PremiumUpsell.%s"):format("Title.GetPremium")
            }, 
            monthlyLocalizedText = {
                key = ("IAPExperience.PremiumUpsell.%s"):format("Action.Subscribe")
            }, 
            descLocalizedText = {
                key = ("IAPExperience.PremiumUpsell.%s"):format("Label.PremiumBenefitListDesc")
            }, 
            bulletPoint1Text = {
                key = ("IAPExperience.PremiumUpsell.%s"):format("Label.RobuxPerMonth")
            }, 
            bulletPoint2Text = {
                key = ("IAPExperience.PremiumUpsell.%s"):format("Label.PremiumOnlyBenefits")
            }, 
            bulletPoint3Text = if not l_props_0.isCatalog then {
                key = ("IAPExperience.PremiumUpsell.%s"):format("Body.RobuxDiscount")
            } else {
                key = ("IAPExperience.PremiumUpsell.%s"):format("Label.AvatarShopBenefits")
            }, 
            disclosure = {
                key = ("IAPExperience.PremiumUpsell.%s"):format("Label.Disclosure"), 
                params = {
                    currencySymbol = l_props_0.currencySymbol, 
                    price = tostring(l_props_0.robuxPrice)
                }
            }
        }, 
        render = function(v24)
            return v22:renderPrompt(v24);
        end
    });
end;
v14.renderPrompt = function(v25, v26)
    local l_props_1 = v25.props;
    return l_withStyle_0(function(v28)
        local l_Theme_0 = v28.Theme;
        local l_Font_0 = v28.Font;
        local v31 = l_PartialPageModal_0:getMiddleContentWidth(v25.props.screenSize.X);
        return v3.createElement(l_PartialPageModal_0, {
            title = v26.titleLocalizedText, 
            screenSize = l_props_1.screenSize, 
            buttonStackProps = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = l_props_1.purchasePremiumActivated, 
                            text = v26.monthlyLocalizedText, 
                            inputIcon = l_props_1.acceptControllerIcon
                        }
                    }
                }, 
                buttonHeight = 48
            }, 
            onCloseClicked = l_props_1.cancelPurchaseActivated
        }, {
            v3.createElement(l_FitFrameVertical_0, {
                BackgroundTransparency = 1, 
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 24), 
                margin = {
                    top = 24, 
                    bottom = 24
                }, 
                [v3.Change.AbsoluteSize] = function(v32)
                    local _ = v32.AbsoluteSize;
                    if not (v25.contentSize.X == v32.AbsoluteSize.X) or v25.contentSize.Y ~= v32.AbsoluteSize.Y then
                        v25.updateContentSizes(v25.props.screenSize, v32.AbsoluteSize);
                    end;
                end
            }, {
                Icon = v3.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    Size = v25.state.iconSize, 
                    ScaleType = Enum.ScaleType.Fit, 
                    Image = l_Images_0["icons/graphic/premium_large"]
                }), 
                BulletListText = v3.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v31, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Font = l_Font_0.Body.Font, 
                    Text = v26.descLocalizedText, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency
                }), 
                BulletList = v3.createElement(l_FitFrameVertical_0, {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    contentPadding = v25.state.padding
                }, {
                    BulletText1 = v3.createElement(v13, {
                        text = v26.bulletPoint1Text:gsub("{robux}", utf8.char(57346) .. tostring(l_props_1.robuxAmount)), 
                        width = v31, 
                        layoutOrder = 1
                    }), 
                    BulletText2 = v3.createElement(v13, {
                        text = v26.bulletPoint2Text, 
                        width = v31, 
                        layoutOrder = 2
                    }), 
                    BulletText3 = v3.createElement(v13, {
                        text = v26.bulletPoint3Text, 
                        width = v31, 
                        layoutOrder = 3
                    })
                }), 
                Disclosure = v3.createElement("TextLabel", {
                    LayoutOrder = 4, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    RichText = true, 
                    TextWrapped = true, 
                    Font = l_Font_0.Body.Font, 
                    Text = v26.disclosure, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency
                })
            })
        });
    end);
end;
return v14;
