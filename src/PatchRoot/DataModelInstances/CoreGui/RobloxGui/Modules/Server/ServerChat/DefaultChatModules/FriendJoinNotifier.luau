local l_Chat_0 = game:GetService("Chat");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("FriendService");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local _ = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local v6 = false;
local l_status_0, l_result_0 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserHandleFriendJoinNotifierOnClient");
end);
if l_status_0 then
    v6 = l_result_0;
end;
l_status_0 = nil;
pcall(function()
    l_status_0 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if l_status_0 == nil then
    l_status_0 = {};
end;
if not (l_status_0.FormatMessageToSend and l_status_0.LocalizeFormattedMessage) then
    l_status_0.FormatMessageToSend = function(_, _, v11)
        return v11;
    end;
end;
local v12 = {
    ChatColor = Color3.fromRGB(255, 255, 255)
};
return function(v13)
    local function _()
        if v6 == false and l_ChatSettings_0.ShowFriendJoinNotification ~= nil then
            return l_ChatSettings_0.ShowFriendJoinNotification;
        else
            return false;
        end;
    end;
    local function v19(v15, v16)
        local l_v13_Speaker_0 = v13:GetSpeaker(v15.Name);
        if l_v13_Speaker_0 then
            local l_Name_0 = v16.Name;
            if l_ChatSettings_0.PlayerDisplayNamesEnabled then
                l_Name_0 = v16.DisplayName;
            end;
            l_v13_Speaker_0:SendSystemMessage(l_status_0:FormatMessageToSend("GameChat_FriendChatNotifier_JoinMessage", string.format("Your friend %s has joined the game.", l_Name_0), "RBX_NAME", l_Name_0), "System", v12);
        end;
    end;
    local function _(v20, v21)
        if v20 ~= v21 then
            coroutine.wrap(function()
                if v20:IsFriendsWith(v21.UserId) then
                    v19(v20, v21);
                end;
            end)();
        end;
    end;
    if v6 == false and if l_ChatSettings_0.ShowFriendJoinNotification ~= nil then l_ChatSettings_0.ShowFriendJoinNotification else false then
        l_Players_0.PlayerAdded:connect(function(v23)
            local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
            for v25 = 1, #l_l_Players_0_Players_0 do
                local v26 = l_l_Players_0_Players_0[v25];
                if v26 ~= v23 then
                    coroutine.wrap(function()
                        if v26:IsFriendsWith(v23.UserId) then
                            v19(v26, v23);
                        end;
                    end)();
                end;
            end;
        end);
    end;
end;
