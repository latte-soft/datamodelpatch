local l_Parent_0 = script.Parent.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.PurchasePromptDeps).Roact;
local v4 = require(l_CorePackages_0.Packages.React);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.Common.CoreScriptsRootProvider);
local v7 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v9 = require(l_Parent_0.Enums.PurchaseFlow);
local v10 = require(l_Parent_0.Thunks.completeRequest);
local v11 = require(l_Parent_0.Thunks.purchaseItem);
local v12 = require(l_Parent_0.Thunks.launchRobuxUpsell);
local v13 = require(l_Parent_0.Thunks.openRobuxStore);
local v14 = require(l_Parent_0.Thunks.openSecuritySettings);
local v15 = require(l_Parent_0.Thunks.openTermsOfUse);
local v16 = require(l_Parent_0.Thunks.initiatePurchasePrecheck);
local v17 = require(l_Parent_0.Thunks.sendEvent);
local v18 = require(l_Parent_0.Utils.isMockingPurchases);
local v19 = require(l_Parent_0.Utils.getPlayerPrice);
local v20 = require(l_Parent_0.Utils.isLinksAllowed);
local v21 = require(l_Parent_0.connectToStore);
local v22 = require(l_Parent_0.Components.Connection.ExternalEventConnection);
local v23 = require(l_Parent_0.Flags.GetFFLagUseCoreScriptsRootProviderForUpsellModal);
local v24 = require(script.Parent.RobuxUpsellOverlay);
local v25 = l_Roact_0.Component:extend(script.Name);
v25.init = function(v26)
    v26.state = {
        screenSize = Vector2.new(0, 0)
    };
    v26.changeScreenSize = function(v27)
        if v26.state.screenSize ~= v27.AbsoluteSize then
            v26:setState({
                screenSize = v27.AbsoluteSize
            });
        end;
    end;
end;
v25.createElement = function(v28)
    local l_props_0 = v28.props;
    local l_state_0 = v28.state;
    if l_props_0.purchaseFlow ~= v9.RobuxUpsellV2 and l_props_0.purchaseFlow ~= v9.LargeRobuxUpsell then
        return nil;
    else
        local v31 = v20();
        local l_imageUrl_0 = l_props_0.productInfo.imageUrl;
        if string.find(l_props_0.productInfo.imageUrl, "assetid=0") then
            l_imageUrl_0 = nil;
        end;
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            [l_Roact_0.Change.AbsoluteSize] = v28.changeScreenSize, 
            BackgroundTransparency = 1
        }, {
            Prompt = l_Roact_0.createElement(v24, {
                screenSize = l_state_0.screenSize, 
                requestType = l_props_0.requestType, 
                promptState = l_props_0.promptState, 
                purchaseFlow = l_props_0.purchaseFlow, 
                purchaseError = l_props_0.purchaseError, 
                robuxProviderId = l_props_0.nativeUpsell.robuxProductId, 
                robuxProductId = l_props_0.nativeUpsell.productId, 
                itemIcon = l_imageUrl_0, 
                itemName = l_props_0.productInfo.name, 
                itemRobuxCost = v19(l_props_0.productInfo, l_props_0.accountInfo.membershipType == 4), 
                iapRobuxAmount = l_props_0.nativeUpsell.robuxPurchaseAmount or 0, 
                beforeRobuxBalance = l_props_0.accountInfo.balance, 
                isTestPurchase = l_props_0.isTestPurchase, 
                isGamepadEnabled = l_props_0.isGamepadEnabled, 
                purchaseItem = l_props_0.purchaseItem, 
                promptRobuxPurchase = l_props_0.promptRobuxPurchase, 
                openRobuxStore = l_props_0.openRobuxStore, 
                openTermsOfUse = not not v31 and l_props_0.openTermsOfUse or nil, 
                openSecuritySettings = not not v31 and l_props_0.openSecuritySettings or nil, 
                dispatchFetchPurchaseWarning = l_props_0.dispatchFetchPurchaseWarning, 
                endPurchase = l_props_0.completeRequest, 
                onAnalyticEvent = l_props_0.onAnalyticEvent
            }), 
            ModalFix = l_Roact_0.createElement("ImageButton", {
                BackgroundTransparency = 0, 
                Modal = true, 
                Size = UDim2.new(0, 0, 0, 0)
            }), 
            OnCoreGuiMenuOpened = l_Roact_0.createElement(v22, {
                event = l_GuiService_0.MenuOpened, 
                callback = function()
                    l_props_0.completeRequest();
                end
            })
        });
    end;
end;
v25.render = function(v33)
    if not v23() then
        return v33:createElement();
    else
        return l_Roact_0.createElement(v6, {}, {
            FocusNavigationEffects = v4.createElement(v7, {
                selectionGroupName = "RobuxUpsellContainer", 
                focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
            }, {
                RobuxUpsellContainer = v33:createElement()
            })
        });
    end;
end;
return (v21(function(v34)
    return {
        purchaseFlow = v34.purchaseFlow, 
        requestType = v34.promptRequest.requestType, 
        promptState = v34.promptState, 
        purchaseError = v34.purchaseError, 
        productInfo = v34.productInfo, 
        accountInfo = v34.accountInfo, 
        nativeUpsell = v34.nativeUpsell, 
        isTestPurchase = v18(), 
        isGamepadEnabled = v34.gamepadEnabled
    };
end, function(v35)
    return {
        purchaseItem = function()
            return v35(v11());
        end, 
        promptRobuxPurchase = function()
            return v35(v12());
        end, 
        openRobuxStore = function()
            return v35(v13());
        end, 
        openSecuritySettings = function()
            return v35(v14());
        end, 
        openTermsOfUse = function()
            return v35(v15());
        end, 
        dispatchFetchPurchaseWarning = function()
            return v35(v16());
        end, 
        completeRequest = function()
            l_GuiService_0.SelectedCoreObject = nil;
            return v35(v10());
        end, 
        onAnalyticEvent = function(v36, v37)
            return v35(v17(v36, v37));
        end
    };
end)(v25));
