local l_Parent_0 = script.Parent.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.PurchasePromptDeps).Roact;
local v4 = require(l_CorePackages_0.Packages.React);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_RobloxGui_0.Modules.Common.CoreScriptsRootProvider);
local v8 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v10 = require(l_Parent_0.Enums.RequestType);
local v11 = require(l_Parent_0.Thunks.completeRequest);
local v12 = require(l_Parent_0.Thunks.launchSubscriptionPurchase);
local v13 = require(l_Parent_0.Thunks.sendEvent);
local v14 = require(l_Parent_0.connectToStore);
local v15 = require(l_Parent_0.Components.Connection.ExternalEventConnection);
local v16 = require(script.Parent.SubscriptionPurchaseOverlay);
local v17 = l_Roact_0.Component:extend(script.Name);
local v18 = require(l_Parent_0.Flags.GetFFlagFixPlayerGuiSelectionBugOnPromptExit);
local v19 = require(l_Parent_0.Flags.GetFFlagEnableRobloxCreditPurchase);
v17.init = function(v20)
    v20.state = {
        screenSize = Vector2.new(0, 0)
    };
    v20.changeScreenSize = function(v21)
        if v20.state.screenSize ~= v21.AbsoluteSize then
            v20:setState({
                screenSize = v21.AbsoluteSize
            });
        end;
    end;
    if v18() then
        v20.savedSelectedCoreObject = nil;
        v20.endPurchase = function()
            v20:restoreSelectedObject();
            v20.props.completeRequest();
        end;
    end;
end;
v17.saveSelectedObject = function(v22)
    if v18() then
        v22.savedSelectedCoreObject = l_GuiService_0.SelectedCoreObject;
        l_GuiService_0.SelectedCoreObject = nil;
        return ;
    else
        return ;
    end;
end;
v17.restoreSelectedObject = function(v23)
    if v18() then
        if not (v23.savedSelectedCoreObject ~= nil and not v23.savedSelectedCoreObject:IsDescendantOf(l_CoreGui_0)) then
            l_GuiService_0.SelectedCoreObject = v23.savedSelectedCoreObject;
        end;
        return ;
    else
        return ;
    end;
end;
v17.createElement = function(v24)
    local l_props_0 = v24.props;
    local l_state_0 = v24.state;
    if v18() then
        v24:saveSelectedObject();
    end;
    local v27 = nil;
    local v28 = nil;
    local l_subscriptionPurchaseInfo_0 = l_props_0.subscriptionPurchaseInfo;
    if v19() and l_subscriptionPurchaseInfo_0 ~= nil then
        v27 = l_subscriptionPurchaseInfo_0.PrimaryPaymentProviderType;
        v28 = if not l_subscriptionPurchaseInfo_0.AllPaymentProviderTypes then nil else l_subscriptionPurchaseInfo_0.AllPaymentProviderTypes[2];
    end;
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        [l_Roact_0.Change.AbsoluteSize] = v24.changeScreenSize, 
        BackgroundTransparency = 1
    }, {
        Prompt = l_Roact_0.createElement(v16, {
            screenSize = l_state_0.screenSize, 
            promptState = l_props_0.promptState, 
            purchaseError = l_props_0.purchaseError, 
            subscriptionId = l_props_0.subscriptionId, 
            name = l_props_0.subscriptionPurchaseInfo.Name, 
            subscriptionProviderId = l_props_0.subscriptionPurchaseInfo.SubscriptionProviderId, 
            subscriptionProviderName = l_props_0.subscriptionPurchaseInfo.SubscriptionProviderName, 
            priceTier = l_props_0.subscriptionPurchaseInfo.PriceTier, 
            displayPrice = l_props_0.subscriptionPurchaseInfo.DisplayPrice, 
            period = l_props_0.subscriptionPurchaseInfo.DisplaySubscriptionPeriod, 
            disclaimerText = l_props_0.subscriptionPurchaseInfo.DisclaimerText, 
            description = l_props_0.subscriptionPurchaseInfo.Description, 
            itemIcon = l_props_0.subscriptionPurchaseInfo.ImageUrl, 
            primaryPaymentMethod = v27, 
            secondaryPaymentMethod = v28, 
            isGamepadEnabled = l_props_0.isGamepadEnabled, 
            isTestingMode = l_props_0.subscriptionPurchaseInfo.IsTestingMode, 
            promptSubscriptionPurchase = l_props_0.promptSubscriptionPurchase, 
            endPurchase = if not v18() then l_props_0.completeRequest else v24.endPurchase, 
            onAnalyticEvent = l_props_0.onAnalyticEvent
        }), 
        ModalFix = l_Roact_0.createElement("ImageButton", {
            BackgroundTransparency = 0, 
            Modal = true, 
            Size = UDim2.new(0, 0, 0, 0)
        }), 
        OnCoreGuiMenuOpened = l_Roact_0.createElement(v15, {
            event = l_GuiService_0.MenuOpened, 
            callback = function()
                l_props_0.completeRequest();
            end
        })
    });
end;
v17.render = function(v30)
    if v30.props.requestType ~= v10.Subscription then
        return nil;
    else
        return l_Roact_0.createElement(v7, {}, {
            FocusNavigationEffects = v4.createElement(v8, {
                selectionGroupName = "SubscriptionPurchaseContainer", 
                focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
            }, {
                SubscriptionPurchaseContainer = v30:createElement()
            })
        });
    end;
end;
return (v14(function(v31)
    return {
        requestType = v31.promptRequest.requestType, 
        promptState = v31.promptState, 
        purchaseError = v31.purchaseError, 
        subscriptionPurchaseInfo = v31.subscriptionPurchaseInfo, 
        subscriptionId = v31.promptRequest.id, 
        isGamepadEnabled = v31.gamepadEnabled
    };
end, function(v32)
    return {
        promptSubscriptionPurchase = function(v33)
            return v32(v12(v33));
        end, 
        completeRequest = function()
            return v32(v11());
        end, 
        onAnalyticEvent = function(v34, v35)
            return v32(v13(v34, v35));
        end
    };
end)(v17));
