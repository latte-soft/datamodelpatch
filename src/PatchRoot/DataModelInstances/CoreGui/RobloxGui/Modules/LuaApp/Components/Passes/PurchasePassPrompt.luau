local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_CorePackages_0.UIBlox);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v9 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v10 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v11 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v12 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v13 = require(l_Modules_0.LuaApp.getPurchaseErrorTypeFromErrorResponse);
local v14 = require(l_Modules_0.LuaApp.withLocalization);
local l_withStyle_0 = v6.Style.withStyle;
local v16 = require(l_CorePackages_0.Packages.t);
local v17 = require(l_CorePackages_0.Promise);
local v18 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v19 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v20 = require(l_Modules_0.LuaApp.Enum.PurchaseErrors);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v22 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v23 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamePasses);
local v24 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v25 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v26 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForPurchasePassInsufficientRobux);
local v27 = require(l_Modules_0.LuaApp.Thunks.NavigateDownToRobuxUpsell);
local v28 = require(l_Modules_0.LuaApp.Components.RobuxUpsell.Enum.RobuxUpsellTriggerContext);
local v29 = require(l_Modules_0.LuaApp.Thunks.PurchaseProduct);
local v30 = require(l_Modules_0.LuaApp.Thunks.SetPurchaseErrorToast);
local v31 = require(l_Modules_0.LuaApp.Flags.GamepassRobuxUpsellIXPTest);
local v32 = v3.PureComponent:extend("PurchasePassPrompt");
v32.validateProps = v16.strictInterface({
    universeId = v16.string, 
    pass = v16.table, 
    containerWidth = v16.number, 
    defaultChildRef = v16.optional(v16.any), 
    focusController = v16.optional(v16.any), 
    localization = v16.any, 
    networking = v16.callback, 
    analytics = v16.any, 
    gamepassRobuxUpsellEnabled = v16.optional(v16.boolean), 
    purchaseStatus = v16.optional(v16.any), 
    userRobux = v16.optional(v16.number), 
    setCurrentToastMessage = v16.callback, 
    navigateDownToRobuxUpsell = v16.callback, 
    openPurchasePassInsufficientRobux = v16.callback, 
    purchasePass = v16.callback, 
    closePrompt = v16.callback, 
    apiFetchGamePasses = v16.callback, 
    setPurchaseErrorToast = v16.callback
});
v32.init = function(v33)
    v33.onPurchaseFailedWithRobuxShortfall = function(_)
        if v31.isEnabled() then
            l_IXPService_0:LogUserLayerExposure(v12.GamepassRobuxUpsellLayer);
            local l_Diag_0 = v33.props.analytics.Diag;
            v33.props.analytics.EventStream:setRBXEventStream("ua", "GamepassRobuxUpsellIXP", {
                isVariant = v33.props.gamepassRobuxUpsellEnabled
            });
            if not v33.props.gamepassRobuxUpsellEnabled then
                l_Diag_0:reportCounter("UAGamepassRobuxUpsellControl", 1);
            else
                l_Diag_0:reportCounter("UAGamepassRobuxUpsellVariant", 1);
            end;
        end;
        if not v33.props.gamepassRobuxUpsellEnabled then
            v33.props.openPurchasePassInsufficientRobux();
            return ;
        else
            local l_networking_0 = v33.props.networking;
            local l_pass_0 = v33.props.pass;
            local _ = v33.props.universeId;
            local l_userRobux_0 = v33.props.userRobux;
            local l_purchasePass_0 = v33.props.purchasePass;
            local v41 = {
                expectedCurrency = v5.Currency.Robux, 
                expectedPrice = l_pass_0.price, 
                expectedSellerId = l_pass_0.sellerId
            };
            v33.props.navigateDownToRobuxUpsell(l_pass_0.price, l_userRobux_0, l_pass_0.displayName, nil, function()
                return l_purchasePass_0(l_networking_0, l_pass_0.productId, v41);
            end);
            return ;
        end;
    end;
    v33.onPurchaseFailedWhenOwned = function(v42)
        v33.props.apiFetchGamePasses(v33.props.networking, v33.props.universeId);
        v33.props.setPurchaseErrorToast(v42);
        v33.props.closePrompt();
    end;
    v33.customPurchaseErrorHandler = function(v43)
        local v44 = false;
        if v33.isMounted then
            local v45 = v13(v43);
            if v45 == v20.NotEnoughRobux then
                v33.onPurchaseFailedWithRobuxShortfall(v43);
                v44 = true;
            end;
            if v45 == v20.AlreadyOwn then
                v33.onPurchaseFailedWhenOwned(v43);
                v44 = true;
            end;
        end;
        return v44;
    end;
    v33.purchasePass = function()
        local l_networking_1 = v33.props.networking;
        local l_pass_1 = v33.props.pass;
        local l_productId_0 = l_pass_1.productId;
        local l_universeId_1 = v33.props.universeId;
        v33.props.purchasePass(l_networking_1, l_productId_0, {
            expectedCurrency = v5.Currency.Robux, 
            expectedPrice = l_pass_1.price, 
            expectedSellerId = l_pass_1.sellerId
        }, v33.customPurchaseErrorHandler):finally(function(v50)
            if not (not (v50 ~= v17.Status.Rejected) or not v33.isMounted) then
                v33.props.apiFetchGamePasses(l_networking_1, l_universeId_1);
                local l_localization_0 = v33.props.localization;
                v33.props.setCurrentToastMessage(v19.PurchaseMessage, l_localization_0:Format("Feature.AccountSecurityPrompt.Header.Success"), l_localization_0:Format("Feature.Catalog.Label.Purchased"), true);
                v33.props.closePrompt();
            end;
        end);
    end;
end;
v32.render = function(v52)
    local l_containerWidth_0 = v52.props.containerWidth;
    local l_purchaseStatus_0 = v52.props.purchaseStatus;
    local l_closePrompt_0 = v52.props.closePrompt;
    local l_localization_1 = v52.props.localization;
    local l_pass_2 = v52.props.pass;
    local l_displayName_0 = l_pass_2.displayName;
    local l_sellerName_0 = l_pass_2.sellerName;
    local l_price_0 = l_pass_2.price;
    local v61 = l_purchaseStatus_0 == v18.Fetching;
    return l_withStyle_0(function(v62)
        return v14({
            buyItem = "IAPExperience.PurchasePrompt.Title.BuyItem", 
            message = {
                "Feature.Catalog.Label.PurchaseConfirmation"; 
                itemName = l_displayName_0, 
                creatorName = l_sellerName_0, 
                itemPrice = l_NumberLocalization_0.localize(l_price_0, l_localization_1:GetLocale())
            }, 
            buy = "Feature.Catalog.Action.Buy"
        })(function(v63)
            return v3.createElement(v22, {
                containerWidth = l_containerWidth_0, 
                titleText = v63.buyItem, 
                titleFont = v62.Font.Header1.Font, 
                messageText = v63.message, 
                messageFont = v62.Font.Body.Font, 
                buttonFont = v62.Font.Header2.Font, 
                confirmButtonText = v63.buy, 
                onConfirm = v52.purchasePass, 
                isConfirming = v61, 
                hasCancelButton = true, 
                onCancel = l_closePrompt_0
            });
        end);
    end);
end;
v32.didMount = function(v64)
    v64.isMounted = true;
end;
v32.willUnmount = function(v65)
    v65.isMounted = false;
end;
v32 = l_RoactServices_0.connect({
    networking = v8, 
    localization = v10, 
    analytics = v9
})((v4.connect(function(v66, v67)
    return {
        purchaseStatus = v29.GetPostingStatus(v66, v67.pass.productId), 
        userRobux = v66.UserRobux[v66.LocalUserId]
    };
end, function(v68)
    return {
        setCurrentToastMessage = function(v69, v70, v71, v72)
            return v68(v24({
                toastType = v69, 
                toastMessage = v70, 
                toastSubMessage = v71, 
                isLocalized = v72
            }));
        end, 
        openPurchasePassInsufficientRobux = function()
            return v68(v26());
        end, 
        navigateDownToRobuxUpsell = function(v73, v74, v75, v76, v77)
            v68(v25());
            return v68(v27(v28.UAGamepass, v73, v74, v75, v76, v77));
        end, 
        purchasePass = function(v78, v79, v80, v81)
            return v68(v29.Post(v78, v79, v80, v81));
        end, 
        closePrompt = function()
            return v68(v25());
        end, 
        apiFetchGamePasses = function(v82, v83)
            return v68(v23(v82, v83));
        end, 
        setPurchaseErrorToast = function(v84)
            return v68(v30(v84));
        end
    };
end)(v32)));
if v31.isEnabled() then
    v32 = v11.connectUserLayer({
        v12.GamepassRobuxUpsellLayer
    }, function(v85, _)
        return {
            gamepassRobuxUpsellEnabled = v31.isUserEnrolled(v85)
        };
    end, false)(v32);
end;
return v32;
