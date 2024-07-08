local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v4 = require(l_Modules_0.Luobu.Constants);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = v2.PureComponent:extend("TencentNoticeList");
v6.validateProps = v5.strictInterface({
    renderItem = v5.callback, 
    itemList = v5.table
});
v6.render = function(v7)
    local l_renderItem_0 = v7.props.renderItem;
    local l_itemList_0 = v7.props.itemList;
    local l_TENCENT_NOTICE_CENTER_PAGE_ROW_HEIGHT_0 = v4.TENCENT_NOTICE_CENTER_PAGE_ROW_HEIGHT;
    return l_withStyle_0(function(v11)
        local l_BackgroundDefault_0 = v11.Theme.BackgroundDefault;
        local l_Divider_0 = v11.Theme.Divider;
        local v14 = {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            })
        };
        for v15, v16 in ipairs(l_itemList_0) do
            local v17 = v15 < #l_itemList_0;
            v14["NoticeList_Row_" .. v16.noticeId] = l_renderItem_0(v16, {
                Size = UDim2.new(1, 0, 0, not not v17 and l_TENCENT_NOTICE_CENTER_PAGE_ROW_HEIGHT_0 - 1 or l_TENCENT_NOTICE_CENTER_PAGE_ROW_HEIGHT_0), 
                LayoutOrder = v15 * 2 - 1
            });
            v14["NoticeList_Divider_" .. v16.noticeId] = v17 and v2.createElement("Frame", {
                Size = UDim2.new(1, -24, 0, 1), 
                BackgroundColor3 = l_Divider_0.Color, 
                BackgroundTransparency = l_Divider_0.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = v15 * 2
            });
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_TENCENT_NOTICE_CENTER_PAGE_ROW_HEIGHT_0 * #l_itemList_0), 
            BackgroundColor3 = l_BackgroundDefault_0.Color, 
            BackgroundTransparency = l_BackgroundDefault_0.Transparency, 
            BorderSizePixel = 0, 
            BorderColor3 = l_Divider_0.Color, 
            LayoutOrder = 1
        }, v14);
    end);
end;
return v6;
