local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v6 = require(l_script_FirstAncestor_0.Store.Thunks.InitiateBulkPurchaseFlow);
local v7 = require(l_script_FirstAncestor_0.Hooks.useNetwork);
local _ = require(l_script_FirstAncestor_0.Store.Types);
local v9 = require(l_script_FirstAncestor_0.Enums.PurchasableStateEnum);
local function v14(v10)
    local v11 = {};
    for _, v13 in v10, nil, nil do
        table.insert(v11, {
            id = v13.id, 
            name = v13.name, 
            description = v13.description, 
            priceRobux = v13.priceRobux, 
            type = v13.type, 
            ownedCount = v13.ownedCount, 
            quantityLimitPerUser = v13.quantityLimitPerUser, 
            isLimited = v13.isLimited, 
            purchasableState = if v13.purchaseableState == "Purchaseable" then v9.Purchasable else v13.purchaseableState
        });
    end;
    return v11;
end;
return function()
    local v15 = l_useDispatch_0();
    local v16 = v7();
    v4.useEffect(function()
        local v17 = nil;
        if not (not v15 or not v16) then
            v17 = l_MarketplaceService_0.PromptBulkPurchaseRequested:Connect(function(v18, v19, v20, v21, v22, v23)
                if v18 == l_Players_0.LocalPlayer then
                    v15(v6(v16, v14(v19), v20, v21, v22, v23));
                end;
            end);
        end;
        return function()
            if v17 then
                v17:Disconnect();
                v17 = nil;
            end;
        end;
    end, {
        v15, 
        v16
    });
end;
