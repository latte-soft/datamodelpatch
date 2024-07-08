local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.RequestAvatarCreationFeePurchase);
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.Thunk);
local v4 = require(l_Parent_0.Services.Network);
local v5 = require(l_Parent_0.Services.ExternalSettings);
local v6 = require(l_Parent_0.Network.getBalanceInfo);
local v7 = require(l_Parent_0.Network.getAccountInfo);
local v8 = require(l_Parent_0.Actions.ErrorOccurred);
local v9 = require(script.Parent.resolvePromptState);
local v10 = {
    v4, 
    v5
};
return function(v11, v12, v13)
    return v3.new(script.Name, v10, function(v14, v15)
        local v16 = v15[v4];
        local v17 = v15[v5];
        v14:dispatch(v1(v13));
        return v2.all({
            accountInfo = v7(v16, v17), 
            balanceInfo = v6(v16, v17)
        }):andThen(function(v18)
            v14:dispatch(v9({
                PriceInRobux = 0, 
                Name = v11, 
                ProductId = v12
            }, v18.accountInfo, v18.balanceInfo, false, true, 0));
        end):catch(function(v19)
            v14:dispatch(v8(v19));
        end);
    end);
end;
