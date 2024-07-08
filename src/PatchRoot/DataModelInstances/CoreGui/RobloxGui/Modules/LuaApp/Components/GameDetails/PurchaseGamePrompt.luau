local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_Modules_0.Common.Functional);
local v5 = require(l_Modules_0.LuaApp.Constants);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v9 = require(l_Modules_0.LuaApp.getPurchaseErrorTypeFromErrorResponse);
local v10 = require(l_Modules_0.LuaApp.withLocalization);
local v11 = require(l_Modules_0.LuaApp.ThemeContext_DEPRECATED);
local v12 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v13 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v14 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v15 = require(l_Modules_0.LuaApp.Enum.PurchaseErrors);
local v16 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v17 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v18 = require(l_Modules_0.LuaApp.Thunks.Games.FetchGamePlayabilityAndProductInfo);
local v19 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v20 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForPurchaseGameRobuxShortfall);
local v21 = require(l_Modules_0.LuaApp.Thunks.PurchaseProduct);
local v22 = require(l_Modules_0.LuaApp.Thunks.SetPurchaseErrorToast);
local l_Robux_0 = v5.Currency.Robux;
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagPurchaseGamePromptUseDeprecatedTheme);
local v26 = v2.PureComponent:extend("PurchaseGamePrompt");
v26.defaultProps = {
    expectedCurrency = l_Robux_0
};
v26.init = function(v27)
    v27.onPurchaseFailedWithRobuxShortfall = function(v28)
        local l_gameName_0 = v27.props.gameName;
        local l_shortfallPrice_0 = v28.shortfallPrice;
        local l_theme_0 = v27.props.theme;
        if v25() then
            l_theme_0 = v27.props.appTheme;
        end;
        v27.props.openPurchaseGameRobuxShortfallPrompt(l_gameName_0, l_shortfallPrice_0, l_theme_0, {
            v27.props.currentPage
        });
    end;
    v27.onPurchaseFailedWhenOwned = function(v32)
        v27.props.fetchPlayabilityAndProductInfo(v27.props.networking, v27.props.universeId);
        v27.props.setPurchaseErrorToast(v32);
        v27.props.closePrompt();
    end;
    v27.customPurchaseErrorHandler = function(v33)
        local v34 = false;
        local v35 = v9(v33);
        if v35 == v15.NotEnoughRobux then
            v27.onPurchaseFailedWithRobuxShortfall(v33);
            v34 = true;
        end;
        if v35 == v15.AlreadyOwn then
            v27.onPurchaseFailedWhenOwned(v33);
            v34 = true;
        end;
        return v34;
    end;
    v27.purchaseGame = function()
        local l_networking_0 = v27.props.networking;
        v27.props.purchaseGame(l_networking_0, v27.props.productId, {
            expectedCurreny = v27.props.expectedCurrency, 
            expectedPrice = v27.props.price, 
            expectedSellerId = v27.props.sellerId
        }, v27.customPurchaseErrorHandler):andThen(function()
            v27.props.fetchPlayabilityAndProductInfo(l_networking_0, v27.props.universeId);
            if not v24() then
                local l_localization_0 = v27.props.localization;
                v27.props.setCurrentToastMessage(v14.PurchaseMessage, l_localization_0:Format("Feature.Toast.Heading.PurchaseMessage.Success"), l_localization_0:Format("Feature.Toast.Message.PurchaseMessage.SuccessV3", {
                    gameName = v27.props.gameName, 
                    price = v27.props.price
                }), true);
            else
                v27.props.setCurrentToastMessage(v14.PurchaseMessage, "Feature.Toast.Heading.PurchaseMessage.Success", {
                    "Feature.Toast.Message.PurchaseMessage.SuccessV3", 
                    {
                        gameName = v27.props.gameName, 
                        price = v27.props.price
                    }
                }, false);
            end;
            v27.props.closePrompt();
        end);
    end;
end;
v26.didMount = function(v38)
    local l_pageFilter_0 = v38.props.pageFilter;
    local l_currentPage_0 = v38.props.currentPage;
    local l_closePrompt_0 = v38.props.closePrompt;
    if not (not l_pageFilter_0 or v4.Find(l_pageFilter_0, l_currentPage_0)) then
        l_closePrompt_0();
    end;
end;
v26.render = function(v42)
    local l_theme_1 = v42.props.theme;
    if v25() then
        l_theme_1 = v42.props.appTheme;
    end;
    local l_containerWidth_0 = v42.props.containerWidth;
    local l_purchaseStatus_0 = v42.props.purchaseStatus;
    local l_closePrompt_1 = v42.props.closePrompt;
    local l_localization_1 = v42.props.localization;
    local l_gameName_1 = v42.props.gameName;
    local l_price_0 = v42.props.price;
    local v50 = l_purchaseStatus_0 == v13.Fetching;
    local function v52(v51)
        return v2.createElement(v11.Provider, {
            value = l_theme_1
        }, {
            AlertWindow = v2.createElement(v16, {
                containerWidth = l_containerWidth_0, 
                titleText = v51.titleText, 
                titleFont = l_theme_1.GameDetails.Text.BoldFont, 
                messageText = v51.messageText, 
                messageFont = l_theme_1.GameDetails.Text.Font, 
                buttonFont = l_theme_1.GameDetails.Text.Font, 
                confirmButtonText = v51.confirmButtonText, 
                onConfirm = v42.purchaseGame, 
                isConfirming = v50, 
                hasCancelButton = true, 
                onCancel = l_closePrompt_1
            })
        });
    end;
    if not v24() then
        return v52({
            titleText = l_localization_1:Format("Feature.GameDetails.Heading.PurchaseGame"), 
            messageText = l_localization_1:Format("Feature.GameDetails.Message.PurchaseGameV2", {
                gameName = l_gameName_1, 
                X = l_price_0
            }), 
            confirmButtonText = l_localization_1:Format("Feature.GameDetails.Action.Unlock")
        });
    else
        return v10({
            titleText = "Feature.GameDetails.Heading.PurchaseGame", 
            messageText = {
                "Feature.GameDetails.Message.PurchaseGameV2"; 
                gameName = l_gameName_1, 
                X = l_price_0
            }, 
            confirmButtonText = "Feature.GameDetails.Action.Unlock"
        })(v52);
    end;
end;
return (l_RoactServices_0.connect({
    networking = v7, 
    localization = v8
})((v12((v3.connect(function(v53, v54)
    local v55 = v53.Navigation.history[#v53.Navigation.history];
    return {
        purchaseStatus = v21.GetPostingStatus(v53, v54.productId), 
        currentPage = v55[#v55].name
    };
end, function(v56)
    return {
        setCurrentToastMessage = function(v57, v58, v59, v60)
            return v56(v17({
                toastType = v57, 
                toastMessage = v58, 
                toastSubMessage = v59, 
                isLocalized = v60
            }));
        end, 
        openPurchaseGameRobuxShortfallPrompt = function(v61, v62, v63, v64)
            return v56(v20(v61, v62, v63, v64));
        end, 
        purchaseGame = function(v65, v66, v67, v68)
            return v56(v21.Post(v65, v66, v67, v68));
        end, 
        closePrompt = function()
            return v56(v19());
        end, 
        fetchPlayabilityAndProductInfo = function(v69, v70)
            return v56(v18.Fetch(v69, v70));
        end, 
        setPurchaseErrorToast = function(v71)
            return v56(v22(v71));
        end
    };
end)(v26))))));
