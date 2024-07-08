local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Rodux);
local v2 = require(game:GetService("CorePackages").Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.SetNotificationCount);
local v4 = require(l_Modules_0.LuaApp.Actions.SetFriendRequestsCount);
local v5 = require(l_Modules_0.LuaApp.Actions.SetUnreadMessageCount);
local v6 = require(l_Modules_0.LuaApp.Actions.SetEmailNotificationCount);
local v7 = require(l_Modules_0.LuaApp.Actions.SetPasswordNotificationCount);
local v8 = require(l_Modules_0.Luobu.Actions.SetTencentNoticeBadgeCount);
local v9 = require(l_Modules_0.Luobu.Actions.DecrementUnreadTencentNoticeCount);
local v10 = require(l_Modules_0.LuaApp.Components.EventReceivers.EventNetworking);
if not settings():GetFFlag("FixCountOfUnreadNotificationError") then
    return function(v11, v12)
        v11 = v11 or {
            TopBarNotificationIcon = 0, 
            MorePageMessages = 0, 
            MorePageFriends = 0, 
            MorePageEmailSettings = 0, 
            MorePagePasswordSettings = 0, 
            MorePageSettings = 0, 
            MorePageTencentUnreadNotice = 0
        };
        if v12.type == v3.name then
            v11.TopBarNotificationIcon = v12.notificationCount;
            return v11;
        elseif v12.type == v4.name then
            return v2.Dictionary.join(v11, {
                MorePageFriends = v12.count
            });
        elseif v12.type == v5.name then
            return v2.Dictionary.join(v11, {
                MorePageMessages = v12.count
            });
        elseif v12.type == v6.name then
            return v2.Dictionary.join(v11, {
                MorePageEmailSettings = v12.count, 
                MorePageSettings = v12.count + v11.MorePagePasswordSettings
            });
        elseif v12.type == v7.name then
            return v2.Dictionary.join(v11, {
                MorePagePasswordSettings = v12.count, 
                MorePageSettings = v12.count + v11.MorePageEmailSettings
            });
        elseif v12.type == v8.name then
            return v2.Dictionary.join(v11, {
                MorePageTencentUnreadNotice = v12.count
            });
        elseif v12.type == v9.name then
            local v13 = v11.MorePageTencentUnreadNotice - 1;
            return v2.Dictionary.join(v11, {
                MorePageTencentUnreadNotice = v13 > 0 and v13 or 0
            });
        else
            return v11;
        end;
    end;
else
    return v1.createReducer({
        TopBarNotificationIcon = 0, 
        MorePageMessages = 0, 
        MorePageFriends = 0, 
        MorePageEmailSettings = 0, 
        MorePagePasswordSettings = 0, 
        MorePageSettings = 0, 
        MorePageTencentUnreadNotice = 0
    }, {
        [v3.name] = function(v14, v15)
            return v2.Dictionary.join(v14, {
                TopBarNotificationIcon = v15.notificationCount
            });
        end, 
        [v4.name] = function(v16, v17)
            return v2.Dictionary.join(v16, {
                MorePageFriends = v17.count
            });
        end, 
        [v10.FriendsNetworking.GetFriendRequestsCount.Succeeded.name] = function(v18, v19)
            return v2.Dictionary.join(v18, {
                MorePageFriends = v19.responseBody.count
            });
        end, 
        [v5.name] = function(v20, v21)
            return v2.Dictionary.join(v20, {
                MorePageMessages = v21.count
            });
        end, 
        [v6.name] = function(v22, v23)
            return v2.Dictionary.join(v22, {
                MorePageEmailSettings = v23.count, 
                MorePageSettings = v23.count + v22.MorePagePasswordSettings
            });
        end, 
        [v7.name] = function(v24, v25)
            return v2.Dictionary.join(v24, {
                MorePagePasswordSettings = v25.count, 
                MorePageSettings = v25.count + v24.MorePageEmailSettings
            });
        end, 
        [v8.name] = function(v26, v27)
            return v2.Dictionary.join(v26, {
                MorePageTencentUnreadNotice = v27.count
            });
        end, 
        [v9.name] = function(v28, _)
            local v30 = v28.MorePageTencentUnreadNotice - 1;
            return v2.Dictionary.join(v28, {
                MorePageTencentUnreadNotice = v30 > 0 and v30 or 0
            });
        end
    });
end;
