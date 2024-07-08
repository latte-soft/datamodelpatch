local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseEnded);
local v7 = require(l_script_FirstAncestor_0.Store.Selectors.selectPurchaseResults);
local v8 = require(l_script_FirstAncestor_0.Utils.getThumbnailUrl);
local _ = require(l_script_FirstAncestor_0.Store.Types);
local _ = require(script.Parent.BulkPurchasePartialSuccess);
local function _(v11, v12)
    return {
        id = v11.id, 
        image = v8(v11.id, v11.type), 
        name = v11.name, 
        status = v12
    };
end;
local function v22(v14)
    local v15 = {};
    local v16 = {};
    local v17 = 0;
    if not (not v14.itemData or not v14.itemStatuses) then
        for _, v19 in v14.itemData, nil, nil do
            local v20 = v14.itemStatuses[v19.id];
            local v21 = {
                id = v19.id, 
                image = v8(v19.id, v19.type), 
                name = v19.name, 
                status = v20
            };
            if v20 == Enum.MarketplaceItemPurchaseStatus.Success then
                v17 = v17 + v19.priceRobux;
                table.insert(v15, v21);
            elseif v20 then
                table.insert(v16, v21);
            end;
        end;
    end;
    return {
        robuxSpent = v17, 
        currentBalance = v14.balance or 0, 
        unsuccessfulItems = v16, 
        successfulItems = v15
    };
end;
return function()
    local v23 = l_useSelector_0(v7);
    local v24 = l_useSelector_0(v22);
    local v25 = l_useDispatch_0();
    return {
        onDismiss = v3.useCallback(function()
            l_MarketplaceService_0:signalPromptBulkPurchaseFinished(1, v23);
            v25(v6());
        end, {
            v23, 
            v25
        }), 
        successfulItems = v24.successfulItems, 
        unsuccessfulItems = v24.unsuccessfulItems, 
        robuxSpent = v24.robuxSpent, 
        currentBalance = v24.currentBalance
    };
end;
