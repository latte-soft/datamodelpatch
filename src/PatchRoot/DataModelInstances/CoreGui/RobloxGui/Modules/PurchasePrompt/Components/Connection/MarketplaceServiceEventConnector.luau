local l_Parent_0 = script.Parent.Parent.Parent;
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local l_Roact_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Roact;
local v4 = require(l_Parent_0.Actions.ErrorOccurred);
local v5 = require(l_Parent_0.Enums.PurchaseError);
local v6 = require(l_Parent_0.Thunks.completePurchase);
local v7 = require(l_Parent_0.Thunks.initiatePurchase);
local v8 = require(l_Parent_0.Thunks.initiateBundlePurchase);
local v9 = require(l_Parent_0.Thunks.initiatePremiumPurchase);
local v10 = require(l_Parent_0.Thunks.initiateSubscriptionPurchase);
local v11 = require(l_Parent_0.connectToStore);
local v12 = require(script.Parent.ExternalEventConnection);
local v13 = require(l_Parent_0.Flags.GetFFlagEnablePromptPurchaseRequestedV2);
local v14 = require(l_Parent_0.Flags.GetFFlagEnablePromptPurchaseRequestedV2Take2);
local v15 = require(l_Parent_0.Parent.Flags.FFlagEnableUGC4ACollectiblePurchaseSupport);
return (v11(nil, function(v16)
    return {
        onPurchaseRequest = function(v17, v18, v19, _)
            if v17 == l_Players_0.LocalPlayer then
                v16(v7(v18, Enum.InfoType.Asset, v19, false, "", ""));
            end;
        end, 
        onPurchaseRequestV2 = function(v21, v22, v23, _, v25, v26)
            if v21 == l_Players_0.LocalPlayer then
                v16(v7(v22, Enum.InfoType.Asset, v23, false, v25, v26));
            end;
        end, 
        onRobloxPurchaseRequest = function(v27, v28)
            v16(v7(v27, Enum.InfoType.Asset, v28, true));
        end, 
        onProductPurchaseRequest = function(v29, v30, v31, _)
            if v29 == l_Players_0.LocalPlayer then
                v16(v7(v30, Enum.InfoType.Product, v31));
            end;
        end, 
        onPurchaseGamePassRequest = function(v33, v34)
            if v33 == l_Players_0.LocalPlayer then
                v16(v7(v34, Enum.InfoType.GamePass, false));
            end;
        end, 
        onServerPurchaseVerification = function(v35)
            if v35 then
                local l_playerId_0 = v35.playerId;
                if l_playerId_0 ~= nil then
                    l_playerId_0 = tonumber(v35.playerId);
                end;
                if l_playerId_0 == l_Players_0.LocalPlayer.UserId then
                    v16(v6());
                end;
                return ;
            else
                v16(v4(v5.UnknownFailure));
                return ;
            end;
        end, 
        onBundlePurchaseRequest = function(v37, v38)
            if v37 == l_Players_0.LocalPlayer then
                v16(v8(v38));
            end;
        end, 
        onPremiumPurchaseRequest = function(v39)
            if v39 == l_Players_0.LocalPlayer then
                v16(v9());
            end;
        end, 
        onPromptCollectiblesPurchaseRequest = function(v40, v41, v42, v43, v44, v45, v46, v47)
            if v40 == l_Players_0.LocalPlayer then
                v16(v7(v41, Enum.InfoType.Asset, false, true, v46, v47, v42, v43, v44, v45));
            end;
        end, 
        onSubscriptionPurchaseRequest = function(v48)
            v16(v10(v48));
        end, 
        onCollectibleBundlePurchaseRequest = if not v15 then nil else function(v49, v50, v51, v52, v53, v54, v55, v56)
            if v15 and v49 == l_Players_0.LocalPlayer then
                v16(v8(v50, v55, v56, v51, v52, v53, v54));
            end;
        end
    };
end)(function(v57)
    local l_onPurchaseRequest_0 = v57.onPurchaseRequest;
    local l_onPurchaseRequestV2_0 = v57.onPurchaseRequestV2;
    local l_onProductPurchaseRequest_0 = v57.onProductPurchaseRequest;
    local l_onPurchaseGamePassRequest_0 = v57.onPurchaseGamePassRequest;
    local l_onServerPurchaseVerification_0 = v57.onServerPurchaseVerification;
    local l_onBundlePurchaseRequest_0 = v57.onBundlePurchaseRequest;
    local l_onPremiumPurchaseRequest_0 = v57.onPremiumPurchaseRequest;
    local l_onRobloxPurchaseRequest_0 = v57.onRobloxPurchaseRequest;
    local l_onPromptCollectiblesPurchaseRequest_0 = v57.onPromptCollectiblesPurchaseRequest;
    local l_onSubscriptionPurchaseRequest_0 = v57.onSubscriptionPurchaseRequest;
    local v68 = if not v15 then nil else v57.onCollectibleBundlePurchaseRequest;
    local function v69()
        return l_MarketplaceService_0.PromptPurchaseRequestedV2;
    end;
    local v70 = nil;
    v70 = if v13() or v14() and pcall(v69) then l_Roact_0.createElement(v12, {
        event = l_MarketplaceService_0.PromptPurchaseRequestedV2, 
        callback = l_onPurchaseRequestV2_0
    }) else l_Roact_0.createElement(v12, {
        event = l_MarketplaceService_0.PromptPurchaseRequested, 
        callback = l_onPurchaseRequest_0
    });
    local function v71()
        return l_MarketplaceService_0.PromptCollectiblesPurchaseRequested;
    end;
    local v72 = nil;
    if pcall(v71) then
        v72 = l_Roact_0.createElement(v12, {
            event = l_MarketplaceService_0.PromptCollectiblesPurchaseRequested, 
            callback = l_onPromptCollectiblesPurchaseRequest_0
        });
    end;
    local function v73()
        return l_MarketplaceService_0.PromptCollectibleBundlePurchaseRequested;
    end;
    local v74 = nil;
    if not (not v15 or not pcall(v73)) then
        v74 = l_Roact_0.createElement(v12, {
            event = l_MarketplaceService_0.PromptCollectibleBundlePurchaseRequested, 
            callback = v68
        });
    end;
    return l_Roact_0.createFragment({
        v70, 
        v72, 
        v74, 
        RobloxPurchase = l_Roact_0.createElement(v12, {
            event = l_MarketplaceService_0.PromptRobloxPurchaseRequested, 
            callback = l_onRobloxPurchaseRequest_0
        }), 
        l_Roact_0.createElement(v12, {
            event = l_MarketplaceService_0.PromptProductPurchaseRequested, 
            callback = l_onProductPurchaseRequest_0
        }), 
        l_Roact_0.createElement(v12, {
            event = l_MarketplaceService_0.PromptGamePassPurchaseRequested, 
            callback = l_onPurchaseGamePassRequest_0
        }), 
        l_Roact_0.createElement(v12, {
            event = l_MarketplaceService_0.ServerPurchaseVerification, 
            callback = l_onServerPurchaseVerification_0
        }), 
        l_Roact_0.createElement(v12, {
            event = l_MarketplaceService_0.PromptBundlePurchaseRequested, 
            callback = l_onBundlePurchaseRequest_0
        }), 
        l_Roact_0.createElement(v12, {
            event = l_MarketplaceService_0.PromptPremiumPurchaseRequested, 
            callback = l_onPremiumPurchaseRequest_0
        }), 
        l_Roact_0.createElement(v12, {
            event = l_MarketplaceService_0.PromptSubscriptionPurchaseRequested, 
            callback = l_onSubscriptionPurchaseRequest_0
        })
    });
end));
