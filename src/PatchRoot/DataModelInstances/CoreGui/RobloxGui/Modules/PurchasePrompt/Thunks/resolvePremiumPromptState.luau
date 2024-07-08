local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local v2 = require(l_Parent_0.Actions.SetPromptState);
local v3 = require(l_Parent_0.Actions.ErrorOccurred);
local v4 = require(l_Parent_0.Actions.PremiumInfoRecieved);
local v5 = require(l_Parent_0.Actions.AccountInfoReceived);
local v6 = require(l_Parent_0.Actions.BalanceInfoRecieved);
local v7 = require(l_Parent_0.Enums.PromptState);
local v8 = require(l_Parent_0.Enums.PurchaseError);
local v9 = require(l_Parent_0.Services.Analytics);
local v10 = require(l_Parent_0.Services.ExternalSettings);
local v11 = require(l_Parent_0.Services.Network);
local v12 = require(l_Parent_0.Network.postPremiumImpression);
local v13 = require(l_Parent_0.Thunks.completeRequest);
local v14 = require(l_Parent_0.Thunk);
local v15 = {
    v11, 
    v10, 
    v9
};
return function(v16, v17, v18, v19)
    return v14.new(script.Name, v15, function(v20, v21)
        local v22 = v21[v11];
        local v23 = v21[v10];
        local v24 = v21[v9];
        local v25 = v23.getPlatform();
        v20:dispatch(v4(v18));
        v20:dispatch(v5(v16));
        v20:dispatch(v6(v17));
        if v19 == false then
            v24.signalPremiumUpsellPrecheckFail();
            return v20:dispatch(v13());
        else
            if not v23.isStudio() then
                if v16.isPremium then
                    v24.signalPremiumUpsellShownPremium();
                    return v20:dispatch(v3(v8.AlreadyPremium));
                end;
            elseif l_Players_0.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
                return v20:dispatch(v3(v8.AlreadyPremium));
            end;
            if v25 == Enum.Platform.XBoxOne then
                v24.signalPremiumUpsellInvalidPlatform();
                return v20:dispatch(v3(v8.PremiumUnavailablePlatform));
            elseif v18 == nil then
                v24.signalPremiumUpsellInvalidProducts();
                return v20:dispatch(v3(v8.PremiumUnavailable));
            else
                if not v23.isStudio() then
                    v24.signalPremiumUpsellShownNonPremium();
                    v12(v22);
                end;
                return v20:dispatch(v2(v7.PremiumUpsell));
            end;
        end;
    end);
end;
