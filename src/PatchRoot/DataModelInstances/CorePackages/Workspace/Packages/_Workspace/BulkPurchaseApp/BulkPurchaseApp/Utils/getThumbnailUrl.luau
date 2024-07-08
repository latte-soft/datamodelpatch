local v0 = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.UserLib);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v0.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = v0.Utils.Constants;
local function _(v3)
    if v3 == "AvatarBundle" then
        return l_Constants_0.RbxthumbTypes.BundleThumbnail;
    else
        return l_Constants_0.RbxthumbTypes.Asset;
    end;
end;
return function(v5, v6)
    return l_getRbxthumbWithTypeSizeAndOptions_0(v5, if v6 == "AvatarBundle" then l_Constants_0.RbxthumbTypes.BundleThumbnail else l_Constants_0.RbxthumbTypes.Asset, 150);
end;
