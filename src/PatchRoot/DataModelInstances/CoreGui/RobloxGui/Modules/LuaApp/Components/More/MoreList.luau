local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_CorePackages_0.Roact);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = v3.PureComponent:extend("MoreList");
v6.defaultProps = {
    LayoutOrder = 1
};
v6.render = function(v7)
    local l_LayoutOrder_0 = v7.props.LayoutOrder;
    local l_itemList_0 = v7.props.itemList;
    local l_renderItem_0 = v7.props.renderItem;
    local l_rowHeight_0 = v7.props.rowHeight;
    v2.isType(l_renderItem_0, "function", "MoreList.props.renderItem");
    if not l_itemList_0 or #l_itemList_0 == 0 then
        return ;
    else
        local function v22(v12, v13)
            local v14 = {};
            local v15 = 0;
            local v16;
            if #l_itemList_0[1] <= 1 then
                v16 = false;
                if not (#l_itemList_0 > 1) then
                    goto label0;
                end;
            end;
            v16 = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            });
            ::label0::;
            v14.Layout = v16;
            for v17, v18 in ipairs(l_itemList_0) do
                for v19, v20 in ipairs(v18) do
                    v15 = v15 + 1;
                    local v21 = true;
                    if v19 >= #v18 then
                        v21 = v17 < #l_itemList_0;
                    end;
                    v14["Row" .. v15] = l_renderItem_0(v20, {
                        Size = UDim2.new(1, 0, 0, not not v21 and l_rowHeight_0 - 1 or l_rowHeight_0), 
                        LayoutOrder = v15 * 2 - 1
                    });
                    if v21 then
                        v14["Divider" .. v15] = v3.createElement("Frame", {
                            Size = UDim2.new(1, -(not not v20.icon and v5.MORE_PAGE_TEXT_PADDING_WITH_ICON or v5.MORE_PAGE_ROW_PADDING_LEFT), 0, 1), 
                            BackgroundColor3 = v13.Color, 
                            BackgroundTransparency = v13.Transparency, 
                            BorderSizePixel = 0, 
                            LayoutOrder = v15 * 2
                        });
                    end;
                end;
            end;
            return v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_rowHeight_0 * v15), 
                BackgroundColor3 = v12.Color, 
                BackgroundTransparency = v12.Transparency, 
                BorderSizePixel = 0, 
                BorderColor3 = v13.Color, 
                LayoutOrder = l_LayoutOrder_0
            }, v14);
        end;
        return l_withStyle_0(function(v23)
            return v22(v23.Theme.BackgroundDefault, v23.Theme.Divider);
        end);
    end;
end;
return v6;
