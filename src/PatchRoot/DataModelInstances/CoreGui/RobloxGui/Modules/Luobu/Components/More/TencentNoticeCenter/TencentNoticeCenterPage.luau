local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local _ = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v9 = require(l_Modules_0.Luobu.Components.More.TencentNoticeCenter.TencentNoticeList);
local v10 = require(l_Modules_0.Luobu.Components.More.TencentNoticeCenter.TencentNoticeItemContainer);
local v11 = require(l_Modules_0.LuaApp.Components.More.MorePageScrollingFrame);
local v12 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_EmptyState_0 = v4.App.Indicator.EmptyState;
local v15 = v2.PureComponent:extend("TencentNoticeCenterPage");
v15.validateProps = v12.strictInterface({
    formFactor = v12.string, 
    noticeList = v12.optional(v12.table)
});
v15.init = function(v16)
    v16.renderItem = function(v17, v18)
        return v2.createElement(v10, {
            item = v17, 
            layoutInfo = v18
        });
    end;
end;
v15.render = function(v19)
    return l_withStyle_0(function(v20)
        local _ = nil;
        local l_BackgroundDefault_0 = v20.Theme.BackgroundDefault;
        local v23 = v19.props.formFactor == l_FormFactor_0.WIDE;
        local l_noticeList_0 = v19.props.noticeList;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_BackgroundDefault_0.Color, 
            BackgroundTransparency = l_BackgroundDefault_0.Transparency
        }, {
            TopBar = v2.createElement(v8.Container, {
                leftItem = v8.BackButton, 
                rightItems = {
                    v8.BuyRobuxButton, 
                    v8.NotificationsButton
                }
            }), 
            Content = v2.createElement(v8.PageContent, {}, {
                ContentFrame = if l_noticeList_0 == nil then v2.createElement("Frame", {
                    Position = UDim2.fromScale(0, 0), 
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundColor3 = l_BackgroundDefault_0.Color
                }, {
                    EmptySection = l_withLocalization_0({
                        emptyText = "CommonUI.Features.Label.MoreEvents"
                    })(function(v25)
                        return v2.createElement(l_EmptyState_0, {
                            text = v25.emptyText, 
                            size = UDim2.fromScale(1, 1)
                        });
                    end)
                }) else v2.createElement(v11, {
                    Position = UDim2.fromScale(0, 0), 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    Layout = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, not v23 and 0 or 60), 
                        PaddingRight = UDim.new(0, not v23 and 0 or 60), 
                        PaddingTop = UDim.new(0, not v23 and 20 or 40), 
                        PaddingBottom = UDim.new(0, not v23 and 20 or 40)
                    }), 
                    TencentNoticeCenterList = l_noticeList_0 and v2.createElement(v9, {
                        itemList = l_noticeList_0, 
                        renderItem = v19.renderItem
                    })
                })
            })
        });
    end);
end;
return v3.connect(function(v26)
    return {
        formFactor = v26.FormFactor, 
        noticeList = v26.Luobu.TencentNotice.noticeList
    };
end)(v15);
