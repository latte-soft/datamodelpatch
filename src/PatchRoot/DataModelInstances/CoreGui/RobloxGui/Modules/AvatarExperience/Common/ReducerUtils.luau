local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return {
    filterTryOns = function(v3, v4)
        local v5 = {};
        local v6 = nil;
        for v7, v8 in v3, nil, nil do
            local v9 = v1.AssetTypeToAssetCategory[v4.itemSubType];
            local v10 = not v9 or v1.AssetTypeToAssetCategory[v8.itemSubType] ~= v9;
            if not (v8.itemSubType ~= v4.itemSubType) or not v10 then
                v6 = v8;
            else
                v5[v7] = v8;
            end;
        end;
        return v5, v6;
    end, 
    convertDefaultBodyColorRanges = function(v11)
        local v12 = {};
        for _, v14 in v11, nil, nil do
            table.insert(v12, {
                rangeId = v14[1]:ToHex(), 
                range = v14
            });
        end;
        return v12;
    end, 
    generateTryOnItemIdKey = function(v15, v16, v17)
        if v17 ~= nil and v17 == v1.LookType.Avatar then
            return tostring(v15) .. "-" .. v16;
        else
            return v15;
        end;
    end
};
