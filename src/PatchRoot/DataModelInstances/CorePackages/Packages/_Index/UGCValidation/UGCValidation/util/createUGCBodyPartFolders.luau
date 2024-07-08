local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.BundlesMetadata);
local v2 = require(l_Parent_0.Constants);
local function v12(v3, v4, v5)
    assert(v3:IsA("Model"));
    local v6 = v4[v5];
    if v6 == nil then
        return {};
    else
        local v7 = {};
        for _, v9 in v2.UGC_BODY_PARTS, nil, nil do
            local l_v3_FirstChild_0 = v3:FindFirstChild(v9);
            if l_v3_FirstChild_0 ~= nil then
                local v11 = v2.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[v9];
                assert(v11 ~= nil, "Body part doesn't map to an asset type");
                if v6.allowedAssetTypeSettings[v11.Name] ~= nil then
                    if v7[v11] == nil then
                        v7[v11] = {
                            l_v3_FirstChild_0
                        };
                    else
                        table.insert(v7[v11], l_v3_FirstChild_0);
                    end;
                end;
            end;
        end;
        return v7;
    end;
end;
return function(v13, v14, v15, v16)
    assert(v13:IsA("Model"), "Invalid root instance, must be a model");
    local v17 = v12(v13, v14, v15);
    local v18 = {};
    for v19, v20 in v17, nil, nil do
        if table.find(v2.ASSET_TYPES_THAT_SKIP_FOLDER, v19) == nil then
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = v2.FOLDER_NAMES.R15ArtistIntent;
            for _, v23 in v20, nil, nil do
                v23.Parent = l_Folder_0;
            end;
            v18[v19] = {
                l_Folder_0
            };
            if v16 then
                local v24 = l_Folder_0:Clone();
                v24.Name = v2.FOLDER_NAMES.R15Fixed;
                table.insert(v18[v19], v24);
                local l_Folder_1 = Instance.new("Folder");
                l_Folder_1.Name = v2.FOLDER_NAMES.R6;
                table.insert(v18[v19], l_Folder_1);
            end;
        else
            v18[v19] = v20;
        end;
    end;
    return v18;
end;
