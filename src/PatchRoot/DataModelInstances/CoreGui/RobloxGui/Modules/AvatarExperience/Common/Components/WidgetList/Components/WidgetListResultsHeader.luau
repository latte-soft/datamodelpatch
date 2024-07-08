local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Packages.React);
local v2 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.ResultsHeader);
return function(v3)
    return v1.createElement(v1.Fragment, nil, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        ResultsHeader = if not v3.hideResultsHeader then v1.createElement(v2, {
            searchUuid = v3.searchUuid
        }) else nil, 
        ManualPaddingFrame = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 11), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        })
    });
end;
