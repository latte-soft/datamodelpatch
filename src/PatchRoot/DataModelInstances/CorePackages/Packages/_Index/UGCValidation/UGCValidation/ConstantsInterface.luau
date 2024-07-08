local v0 = require(script.Parent.Constants);
return {
    isBodyPart = function(v1)
        return v0.ASSET_TYPE_INFO[v1] and v0.ASSET_TYPE_INFO[v1].isBodyPart;
    end, 
    getBodyPartAssets = function()
        local v2 = {};
        for v3, v4 in v0.ASSET_TYPE_INFO, nil, nil do
            if v4.isBodyPart then
                table.insert(v2, v3);
            end;
        end;
        return v2;
    end, 
    getRigAttachmentToParent = function(v5, v6)
        if not v5 then
            for _, v8 in v0.ASSET_TYPE_INFO, nil, nil do
                if v8.isBodyPart then
                    local v9 = v8.subParts[v6];
                    if v9 then
                        return v9.rigAttachmentToParent.name;
                    end;
                end;
            end;
            return "";
        else
            local v10 = v0.ASSET_TYPE_INFO[v5];
            if v10.isBodyPart then
                return v10.subParts[v6].rigAttachmentToParent.name;
            else
                return "";
            end;
        end;
    end, 
    getAttachments = function(v11, v12)
        local v13 = nil;
        if not v11 then
            for _, v15 in v0.ASSET_TYPE_INFO, nil, nil do
                if v15.isBodyPart then
                    v13 = v15.subParts[v12];
                    if v13 then
                        break;
                    end;
                end;
            end;
        else
            local v16 = v0.ASSET_TYPE_INFO[v11];
            if v16.isBodyPart then
                v13 = v16.subParts[v12];
            else
                return {};
            end;
        end;
        local v17 = {};
        if v13 then
            table.insert(v17, v13.rigAttachmentToParent.name);
            for v18 in v13.otherAttachments, nil, nil do
                table.insert(v17, v18);
            end;
        end;
        return v17;
    end, 
    calculateFullBodyBounds = function(v19)
        local v20 = nil;
        local v21 = nil;
        local v22 = nil;
        local l_minSize_0 = v0.ASSET_TYPE_INFO[Enum.AssetType.DynamicHead].bounds[v19].minSize;
        local l_minSize_1 = v0.ASSET_TYPE_INFO[Enum.AssetType.Torso].bounds[v19].minSize;
        local l_minSize_2 = v0.ASSET_TYPE_INFO[Enum.AssetType.LeftArm].bounds[v19].minSize;
        local l_minSize_3 = v0.ASSET_TYPE_INFO[Enum.AssetType.RightArm].bounds[v19].minSize;
        local l_minSize_4 = v0.ASSET_TYPE_INFO[Enum.AssetType.LeftLeg].bounds[v19].minSize;
        local l_minSize_5 = v0.ASSET_TYPE_INFO[Enum.AssetType.RightLeg].bounds[v19].minSize;
        v20 = math.max((l_minSize_1.x + l_minSize_2.x) + l_minSize_3.x, l_minSize_4.x + l_minSize_5.x, l_minSize_0.x);
        v21 = (math.max(l_minSize_4.y, l_minSize_5.y) + l_minSize_1.y) + l_minSize_0.y;
        v22 = math.max(l_minSize_1.z, l_minSize_2.z, l_minSize_3.z, l_minSize_0.z, l_minSize_4.z, l_minSize_5.z);
        l_minSize_0 = nil;
        l_minSize_1 = nil;
        l_minSize_2 = nil;
        l_minSize_3 = v0.ASSET_TYPE_INFO[Enum.AssetType.DynamicHead].bounds[v19].maxSize;
        l_minSize_4 = v0.ASSET_TYPE_INFO[Enum.AssetType.Torso].bounds[v19].maxSize;
        l_minSize_5 = v0.ASSET_TYPE_INFO[Enum.AssetType.LeftArm].bounds[v19].maxSize;
        local l_maxSize_0 = v0.ASSET_TYPE_INFO[Enum.AssetType.RightArm].bounds[v19].maxSize;
        local l_maxSize_1 = v0.ASSET_TYPE_INFO[Enum.AssetType.LeftLeg].bounds[v19].maxSize;
        local l_maxSize_2 = v0.ASSET_TYPE_INFO[Enum.AssetType.RightLeg].bounds[v19].maxSize;
        return Vector3.new(v20, v21, v22), (Vector3.new(math.max((l_minSize_4.x + l_minSize_5.x) + l_maxSize_0.x, l_maxSize_1.x + l_maxSize_2.x, l_minSize_3.x), (math.max(l_maxSize_1.y, l_maxSize_2.y) + l_minSize_4.y) + l_minSize_3.y, (math.max(l_minSize_4.z, l_minSize_5.z, l_maxSize_0.z, l_minSize_3.z, l_maxSize_1.z, l_maxSize_2.z))));
    end
};
