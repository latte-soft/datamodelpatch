local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.FitChildren);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v6 = require(l_Modules_0.LuaApp.Components.ListCell);
local v7 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v8 = Rect.new(8, 8, 9, 9);
local v9 = v2.PureComponent:extend("ListCellMenu");
v9.defaultProps = {
    itemHeight = 66, 
    maxHeight = 10000, 
    visibleItem = 5.58
};
v9.init = function(v10)
    v10.onCanvasSizeChanged = function(v11)
        local l_Offset_0 = v11.CanvasSize.Y.Offset;
        local l_maxHeight_0 = v10.props.maxHeight;
        l_maxHeight_0 = if v10.props.formFactor == l_FormFactor_0.COMPACT then math.min(l_maxHeight_0, v10.props.visibleItem * v10.props.itemHeight) else math.min(l_maxHeight_0, v10.props.screenHeight * 0.5);
        if l_Offset_0 <= l_maxHeight_0 then
            v11.ScrollingEnabled = false;
        else
            v11.ScrollingEnabled = true;
            l_Offset_0 = l_maxHeight_0;
        end;
        v11.Size = UDim2.new(0, v10.props.width, 0, l_Offset_0);
    end;
end;
v9.render = function(v14)
    local l_items_0 = v14.props.items;
    local l_layoutOrder_0 = v14.props.layoutOrder;
    local v17 = UDim2.new(0, v14.props.width, 0, 0);
    local l_ContextualMenu_0 = v14.props.appTheme.ContextualMenu;
    local v19 = {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v20 = 0;
    for v21, v22 in ipairs(l_items_0) do
        v20 = v20 + 1;
        v19["Item_" .. v21] = v2.createElement(v6, {
            item = v22, 
            layoutOrder = v20
        });
        if v21 < #l_items_0 then
            v20 = v20 + 1;
            v19["Divider_" .. v21] = v2.createElement("Frame", {
                BackgroundColor3 = l_ContextualMenu_0.Divider.Color, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                LayoutOrder = v20, 
                Size = UDim2.new(1, 0, 0, 1)
            });
        end;
    end;
    return v2.createElement(v4.FitImageLabel, {
        Position = UDim2.new(0.5, 0, 0, 0), 
        AnchorPoint = Vector2.new(0.5, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Image = "LuaApp/buttons/buttonFill", 
        ImageColor3 = l_ContextualMenu_0.Background.Color, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v8, 
        fitAxis = v4.FitAxis.Both, 
        LayoutOrder = l_layoutOrder_0
    }, {
        ScrollingFrame = v2.createElement(v4.FitScrollingFrame, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ScrollBarThickness = 0, 
            Size = v17, 
            fitFields = {
                CanvasSize = v4.FitAxis.Height
            }, 
            [v2.Change.CanvasSize] = v14.onCanvasSizeChanged
        }, v19)
    });
end;
return (v7((v3.connect(function(v23, _)
    return {
        formFactor = v23.FormFactor, 
        screenWidth = v23.ScreenSize.X, 
        screenHeight = v23.ScreenSize.Y
    };
end)(v9))));
