local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
local v2 = require(l_Parent_0.Enums.PaymentPlatform);
local v3 = require(l_Parent_0.Models.RobuxUpsell);
local v4 = require(l_Parent_0.Promise);
local function _(v5)
    if v5 == v2.Web then
        return "Web";
    elseif v5 == v2.Apple then
        return "AppleAppStore";
    elseif v5 == v2.Google then
        return "GooglePlayStore";
    elseif v5 == v2.Amazon then
        return "AmazonStore";
    elseif v5 == v2.UWP then
        return "WindowsStore";
    elseif v5 == v2.Xbox then
        return "XboxStore";
    elseif v5 == v2.Maquettes then
        return "MaquettesStore";
    elseif v5 == v2.Palisades then
        return "PalisadesStore";
    else
        return "None";
    end;
end;
return function(v7, v8, v9, v10)
    return v7.getRobuxUpsellProduct(v8, v9, v10 == v2.Web and "Web" or (v10 == v2.Apple and "AppleAppStore" or (v10 == v2.Google and "GooglePlayStore" or (v10 == v2.Amazon and "AmazonStore" or (v10 == v2.UWP and "WindowsStore" or (v10 == v2.Xbox and "XboxStore" or (v10 == v2.Maquettes and "MaquettesStore" or (v10 == v2.Palisades and "PalisadesStore" or "None")))))))):andThen(function(v11)
        local v12 = v3.fromJson(v11);
        if not v12 then
            return v4.reject(v1.UnknownFailure);
        else
            return v4.resolve(v12);
        end;
    end):catch(function(_)
        return v4.reject(v1.UnknownFailure);
    end);
end;
