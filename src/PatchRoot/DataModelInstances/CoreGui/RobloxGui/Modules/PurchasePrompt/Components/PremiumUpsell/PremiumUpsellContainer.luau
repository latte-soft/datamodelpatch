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
local v12 = require(l_Parent_0.Thunks.launchPremiumUpsell);
local v13 = require(l_Parent_0.Thunks.sendEvent);
local v14 = require(l_Parent_0.connectToStore);
local v15 = require(l_Parent_0.Components.Connection.ExternalEventConnection);
local v16 = require(script.Parent.PremiumUpsellOverlay);
local v17 = require(l_Parent_0.Flags.GetFFLagUseCoreScriptsRootProviderForUpsellModal);
local v18 = l_Roact_0.Component:extend(script.Name);
local v19 = require(l_Parent_0.Flags.GetFFlagFixPlayerGuiSelectionBugOnPromptExitPremium);
v18.init = function(v20)
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
    if v19() then
        v20.savedSelectedCoreObject = nil;
        v20.endPurchase = function()
            v20:restoreSelectedObject();
            v20.props.completeRequest();
        end;
    end;
end;
v18.saveSelectedObject = function(v22)
    if v19() then
        v22.savedSelectedCoreObject = l_GuiService_0.SelectedCoreObject;
        l_GuiService_0.SelectedCoreObject = nil;
        return ;
    else
        return ;
    end;
end;
v18.restoreSelectedObject = function(v23)
    if v19() then
        if not (v23.savedSelectedCoreObject ~= nil and not v23.savedSelectedCoreObject:IsDescendantOf(l_CoreGui_0)) then
            l_GuiService_0.SelectedCoreObject = v23.savedSelectedCoreObject;
        end;
        return ;
    else
        return ;
    end;
end;
v18.createElement = function(v24)
    local l_props_0 = v24.props;
    local l_state_0 = v24.state;
    if l_props_0.requestType ~= v10.Premium then
        return nil;
    else
        if v19() then
            v24:saveSelectedObject();
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
                currencySymbol = l_props_0.premiumProductInfo.currencySymbol, 
                robuxPrice = l_props_0.premiumProductInfo.price, 
                robuxAmount = l_props_0.premiumProductInfo.robuxAmount, 
                isGamepadEnabled = l_props_0.isGamepadEnabled, 
                promptPremiumPurchase = l_props_0.promptPremiumPurchase, 
                endPurchase = if not v19() then l_props_0.completeRequest else v24.endPurchase, 
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
end;
v18.render = function(v27)
    if not v17() then
        return v27:createElement();
    else
        return l_Roact_0.createElement(v7, {}, {
            FocusNavigationEffects = v4.createElement(v8, {
                selectionGroupName = "PremiumUpsellContainer", 
                focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
            }, {
                PremiumUpsellContainer = v27:createElement()
            })
        });
    end;
end;
return (v14(function(v28)
    return {
        requestType = v28.promptRequest.requestType, 
        promptState = v28.promptState, 
        purchaseError = v28.purchaseError, 
        premiumProductInfo = v28.premiumProductInfo, 
        isGamepadEnabled = v28.gamepadEnabled
    };
end, function(v29)
    return {
        promptPremiumPurchase = function()
            return v29(v12());
        end, 
        completeRequest = function()
            return v29(v11());
        end, 
        onAnalyticEvent = function(v30, v31)
            return v29(v13(v30, v31));
        end
    };
end)(v18));
