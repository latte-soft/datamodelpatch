local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.t);
local l_DateTime_0 = require(l_CorePackages_0.Workspace.Packages.Time).DateTime;
local l_TimeZone_0 = require(l_CorePackages_0.Workspace.Packages.Time).TimeZone;
local v11 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v12 = require(l_Modules_0.LuaApp.AppPage);
local v13 = require(l_Modules_0.Luobu.Components.More.TencentNoticeCenter.NoticeListCell);
local v14 = require(l_Modules_0.Luobu.Actions.DecrementUnreadTencentNoticeCount);
local v15 = require(l_Modules_0.Luobu.Actions.ReadTencentNoticeId);
local v16 = require(l_Modules_0.Luobu.Enum.TencentNoticeType);
local v17 = require(l_Modules_0.Luobu.Enum.MemStorageKeys);
local v18 = v6.PureComponent:extend("TencentNoticeItemContainer");
v18.validateProps = v8.strictInterface({
    layoutInfo = v8.table, 
    item = v8.optional(v8.table), 
    dateText = v8.optional(v8.string), 
    navigateDown = v8.callback, 
    decrementUnreadTencentNoticeCount = v8.callback, 
    readTencentNoticeId = v8.callback, 
    noticeReadStatus = v8.table
});
local function _(v19)
    local v20 = l_DateTime_0.fromUnixTimestamp(v19);
    return (v20:GetLongRelativeTime(v20, l_TimeZone_0.Current, l_LocalizationService_0.RobloxLocaleId));
end;
v18.init = function(v22)
    v22.onActivated = function()
        local l_item_0 = v22.props.item;
        if l_item_0.type == v16.Web then
            v22.props.navigateDown({
                name = v12.GenericWebPage, 
                detail = l_item_0.webTypeUrl or l_item_0.noticeUrl, 
                extraProps = {
                    title = l_item_0.title
                }
            });
        else
            v22.props.navigateDown({
                name = v12.TencentNoticeContent, 
                extraProps = {
                    notice = l_item_0, 
                    dateText = v22.props.dateText
                }
            });
        end;
        if ((l_item_0.hasRead or v22.props.noticeReadStatus[l_item_0.noticeId]) or false) == false then
            v22:fireNoticeIdHasRead(l_item_0.noticeId, l_item_0.endTime);
        end;
    end;
end;
v18.fireNoticeIdHasRead = function(v24, v25, v26)
    l_MemStorageService_0:Fire(v17.TencentNoticeIdReadStatus, l_HttpService_0:JSONEncode({
        noticeId = v25, 
        endTime = v26
    }));
    v24.props.decrementUnreadTencentNoticeCount();
    v24.props.readTencentNoticeId(v25);
end;
v18.render = function(v27)
    return v6.createElement(v13, v5.Dictionary.join(v27.props.layoutInfo, {
        item = v27.props.item, 
        dateText = v27.props.dateText, 
        onActivated = v27.onActivated
    }));
end;
return (v7.connect(function(v28, v29)
    local v30 = not not v29.item and v29.item.startTime or nil;
    local v31 = {};
    local v32;
    if v30 then
        local v33 = l_DateTime_0.fromUnixTimestamp(v30);
        v32 = v33:GetLongRelativeTime(v33, l_TimeZone_0.Current, l_LocalizationService_0.RobloxLocaleId);
        if v32 then
            goto label0;
        end;
    end;
    v32 = nil;
    ::label0::;
    v31.dateText = v32;
    v31.noticeReadStatus = v28.Luobu.TencentNoticeReadStatus;
    return v31;
end, function(v34)
    return {
        navigateDown = function(v35)
            v34(v11(v35));
        end, 
        decrementUnreadTencentNoticeCount = function()
            return v34(v14());
        end, 
        readTencentNoticeId = function(v36)
            return v34(v15(v36));
        end
    };
end)(v18));
