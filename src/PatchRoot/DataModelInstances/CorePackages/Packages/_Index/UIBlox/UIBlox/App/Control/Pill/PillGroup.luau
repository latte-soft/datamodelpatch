local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local l_Parent_4 = l_Parent_3.Parent;
local v5 = require(l_Parent_4.Cryo);
local v6 = require(l_Parent_4.React);
local v7 = require(l_Parent_4.RoactGamepad);
local l_Focusable_0 = v7.Focusable;
local v9 = require(l_Parent_4.FitFrame);
local l_FitFrameHorizontal_0 = v9.FitFrameHorizontal;
local v11 = require(l_Parent_2.ImageSet.Enum.IconSize);
local v12 = require(l_Parent_2.ImageSet.Images);
local v13 = require(l_Parent_3.Core.Style.useStyle);
local v14 = require(l_Parent_3.App.Button.IconButton);
local v15 = require(l_Parent_3.Utility.useIsGamepad);
local v16 = require(l_Parent_1.HorizontalNav.ScrollingListWithArrowsAndGradient);
local v17 = require(l_Parent_0.Pillv2);
local function v48(v18)
    local v19 = v15();
    local v20 = v6.useRef(nil);
    local function _()
        local l_current_0 = v20.current;
        if l_current_0 then
            l_current_0:ScrollToTop();
        end;
    end;
    local v23 = v18.leftPadding or 15;
    local v24 = v18.rightPadding or 15;
    local v25 = v18.selectedPills or {};
    local l_Theme_0 = v13().Theme;
    local v28 = v6.useCallback(function(v27)
        if v20.current then
            v20.current.CanvasSize = UDim2.new(0, v27.AbsoluteSize.X, 1, 0);
        end;
    end);
    local v29 = v7.useRefCache();
    local v30 = v6.useCallback(function()
        if v18.onSelectionChanged then
            v18.onSelectionChanged({});
        end;
    end);
    local v34 = v6.useMemo(function()
        local v31 = {};
        for _, v33 in v18.pills, nil, nil do
            if not v5.List.find(v25, v33) then
                table.insert(v31, v33);
            end;
        end;
        return v5.List.join(v25, v31);
    end, {
        v18.pills, 
        v25
    });
    local v35 = #v25 > 1;
    local v36 = {
        ClearButton = not not v35 and v6.createElement(v14, {
            layoutOrder = 1, 
            size = UDim2.fromOffset(24, 24), 
            iconSize = v11.Medium, 
            icon = v12["icons/actions/reject"], 
            onActivated = v30, 
            key = "0", 
            buttonRef = v29[0], 
            NextSelectionRight = v29[1]
        }) or nil
    };
    local l_isLoading_0 = v18.isLoading;
    for v38, v39 in v34, nil, nil do
        local function v43()
            local v40 = v5.List.find(v25, v39) ~= nil;
            local v41 = if not v40 then v5.List.join(v25, {
                v39
            }) else v5.List.removeValue(v25, v39);
            if not v40 then
                local l_current_1 = v20.current;
                if l_current_1 then
                    l_current_1:ScrollToTop();
                end;
            end;
            if v18.onSelectionChanged then
                v18.onSelectionChanged(v41);
            end;
        end;
        local v44 = v38 <= #v25;
        if v44 then
            l_isLoading_0 = false;
        end;
        v36[v38] = v6.createElement(l_Focusable_0[v17], {
            layoutOrder = v38 + 1, 
            key = tostring(v38), 
            text = v39, 
            isSelected = v44, 
            isLoading = v18.isLoading and not v44, 
            ref = v29[v38], 
            NextSelectionLeft = if not (v38 <= 1) or v35 then v29[v38 - 1] else nil, 
            NextSelectionRight = if v38 < #v34 then v29[v38 + 1] else nil, 
            onActivated = v43
        });
    end;
    if not (not l_isLoading_0 or not v19) then
        v36[1] = v6.createElement(l_Focusable_0[v17], {
            layoutOrder = 2, 
            key = "1", 
            ref = v29[1], 
            text = ""
        });
    end;
    local function v45()
        return {
            SubNavFrame = v6.createElement(l_FitFrameHorizontal_0, {
                height = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 8), 
                margin = v9.Rect.quad(0, v24, 0, v23), 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal, 
                BackgroundTransparency = 1, 
                [v6.Change.AbsoluteSize] = v28
            }, v36)
        };
    end;
    local v46 = {};
    for v47 = 1, #v34 do
        v46[v47] = v29[v47];
    end;
    return v6.createElement(l_Focusable_0.Frame, {
        Size = UDim2.new(1, 0, 0, 52), 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v18.layoutOrder, 
        ref = v18.forwardRef, 
        NextSelectionUp = v18.NextSelectionUp, 
        NextSelectionDown = v18.NextSelectionDown, 
        defaultChild = v29[1]
    }, {
        ScrollingList = v6.createElement(v16, {
            getScollingListContent = v45, 
            listHeight = 52, 
            scrollingFrameRef = v20, 
            buttonRefs = v46, 
            buttonPadding = 8, 
            padOutsideEdges = false, 
            hideGradient = true
        })
    });
end;
return v6.forwardRef(function(v49, v50)
    return v6.createElement(v48, v5.Dictionary.join(v49, {
        forwardRef = v50
    }));
end);
