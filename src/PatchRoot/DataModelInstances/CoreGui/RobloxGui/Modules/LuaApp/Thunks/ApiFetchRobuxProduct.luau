local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.PaymentsGatewayApi.PostGetUpsellProduct);
local v4 = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
local v5 = require(l_Modules_0.LuaApp.Util.getPaymentPlatform);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local function _(v7)
    if v7 == v4.Web then
        return "Web";
    elseif v7 == v4.Apple then
        return "AppleAppStore";
    elseif v7 == v4.Google then
        return "GooglePlayStore";
    elseif v7 == v4.Amazon then
        return "AmazonStore";
    elseif v7 == v4.UWP then
        return "WindowsStore";
    elseif v7 == v4.Xbox then
        return "XboxStore";
    elseif v7 == v4.Maquettes then
        return "MaquettesStore";
    elseif v7 == v4.Palisades then
        return "PalisadesStore";
    else
        return "None";
    end;
end;
return function(v9, v10, v11)
    return function(_)
        local v13 = v5();
        return v3(v9, v13 == v4.Web and "Web" or (v13 == v4.Apple and "AppleAppStore" or (v13 == v4.Google and "GooglePlayStore" or (v13 == v4.Amazon and "AmazonStore" or (v13 == v4.UWP and "WindowsStore" or (v13 == v4.Xbox and "XboxStore" or (v13 == v4.Maquettes and "MaquettesStore" or (v13 == v4.Palisades and "PalisadesStore" or "None"))))))), v10, v11):andThen(function(v14)
            if not (v14 ~= nil) or v14[1] == nil then
                return v2.reject();
            else
                local v15 = v14[1];
                return v2.resolve({
                    productId = v15.roblox_product_id, 
                    providerId = v15.provider_product_id, 
                    productName = v15.roblox_product_name, 
                    robuxAmount = v15.robux_amount
                });
            end;
        end);
    end;
end;
