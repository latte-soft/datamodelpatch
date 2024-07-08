local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_Workspace_0 = game:GetService("Workspace");
local v3 = require(l_Parent_0.Misc.Constants);
local v4 = require(l_Parent_0.Enums.PurchaseError);
local v5 = require(l_Parent_0.Parent.Flags.FFlagEnableUGC4ACollectiblePurchaseSupport);
local v6 = "AllowThirdPartySales has blocked the purchase" .. " prompt for %d created by %d. To sell this asset made by a" .. " different %s, you will need to enable AllowThirdPartySales.";
return function(v7, v8, v9, v10, v11)
    local v12 = v7.ProductType == v3.ProductType.CollectibleItem;
    local v13 = if not not v5 and v7.CollectiblesItemDetails then v7.CollectiblesItemDetails.IsLimited else nil;
    if not v5 then
        if not (v12 or not v8) then
            return false, v4.AlreadyOwn;
        end;
    elseif not v12 then
        if v8 then
            return false, v4.AlreadyOwn;
        end;
    elseif not (v13 or not v8) then
        return false, v4.AlreadyOwn;
    end;
    if (not (v11 == nil) or v7.IsForSale) or v7.IsPublicDomain then
        if not (not (v11 == nil) or not v10.GetFFlagEnableRestrictedAssetSaleLocationPurchasePrompt()) and v7.CanBeSoldInThisGame == false then
            return false, v4.NotForSaleHere;
        else
            if not v5 then
                if not (not (v11 == nil) or not (v12 or v7.IsLimited) and not v7.IsLimitedUnique) and (not (v7.Remaining ~= nil) or v7.Remaining == 0) then
                    return false, v4.Limited;
                end;
            elseif not (not (v11 == nil) or not (v12 and v13 or v7.IsLimited) and not v7.IsLimitedUnique) and (not (v7.Remaining ~= nil) or v7.Remaining == 0) then
                return false, v4.Limited;
            end;
            if v7.MinimumMembershipLevel == Enum.MembershipType.Premium.Value and l_Players_0.LocalPlayer.MembershipType ~= Enum.MembershipType.Premium then
                return false, v4.PremiumOnly;
            elseif not (v7.ContentRatingTypeId == 1) or not l_Players_0.LocalPlayer:GetUnder13() then
                local v14 = true;
                v14 = if not v10.getLuaUseThirdPartyPermissions() then l_Workspace_0.AllowThirdPartySales else v10.isThirdPartyPurchaseAllowed();
                if not ((not (v7.ProductType ~= v3.ProductType.DeveloperProduct) or not v9) or v14) then
                    local v15 = game.CreatorType == Enum.CreatorType.Group;
                    local v16 = v7.Creator.CreatorType == "Group";
                    local v17 = tonumber(v7.Creator.CreatorTargetId);
                    if v17 ~= 1 and (not (v15 == v16) or v17 ~= game.CreatorId) then
                        warn(v6:format(v7.AssetId, v17, not v15 and "user" or "group"));
                        return false, v4.ThirdPartyDisabled;
                    end;
                end;
                return true, nil;
            else
                return false, v4.Under13;
            end;
        end;
    else
        return false, v4.NotForSale;
    end;
end;
