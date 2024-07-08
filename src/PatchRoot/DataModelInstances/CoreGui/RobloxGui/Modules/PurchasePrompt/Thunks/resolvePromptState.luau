local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_0.Actions.SetPurchaseFlow);
local v4 = require(l_Parent_0.Actions.SetPromptState);
local v5 = require(l_Parent_0.Actions.ProductInfoReceived);
local v6 = require(l_Parent_0.Actions.AccountInfoReceived);
local v7 = require(l_Parent_0.Actions.BalanceInfoRecieved);
local v8 = require(l_Parent_0.Actions.PromptNativeUpsell);
local v9 = require(l_Parent_0.Actions.ErrorOccurred);
local v10 = require(l_Parent_0.Actions.CompleteRequest);
local v11 = require(l_Parent_0.Enums.PurchaseFlow);
local v12 = require(l_Parent_0.Enums.PromptState);
local v13 = require(l_Parent_0.Enums.PurchaseError);
local v14 = require(l_Parent_0.Enums.PaymentPlatform);
local v15 = require(l_Parent_0.Enums.RequestType);
local _ = require(l_Parent_0.Models.RobuxUpsell);
local v17 = require(l_Parent_0.Network.getRobuxUpsellProduct);
local v18 = require(l_Parent_0.Services.ABTest);
local v19 = require(l_Parent_0.Services.Analytics);
local v20 = require(l_Parent_0.Services.ExternalSettings);
local v21 = require(l_Parent_0.Services.Network);
local v22 = require(l_Parent_0.Enums.Counter);
local v23 = require(l_Parent_0.Thunks.sendCounter);
local v24 = require(l_Parent_0.Utils.meetsPrerequisites);
local v25 = require(l_Parent_0.Utils.getPlayerProductInfoPrice);
local v26 = require(l_Parent_0.Utils.getPaymentPlatform);
local v27 = require(l_Parent_0.Utils.getPaymentFromPlatformLegacy);
local v28 = require(l_Parent_0.Utils.getHasAmazonUserAgent);
local v29 = require(l_Parent_0.Flags.GetFFlagEnableQuestPaymentPlatformType);
local v30 = require(l_Parent_0.Utils.hasPendingRequest);
local v31 = require(l_Parent_0.Thunk);
local v32 = require(l_Parent_0.Flags.GetFFlagEnableLuobuInGameUpsell);
local l_GetFStringLargerRobuxUpsellIxpLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringLargerRobuxUpsellIxpLayer;
local v34 = require(l_Parent_0.Flags.LargerRobuxUpsellTest);
local v35 = {
    v18, 
    v19, 
    v20, 
    v21
};
return function(v36, v37, v38, v39, v40, v41)
    return v31.new(script.Name, v35, function(v42, v43)
        local v44 = v42:getState();
        local v45 = v43[v18];
        local v46 = v43[v19];
        local v47 = v43[v20];
        local v48 = v43[v21];
        v42:dispatch(v5(v36));
        v42:dispatch(v6(v37));
        v42:dispatch(v7(v38));
        local v49, v50 = v24(v36, v39, (not v47.getFlagBypassThirdPartySettingForRobloxPurchase() or not v40) and (v47.getLuaUseThirdPartyPermissions() or v47.getFlagRestrictSales2()), v47, v41);
        if v49 then
            local l_robux_0 = v38.robux;
            local v52 = v25(v36, v37.isPremium);
            if v41 ~= nil then
                v52 = v41;
            end;
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            if l_robux_0 < v52 then
                if not v47.getFFlagDisableRobuxUpsell() then
                    local v54 = nil;
                    v54 = if not v29() then v27(l_l_UserInputService_0_Platform_0, v32(), (v28())) else v26(l_l_UserInputService_0_Platform_0);
                    if v54 ~= v14.Web then
                        v42:dispatch(v3(v11.RobuxUpsellV2));
                    end;
                    local _ = false;
                    if v34.isEnabled() then
                        local v56 = l_GetFStringLargerRobuxUpsellIxpLayer_0();
                        local v57 = v45.getLayerData(v56);
                        if v57 then
                            v45.logUserLayerExposure(v56);
                            if v34.isUserEnrolled(v57) then
                                v42:dispatch(v3(v11.LargeRobuxUpsell));
                            end;
                        end;
                    end;
                    return v17(v48, v52, l_robux_0, v54):andThen(function(v58)
                        if v30(v42:getState()) then
                            v46.signalProductPurchaseUpsellShown(v58.id, v44.requestType, v58.providerId);
                            v42:dispatch(v8(v58.providerId, v58.id, v58.robuxAmount));
                            v42:dispatch(v23(v22.UpsellModalShown));
                            return ;
                        else
                            return ;
                        end;
                    end, function()
                        if v30(v42:getState()) then
                            if v42:getState().purchaseFlow == v11.LargeRobuxUpsell then
                                v42:dispatch(v4(v12.LargeRobuxUpsell));
                                v42:dispatch(v23(v22.UpsellModalShown));
                                return ;
                            else
                                v42:dispatch(v9(v13.NotEnoughRobuxXbox));
                                v42:dispatch(v23(v22.UpsellGenericModalShown));
                                return ;
                            end;
                        else
                            return ;
                        end;
                    end);
                else
                    return v42:dispatch(v9(v13.NotEnoughRobuxNoUpsell));
                end;
            else
                if v44.requestType ~= v15.AvatarCreationFee then
                    v46.signalProductPurchaseShown(v36.productId, v44.requestType);
                end;
                return v42:dispatch(v4(v12.PromptPurchase));
            end;
        elseif not v47.isStudio() and v50 == v13.ThirdPartyDisabled then
            return v42:dispatch(v10());
        else
            return v42:dispatch(v9(v50));
        end;
    end);
end;
