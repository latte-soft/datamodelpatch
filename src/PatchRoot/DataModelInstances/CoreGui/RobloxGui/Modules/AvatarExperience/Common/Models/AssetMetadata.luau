local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v4 = {
    mock = function()
        return {
            version = "1", 
            order = 1, 
            type = Enum.AccessoryType.Hat, 
            isLayered = true
        };
    end, 
    getDefaultLayeredClothingMetadata = function(v3)
        if v1.AssetTypeIdToAccessoryTypeEnum[v3] == nil then
            return {
                version = "1"
            };
        else
            return {
                version = "1", 
                order = v1.LayeredClothingOrder[v3], 
                type = v1.AssetTypeIdToAccessoryTypeEnum[v3], 
                isLayered = v1.LayeredAssetTypes[v3] ~= nil
            };
        end;
    end
};
v4.getDefaultMetadata = function(v5)
    return (v4.getDefaultLayeredClothingMetadata(v5));
end;
v4.fromMetadata = function(v6, v7)
    v6 = v6 or {};
    return {
        version = tostring(v6.version), 
        order = v6.order or v1.LayeredClothingOrder[v7], 
        type = v6.type, 
        isLayered = v1.LayeredAssetTypes[v7] ~= nil
    };
end;
return v4;
