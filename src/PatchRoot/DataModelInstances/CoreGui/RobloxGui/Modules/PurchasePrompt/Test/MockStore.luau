local l_Rodux_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Rodux;
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Reducers.Reducer);
local v3 = require(l_Parent_0.Services.ABTest);
local v4 = require(l_Parent_0.Services.Network);
local v5 = require(l_Parent_0.Services.Analytics);
local v6 = require(l_Parent_0.Services.PlatformInterface);
local v7 = require(l_Parent_0.Services.ExternalSettings);
local v8 = require(l_Parent_0.Thunk);
local v9 = require(l_Parent_0.Enums.PurchaseFlow);
return {
    getMockPurchaseFlow = function(v10)
        return v10 or v9.Product;
    end, 
    getMockNativeUpsell = function(_, _, _)
        return {
            robuxProductId = "testRobuxProductId", 
            productId = "testProductId", 
            robuxPurchaseAmount = 500
        };
    end, 
    getMockStore = function()
        return l_Rodux_0.Store.new(v2, {}, {
            v8.middleware({
                [v3] = v3.new(), 
                [v4] = v4.new(), 
                [v5] = v5.new(), 
                [v6] = v6.new(), 
                [v7] = v7.new()
            })
        });
    end
};
