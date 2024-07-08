local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useIsGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useIsGamepad;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.RadioButtonGroup);
local v6 = require(l_Modules_0.AvatarExperience.Common.Enum.SortAggregation);
local v7 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v8)
    local v9 = l_useLocalization_0({
        allTime = "Feature.Catalog.LabelAllTime", 
        pastWeek = "Feature.Catalog.LabelPastWeek", 
        pastDay = "Feature.Catalog.LabelPastDay"
    });
    local v10 = {
        {
            text = v9.allTime, 
            id = v6.AllTime
        }, 
        {
            text = v9.pastWeek, 
            id = v6.PastWeek
        }, 
        {
            text = v9.pastDay, 
            id = v6.PastDay
        }
    };
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v7.SortAndFiltersSmallRowHeight * #v10), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2
    }, {
        SortRadioButtons = v2.createElement(v5, {
            items = v10, 
            hideDividers = true, 
            itemHeight = v7.SortAndFiltersSmallRowHeight, 
            selectedValue = v8.sortAggregation, 
            onActivated = v8.setSortAggregation, 
            useDefaultControlState = l_useIsGamepad_0()
        })
    });
end;
