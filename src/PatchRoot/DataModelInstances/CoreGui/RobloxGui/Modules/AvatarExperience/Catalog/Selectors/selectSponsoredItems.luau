local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v6 = require(l_CorePackages_0.Packages.Dash);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_SponsoredItemsCategoryRecommended_0 = v4.SponsoredItemsCategoryRecommended;
local v13 = l_memoize_0(function(v9, v10)
    return v6.map(v9, function(v11)
        local v12 = v10[v11.id];
        if not v12 or not v12.product then
            return v11;
        else
            return (v6.join(v11, {
                productId = v12.product.id
            }));
        end;
    end);
end);
return function(v14)
    local v15 = v14.AvatarExperience.Catalog.SponsoredItems[l_SponsoredItemsCategoryRecommended_0];
    local l_AssetInfos_0 = v14.AvatarExperience.Common.AssetInfos;
    if not v15 then
        return nil;
    else
        return (v13(v15, l_AssetInfos_0));
    end;
end;
