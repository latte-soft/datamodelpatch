local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local _ = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useSortsController);
local l_useIsGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useIsGamepad;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.RadioButtonGroup);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.SortAggregationGroup);
local v8 = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local v9 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v13 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRemovePriceFilters);
local v14 = UDim.new(0, 12);
local v15 = 6 + v9.SortAndFiltersSmallRowHeight * 3;
local function _(v16)
    return v16 + v14.Offset * 2;
end;
return function(v18)
    local l_sortsController_0 = v18.sortsController;
    local v20 = l_useLocalization_0(v10.SortTypeLocalization);
    local l_RecentlyCreated_0 = v8.RecentlyCreated;
    local v22 = {
        {
            text = v20.Relevance, 
            id = v8.Relevance
        }, 
        {
            text = v20.MostFavorited, 
            id = v8.MostFavorited, 
            expandedViewHeight = v15, 
            expandedView = v2.createElement(v7, {
                sortAggregation = l_sortsController_0.mostFavoritedAggregation, 
                setSortAggregation = l_sortsController_0.setMostFavoritedAggregation
            })
        }, 
        {
            text = v20.Bestselling, 
            id = v8.Bestselling, 
            expandedViewHeight = v15, 
            expandedView = v2.createElement(v7, {
                sortAggregation = l_sortsController_0.bestSellingAggregation, 
                setSortAggregation = l_sortsController_0.setBestSellingAggregation
            })
        }, 
        {
            text = v20.PriceLowToHigh, 
            id = v8.PriceLowToHigh
        }, 
        {
            text = v20.PriceHighToLow, 
            id = v8.PriceHighToLow
        }, 
        {
            text = v20[l_RecentlyCreated_0], 
            id = l_RecentlyCreated_0
        }
    };
    if not (not v13() or not v18.removePriceSortIXP) then
        local v23 = {};
        for v24 = 1, #v22 do
            if v22[v24].id ~= v8.PriceLowToHigh and v22[v24].id ~= v8.PriceHighToLow then
                table.insert(v23, v22[v24]);
            end;
        end;
        v22 = v23;
    end;
    local v25 = l_useIsGamepad_0();
    local v26, v27 = v2.useBinding(0);
    return v2.createElement(l_Focusable_0.Frame, {
        Size = v26:map(function(v28)
            return UDim2.new(1, 0, 0, v28 + v14.Offset * 2);
        end), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ref = v18.frameRef, 
        NextSelectionUp = v18.NextSelectionUp, 
        NextSelectionDown = v18.NextSelectionDown
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = v14
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingTop = v14, 
            PaddingBottom = v14, 
            PaddingLeft = v14
        }), 
        RadioButtonGroupContainer = v2.createElement("Frame", {
            Size = v26:map(v11.mapHeightToSize), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            SortRadioButtons = v2.createElement(v6, {
                items = v22, 
                itemHeight = v9.SortAndFiltersRowHeight, 
                selectedValue = l_sortsController_0.sortType, 
                onActivated = function(v29)
                    l_sortsController_0.setSortType(v29);
                end, 
                useDefaultControlState = v25, 
                onHeightChanged = function(v30)
                    v27(v30);
                    if v18.onHeightChanged then
                        v18.onHeightChanged(v30 + v14.Offset * 2);
                    end;
                end
            })
        })
    });
end;
