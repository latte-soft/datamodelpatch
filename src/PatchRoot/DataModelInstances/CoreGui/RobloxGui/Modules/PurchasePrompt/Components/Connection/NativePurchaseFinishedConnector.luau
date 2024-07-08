local l_Parent_0 = script.Parent.Parent.Parent;
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Roact_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Roact;
local v3 = require(l_Parent_0.Actions.ErrorOccurred);
local v4 = require(l_Parent_0.Enums.PurchaseError);
local v5 = require(l_Parent_0.Thunks.retryAfterUpsell);
local v6 = require(l_Parent_0.connectToStore);
local v7 = require(l_Parent_0.Enums.Counter);
local v8 = require(l_Parent_0.Thunks.sendCounter);
local v9 = require(script.Parent.ExternalEventConnection);
return (v6(nil, function(v10)
    return {
        nativePurchaseFinished = function(_, _, v13)
            if not v13 then
                v10(v3(v4.InvalidFundsUnknown));
                v10(v8(v7.UpsellFailedNativePurchase));
                return ;
            else
                v10(v5());
                return ;
            end;
        end, 
        nativePurchaseFinishedWithLocalPlayer = function(_, v15)
            if not v15 then
                v10(v3(v4.InvalidFundsUnknown));
                v10(v8(v7.UpsellFailedNativePurchase));
                return ;
            else
                v10(v5());
                return ;
            end;
        end
    };
end)(function(v16)
    local l_nativePurchaseFinished_0 = v16.nativePurchaseFinished;
    local l_nativePurchaseFinishedWithLocalPlayer_0 = v16.nativePurchaseFinishedWithLocalPlayer;
    if not game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
        return l_Roact_0.createElement(v9, {
            event = l_MarketplaceService_0.NativePurchaseFinished, 
            callback = l_nativePurchaseFinished_0
        });
    else
        return l_Roact_0.createFragment({
            NativePurchase = l_Roact_0.createElement(v9, {
                event = l_MarketplaceService_0.NativePurchaseFinished, 
                callback = l_nativePurchaseFinished_0
            }), 
            NativePurchaseWithLocalPlayer = l_Roact_0.createElement(v9, {
                event = l_MarketplaceService_0.NativePurchaseFinishedWithLocalPlayer, 
                callback = l_nativePurchaseFinishedWithLocalPlayer_0
            })
        });
    end;
end));
