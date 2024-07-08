local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.FitChildren);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v7 = require(l_Modules_0.LuaApp.Components.ListPickerItem);
game:DefineFastInt("AutomaticSizingListPickerHotfix", 0);
local v8 = v2.PureComponent:extend("ListPicker");
v8.defaultProps = {
    itemHeight = 54, 
    maxHeight = 10000, 
    visibleItem = 5.58, 
    Selectable = false
};
v8.init = function(v9)
    v9.onCanvasSizeChanged = function(v10)
        local l_Offset_0 = v10.CanvasSize.Y.Offset;
        local l_maxHeight_0 = v9.props.maxHeight;
        l_maxHeight_0 = if v9.props.formFactor == l_FormFactor_0.COMPACT then math.min(l_maxHeight_0, v9.props.visibleItem * v9.props.itemHeight) else math.min(l_maxHeight_0, v9.props.screenHeight * 0.5);
        if l_Offset_0 <= l_maxHeight_0 then
            v9:setState({
                scrollingEnabled = false, 
                canvasSizeYOffset = l_Offset_0
            });
            return ;
        else
            v9:setState({
                scrollingEnabled = true, 
                canvasSizeYOffset = l_maxHeight_0
            });
            return ;
        end;
    end;
    v9:setState({
        scrollingEnabled = false, 
        canvasSizeYOffset = 0
    });
end;
v8.render = function(v13)
    local l_items_0 = v13.props.items;
    local l_layoutOrder_0 = v13.props.layoutOrder;
    local l_width_0 = v13.props.width;
    local l_canvasSizeYOffset_0 = v13.state.canvasSizeYOffset;
    local l_scrollingEnabled_0 = v13.state.scrollingEnabled;
    local v19 = UDim2.fromOffset(l_width_0, l_canvasSizeYOffset_0);
    local v20 = {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    for v21, v22 in ipairs(l_items_0) do
        v20[v21] = v2.createElement(v7, {
            item = v22, 
            layoutOrder = v21, 
            separatorEnabled = v21 < #l_items_0
        });
    end;
    return l_withStyle_0(function(v23)
        return v2.createElement(v5.FitScrollingFrame, {
            BorderSizePixel = 0, 
            BackgroundColor3 = v23.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = v23.Theme.BackgroundUIDefault.Transparency, 
            LayoutOrder = l_layoutOrder_0, 
            ScrollBarThickness = 0, 
            Size = v19, 
            ScrollingEnabled = l_scrollingEnabled_0, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            fitFields = {
                CanvasSize = v5.FitAxis.Height
            }, 
            [v2.Change.CanvasSize] = v13.onCanvasSizeChanged, 
            Selectable = v13.props.Selectable
        }, v20);
    end);
end;
return (v3.connect(function(v24, _)
    return {
        formFactor = v24.FormFactor, 
        screenWidth = v24.ScreenSize.X, 
        screenHeight = v24.ScreenSize.Y
    };
end)(v8));
