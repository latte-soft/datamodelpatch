local v0 = nil;
pcall(function()
    v0 = game:GetService("PlatformService");
end);
local v1 = require(script.Parent.EventHub);
local v2 = require(script.Parent.Http);
local v3 = require(script.Parent.Utility);
local v4 = {
    ["60"] = "899a379d-0a66-4b07-8bcd-29b1e38699ba", 
    ["59"] = "7dba5b02-02be-4442-814e-9b9ebf6d66bf"
};
local v5 = false;
local function _()
    while v5 do
        wait(0.1);
    end;
end;
local v7 = false;
local function _()
    while v7 do
        wait(0.1);
    end;
end;
local v9 = {};
v9.__index = v9;
v9.new = function(v10)
    local v11 = {};
    setmetatable(v11, v9);
    v11.data = v10;
    v11.partIds = {};
    v11.wearing = false;
    v11.owned = false;
    v11.isPurchasing = false;
    v11.isEquipping = false;
    v11.OwnershipChanged = v3.Signal();
    v11.IsWearingChanged = v3.Signal();
    return v11;
end;
v9.GetAssetId = function(v12)
    return v12.data.bundleId;
end;
v9.GetBundleId = function(v13)
    return v13.data.bundleId;
end;
v9.OpenAvatarDetailInXboxStore = function(v14)
    if v0 then
        local v15 = v4[tostring(v14:GetBundleId())];
        if v15 then
            v0:OpenProductDetail(v15);
        end;
    end;
end;
v9.IsXboxAddOn = function(v16)
    return v16.data.isStarterPack;
end;
v9.GetPartIds = function(v17)
    return v17.data.partIds;
end;
v9.IsWearing = function(v18)
    return v18.wearing;
end;
v9.SetWearing = function(v19, v20)
    if v20 ~= v19.wearing then
        v19.wearing = v20;
        v19.IsWearingChanged:fire(v19.wearing);
    end;
end;
v9.IsOwned = function(v21)
    return v21.owned;
end;
v9.SetOwned = function(v22, v23)
    if v23 ~= v22.owned then
        v22.owned = v23;
        v22.OwnershipChanged:fire(v22.owned);
    end;
end;
v9.GetRobuxPrice = function(v24)
    return v24.data.priceInRobux;
end;
v9.GetFullName = function(v25)
    return v25.data.name or "Unknown";
end;
v9.GetName = function(v26)
    local l_v26_FullName_0 = v26:GetFullName();
    local v28 = string.find(l_v26_FullName_0, ":");
    if v28 then
        l_v26_FullName_0 = string.sub(l_v26_FullName_0, 1, v28 - 1);
    end;
    return l_v26_FullName_0;
end;
v9.GetDescription = function(v29)
    return v29.data.description;
end;
v9.WearAsync = function(v30)
    if not v30.isEquipping then
        if not v30.data.bundleId then
            return ;
        else
            v30.isEquipping = true;
            while v5 do
                wait(0.1);
            end;
            v5 = true;
            v1:dispatchEvent(v1.Notifications.AvatarEquipBegin, v30.data.bundleId);
            local v31 = v2.SetWearingAssetsAsync(v30.data.partIds);
            if not (not v31 or not v31.success) then
                v1:dispatchEvent(v1.Notifications.AvatarEquipSuccess, v30.data.bundleId);
            end;
            v5 = false;
            v30.isEquipping = false;
            return v31;
        end;
    else
        return ;
    end;
end;
v9.BuyAsync = function(v32)
    if not v32.isPurchasing then
        v32.isPurchasing = true;
        while v7 do
            wait(0.1);
        end;
        v7 = true;
        v1:dispatchEvent(v1.Notifications.AvatarPurchaseBegin, v32:GetBundleId());
        local v33 = v2.PurchaseProductAsync(v32.data.productId, v32.data.priceInRobux, v32.data.creatorId, 1);
        if not (not v33 or not (v33.purchased == true)) then
            v1:dispatchEvent(v1.Notifications.AvatarPurchaseSuccess, v32:GetBundleId(), true);
        end;
        v7 = false;
        v32.isPurchasing = false;
        return v33;
    else
        return ;
    end;
end;
return v9;
