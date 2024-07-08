local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterButton);
return function(v6)
    local l_showFilterButton_0 = v6.showFilterButton;
    local v8 = not l_showFilterButton_0 and 0 or 52;
    local v9 = v3.useRef(nil);
    local v10 = v3.useRef(nil);
    return v3.createElement(l_Focusable_0.Frame, {
        Size = UDim2.new(1, 0, 0, v6.height), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        LayoutOrder = v6.layoutOrder, 
        ref = v6.layoutRef, 
        defaultChild = if not l_showFilterButton_0 then v10 else v9, 
        NextSelectionUp = v6.NextSelectionUp, 
        NextSelectionDown = v6.NextSelectionDown, 
        NextSelectionLeft = v6.NextSelectionLeft, 
        NextSelectionRight = v6.NextSelectionRight
    }, {
        FilterButton = l_showFilterButton_0 and v3.createElement(v5, {
            anchorPoint = Vector2.new(0, 0.5), 
            position = UDim2.new(0, 8, 0.5, 0), 
            buttonRef = v9, 
            NextSelectionRight = if not v6.isContentEmpty then v10 else nil
        }), 
        ContentFrame = v3.createElement(l_Focusable_0.Frame, {
            Size = UDim2.new(1, -v8, 1, 0), 
            Position = UDim2.new(0, v8, 0, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ref = v10, 
            NextSelectionLeft = v9, 
            ClipsDescendants = true
        }, v6.children)
    });
end;
