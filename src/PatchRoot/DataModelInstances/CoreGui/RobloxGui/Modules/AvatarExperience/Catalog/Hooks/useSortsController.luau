local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v7 = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local v8 = require(l_Modules_0.AvatarExperience.Common.Enum.SortAggregation);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCatalogSort);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
return function()
    local _ = v5(v6);
    local v12 = l_useSelector_0(v10.selectCatalogSort);
    local v13 = l_useSelector_0(v10.selectCatalogSortAggregation);
    local v14, v15 = v2.useState(v12);
    local v16, v17 = v2.useState(v13);
    local v18, v19 = v2.useState(v13);
    local v20 = l_useDispatch_0();
    local v21 = v14 ~= v7.Relevance;
    local v22 = true;
    if v14 == v12 then
        if v14 == v7.MostFavorited then
            v22 = true;
            if not (v16 == v13) then
                goto label0;
            end;
        end;
        v22 = false;
        if v14 == v7.Bestselling then
            v22 = v18 ~= v13;
        end;
    end;
    ::label0::;
    return {
        sortType = v14, 
        setSortType = v15, 
        mostFavoritedAggregation = v16, 
        setMostFavoritedAggregation = v17, 
        bestSellingAggregation = v18, 
        setBestSellingAggregation = v19, 
        canReset = v21, 
        canApply = v22, 
        reset = v2.useCallback(function()
            v15(v7.Relevance);
            v17(v8.AllTime);
            v19(v8.AllTime);
        end), 
        apply = v2.useCallback(function()
            local l_AllTime_0 = v8.AllTime;
            if v14 == v7.MostFavorited then
                l_AllTime_0 = v16;
            elseif v14 == v7.Bestselling then
                l_AllTime_0 = v18;
            end;
            v20(v9(v14, l_AllTime_0));
        end, {
            v14, 
            v16, 
            v18
        })
    };
end;
