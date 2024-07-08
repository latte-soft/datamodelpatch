local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local v2 = require(l_Parent_0.flags.getFStringUGCLCAllowedAssetTypeIds);
return {
    isRigidAccessoryAllowed = function(v3)
        local v4 = v1.ASSET_TYPE_INFO[v3];
        if v4 == nil then
            return false;
        else
            return v4.rigidAllowed == true;
        end;
    end, 
    isLayeredClothingAllowed = function(v5)
        return table.find(string.split(v2(), ","), (tostring(v5.Value))) ~= nil;
    end
};
