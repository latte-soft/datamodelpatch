local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.MenuConfigs.getMenuItemsFromConfigs);
local v4 = require(l_script_FirstAncestor_0.MenuConfigs.Experience.ReportExperienceMenuItemConfigList);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Components.Constants);
local v7 = require(l_Parent_0.Cryo);
local v8 = require(l_script_FirstAncestor_0.Reducers.reportExperienceUIStateReducer);
return function(v9)
    local v10, v11 = v2.useReducer(v8, v6.InitExperienceUIState);
    v2.useEffect(function()
        if v9.utilityProps.isReportTabVisible then
            v9.utilityProps.analyticsDispatch({
                type = v6.AnalyticsActions.SwitchToExperienceInitialSelections
            });
        end;
    end, {
        v9.utilityProps.isReportTabVisible
    });
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        MenuItems = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, (v7.Dictionary.join({
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            })
        }, (v3(v10, v11, v9.utilityProps, v4)))))
    });
end;
