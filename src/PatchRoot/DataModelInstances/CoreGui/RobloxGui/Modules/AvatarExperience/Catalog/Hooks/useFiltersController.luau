local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Common.Enum.CreatorFilter);
local v4 = require(l_Modules_0.AvatarExperience.Common.Enum.PriceFilter);
local v5 = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local v6 = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSalesTypeFilter);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCreatorFilter);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetPriceRange);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetUnavailableItemFilter);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local function _(v15, v16)
    if not (v8.MinPriceFilter >= v15) or v16 < v8.MaxPriceFilter then
        return v4.PriceRange;
    else
        return v4.AnyPrice;
    end;
end;
local function _(v18)
    if not (v18 ~= nil) or v18 == "" then
        return v3.AllCreators;
    else
        return v3.Username;
    end;
end;
return function()
    local v20 = l_useSelector_0(v14.selectSalesTypeFilter);
    local v21, v22 = v2.useState(v20);
    local v23 = l_useSelector_0(v14.selectCreatorFilter);
    local v24, v25 = v2.useState(if not (v23 ~= nil) or v23 == "" then v3.AllCreators else v3.Username);
    local v26, v27 = v2.useState(v23);
    local v28 = l_useSelector_0(v14.selectMinPrice);
    local v29 = l_useSelector_0(v14.selectMaxPrice);
    local v30, v31 = v2.useState(if not (v8.MinPriceFilter >= v28) or v29 < v8.MaxPriceFilter then v4.PriceRange else v4.AnyPrice);
    local v32, v33 = v2.useState(v28);
    local v34, v35 = v2.useState(v29);
    local v36 = l_useSelector_0(v14.selectUnavailableItemFilter);
    local v37, v38 = v2.useState(v36);
    local v39 = l_useDispatch_0();
    local v40 = true;
    if v21 == v5.All then
        v40 = true;
        if v24 == v3.AllCreators then
            v40 = true;
            if v30 == v4.AnyPrice then
                v40 = v37 ~= v6.Hide;
            end;
        end;
    end;
    local v41 = v24 == v3.AllCreators and "" or v26;
    local v42 = if v30 == v4.AnyPrice then v8.MinPriceFilter else v32;
    local v43 = if v30 == v4.AnyPrice then v8.MaxPriceFilter else v34;
    local v44 = true;
    if v21 == v20 then
        v44 = true;
        if v41 == v23 then
            v44 = true;
            if v42 == v28 then
                v44 = true;
                if v43 == v29 then
                    v44 = v37 ~= v36;
                end;
            end;
        end;
    end;
    return {
        salesTypeFilter = v21, 
        setSalesTypeFilter = v22, 
        creatorFilter = v24, 
        setCreatorFilter = v25, 
        creatorUsername = v26, 
        setCreatorUsername = v27, 
        priceFilter = v30, 
        setPriceFilter = v31, 
        minPrice = v32, 
        setMinPrice = v33, 
        maxPrice = v34, 
        setMaxPrice = v35, 
        unavailableItemFilter = v37, 
        setUnavailableItemFilter = v38, 
        canReset = v40, 
        canApply = v44, 
        reset = v2.useCallback(function()
            v22(v5.All);
            v25(v3.AllCreators);
            v31(v4.AnyPrice);
            v38(v6.Hide);
        end), 
        apply = v2.useCallback(function()
            v39(v10(v21));
            v39(v11(v41));
            v39(v12(v42, v43));
            v39(v13(v37));
        end, {
            v21, 
            v41, 
            v42, 
            v43, 
            v37
        })
    };
end;
