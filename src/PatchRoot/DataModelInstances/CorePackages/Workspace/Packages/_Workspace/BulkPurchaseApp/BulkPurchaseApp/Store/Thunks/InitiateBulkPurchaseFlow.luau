local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local v1 = require(l_script_FirstAncestor_0.Parent.Promise);
local v2 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseRequested);
local v3 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseFailed);
local v4 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseStarted);
local v5 = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
local v6 = require(l_script_FirstAncestor_0.NetworkRequests.getAccount);
local _ = require(l_script_FirstAncestor_0.Store.Types);
return function(v8, v9, v10, v11, v12, v13)
    return function(v14)
        v14:dispatch(v2(v9, v10, v11, v12, v13));
        local v15, _ = v6(v8);
        return v1.all({
            v15
        }):andThen(function(_)
            v14:dispatch(v4(v11));
        end):catch(function(_)
            v14:dispatch(v3(v5.Generic));
        end);
    end;
end;
