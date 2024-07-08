local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.UIBlox);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_Images_0 = v4.App.ImageSet.Images;
local v8 = require(l_Parent_1.Locale.MultiTextLocalizer);
local v9 = require(l_Parent_0.PurchaseErrorType);
local v10 = require(l_Parent_0.PurchaseFlowType);
local v11 = v3.Component:extend(script.Name);
v11.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0)
};
v11.getErrorTitle = function(_, v13, v14, v15)
    if v14 == v9.FailedRobuxPurchase then
        return v13.robuxFailedPurchaseTitle;
    elseif v14 == v9.AlreadySubscribed then
        return v13.alreadySubscribedTitle;
    elseif v15 == v10.Subscription then
        return v13.cantSubscribeTitle;
    else
        return v13.titleText;
    end;
end;
v11.getErrorMessage = function(_, v17, v18)
    if v18 == v9.AlreadyOwn then
        return v17.alreadyOwnText;
    elseif v18 == v9.FailedGrant then
        return v17.failedGrantText;
    elseif v18 == v9.FailedGrantUnknown then
        return v17.failedGrantUnknownText;
    elseif v18 == v9.Limited then
        return v17.limitedText;
    elseif v18 == v9.NotEnoughRobux then
        return v17.notEnoughRobuxText;
    elseif v18 == v9.NotForSale then
        return v17.notForSaleText;
    elseif v18 == v9.NotForSaleExperience then
        return v17.notForSaleExperienceText;
    elseif v18 == v9.PremiumOnly then
        return v17.premiumOnlyText;
    elseif v18 == v9.ThirdPartyDisabled then
        return v17.thirdPartyDisabledText;
    elseif v18 == v9.Under13 then
        return v17.under13Text;
    elseif v18 == v9.PremiumPlatformUnavailable then
        return v17.premiumPlatformUnavailable;
    elseif v18 == v9.AlreadyPremium then
        return v17.alreadyPremium;
    elseif v18 == v9.PurchaseLimit then
        return v17.purchaseLimitText;
    elseif v18 == v9.ParentalLimit then
        return v17.parentalLimitText;
    elseif v18 == v9.FailedRobuxPurchase then
        return v17.robuxFailedPurchaseText;
    elseif v18 == v9.AlreadySubscribed then
        return v17.alreadySubscribedText;
    elseif v18 == v9.SubscriptionNotForSale then
        return v17.subscriptionNotForSaleText;
    elseif v18 == v9.SubscriptionExceededUserSpendLimit then
        return v17.parentalRestrictionSubscriptionText;
    elseif v18 == v9.SubscriptionUnsupportedLocale then
        return v17.subscriptionUnsupportedLocaleText;
    elseif v18 == v9.RestrictedUser then
        return v17.restrictedUserText;
    elseif not (v18 ~= v9.SubscriptionPurchasePlatformNotSupported) or v18 == v9.SubscriptionInvalidSaleLocation then
        return v17.subscriptionUnsupportedPlatformText;
    elseif v18 == v9.VpcRequired then
        return v17.vpcRequiredText;
    elseif v18 == v9.ExceedParentalSpendLimit then
        return v17.exceedParentalSpendLimitText;
    else
        return v17.unknownText;
    end;
end;
getIsAlreadyOwnedError = function(v19)
    local v20 = true;
    if v19 ~= v9.AlreadyOwn then
        v20 = true;
        if v19 ~= v9.AlreadyPremium then
            v20 = v19 == v9.AlreadySubscribed;
        end;
    end;
    return v20;
end;
getErrorTitleIcon = function(v21)
    if not getIsAlreadyOwnedError(v21) then
        return l_Images_0["icons/status/error_large"];
    else
        return l_Images_0["icons/status/success_large"];
    end;
end;
v11.render = function(v22)
    return v3.createElement(v8, {
        keys = {
            titleText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Title.Error")
            }, 
            robuxFailedPurchaseTitle = {
                key = ("IAPExperience.PurchaseError.%s"):format("Title.RobuxPurchaseFailed")
            }, 
            robuxFailedPurchaseText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.FailedRobuxPurchase")
            }, 
            unknownText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.UnknownError")
            }, 
            okText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.Ok")
            }, 
            alreadyOwnText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.AlreadyOwn")
            }, 
            failedGrantText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.FailedGrant")
            }, 
            failedGrantUnknownText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.FailedGrantUnknown")
            }, 
            limitedText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.Limited")
            }, 
            notEnoughRobuxText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.NotEnoughRobux")
            }, 
            notForSaleText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.NotForSale")
            }, 
            notForSaleExperienceText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.NotForSaleExperience")
            }, 
            premiumOnlyText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.PremiumOnly")
            }, 
            thirdPartyDisabledText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.ThirdPartyDisabled")
            }, 
            under13Text = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.Under13")
            }, 
            premiumPlatformUnavailable = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.PremiumPlatformUnavailable")
            }, 
            alreadyPremium = {
                key = ("IAPExperience.PurchaseError.%s"):format("AlreadyPremium")
            }, 
            purchaseLimitText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.PurchaseLimit")
            }, 
            parentalLimitText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.ParentalLimit")
            }, 
            alreadySubscribedTitle = {
                key = ("IAPExperience.PurchaseError.%s"):format("Title.AlreadySubscribed")
            }, 
            cantSubscribeTitle = {
                key = ("IAPExperience.PurchaseError.%s"):format("Title.CantSubscribe")
            }, 
            alreadySubscribedText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.AlreadySubscribed")
            }, 
            subscriptionNotForSaleText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.SubscriptionNotForSale")
            }, 
            parentalRestrictionSubscriptionText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.ParentalRestrictionSubscription")
            }, 
            subscriptionUnsupportedLocaleText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.SubscriptionUnsupportedLocale")
            }, 
            restrictedUserText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.RestrictedUser")
            }, 
            subscriptionUnsupportedPlatformText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.SubscriptionUnsupportedPlatform")
            }, 
            vpcRequiredText = {
                key = ("IAPExperience.PurchaseError.%s"):format("Text.VpcRequired")
            }, 
            exceedParentalSpendLimitText = {
                key = ("Feature.Subscription.%s"):format("Message.MonthlySpendRestrictionsMonthlyLimitExceed")
            }
        }, 
        render = function(v23)
            return v22:renderAlert(v23);
        end
    });
end;
v11.renderAlert = function(v24, v25)
    local l_props_0 = v24.props;
    return v3.createElement(l_InteractiveAlert_0, {
        anchorPoint = l_props_0.anchorPoint, 
        position = l_props_0.position, 
        screenSize = l_props_0.screenSize, 
        title = v24:getErrorTitle(v25, l_props_0.errorType, l_props_0.flowType), 
        titleIcon = getErrorTitleIcon(l_props_0.errorType), 
        bodyText = v24:getErrorMessage(v25, l_props_0.errorType), 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = l_props_0.doneActivated, 
                        text = v25.okText, 
                        inputIcon = l_props_0.doneControllerIcon
                    }
                }
            }
        }
    });
end;
return v11;
