local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
local v2 = require(l_Parent_0.Flags.GetFFlagIBEnableLimitedBundle);
return function(v3)
    local l_assetId_0 = v3.detailsInformation.assetId;
    if l_assetId_0 == nil then
        return nil;
    else
        local v5 = v3.assets[l_assetId_0];
        if not v2() then
            if not v5 or not v5.isForSale then
                if not v1() then
                    return (v5 and v5.bundlesAssetIsIn) and #v5.bundlesAssetIsIn > 0;
                else
                    return v5 and v5.parentBundleId ~= nil;
                end;
            else
                return false;
            end;
        else
            return v5 and v5.parentBundleId ~= nil;
        end;
    end;
end;
