local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_2.Otter);
local v7 = require(l_Parent_2.Cryo);
local v8 = require(l_Parent_2.RoactGamepad);
local l_Focusable_0 = v8.Focusable;
local v10 = require(script.Parent.TileSlot);
local v11 = require(l_Core_0.Style.useStyle);
local v12 = require(l_Parent_0.SelectionImage.CursorKind);
local v13 = require(l_Parent_0.SelectionImage.useSelectionCursor);
local v14 = require(l_Parent_0.SelectionCursor.useCursorByType);
local v15 = require(l_Parent_0.SelectionCursor.CursorType);
local v16 = require(l_Parent_1.UIBloxConfig);
local v17 = {
    dampingRatio = 1, 
    frequency = 10
};
local v18 = v5.strictInterface({
    slots = v5.array((v5.strictInterface({
        displayText = v5.optional(v5.string), 
        thumbnail = v5.optional(v5.string), 
        isDisabled = v5.optional(v5.boolean), 
        isLoading = v5.optional(v5.boolean)
    }))), 
    defaultSelectedSlotIndex = v5.optional(v5.integer), 
    onChange = v5.callback, 
    width = v5.optional(v5.integer), 
    darken = v5.optional(v5.boolean), 
    onInputBegan = v5.optional(v5.callback), 
    onInputEnded = v5.optional(v5.callback), 
    scrollingFrameRef = v5.optional(v5.table), 
    onFocusChanged = v5.optional(v5.callback), 
    inputBindings = v5.optional(v5.table), 
    NextSelectionLeft = v5.optional(v5.table), 
    NextSelectionRight = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionDown = v5.optional(v5.table)
});
local function v24(v19, v20)
    local v21 = v4.useRef(nil);
    if v21.current == nil then
        v21.current = v6.createSingleMotor(v20 or 0);
    end;
    local l_current_0 = v21.current;
    v4.useEffect(function()
        l_current_0:onStep(function(v23)
            if v19.current ~= nil then
                v19.current.CanvasPosition = Vector2.new(v23, 0);
            end;
        end);
        return function()
            l_current_0:destroy();
        end;
    end, {});
    return l_current_0;
end;
return function(v25)
    local v26 = v8.useRefCache();
    local v27 = v4.useRef(nil);
    if v25.scrollingFrameRef then
        v27 = v25.scrollingFrameRef;
    end;
    local v28 = v25.width or 360;
    local v29 = v24(v27, 0);
    local v30, v31 = v4.useState(v25.defaultSelectedSlotIndex or 1);
    v4.useEffect(function()
        local l_current_1 = v27.current;
        if v30 ~= 0 and l_current_1 then
            local v33 = v26[v30] and v26[v30].current;
            if v33 then
                local l_X_0 = l_current_1.CanvasPosition.X;
                local l_X_1 = l_current_1.AbsolutePosition.X;
                local v36 = l_X_1 + v28;
                local l_X_2 = v33.AbsolutePosition.X;
                local v38 = ((l_X_2 + 48) + 24) - v36;
                local v39 = (l_X_2 - 24) - l_X_1;
                local v40 = l_X_0 + v38;
                local v41 = l_X_0 + v39;
                if l_X_0 < v40 then
                    v29:setGoal(v6.spring(v40, v17));
                    return ;
                else
                    if v41 < l_X_0 then
                        v29:setGoal(v6.spring(v41, v17));
                    end;
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end, {
        v30, 
        v28, 
        v26, 
        v27, 
        v29
    });
    local v43 = v4.useCallback(function(v42)
        v31(v42);
        v25.onChange(v42);
    end, {
        v25.onChange
    });
    local v44 = (#v25.slots * 48 + (#v25.slots - 1) * 12) + 48;
    local v45 = v11();
    local v46 = if not v16.migrateToNewSelectionCursor then v13(v12.RoundedSlot) else v14(v15.RoundedSlot);
    assert(v18(v25));
    local l_Theme_0 = v45.Theme;
    local v50 = v7.List.map(v25.slots, function(v48, v49)
        return v4.createElement(l_Focusable_0.Frame, {
            key = "Slot" .. tostring(v49), 
            LayoutOrder = v49, 
            Size = UDim2.fromOffset(48, 48), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 2, 
            ref = v26[v49], 
            NextSelectionRight = v49 < #v25.slots and v26[v49 + 1] or nil, 
            NextSelectionLeft = v49 > 1 and v26[v49 - 1] or nil, 
            onFocusGained = function()
                v43(v49);
            end, 
            SelectionImageObject = v46
        }, {
            Slot = v4.createElement(v10, {
                isSelected = v30 == v49, 
                displayText = v48.displayText, 
                thumbnail = v48.thumbnail, 
                isLoading = v48.isLoading, 
                isDisabled = v48.isDisabled, 
                index = v49, 
                onActivated = v43
            })
        });
    end);
    table.insert(v50, (v4.createElement("UIListLayout", {
        key = "Layout", 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, 12)
    })));
    return v4.createElement(l_Focusable_0.ScrollingFrame, {
        Size = UDim2.fromOffset(v28, 72), 
        CanvasSize = UDim2.new(0, v44, 0, 72), 
        BackgroundTransparency = 1, 
        ScrollBarImageColor3 = l_Theme_0.PlaceHolder.Color, 
        ScrollBarImageTransparency = l_Theme_0.PlaceHolder.Transparency, 
        ScrollBarThickness = 0, 
        BorderSizePixel = 0, 
        ClipsDescendants = true, 
        ElasticBehavior = Enum.ElasticBehavior.Always, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ref = v27, 
        [v4.Event.InputBegan] = v25.onInputBegan, 
        [v4.Event.InputEnded] = v25.onInputEnded, 
        onFocusChanged = v25.onFocusChanged, 
        inputBindings = v25.inputBindings, 
        NextSelectionDown = v25.NextSelectionDown, 
        NextSelectionUp = v25.NextSelectionUp, 
        NextSelectionLeft = v25.NextSelectionLeft, 
        NextSelectionRight = v25.NextSelectionRight, 
        defaultChild = v26[1], 
        restorePreviousChildFocus = true
    }, {
        SlotContainer = v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = if not v25.darken then l_Theme_0.PlaceHolder.Color else l_Theme_0.Overlay.Color, 
            BackgroundTransparency = if not v25.darken then l_Theme_0.PlaceHolder.Transparency else l_Theme_0.Overlay.Transparency
        }, v50)
    });
end;
