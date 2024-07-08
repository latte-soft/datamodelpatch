local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Cryo);
local v4 = require(l_Parent_2.React);
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v6 = require(l_Parent_1.Core.Control.InteractableList);
local v7 = require(l_Parent_1.Core.Control.Enum.SelectionMode);
local v8 = require(l_Parent_0.SelectionImage.useSelectionCursor);
local v9 = require(l_Parent_1.App.SelectionImage.CursorKind);
local v10 = require(l_Parent_1.App.SelectionCursor.useCursor);
local v11 = require(l_Parent_1.UIBloxConfig);
local v12 = require(script.Parent.IconTab);
local v13 = require(script.Parent.HorizontalContainer);
local _ = require(script.Parent.Types);
local v15 = require(script.Parent.Constants);
local v16 = {
    selection = {
        1
    }, 
    items = {}, 
    padding = {
        left = v15.ICON_TAB_PADDING, 
        right = v15.ICON_TAB_PADDING
    }, 
    itemSpacing = UDim.new(0, v15.ICON_TAB_ITEM_SPACING), 
    itemPadding = {
        left = v15.ICON_TAB_ITEM_PADDING_LEFT, 
        right = v15.ICON_TAB_ITEM_PADDING_RIGHT
    }
};
return function(v17)
    local v18 = l_Object_0.assign({}, v16, v17);
    local v19 = if not v11.useNewSelectionCursor then v8(v9.XLargePill) else v10(UDim.new(0.5, 0), 0);
    return v13({
        size = UDim2.new(0, 0, 0, v15.ICON_TAB_GROUP_HEIGHT), 
        showRoundedBackground = false, 
        automaticSize = Enum.AutomaticSize.X, 
        padding = v18.padding
    }, {
        MainTabList = v4.createElement(v6, {
            size = UDim2.new(0, 0, 1, 0), 
            automaticSize = Enum.AutomaticSize.X, 
            fillDirection = Enum.FillDirection.Horizontal, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            sortOrder = Enum.SortOrder.LayoutOrder, 
            itemList = v18.items, 
            itemSize = UDim2.fromScale(0, 0), 
            renderItem = function(v20, v21, v22)
                return v4.createElement(v12, {
                    item = v20, 
                    selected = v22, 
                    controlState = v21, 
                    padding = v18.itemPadding
                }), {
                    LayoutOrder = v3.List.find(v18.items, v20), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    SelectionImageObject = v19
                };
            end, 
            onSelectionChanged = function(v23)
                local v24 = v18.items[v23[1]];
                if v24 ~= nil and v24.onActivated ~= nil then
                    v24.onActivated();
                end;
            end, 
            selection = v18.selection, 
            selectionMode = v7.Single, 
            padding = v18.itemSpacing
        })
    });
end;
