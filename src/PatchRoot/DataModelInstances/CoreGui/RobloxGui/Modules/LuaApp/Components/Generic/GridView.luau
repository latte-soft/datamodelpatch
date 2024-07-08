local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v3 = v1.PureComponent:extend("GridView");
local v4 = game:DefineFastFlag("LuaAppGridViewRemoveDelay", false);
v3.defaultProps = {
    items = {}, 
    cellPaddingOffset = Vector2.new(0, 0), 
    windowAbsoluteSize = Vector2.new(1, 1), 
    itemAbsoluteSize = Vector2.new(1, 1), 
    horizontalAlignment = Enum.HorizontalAlignment.Center, 
    onItemsPerRowChanged = nil
};
v3.init = function(v5)
    v5.state = {
        itemsPerRow = 0, 
        itemWindowStart = 1
    };
    v5.containerRef = v1.createRef();
    v5.isMounted = false;
    v5.itemsPerRow = 0;
    v5.itemWindowStart = 1;
    v5.getTotalRowsAndHeight = l_memoize_0(function(v6, v7, v8, v9, v10)
        local v11 = 0;
        if v6 > 0 then
            v11 = math.ceil(v7 / v6);
        end;
        if v8 ~= nil then
            v11 = math.min(v11, v8);
        end;
        return v11, (math.max(0, v10.Y * v11 + v9.Y * (v11 - 1)));
    end);
    v5.getWindowHeight = function()
        local l_windowAbsoluteSize_0 = v5.props.windowAbsoluteSize;
        local l_screenSize_0 = v5.props.screenSize;
        if not l_screenSize_0 then
            return l_windowAbsoluteSize_0.Y;
        else
            return l_screenSize_0.Y;
        end;
    end;
    v5.updateItemWindowBounds = function(v14)
        local l_current_0 = v5.containerRef.current;
        if l_current_0 then
            local l_Y_0 = l_current_0.AbsolutePosition.Y;
            local l_windowAbsoluteSize_1 = v5.props.windowAbsoluteSize;
            local l_cellPaddingOffset_0 = v5.props.cellPaddingOffset;
            local v19 = -l_Y_0;
            local l_itemAbsoluteSize_0 = v5.props.itemAbsoluteSize;
            local v21 = math.floor((l_windowAbsoluteSize_1.X + l_cellPaddingOffset_0.X) / (l_itemAbsoluteSize_0.X + l_cellPaddingOffset_0.X));
            local v22 = math.max(0, (math.floor(v19 / (l_itemAbsoluteSize_0.Y + l_cellPaddingOffset_0.Y))));
            if v21 > 0 then
                local v23, v24 = v5.getTotalRowsAndHeight(v21, #v5.props.items, v5.props.numberOfRowsToShow, l_cellPaddingOffset_0, l_itemAbsoluteSize_0);
                v22 = if not (v5.getWindowHeight() >= l_Y_0) or l_Y_0 + v24 < 0 then v23 else math.min(v22, v23);
            end;
            local v25 = math.max(1, v22 * v21 + 1);
            local v26 = true;
            if v21 == v5.itemsPerRow then
                v26 = v25 ~= v5.itemWindowStart;
            end;
            if v5.props.onItemsPerRowChanged and v21 ~= v5.itemsPerRow then
                v5.props.onItemsPerRowChanged(v21);
            end;
            v5.itemsPerRow = v21;
            v5.itemWindowStart = v25;
            if not (not v26 or not v5.isMounted) then
                if v4 or not v14 then
                    v5:setState({
                        itemsPerRow = v5.itemsPerRow, 
                        itemWindowStart = v5.itemWindowStart
                    });
                else
                    spawn(function()
                        if v5.isMounted then
                            v5:setState({
                                itemsPerRow = v5.itemsPerRow, 
                                itemWindowStart = v5.itemWindowStart
                            });
                        end;
                    end);
                    return ;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v3.render = function(v27)
    local l_layoutOrder_0 = v27.props.layoutOrder;
    local l_items_0 = v27.props.items;
    local l_renderItem_0 = v27.props.renderItem;
    local l_cellPaddingOffset_1 = v27.props.cellPaddingOffset;
    local l_numberOfRowsToShow_0 = v27.props.numberOfRowsToShow;
    local l_itemAbsoluteSize_1 = v27.props.itemAbsoluteSize;
    local l_horizontalAlignment_0 = v27.props.horizontalAlignment;
    local l_itemsPerRow_0 = v27.state.itemsPerRow;
    local l_itemWindowStart_0 = v27.state.itemWindowStart;
    local v37 = #l_items_0;
    local v38, v39 = v27.getTotalRowsAndHeight(l_itemsPerRow_0, v37, l_numberOfRowsToShow_0, l_cellPaddingOffset_1, l_itemAbsoluteSize_1);
    local v40 = (math.ceil(v27.getWindowHeight() / (l_itemAbsoluteSize_1.Y + l_cellPaddingOffset_1.Y)) + 1) * l_itemsPerRow_0;
    local v41 = math.min(v37, v38 * l_itemsPerRow_0, (l_itemWindowStart_0 + v40) - 1);
    local v42 = math.min(((l_itemWindowStart_0 - 1) / l_itemsPerRow_0) * (l_itemAbsoluteSize_1.Y + l_cellPaddingOffset_1.Y), v39);
    local v43 = nil;
    if typeof(l_renderItem_0) == "function" then
        v43 = {
            Layout = v1.createElement("UIGridLayout", {
                CellPadding = UDim2.new(0, l_cellPaddingOffset_1.X, 0, l_cellPaddingOffset_1.Y), 
                CellSize = UDim2.new(0, l_itemAbsoluteSize_1.X, 0, l_itemAbsoluteSize_1.Y), 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = l_horizontalAlignment_0, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        if l_itemWindowStart_0 > 0 then
            for v44 = l_itemWindowStart_0, v41 do
                v43[v44 % v40] = l_renderItem_0(l_items_0[v44], l_itemAbsoluteSize_1, v44, if l_itemsPerRow_0 > 0 then math.ceil(v44 / l_itemsPerRow_0) else -1);
            end;
        end;
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v39), 
        LayoutOrder = l_layoutOrder_0, 
        BackgroundTransparency = 1, 
        [v1.Ref] = v27.containerRef, 
        [v1.Change.AbsolutePosition] = function()
            if not v4 then
                v27.updateItemWindowBounds(true);
                return ;
            else
                v27.updateItemWindowBounds();
                return ;
            end;
        end
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v42)
        }), 
        Content = v43 and v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, v43)
    });
end;
v3.didMount = function(v45)
    v45.isMounted = true;
    if not v4 then
        v45.updateItemWindowBounds(false);
        return ;
    else
        v45.updateItemWindowBounds();
        return ;
    end;
end;
v3.willUnmount = function(v46)
    v46.isMounted = false;
end;
v3.didUpdate = function(v47, v48, _)
    local v50 = true;
    if v47.props.windowAbsoluteSize == v48.windowAbsoluteSize then
        v50 = true;
        if v47.props.itemAbsoluteSize == v48.itemAbsoluteSize then
            v50 = true;
            if v47.props.cellPaddingOffset == v48.cellPaddingOffset then
                v50 = v47.props.screenSize and v47.props.screenSize ~= v48.screenSize;
            end;
        end;
    end;
    if v50 then
        if not v4 then
            v47.updateItemWindowBounds(false);
        else
            v47.updateItemWindowBounds();
            return ;
        end;
    end;
end;
return v3;
