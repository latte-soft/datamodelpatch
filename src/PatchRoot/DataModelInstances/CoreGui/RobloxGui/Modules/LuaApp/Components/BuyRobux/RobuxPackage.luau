local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_Modules_0.LuaApp.Models.PremiumFeaturesApi.IAPProduct);
local _ = require(l_CorePackages_0.Workspace.Packages.PaymentsProtocol).PaymentsProtocol.default;
local v4 = {};
calculateMoreAmount = function(v5)
    if not (v5 ~= nil) or #v5 == 0 then
        return {};
    else
        local v6 = nil;
        for _, v8 in v5, nil, nil do
            if not (v6 ~= nil) or v8.robuxAmount < v6.robuxAmount then
                v6 = v8;
            end;
        end;
        for _, v10 in v5, nil, nil do
            local v11 = v10.robuxAmount - v6.robuxAmount * (v10.price / v6.price);
            if v11 > 0 then
                v10.robuxMoreAmount = math.floor((v11 + 50) / 100) * 100;
            end;
        end;
        return v5;
    end;
end;
v4.formatIapProducts = function(v12)
    local v13 = {};
    for _, v15 in v12, nil, nil do
        table.insert(v13, {
            productId = v15.productId, 
            price = v15.price, 
            packageId = v15.mobileProductId, 
            robuxAmount = v15.robuxAmount, 
            currencyAmountStr = v15.currencySymbol .. tostring(v15.price)
        });
    end;
    return calculateMoreAmount(v13);
end;
v4.formatNativeRobuxProducts = function(v16)
    local v17 = {};
    for _, v19 in v16, nil, nil do
        table.insert(v17, {
            productId = v19.productId, 
            price = v19.price, 
            packageId = v19.nativeProductId, 
            robuxAmount = v19.robuxAmount, 
            currencyAmountStr = v19.displayPrice
        });
    end;
    return calculateMoreAmount(v17);
end;
return v4;
