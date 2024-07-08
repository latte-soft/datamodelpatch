local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v17 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize(function(v7, v8)
    local v9 = nil;
    local v10 = nil;
    local v11 = nil;
    for v12, v13 in v7, nil, nil do
        if v13.selectedInTryOnManager then
            local l_itemRecency_0 = v13.itemRecency;
            if v13.itemType == v3.ItemType.Asset then
                if v13.itemSubType == v8 and (not (v9 ~= nil) or v9 < l_itemRecency_0) then
                    v9 = l_itemRecency_0;
                    v10 = v12;
                    v11 = nil;
                end;
            elseif v13.bundleInfo then
                for v15, v16 in v13.bundleInfo, nil, nil do
                    if v16.assetType == v8 and (not (v9 ~= nil) or v9 < l_itemRecency_0) then
                        v9 = l_itemRecency_0;
                        v10 = v15;
                        v11 = v13.bundleInfo;
                    end;
                end;
            end;
        end;
    end;
    return v10, v11, v9;
end);
return function(v18, v19)
    return v17(v18.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, v19);
end;
