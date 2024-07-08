local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v5 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v6 = require(l_Modules_0.AvatarExperience.Flags.SponsoredItemsIXPTest);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.SponsoredItemsWidgetRow);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v10 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v11 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v12 = require(l_CorePackages_0.Cryo);
local _ = require(l_Modules_0.AvatarExperience.Common.CategoryTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v15 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSearchResultsCategories);
local v16 = v4.GetSponsoredItemsKey(v3.SponsoredItemsCategoryRecommended, v3.SponsoredItemsToFetch);
return function(v17, v18, v19)
    local v20, v21 = v5.useTestVariables(v6.EnabledForUser, v6.Row);
    local v23 = l_useSelector_0(function(v22)
        return l_PerformFetch_0.GetStatus(v22, v16);
    end);
    local v25 = l_useSelector_0(function(v24)
        return l_PerformFetch_0.GetStatus(v24, (v11.getSearchKey(v24, v17)));
    end);
    local v27 = l_useSelector_0(function(v26)
        return v26.AvatarExperience.Catalog.SortAndFilters.SelectedTopics;
    end);
    local v29 = l_useSelector_0(function(v28)
        return v28.SearchesParameters[v17];
    end);
    return {
        row = v21, 
        component = v7, 
        isEnabled = v2.useMemo(function()
            if v20 and v23 ~= v10.Failed then
                local v30 = false;
                if v27 ~= nil then
                    v30 = #v27 > 0;
                end;
                local v31 = v25 == v10.Done;
                local v32 = false;
                if not ((not v29 or not v29.categoryInfo) or v12.isEmpty(v29.categoryInfo)) then
                    v32 = v29.categoryInfo.ShowSponsored or false;
                end;
                if not v15() then
                    return ((v18 and v31) and v32) and not v30;
                else
                    return (((v18 and v31) and v32) and not v30) and not v19;
                end;
            else
                return false;
            end;
        end, {
            v20, 
            v23, 
            v27, 
            v25, 
            v18, 
            v29, 
            if not v15() then nil else v19
        })
    };
end;
