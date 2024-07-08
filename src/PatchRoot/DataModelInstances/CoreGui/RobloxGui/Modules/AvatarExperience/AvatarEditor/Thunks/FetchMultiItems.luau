local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetPageFinished);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetUserInventory);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfits);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
return function(v11, v12, v13)
    v4.isType(v11, "function", "GetOutfits thunk expects networkImpl to be a function");
    v4.isType(v12, "table", "GetOutfits thunk expects categoryInfo to be a table");
    local v14, _ = v10.getSearchUuidAndAssetTypes(v12, v13);
    return l_PerformFetch_0.Single(v14, function(v16)
        if v12.Sort then
            local v17 = true;
            do
                local l_v17_0 = v17;
                local function v19(v20)
                    local v21 = v12.SortOrder[v20] or "";
                    local v22 = v12.Sort[v21];
                    local v23 = v14 .. v21;
                    if v22 == v7.OutfitOrAsset.Outfit then
                        local v24 = v14 == v7.EditableCharacterKey;
                        if v12.OutfitFilter then
                            v24 = v12.OutfitFilter == Enum.OutfitSource.Created;
                        end;
                        v16:dispatch(v9(v11, v14, v24, v23, v21)):andThen(function(v25)
                            if v25 == v6.ReachedLastPage then
                                v19(v20 + 1);
                                return ;
                            else
                                l_v17_0 = false;
                                return ;
                            end;
                        end);
                        return ;
                    elseif v22 == v7.OutfitOrAsset.Asset then
                        v16:dispatch(v8(v12, v23, v14)):andThen(function(v26)
                            if v26 == v6.ReachedLastPage then
                                v19(v20 + 1);
                                return ;
                            else
                                l_v17_0 = false;
                                return ;
                            end;
                        end);
                        return ;
                    else
                        if l_v17_0 then
                            v16:dispatch(v5(v23, l_v17_0));
                        end;
                        return ;
                    end;
                end;
                v19(1);
            end;
        end;
        return v2.resolve();
    end);
end;
