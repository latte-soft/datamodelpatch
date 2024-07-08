local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v6 = require(l_RobloxGui_0.Modules.FriendingUtility);
local l_SendNotificationInfo_0 = l_RobloxGui_0:WaitForChild("SendNotificationInfo");
return function(v8, v9)
    return function()
        coroutine.wrap(function()
            local l_v6_FriendCountAsync_0 = v6:GetFriendCountAsync(v8.UserId);
            local l_v6_FriendCountAsync_1 = v6:GetFriendCountAsync(l_LocalPlayer_0.UserId);
            if l_v6_FriendCountAsync_1 and l_v6_FriendCountAsync_0 then
                if l_v6_FriendCountAsync_1 < 200 and l_v6_FriendCountAsync_0 < 200 then
                    l_RbxAnalyticsService_0:ReportCounter("PlayerDropDown-RequestFriendship");
                    l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "PlayerDropDown");
                    if v8.Parent == l_Players_0 then
                        l_LocalPlayer_0:RequestFriendship(v8);
                        return ;
                    end;
                elseif l_v6_FriendCountAsync_1 >= 200 then
                    l_SendNotificationInfo_0:Fire({
                        Title = not v9 and "Cannot send friend request" or "Cannot accept friend request", 
                        Text = "You are at the max friends limit.", 
                        Duration = 5
                    });
                    return ;
                elseif l_v6_FriendCountAsync_0 >= 200 then
                    l_SendNotificationInfo_0:Fire({
                        Title = not v9 and "Cannot send friend request" or "Cannot accept friend request", 
                        Text = v5:FormatByKey("PlayerDropDown.OtherPlayerFriendLimit", {
                            RBX_NAME = v8.Name
                        }), 
                        Duration = 5
                    });
                end;
                return ;
            else
                return ;
            end;
        end)();
    end;
end;
