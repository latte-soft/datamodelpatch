local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Selectors.IsDetailsItemPartOfBundleAndOffsale);
local v2 = require(l_Parent_0.UtilityFunctions);
return function(v3)
    local l_assetId_0 = v3.detailsInformation.assetId;
    if l_assetId_0 then
        local v5 = v1(v3);
        if v5 == nil then
            return false;
        else
            local v6 = v3.assets[l_assetId_0];
            if v6 then
                if not v5 then
                    return v3.favorites.assets[l_assetId_0];
                else
                    return v3.favorites.bundles[v2.getBundleId(v6)];
                end;
            else
                return false;
            end;
        end;
    else
        return false;
    end;
end;
