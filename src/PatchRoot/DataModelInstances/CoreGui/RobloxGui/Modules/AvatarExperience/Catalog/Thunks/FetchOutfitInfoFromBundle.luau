local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v8 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v9 = require(l_CorePackages_0.Promise);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfit);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchBundleAssetsDetails);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchBundleInfo);
local function _(v13)
    return v7.FetchOutfitInfoFromBundleKey .. tostring(v13);
end;
local function _(v15, v16)
    return l_PerformFetch_0.GetStatus(v15, v7.FetchBundleInfoKey .. tostring(v16)) == v8.Fetching;
end;
local function _(v18, v19)
    return l_PerformFetch_0.GetStatus(v18, v5.OutfitInfoKey .. tostring(v19)) == v8.Fetching;
end;
local function _(v21, v22)
    local v23 = v21.AvatarExperience.Common.BundleInfos[v22];
    if not (v23 and v23.receivedCatalogData) and not (l_PerformFetch_0.GetStatus(v21, v7.FetchBundleInfoKey .. tostring(v22)) == v8.Fetching) then
        return true;
    else
        return false;
    end;
end;
local function v29(v25, v26)
    local v27 = v25.AvatarExperience.Common.BundleInfos[v26];
    if not v27 or not v27.receivedCatalogData then
        return false;
    elseif not v6.isShoeBundle(v27) then
        local v28 = v6.getUserOutfitIdFromBundle(v27);
        if not v25.AvatarExperience.AvatarEditor.OutfitInfos[v28] and not (l_PerformFetch_0.GetStatus(v25, v5.OutfitInfoKey .. tostring(v28)) == v8.Fetching) then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
return function(v30, v31)
    v3.isType(v30, "function", "FetchOutfitInfoFromBundle thunk expects networkImpl to be a function");
    v3.isType(v31, "string", "FetchOutfitInfoFromBundle thunk expects bundleId to be a string");
    return function(v32)
        if l_PerformFetch_0.GetStatus(v32:getState(), v7.FetchOutfitInfoFromBundleKey .. tostring(v31)) == v8.Fetching then
            return v9.resolve();
        else
            return l_PerformFetch_0.Single(v7.FetchOutfitInfoFromBundleKey .. tostring(v31), function(v33)
                local v34 = v33:getState();
                local l_v34_0 = v34;
                local l_v31_0 = v31;
                local v37 = l_v34_0.AvatarExperience.Common.BundleInfos[l_v31_0];
                if not ((not v37 or not v37.receivedCatalogData) and l_PerformFetch_0.GetStatus(l_v34_0, v7.FetchBundleInfoKey .. tostring(l_v31_0)) ~= v8.Fetching) then
                    if v29(v34, v31) then
                        for _, v39 in (v6.getUserOutfitIdsFromBundle(v34.AvatarExperience.Common.BundleInfos[v31])), nil, nil do
                            v33:dispatch(v10(v30, v39, nil, v31));
                        end;
                    end;
                else
                    v33:dispatch(v12(v31)):andThen(function(_)
                        v34 = v33:getState();
                        if not v29(v34, v31) then
                            local v41 = v34.AvatarExperience.Common.BundleInfos[v31];
                            if v4.isEmpty((v6.getUserOutfitIdsFromBundle(v41))) then
                                local v42 = {};
                                if v41.items then
                                    for _, v44 in v41.items, nil, nil do
                                        table.insert(v42, (tonumber(v44.id)));
                                    end;
                                end;
                                v33:dispatch(v11(v30, v31, v42));
                            end;
                        else
                            for _, v46 in (v6.getUserOutfitIdsFromBundle(v34.AvatarExperience.Common.BundleInfos[v31])), nil, nil do
                                v33:dispatch(v10(v30, v46, nil, v31));
                            end;
                        end;
                        return v9.resolve();
                    end);
                end;
                return v9.resolve();
            end)(v32);
        end;
    end;
end;
