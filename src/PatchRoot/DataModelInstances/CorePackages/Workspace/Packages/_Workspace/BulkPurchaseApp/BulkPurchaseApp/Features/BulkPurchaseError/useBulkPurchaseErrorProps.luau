local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseEnded);
local v7 = require(l_script_FirstAncestor_0.Store.Selectors.selectPurchaseResults);
local v8 = require(l_script_FirstAncestor_0.Store.Selectors.selectErrorCode);
local _ = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
local _ = require(script.Parent.BulkPurchaseError);
return function()
    local v11 = l_useSelector_0(v7);
    local v12 = l_useSelector_0(v8);
    local v13 = l_useDispatch_0();
    return {
        onDismiss = v3.useCallback(function()
            l_MarketplaceService_0:signalPromptBulkPurchaseFinished(3, v11);
            v13(v6());
        end, {
            v11, 
            v13
        }), 
        errorCode = v12
    };
end;
