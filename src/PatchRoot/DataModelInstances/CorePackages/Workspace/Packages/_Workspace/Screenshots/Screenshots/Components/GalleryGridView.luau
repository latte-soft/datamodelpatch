local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.RobloxAppHooks);
local v6 = require(l_Parent_1.UIBlox);
local l_useEffectOnce_0 = v4.Hooks.useEffectOnce;
local l_useScreenSize_0 = v5.useScreenSize;
local l_GridView_0 = v6.App.Grid.GridView;
local v10 = require(l_Parent_0.Components.GalleryActionContainer);
local v11 = require(l_Parent_0.Components.GalleryItem);
local v12 = require(l_Parent_0.Components.ShowMoreButton);
local _ = require(l_Parent_0.Types);
local v14 = require(l_Parent_0.Flags.FFlagCapturesRemoveOldMenuTheme);
local v15 = require(l_Parent_0.Flags.FFlagCaptureStorageBulkManagementEnabled);
local v16 = not v14 and 12 or 1;
local v17 = if not v14 then v16 + 4 else v16 + 8;
local function _(v18)
    return (math.clamp(math.floor(v18 / 120), 1, 4));
end;
local function _(v20, v21)
    local v22 = math.clamp(math.floor(v21 / 120), 1, 4);
    v21 = v21 - 4 * (v22 - 1);
    local v23 = math.min(v21 / v22, v21);
    return Vector2.new(math.floor(v23), (math.floor(v23 * v20)));
end;
local function _(v25, v26, v27)
    if v25 <= 0 then
        return 0;
    else
        local v28 = math.floor(v25 / v27.Y);
        if v25 < v27.Y * v28 + 4 * (v28 - 1) then
            v28 = v28 - 1;
        end;
        return (math.max(v28 * math.clamp(math.floor(v26 / 120), 1, 4), 8));
    end;
end;
local function v32(v30, v31)
    return v3.createElement(v11, {
        capture = v30, 
        captureIndex = v31
    });
end;
return function(v33)
    local v34, v35 = v3.useState(Vector2.new(0, 0));
    local v36, v37 = v3.useState(0);
    local v38 = l_useScreenSize_0();
    local v39 = v36 < #v33.captures;
    local v40 = false;
    if v34.X > 0 then
        v40 = v34.Y > 0;
    end;
    local v42 = v3.useCallback(function(v41)
        v35(v41.AbsoluteSize);
    end, {});
    local v43 = math.clamp(v38.Y / v38.X, 0.42857142857142855, 1);
    local v44 = (v34.Y - 12) - 40;
    if v14 then
        v44 = v44 - 36;
    end;
    local l_X_0 = v34.X;
    local l_v43_0 = v43;
    local l_l_X_0_0 = l_X_0;
    local v48 = math.clamp(math.floor(l_l_X_0_0 / 120), 1, 4);
    l_l_X_0_0 = l_l_X_0_0 - 4 * (v48 - 1);
    local v49 = math.min(l_l_X_0_0 / v48, l_l_X_0_0);
    local v50 = Vector2.new(math.floor(v49), (math.floor(v49 * l_v43_0)));
    l_l_X_0_0 = v44;
    v48 = l_X_0;
    v49 = v50;
    if l_l_X_0_0 <= 0 then
        l_v43_0 = 0;
    else
        local v51 = math.floor(l_l_X_0_0 / v49.Y);
        if l_l_X_0_0 < v49.Y * v51 + 4 * (v51 - 1) then
            v51 = v51 - 1;
        end;
        l_v43_0 = math.max(v51 * math.clamp(math.floor(v48 / 120), 1, 4), 8);
    end;
    if l_v43_0 < v36 then
        l_X_0 = l_X_0 - v17;
        v48 = v43;
        v49 = l_X_0;
        local v52 = math.clamp(math.floor(v49 / 120), 1, 4);
        v49 = v49 - 4 * (v52 - 1);
        local v53 = math.min(v49 / v52, v49);
        v50 = Vector2.new(math.floor(v53), (math.floor(v53 * v48)));
        v48 = v44;
        v49 = l_X_0;
        v52 = v50;
        if v48 <= 0 then
            l_v43_0 = 0;
        else
            v53 = math.floor(v48 / v52.Y);
            if v48 < v52.Y * v53 + 4 * (v53 - 1) then
                v53 = v53 - 1;
            end;
            l_v43_0 = math.max(v53 * math.clamp(math.floor(v49 / 120), 1, 4), 8);
        end;
    end;
    l_useEffectOnce_0(function()
        v37(l_v43_0);
    end, l_v43_0 ~= 0);
    v3.useEffect(function()
        if v36 < l_v43_0 then
            v37(l_v43_0);
        end;
    end, {
        v34
    });
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v33.LayoutOrder, 
        Size = v33.Size or UDim2.fromScale(1, 1), 
        [v3.Change.AbsoluteSize] = v42
    }, {
        UIListLayout = if not v15 then nil else v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        GalleryActionContainer = if not v15 then nil else v3.createElement(v10, {
            isDisabled = false, 
            itemCount = #v33.captures, 
            LayoutOrder = 1
        }), 
        ScrollingFrame = v3.createElement("ScrollingFrame", {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            CanvasSize = UDim2.fromScale(1, 0), 
            LayoutOrder = 2, 
            ScrollBarThickness = v16, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Size = if not v15 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, -36)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 12)
            }), 
            GridView = v40 and v3.createElement(l_GridView_0, {
                itemPadding = Vector2.new(4, 4), 
                items = v3.useMemo(function()
                    return v2.slice(v33.captures, 1, (math.min(#v33.captures, v36)));
                end, {
                    v33.captures, 
                    v36
                }), 
                itemSize = v50, 
                LayoutOrder = 1, 
                renderItem = v32
            }), 
            ShowMoreButton = v39 and v3.createElement(v12, {
                LayoutOrder = 2, 
                buttonHeight = 40, 
                onActivated = v3.useCallback(function()
                    v37(v36 + l_v43_0);
                end, {
                    v36, 
                    l_v43_0
                })
            })
        })
    });
end;
