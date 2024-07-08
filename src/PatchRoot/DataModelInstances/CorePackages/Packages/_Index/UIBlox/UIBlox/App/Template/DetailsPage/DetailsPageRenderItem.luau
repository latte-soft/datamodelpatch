local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local v5 = require(l_Parent_2.App.SelectionImage.useSelectionCursor);
local v6 = require(l_Parent_2.App.SelectionImage.CursorKind);
local v7 = require(l_Parent_1.SelectionCursor.useCursorByType);
local v8 = require(l_Parent_1.SelectionCursor.CursorType);
local v9 = require(l_Parent_2.UIBloxConfig);
local _ = require(l_Parent_0.Types);
local v11 = require(l_Parent_3.React);
local function v13(v12)
    l_GuiService_0:Select(v12);
end;
return function(v14)
    local l_item_0 = v14.item;
    local l_safeArea_0 = v14.safeArea;
    local l_itemPadding_0 = v14.itemPadding;
    local v18 = v11.useMemo(function()
        return l_item_0.renderComponent();
    end, {
        l_item_0.renderComponent
    });
    local v19, v20 = v11.useBinding(0);
    return v11.createElement("CanvasGroup", {
        key = l_item_0.key, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        ref = v11.useRef(nil), 
        [v11.Change.AbsolutePosition] = v11.useCallback(function(v21)
            local l_v21_FirstAncestorOfClass_0 = v21:FindFirstAncestorOfClass("ScrollingFrame");
            if l_v21_FirstAncestorOfClass_0 == nil then
                return nil;
            else
                local v23 = (v21.AbsolutePosition.Y - l_v21_FirstAncestorOfClass_0.AbsolutePosition.Y) - l_safeArea_0.Y;
                local v24 = -(v21.AbsoluteSize.Y + l_itemPadding_0);
                if v23 < 1 and v24 < (v23 + l_safeArea_0.Y) + 1 then
                    v20(v23 / v24);
                else
                    v20(0);
                end;
                return nil;
            end;
        end, {
            l_safeArea_0, 
            l_itemPadding_0
        }), 
        GroupTransparency = v19, 
        BackgroundTransparency = 1, 
        Selectable = l_item_0.useSelectionBumper, 
        SelectionImageObject = if not v9.migrateToNewSelectionCursor then v5(v6.Invisible) else v7(v8.Invisible), 
        [v11.Event.SelectionGained] = v13
    }, {
        Padding = v11.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_safeArea_0.X), 
            PaddingRight = UDim.new(0, l_safeArea_0.X)
        }), 
        View = v18
    });
end;
