local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v5.Focusable;
local v7 = require(l_CorePackages_0.Cryo);
local v8 = require(l_CorePackages_0.UIBlox);
local l_CursorKind_0 = v8.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v8.App.SelectionImage.withSelectionCursorProvider;
local l_withStyle_0 = v8.Style.withStyle;
local v12 = require(l_Modules_0.LuaApp.FitChildren);
local v13 = require(l_Modules_0.LuaApp.Components.SearchBarListPickerItem);
local v14 = game:DefineFastFlag("LuaAppSearchListFramesSelectable", false);
local v15 = v2.PureComponent:extend("SearchBarListPicker");
v15.validateProps = v3.strictInterface({
    items = v3.array(v3.any), 
    width = v3.UDim, 
    height = v3.optional(v3.number), 
    layoutOrder = v3.optional(v3.integer), 
    forwardRef = v3.optional(v3.table), 
    NextSelectionUp = v3.optional(v3.table), 
    NextSelectionDown = v3.optional(v3.table), 
    NextSelectionLeft = v3.optional(v3.table), 
    NextSelectionRight = v3.optional(v3.table), 
    formFactor = v3.optional(v3.string), 
    screenHeight = v3.optional(v3.integer), 
    topBarHeight = v3.optional(v3.integer), 
    globalGuiInset = v3.optional(v3.table)
});
v15.init = function(v16)
    v16.focusableRefs = v5.createRefCache();
end;
v15.renderWithProviders = function(v17, v18)
    local l_items_0 = v17.props.items;
    local l_layoutOrder_0 = v17.props.layoutOrder;
    local v21 = nil;
    local l_screenHeight_0 = v17.props.screenHeight;
    local l_topBarHeight_0 = v17.props.topBarHeight;
    local l_globalGuiInset_0 = v17.props.globalGuiInset;
    local l_height_0 = v17.props.height;
    v21 = if not l_height_0 then UDim2.new(v17.props.width.Scale, v17.props.width.Offset, 0, ((l_screenHeight_0 - l_globalGuiInset_0.top) - l_topBarHeight_0) - l_globalGuiInset_0.bottom) else UDim2.new(v17.props.width.Scale, v17.props.width.Offset, 0, l_height_0);
    local v26 = {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        TopPadding = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 5), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 0
        })
    };
    local function _(v27, v28)
        local v29 = v27 + v28;
        if v29 < 1 then
            return v17.props.NextSelectionUp;
        elseif #l_items_0 < v29 then
            return v17.props.NextSelectionDown or v17.focusableRefs[v27];
        else
            return v17.focusableRefs[v29];
        end;
    end;
    local function _(v31)
        local v32 = false;
        if v31 >= 1 then
            v32 = v31 <= #l_items_0;
        end;
        return not not v32 and v17.focusableRefs[v31] or nil;
    end;
    local l_forwardRef_0 = v17.props.forwardRef;
    if v14 and #v17.props.items > 0 then
        v17.focusableRefs[1] = l_forwardRef_0;
    end;
    for v35, v36 in ipairs(l_items_0) do
        local l_createElement_0 = v2.createElement;
        local v38 = l_Focusable_0[v13];
        local v39 = {
            item = v36, 
            layoutOrder = v35, 
            separatorEnabled = v35 < #l_items_0
        };
        local v40;
        if not v14 then
            local v41 = v35 - 1;
            local v42 = false;
            if v41 >= 1 then
                v42 = v41 <= #l_items_0;
            end;
            v40 = not not v42 and v17.focusableRefs[v41] or nil;
        else
            local v43 = v35 + -1;
            v40 = if v43 < 1 then v17.props.NextSelectionUp else if #l_items_0 < v43 then v17.props.NextSelectionDown or v17.focusableRefs[v35] else v17.focusableRefs[v43];
        end;
        v39.NextSelectionUp = v40;
        if not v14 then
            local v44 = math.min(#l_items_0, v35 + 1);
            local v45 = false;
            if v44 >= 1 then
                v45 = v44 <= #l_items_0;
            end;
            v40 = not not v45 and v17.focusableRefs[v44] or nil;
        else
            local v46 = v35 + 1;
            v40 = if v46 < 1 then v17.props.NextSelectionUp else if #l_items_0 < v46 then v17.props.NextSelectionDown or v17.focusableRefs[v35] else v17.focusableRefs[v46];
        end;
        v39.NextSelectionDown = v40;
        if not v14 then
            local v47 = false;
            if v35 >= 1 then
                v47 = v35 <= #l_items_0;
            end;
            v40 = not not v47 and v17.focusableRefs[v35] or nil;
        else
            v40 = v17.props.NextSelectionRight;
        end;
        v39.NextSelectionRight = v40;
        if not v14 then
            local v48 = false;
            if v35 >= 1 then
                v48 = v35 <= #l_items_0;
            end;
            v40 = not not v48 and v17.focusableRefs[v35] or nil;
        else
            v40 = v17.props.NextSelectionLeft;
        end;
        v39.NextSelectionLeft = v40;
        v39.SelectionImageObject = v18(l_CursorKind_0.RoundedRectNoInset);
        v40 = v2.Ref;
        local v49 = false;
        if v35 >= 1 then
            v49 = v35 <= #l_items_0;
        end;
        v39[v40] = not not v49 and v17.focusableRefs[v35] or nil;
        v26[v35] = l_createElement_0(v38, v39);
    end;
    return l_withStyle_0(function(v50)
        return v2.createElement(l_Focusable_0.Frame, {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Size = v21 + UDim2.fromOffset(48, 0), 
            BackgroundColor3 = v50.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v50.Theme.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            NextSelectionLeft = if not v14 then v17.props.NextSelectionLeft else nil, 
            NextSelectionRight = if not v14 then v17.props.NextSelectionRight else nil, 
            NextSelectionUp = if not v14 then v17.props.NextSelectionUp else nil, 
            NextSelectionDown = if not v14 then v17.props.NextSelectionDown else nil, 
            defaultChild = if not not l_items_0 and #l_items_0 > 0 then v17.focusableRefs[1] else nil, 
            [v2.Ref] = if not v14 then l_forwardRef_0 else nil, 
            SelectionGroup = not not v14 or nil, 
            SelectionBehaviorDown = if not v14 then nil else Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = if not v14 then nil else Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = if not v14 then nil else Enum.SelectionBehavior.Stop
        }, {
            list = v2.createElement(v12.FitScrollingFrame, {
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.fromScale(0.5, 0), 
                BorderSizePixel = 0, 
                BackgroundColor3 = v50.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v50.Theme.BackgroundDefault.Transparency, 
                LayoutOrder = l_layoutOrder_0, 
                ScrollBarThickness = 0, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                Size = v21 - UDim2.new(0, 48, 0, 0), 
                fitFields = {
                    CanvasSize = v12.FitAxis.Height
                }, 
                Selectable = if not v14 then nil else false
            }, v26)
        });
    end);
end;
v15.render = function(v51)
    return l_withSelectionCursorProvider_0(function(v52)
        return v51:renderWithProviders(v52);
    end);
end;
v15 = v4.connect(function(v53, _)
    return {
        formFactor = v53.FormFactor, 
        screenHeight = v53.ScreenSize.Y, 
        topBarHeight = v53.TopBar.topBarHeight, 
        globalGuiInset = v53.GlobalGuiInset
    };
end)(v15);
return v2.forwardRef(function(v55, v56)
    return v2.createElement(v15, v7.Dictionary.join(v55, {
        forwardRef = v56
    }));
end);
