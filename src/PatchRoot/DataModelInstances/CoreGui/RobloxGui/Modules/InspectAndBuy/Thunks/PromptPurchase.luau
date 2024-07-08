local l_Players_0 = game:GetService("Players");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Thunk);
local v4 = require(l_Parent_0.Services.Analytics);
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_Parent_0.Actions.SetItemBeingPurchased);
local v7 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblePurchaseForUnlimited);
local v8 = require(l_Parent_0.Thunks.SendCounter);
local v9 = require(l_Parent_0.Flags.GetFFlagIBEnableSendCounters);
local v10 = require(l_Parent_0.Flags.GetFFlagIBFixl20HasQuantityPurchase);
local v11 = {
    v4
};
return function(v12, v13, v14, v15, v16, v17, v18)
    return v3.new(script.Name, v11, function(v19, v20)
        local v21 = v20[v4];
        v19:dispatch(v6(v12, v13));
        local v22 = v15 ~= nil;
        if v7() then
            v22 = v22 and v13 ~= v5.ItemType.Bundle;
        end;
        if not v22 then
            if v13 == v5.ItemType.Bundle then
                l_MarketplaceService_0:PromptBundlePurchase(l_Players_0.LocalPlayer, v12);
                if v9() then
                    v19:dispatch(v8(v5.Counters.PromptBundlePurchase));
                end;
            elseif v13 == v5.ItemType.Asset then
                local v23 = true;
                if v10() then
                    v23 = not v18;
                end;
                if not (v7() and v14 ~= nil) or not v23 then
                    l_MarketplaceService_0:PromptRobloxPurchase(v12, false);
                    if v9() then
                        v19:dispatch(v8(v5.Counters.PromptRobloxPurchase));
                    end;
                else
                    l_MarketplaceService_0:PromptPurchase(l_Players_0.LocalPlayer, v12, false);
                    if v9() then
                        v19:dispatch(v8(v5.Counters.PromptUnlimitedCollectiblePurchase));
                    end;
                end;
            elseif v9() then
                v19:dispatch(v8(v5.Counters.PromptPurchaseUnknownItemType));
            end;
        else
            l_MarketplaceService_0:PromptCollectiblesPurchase(l_Players_0.LocalPlayer, v12, v14, v16, v15, v17);
            if v9() then
                v19:dispatch(v8(v5.Counters.PromptLimitedCollectiblesPurchase));
            end;
        end;
        v21.reportPurchaseAttempt(v13, v12);
    end);
end;
