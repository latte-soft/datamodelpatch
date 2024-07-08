local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.UIBlox);
local l_useSelectionCursor_0 = v4.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v7.Focusable;
local _ = require(l_CorePackages_0.Packages.Dash);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local v11 = require(script.Parent.RadioButtonItem);
local function v29(v12)
    local v13 = v7.useRefCache();
    local v14 = l_useSelectionCursor_0(l_CursorKind_0.Square);
    local v15, v16 = v2.useBinding(0);
    local v17 = v7.useRefCache();
    local function v21()
        local v18 = 0;
        for _, v20 in v12.items, nil, nil do
            v18 = v18 + (v17[v20.id].current or 0);
        end;
        v16(v18);
        if v12.onHeightChanged then
            v12.onHeightChanged(v18);
        end;
    end;
    local v22 = {
        layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 1)
        })
    };
    for v23, v24 in v12.items, nil, nil do
        local v25 = v12.selectedValue == v24.id;
        local v26 = v13["defaultChild-" .. v23];
        v22["radioButtonItem" .. v24.id] = v2.createElement(l_Focusable_0[v11], {
            id = v24.id, 
            text = v24.text, 
            onActivated = v12.onActivated, 
            isSelected = v25, 
            isDisabled = v24.isDisabled, 
            layoutOrder = v23, 
            itemHeight = v12.itemHeight, 
            customView = v24.customView, 
            expandedView = v24.expandedView, 
            expandedViewHeight = v24.expandedViewHeight, 
            useDefaultControlState = v12.useDefaultControlState, 
            hideDivider = v12.hideDividers or v23 == #v12.items, 
            ref = v13[v23], 
            defaultChildRef = v26, 
            defaultChild = v26, 
            restorePreviousChildFocus = v25, 
            NextSelectionUp = if v23 > 1 then v13[v23 - 1] else nil, 
            NextSelectionDown = if v23 < #v12.items then v13[v23 + 1] else nil, 
            SelectionImageObject = v14, 
            onHeightChanged = function(v27)
                v17[v24.id].current = v27;
                v21();
            end
        });
    end;
    local v28 = v12.items and #v12.items > 0;
    return v2.createElement(not not v28 and l_Focusable_0.Frame or "Frame", {
        defaultChild = not not v28 and v13[1] or nil, 
        Size = v15:map(v10.mapHeightToSize), 
        BackgroundTransparency = 1, 
        LayoutOrder = v12.layoutOrder, 
        NextSelectionLeft = v12.NextSelectionLeft, 
        NextSelectionRight = v12.NextSelectionRight, 
        NextSelectionDown = v12.NextSelectionDown, 
        NextSelectionUp = v12.NextSelectionUp, 
        restorePreviousChildFocus = v28 or nil, 
        ref = v12.frameRef
    }, v22);
end;
return v2.forwardRef(function(v30, v31)
    return v2.createElement(v29, v3.Dictionary.join(v30, {
        frameRef = v31
    }));
end);
