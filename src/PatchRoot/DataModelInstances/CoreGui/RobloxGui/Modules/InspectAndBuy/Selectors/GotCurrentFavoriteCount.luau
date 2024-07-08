local l_RetrievalStatus_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).Enum.RetrievalStatus;
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Selectors.IsDetailsItemPartOfBundleAndOffsale);
local v3 = require(l_Parent_0.UtilityFunctions);
local v4 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v5 = v4("getAssetFavoriteCount");
local v6 = v4("getBundleFavoriteCount");
return function(v7)
    local l_assetId_0 = v7.detailsInformation.assetId;
    if l_assetId_0 then
        local v9 = v2(v7);
        if v9 == nil then
            return false;
        else
            local v10 = v7.assets[l_assetId_0];
            if v10 then
                if not v9 then
                    local v11 = v5(v7.storeId, l_assetId_0);
                    local v12 = true;
                    if v7.FetchingStatus[v11] ~= l_RetrievalStatus_0.Fetching then
                        v12 = v7.FetchingStatus[v11] == l_RetrievalStatus_0.Done;
                    end;
                    return v12;
                else
                    local v13 = v6(v7.storeId, (v3.getBundleId(v10)));
                    local v14 = true;
                    if v7.FetchingStatus[v13] ~= l_RetrievalStatus_0.Fetching then
                        v14 = v7.FetchingStatus[v13] == l_RetrievalStatus_0.Done;
                    end;
                    return v14;
                end;
            else
                return false;
            end;
        end;
    else
        return false;
    end;
end;
