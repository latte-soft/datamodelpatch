local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CoreGui_0.RobloxGui.Modules.AvatarExperience.Common.Constants);
local l_DefaultMetricsGridView_0 = v4.App.Grid.DefaultMetricsGridView;
local l_GridMetrics_0 = v4.App.Grid.GridMetrics;
local v9 = v3.PureComponent:extend("LoadableGridView");
v9.validateProps = v5.strictInterface({
    getItemMetrics = v5.callback, 
    items = v5.optional(v5.table), 
    totalNumItems = v5.optional(v5.number), 
    renderItem = v5.callback, 
    getItemHeight = v5.callback, 
    windowHeight = v5.optional(v5.number), 
    LayoutOrder = v5.optional(v5.number), 
    onNumItemsPerRowChanged = v5.optional(v5.callback), 
    onAbsoluteSizeChanged = v5.optional(v5.callback), 
    NextSelectionDown = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionRight = v5.optional(v5.table), 
    NextSelectionLeft = v5.optional(v5.table), 
    forwardRef = v5.optional(v5.table), 
    onFocusGained = v5.optional(v5.callback), 
    restorePreviousChildFocus = v5.optional(v5.boolean)
});
v9.defaultProps = {
    getItemMetrics = l_GridMetrics_0.getSmallMetrics
};
v9.render = function(v10)
    local l_items_0 = v10.props.items;
    local l_totalNumItems_0 = v10.props.totalNumItems;
    local l_LayoutOrder_0 = v10.props.LayoutOrder;
    local l_getItemHeight_0 = v10.props.getItemHeight;
    local l_windowHeight_0 = v10.props.windowHeight;
    local l_getItemMetrics_0 = v10.props.getItemMetrics;
    if not l_items_0 then
        l_items_0 = {};
        for v17 = 1, l_totalNumItems_0 do
            l_items_0[v17] = {};
        end;
    end;
    return v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        [v3.Change.AbsoluteSize] = v10.props.onAbsoluteSizeChanged
    }, {
        DefaultMetricsGridView = v3.createElement(l_DefaultMetricsGridView_0, {
            renderItem = v10.props.renderItem, 
            windowHeight = l_windowHeight_0, 
            getItemHeight = l_getItemHeight_0, 
            getItemMetrics = l_getItemMetrics_0, 
            itemPadding = Vector2.new(v6.LoadableGridViewCellPadding, v6.LoadableGridViewCellPadding), 
            items = l_items_0, 
            maxHeight = math.huge, 
            LayoutOrder = l_LayoutOrder_0, 
            NextSelectionUp = v10.props.NextSelectionUp, 
            NextSelectionDown = v10.props.NextSelectionDown, 
            NextSelectionRight = v10.props.NextSelectionRight, 
            NextSelectionLeft = v10.props.NextSelectionLeft, 
            [v3.Ref] = v10.props.forwardRef, 
            defaultChildIndex = 1, 
            restorePreviousChildFocus = v10.props.restorePreviousChildFocus, 
            onFocusGained = v10.props.onFocusGained, 
            onNumItemsPerRowChanged = v10.props.onNumItemsPerRowChanged
        })
    });
end;
return v3.forwardRef(function(v18, v19)
    return v3.createElement(v9, v2.Dictionary.join(v18, {
        forwardRef = v19
    }));
end);
