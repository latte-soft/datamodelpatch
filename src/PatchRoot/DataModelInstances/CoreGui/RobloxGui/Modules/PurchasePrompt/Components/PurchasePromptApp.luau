local l_Parent_0 = script.Parent.Parent;
local _ = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_CorePackages_0.PurchasePromptDeps);
local l_Roact_0 = v4.Roact;
local l_Rodux_0 = v4.Rodux;
local l_RoactRodux_0 = v4.RoactRodux;
local _ = v4.UIBlox.Style.Provider;
local l_LocaleProvider_0 = require(l_CorePackages_0.IAPExperience).Locale.LocaleProvider;
local v10 = require(l_Parent_0.Reducers.Reducer);
local v11 = require(l_Parent_0.Services.ABTest);
local v12 = require(l_Parent_0.Services.Network);
local v13 = require(l_Parent_0.Services.Analytics);
local v14 = require(l_Parent_0.Services.PlatformInterface);
local v15 = require(l_Parent_0.Services.ExternalSettings);
local v16 = require(l_Parent_0.Thunk);
local v17 = require(script.Parent.Connection.EventConnections);
local v18 = require(script.Parent.Connection.LayoutValuesProvider);
local v19 = require(script.Parent.Connection.provideRobloxLocale);
local v20 = require(l_Parent_0.Components.Connection.PurchasePromptPolicy);
local v21 = require(script.Parent.ProductPurchase.ProductPurchaseContainer);
local v22 = require(script.Parent.RobuxUpsell.RobuxUpsellContainer);
local v23 = require(script.Parent.PremiumUpsell.PremiumUpsellContainer);
local v24 = require(script.Parent.SubscriptionPurchase.SubscriptionPurchaseContainer);
local v25 = require(l_Parent_0.Flags.GetFFlagEnableAvatarCreationFeePurchase);
local v26 = require(script.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider);
local v27 = l_Roact_0.Component:extend("PurchasePromptApp");
v27.init = function(v28)
    local v29 = {};
    local v30 = v11.new();
    local v31 = v12.new();
    local v32 = v13.new();
    local v33 = v14.new();
    local v34 = v15.new();
    v28.state = {
        store = if v25() then nil else l_Rodux_0.Store.new(v10, v29, {
            v16.middleware({
                [v11] = v30, 
                [v12] = v31, 
                [v13] = v32, 
                [v14] = v33, 
                [v15] = v34
            })
        }), 
        isTenFootInterface = v34.isTenFootInterface()
    };
end;
v27.renderWithStyle = function(_, v36)
    return v26(v36);
end;
v27.render = function(v37)
    return v19(function()
        return l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
            store = if not v25() then v37.state.store else v37.props.store
        }, {
            StyleProvider = v37:renderWithStyle({
                LayoutValuesProvider = l_Roact_0.createElement(v18, {
                    isTenFootInterface = v37.state.isTenFootInterface
                }, {
                    PolicyProvider = l_Roact_0.createElement(v20.Provider, {
                        policy = {
                            v20.Mapper
                        }
                    }, {
                        PurchasePrompt = l_Roact_0.createElement("ScreenGui", {
                            AutoLocalize = false, 
                            IgnoreGuiInset = true
                        }, {
                            LocaleProvider = l_Roact_0.createElement(l_LocaleProvider_0, {
                                locale = l_LocalizationService_0.RobloxLocaleId
                            }, {
                                ProductPurchaseContainer = l_Roact_0.createElement(v21), 
                                RobuxUpsellContainer = l_Roact_0.createElement(v22), 
                                PremiumUpsellContainer = l_Roact_0.createElement(v23), 
                                SubscriptionPurchaseContainer = l_Roact_0.createElement(v24)
                            }), 
                            EventConnections = l_Roact_0.createElement(v17)
                        })
                    })
                })
            })
        });
    end);
end;
return v27;
