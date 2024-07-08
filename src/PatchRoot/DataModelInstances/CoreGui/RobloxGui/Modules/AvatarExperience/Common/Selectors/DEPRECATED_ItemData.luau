local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants);
return function(v1, v2, v3)
    if v3 == v0.ItemType.Asset then
        return v1.AssetInfos[v2];
    elseif v3 == v0.ItemType.Bundle then
        return v1.BundleInfos[v2];
    else
        return nil;
    end;
end;
