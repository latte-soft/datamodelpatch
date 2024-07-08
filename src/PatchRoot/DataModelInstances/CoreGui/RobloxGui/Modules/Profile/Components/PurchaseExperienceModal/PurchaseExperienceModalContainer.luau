local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_Dash_0 = v1.Dash;
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local v7 = require(l_Parent_0.ProfileContext);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local v9 = require(l_Parent_0.Common.Constants);
local v10 = require(script.Parent.PurchaseExperienceModal);
local v11 = require(script.Parent.purchaseExperienceMapStateToProps);
local v12 = require(l_Parent_0.Networking.PurchaseProductById);
local v13 = require(l_Parent_0.Common.ProfileScreens);
local v14 = require(l_Parent_0.Analytics);
local v15 = l_Roact_0.Component:extend("PurchaseExperienceModalContainer");
v15.init = function(v16)
    v16.closeModal = function()
        v16.props.navigation.pop();
    end;
    v16.purchaseGame = function()
        local l_props_0 = v16.props;
        l_props_0.analytics:buttonClick(v14.Enums.ButtonClickEvents.PurchaseGame);
        local l_productInfo_0 = l_props_0.productInfo;
        return l_props_0.purchaseProductById(l_productInfo_0.productId, {
            expectedCurrency = v9.RobuxCurrency, 
            expectedPrice = l_productInfo_0.price, 
            expectedSellerId = l_productInfo_0.sellerId
        });
    end;
    v16.showToast = function(v19, v20, v21)
        v16.props.navigation.navigate(v13.GenericToast, {
            toastProps = {
                toastContent = {
                    toastTitle = v19, 
                    toastSubtitle = v20, 
                    hideIcon = v21
                }
            }
        });
    end;
    v16.showPurchaseErrorToast = function(v22)
        v16.props.navigateToLuaAppPages[v13.PurchaseErrorToast](v22);
    end;
    v16.showNetworkingErrorToast = function(v23)
        v16.props.navigateToLuaAppPages[v13.NetworkingErrorToast](v23);
    end;
end;
v15.render = function(v24)
    return l_Roact_0.createElement(v10, l_Dash_0.join(v24.props, {
        closeModal = v24.closeModal, 
        purchaseGame = v24.purchaseGame, 
        showToast = v24.showToast, 
        showPurchaseErrorToast = v24.showPurchaseErrorToast, 
        showNetworkingErrorToast = v24.showNetworkingErrorToast, 
        analytics = l_Dash_0.None
    }));
end;
return l_compose_0(v7.connect(function(v25)
    return {
        navigateToLuaAppPages = v25.navigateToLuaAppPages
    };
end), l_RoactRodux_0.connect(v11, function(v26)
    return {
        purchaseProductById = function(v27, v28)
            return v26(v12.API(v27, v28));
        end
    };
end), v14.connect(function(v29)
    return {
        analytics = v29
    };
end))(v15);
