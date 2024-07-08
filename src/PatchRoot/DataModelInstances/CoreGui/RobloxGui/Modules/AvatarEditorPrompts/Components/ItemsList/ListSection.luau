local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.Packages.t);
local l_RoactFitComponents_0 = require(l_CorePackages_0.AvatarExperienceDeps).RoactFitComponents;
local v6 = require(script.Parent.ListEntry);
local v7 = v2.PureComponent:extend("ListSection");
v7.validateProps = v4.strictInterface({
    headerText = v4.string, 
    items = v4.array(v4.string), 
    layoutOrder = v4.integer, 
    isFirstSection = v4.boolean, 
    isLastSection = v4.boolean, 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    forwardRef = v4.table
});
v7.init = function(v8)
    v8.listRefCache = v3.createRefCache();
end;
v7.render = function(v9)
    local v10 = {
        [0] = v2.createElement(v3.Focusable[v6], {
            text = v9.props.headerText, 
            hasBullet = false, 
            layoutOrder = 0, 
            positionChangedCallback = not not v9.props.isFirstSection and v9.firstEntryPositionChanged or nil, 
            NextSelectionDown = #v9.props.items > 0 and v9.listRefCache[1] or nil, 
            [v2.Ref] = v9.listRefCache[0]
        })
    };
    for v11, v12 in ipairs(v9.props.items) do
        local v13 = nil;
        if v9.props.isLastSection and v11 == #v9.props.items then
            v13 = v9.lastEntryPositionChanged;
        end;
        v10[v11] = v2.createElement(v3.Focusable[v6], {
            text = v12, 
            hasBullet = true, 
            layoutOrder = v11, 
            positionChangedCallback = v13, 
            NextSelectionUp = v9.listRefCache[v11 - 1], 
            NextSelectionDown = v11 ~= #v9.props.items and v9.listRefCache[v11 + 1] or nil, 
            [v2.Ref] = v9.listRefCache[v11]
        });
    end;
    return v2.createElement(v3.Focusable[l_RoactFitComponents_0.FitFrameVertical], {
        width = UDim.new(1, 0), 
        FillDirection = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        BackgroundTransparency = 1, 
        LayoutOrder = v9.props.layoutOrder, 
        defaultChild = v9.listRefCache[0], 
        NextSelectionLeft = v9.props.NextSelectionLeft, 
        NextSelectionRight = v9.props.NextSelectionRight, 
        NextSelectionUp = v9.props.NextSelectionUp, 
        NextSelectionDown = v9.props.NextSelectionDown, 
        [v2.Ref] = v9.props.forwardRef
    }, v10);
end;
return v2.forwardRef(function(v14, v15)
    return v2.createElement(v7, v1.Dictionary.join(v14, {
        forwardRef = v15
    }));
end);
