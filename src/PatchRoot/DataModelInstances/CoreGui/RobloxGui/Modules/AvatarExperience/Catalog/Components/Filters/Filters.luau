local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterSubsection);
local v5 = require(l_Modules_0.AvatarExperience.Common.Enum.CreatorFilter);
local v6 = require(l_Modules_0.AvatarExperience.Common.Enum.PriceFilter);
local v7 = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local v8 = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local _ = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useFiltersController);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterTextBox);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.PriceRangeInput);
local v13 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v14 = require(l_CorePackages_0.Packages.RoactGamepad);
local v15 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRemovePriceFilters);
local l_Focusable_0 = v14.Focusable;
local v17 = UDim.new(0, 20);
local v18 = UDim.new(0, 12);
return function(v19)
    local v20 = v14.useRefCache();
    local l_filtersController_0 = v19.filtersController;
    local v22 = l_useLocalization_0({
        salesType = "Feature.Catalog.Label.Filter.SalesType", 
        all = "Feature.Avatar.Heading.All", 
        limited = "Feature.Catalog.Label.Limited", 
        premium = "Feature.Catalog.Label.Premium", 
        creator = "Feature.Catalog.Label.Filter.Creator", 
        allCreators = "Feature.Catalog.LabelAllCreators", 
        username = "Feature.Catalog.Label.Username", 
        price = "Feature.Catalog.Label.Price", 
        anyPrice = "Feature.Catalog.LabelAnyPrice", 
        priceRange = "Feature.Catalog.Label.PriceRange", 
        unavailableItems = "Feature.Catalog.Label.Filter.UnavailableItems", 
        show = "Feature.Catalog.Label.Filter.Show", 
        hide = "Feature.Catalog.Label.Filter.Hide"
    });
    local v23, v24 = v2.useBinding(0);
    local v25 = v14.useRefCache();
    local function v27()
        local v26 = ((((v18.Offset * 2 + v17.Offset * 3) + (v25.SalesType.current or 0)) + (v25.Creator.current or 0)) + (v25.Price.current or 0)) + (v25.UnavailableItems.current or 0);
        v24(v26);
        if v19.onHeightChanged then
            v19.onHeightChanged(v26);
        end;
    end;
    return v2.createElement(l_Focusable_0.Frame, {
        Size = v23:map(v3.mapHeightToSize), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ref = v19.frameRef, 
        NextSelectionUp = v19.NextSelectionUp, 
        NextSelectionDown = v19.NextSelectionDown, 
        defaultChild = v20.SalesType, 
        restorePreviousChildFocus = true
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = v17
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingTop = v18, 
            PaddingBottom = v18, 
            PaddingLeft = v18
        }), 
        SalesType = v2.createElement(v4, {
            LayoutOrder = 1, 
            title = v22.salesType, 
            items = {
                {
                    text = v22.all, 
                    id = v7.All
                }, 
                {
                    text = v22.limited, 
                    id = v7.Collectibles
                }, 
                {
                    text = v22.premium, 
                    id = v7.Premium
                }
            }, 
            selectedValue = l_filtersController_0.salesTypeFilter, 
            setSelectedValue = l_filtersController_0.setSalesTypeFilter, 
            frameRef = v20.SalesType, 
            NextSelectionDown = v20.Creator, 
            onHeightChanged = function(v28)
                v25.SalesType.current = v28;
                v27();
            end
        }), 
        Creator = v2.createElement(v4, {
            LayoutOrder = 2, 
            title = v22.creator, 
            items = {
                {
                    text = v22.allCreators, 
                    id = v5.AllCreators
                }, 
                {
                    id = v5.Username, 
                    customView = v2.createElement(v11, {
                        text = l_filtersController_0.creatorUsername, 
                        placeholderText = v22.username, 
                        onTextChanged = l_filtersController_0.setCreatorUsername, 
                        onFocused = function()
                            l_filtersController_0.setCreatorFilter(v5.Username);
                        end
                    })
                }
            }, 
            selectedValue = l_filtersController_0.creatorFilter, 
            setSelectedValue = l_filtersController_0.setCreatorFilter, 
            frameRef = v20.Creator, 
            NextSelectionUp = v20.SalesType, 
            NextSelectionDown = if not not v15() and v19.removePriceRangeQueryIXP then v20.UnavailableItems else v20.Price, 
            onHeightChanged = function(v29)
                v25.Creator.current = v29;
                v27();
            end
        }), 
        Price = if not not v15() and v19.removePriceRangeQueryIXP then nil else v2.createElement(v4, {
            LayoutOrder = 3, 
            title = v22.price, 
            items = {
                {
                    text = v22.anyPrice, 
                    id = v6.AnyPrice
                }, 
                {
                    text = v22.priceRange, 
                    id = v6.PriceRange, 
                    expandedViewHeight = v13.SortAndFiltersRowHeight, 
                    expandedView = v2.createElement(v12, {
                        minPrice = l_filtersController_0.minPrice, 
                        maxPrice = l_filtersController_0.maxPrice, 
                        setMinPrice = l_filtersController_0.setMinPrice, 
                        setMaxPrice = l_filtersController_0.setMaxPrice, 
                        onFocused = function()
                            l_filtersController_0.setPriceFilter(v6.PriceRange);
                        end
                    })
                }
            }, 
            selectedValue = l_filtersController_0.priceFilter, 
            setSelectedValue = l_filtersController_0.setPriceFilter, 
            frameRef = v20.Price, 
            NextSelectionUp = v20.Creator, 
            NextSelectionDown = v20.UnavailableItems, 
            onHeightChanged = function(v30)
                v25.Price.current = v30;
                v27();
            end
        }), 
        UnavailableItems = v2.createElement(v4, {
            LayoutOrder = (not not v15() and v19.removePriceRangeQueryIXP) and 3 or 4, 
            title = v22.unavailableItems, 
            items = {
                {
                    text = v22.hide, 
                    id = v8.Hide
                }, 
                {
                    text = v22.show, 
                    id = v8.Show
                }
            }, 
            selectedValue = l_filtersController_0.unavailableItemFilter, 
            setSelectedValue = l_filtersController_0.setUnavailableItemFilter, 
            frameRef = v20.UnavailableItems, 
            NextSelectionUp = if not not v15() and v19.removePriceRangeQueryIXP then v20.Creator else v20.Price, 
            onHeightChanged = function(v31)
                v25.UnavailableItems.current = v31;
                v27();
            end
        })
    });
end;
