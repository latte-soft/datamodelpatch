local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseEnded);
local v6 = require(l_script_FirstAncestor_0.Store.Selectors.selectPurchaseResults);
local _ = require(script.Parent.BulkPurchaseSuccess);
return function()
    local v8 = l_useDispatch_0();
    local v9 = l_useSelector_0(v6);
    local v10 = 0;
    for _, v12 in v9.Items, nil, nil do
        if v12.status == Enum.MarketplaceItemPurchaseStatus.Success then
            v10 = v10 + 1;
        end;
    end;
    return {
        onDismiss = function()
            l_MarketplaceService_0:signalPromptBulkPurchaseFinished(1, v9);
            v8(v5());
        end, 
        itemCount = v10
    };
end;
