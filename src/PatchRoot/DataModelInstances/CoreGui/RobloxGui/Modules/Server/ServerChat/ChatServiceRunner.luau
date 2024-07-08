local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_script_0 = script;
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Chat_0 = game:GetService("Chat");
local l_ChatService_0 = require(l_script_0:WaitForChild("ChatService"));
local l_ChatSettings_0 = require(l_Chat_0:WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"));
local v7 = nil;
pcall(function()
    v7 = require(l_Chat_0.ClientChatModules.ChatLocalization);
end);
v7 = v7 or {};
local v8 = l_ChatSettings_0.MaxChannelNameCheckLength or 50;
local l_MaximumMessageLength_0 = l_ChatSettings_0.MaximumMessageLength;
if not (v7.FormatMessageToSend and v7.LocalizeFormattedMessage) then
    v7.FormatMessageToSend = function(_, _, v12)
        return v12;
    end;
end;
local v13 = {};
local l_DefaultChatSystemChatEvents_0 = l_ReplicatedStorage_0:FindFirstChild("DefaultChatSystemChatEvents");
if not l_DefaultChatSystemChatEvents_0 then
    l_DefaultChatSystemChatEvents_0 = Instance.new("Folder");
    l_DefaultChatSystemChatEvents_0.Name = "DefaultChatSystemChatEvents";
    l_DefaultChatSystemChatEvents_0.Archivable = false;
    l_DefaultChatSystemChatEvents_0.Parent = l_ReplicatedStorage_0;
end;
local function v16(v15)
    if l_MaximumMessageLength_0 * 6 < v15:len() then
        return false;
    elseif utf8.len(v15) == nil then
        return false;
    elseif l_MaximumMessageLength_0 < utf8.len(utf8.nfcnormalize(v15)) then
        return false;
    else
        return true;
    end;
end;
local function v18(v17)
    if v8 * 6 < v17:len() then
        return false;
    elseif utf8.len(v17) == nil then
        return false;
    elseif v8 < utf8.len(utf8.nfcnormalize(v17)) then
        return false;
    else
        return true;
    end;
end;
local function v19()
end;
local function v25(v20, v21, v22)
    for _, v24 in pairs(v20:GetChildren()) do
        if v24:IsA(v22) and v24.Name == v21 then
            return v24;
        end;
    end;
    return nil;
end;
local function _(v26, v27, v28)
    local v29 = v25(v26, v27, v28);
    if not v29 then
        v29 = Instance.new(v28);
        v29.Name = v27;
        v29.Parent = v26;
    end;
    v13[v27] = v29;
    return v29;
end;
local function _(v31, v32)
    local v33 = v25(v31, v32, "RemoteEvent");
    if not v33 then
        v33 = Instance.new("RemoteEvent");
        v33.Name = v32;
        v33.Parent = v31;
    end;
    v13[v32] = v33;
    local l_v33_0 = v33;
    l_v33_0.OnServerEvent:Connect(v19);
    return l_v33_0;
end;
local l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
local v37 = v25(l_l_DefaultChatSystemChatEvents_0_0, "OnNewMessage", "RemoteEvent");
if not v37 then
    v37 = Instance.new("RemoteEvent");
    v37.Name = "OnNewMessage";
    v37.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v13.OnNewMessage = v37;
v37.OnServerEvent:Connect(v19);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v37 = v25(l_l_DefaultChatSystemChatEvents_0_0, "OnMessageDoneFiltering", "RemoteEvent");
if not v37 then
    v37 = Instance.new("RemoteEvent");
    v37.Name = "OnMessageDoneFiltering";
    v37.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v13.OnMessageDoneFiltering = v37;
v37.OnServerEvent:Connect(v19);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v37 = v25(l_l_DefaultChatSystemChatEvents_0_0, "OnNewSystemMessage", "RemoteEvent");
if not v37 then
    v37 = Instance.new("RemoteEvent");
    v37.Name = "OnNewSystemMessage";
    v37.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v13.OnNewSystemMessage = v37;
v37.OnServerEvent:Connect(v19);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v37 = v25(l_l_DefaultChatSystemChatEvents_0_0, "OnChannelJoined", "RemoteEvent");
if not v37 then
    v37 = Instance.new("RemoteEvent");
    v37.Name = "OnChannelJoined";
    v37.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v13.OnChannelJoined = v37;
v37.OnServerEvent:Connect(v19);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v37 = v25(l_l_DefaultChatSystemChatEvents_0_0, "OnChannelLeft", "RemoteEvent");
if not v37 then
    v37 = Instance.new("RemoteEvent");
    v37.Name = "OnChannelLeft";
    v37.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v13.OnChannelLeft = v37;
v37.OnServerEvent:Connect(v19);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v37 = v25(l_l_DefaultChatSystemChatEvents_0_0, "OnMuted", "RemoteEvent");
if not v37 then
    v37 = Instance.new("RemoteEvent");
    v37.Name = "OnMuted";
    v37.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v13.OnMuted = v37;
v37.OnServerEvent:Connect(v19);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v37 = v25(l_l_DefaultChatSystemChatEvents_0_0, "OnUnmuted", "RemoteEvent");
if not v37 then
    v37 = Instance.new("RemoteEvent");
    v37.Name = "OnUnmuted";
    v37.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v13.OnUnmuted = v37;
v37.OnServerEvent:Connect(v19);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v37 = v25(l_l_DefaultChatSystemChatEvents_0_0, "OnMainChannelSet", "RemoteEvent");
if not v37 then
    v37 = Instance.new("RemoteEvent");
    v37.Name = "OnMainChannelSet";
    v37.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v13.OnMainChannelSet = v37;
v37.OnServerEvent:Connect(v19);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v37 = v25(l_l_DefaultChatSystemChatEvents_0_0, "ChannelNameColorUpdated", "RemoteEvent");
if not v37 then
    v37 = Instance.new("RemoteEvent");
    v37.Name = "ChannelNameColorUpdated";
    v37.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v13.ChannelNameColorUpdated = v37;
v37.OnServerEvent:Connect(v19);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v37 = v25(l_l_DefaultChatSystemChatEvents_0_0, "SayMessageRequest", "RemoteEvent");
if not v37 then
    v37 = Instance.new("RemoteEvent");
    v37.Name = "SayMessageRequest";
    v37.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v13.SayMessageRequest = v37;
v37.OnServerEvent:Connect(v19);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v37 = v25(l_l_DefaultChatSystemChatEvents_0_0, "SetBlockedUserIdsRequest", "RemoteEvent");
if not v37 then
    v37 = Instance.new("RemoteEvent");
    v37.Name = "SetBlockedUserIdsRequest";
    v37.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v13.SetBlockedUserIdsRequest = v37;
v37.OnServerEvent:Connect(v19);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
local v38 = v25(l_l_DefaultChatSystemChatEvents_0_0, "GetInitDataRequest", "RemoteFunction");
if not v38 then
    v38 = Instance.new("RemoteFunction");
    v38.Name = "GetInitDataRequest";
    v38.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v13.GetInitDataRequest = v38;
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v38 = v25(l_l_DefaultChatSystemChatEvents_0_0, "MutePlayerRequest", "RemoteFunction");
if not v38 then
    v38 = Instance.new("RemoteFunction");
    v38.Name = "MutePlayerRequest";
    v38.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v13.MutePlayerRequest = v38;
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v38 = v25(l_l_DefaultChatSystemChatEvents_0_0, "UnMutePlayerRequest", "RemoteFunction");
if not v38 then
    v38 = Instance.new("RemoteFunction");
    v38.Name = "UnMutePlayerRequest";
    v38.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v13.UnMutePlayerRequest = v38;
l_DefaultChatSystemChatEvents_0 = v13;
l_l_DefaultChatSystemChatEvents_0_0 = function(v39)
    if l_ChatService_0:GetSpeaker(v39.Name) then
        l_ChatService_0:RemoveSpeaker(v39.Name);
    end;
    local v40 = l_ChatService_0:InternalAddSpeakerWithPlayerObject(v39.Name, v39, false);
    for _, v42 in pairs(l_ChatService_0:GetAutoJoinChannelList()) do
        v40:JoinChannel(v42.Name);
    end;
    v40:InternalAssignEventFolder(l_DefaultChatSystemChatEvents_0);
    v40.ChannelJoined:connect(function(v43, v44)
        local v45 = nil;
        local v46 = nil;
        local l_l_ChatService_0_Channel_0 = l_ChatService_0:GetChannel(v43);
        if l_l_ChatService_0_Channel_0 then
            v45 = l_l_ChatService_0_Channel_0:GetHistoryLogForSpeaker(v40);
            v46 = l_l_ChatService_0_Channel_0.ChannelNameColor;
        end;
        l_DefaultChatSystemChatEvents_0.OnChannelJoined:FireClient(v39, v43, v44, v45, v46);
    end);
    v40.Muted:connect(function(v48, v49, v50)
        l_DefaultChatSystemChatEvents_0.OnMuted:FireClient(v39, v48, v49, v50);
    end);
    v40.Unmuted:connect(function(v51)
        l_DefaultChatSystemChatEvents_0.OnUnmuted:FireClient(v39, v51);
    end);
    l_ChatService_0:InternalFireSpeakerAdded(v40.Name);
end;
l_DefaultChatSystemChatEvents_0.SayMessageRequest.OnServerEvent:connect(function(v52, v53, v54)
    if type(v53) ~= "string" then
        return ;
    elseif v16(v53) then
        if type(v54) ~= "string" then
            return ;
        elseif v18(v54) then
            local l_l_ChatService_0_Speaker_0 = l_ChatService_0:GetSpeaker(v52.Name);
            if not l_l_ChatService_0_Speaker_0 then
                return nil;
            else
                return l_l_ChatService_0_Speaker_0:SayMessage(v53, v54);
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end);
l_DefaultChatSystemChatEvents_0.MutePlayerRequest.OnServerInvoke = function(v56, v57)
    if type(v57) ~= "string" then
        return ;
    else
        local l_l_ChatService_0_Speaker_1 = l_ChatService_0:GetSpeaker(v56.Name);
        if l_l_ChatService_0_Speaker_1 then
            local l_l_ChatService_0_Speaker_2 = l_ChatService_0:GetSpeaker(v57);
            if l_l_ChatService_0_Speaker_2 then
                l_l_ChatService_0_Speaker_1:AddMutedSpeaker(l_l_ChatService_0_Speaker_2.Name);
                return true;
            end;
        end;
        return false;
    end;
end;
l_DefaultChatSystemChatEvents_0.UnMutePlayerRequest.OnServerInvoke = function(v60, v61)
    if type(v61) ~= "string" then
        return ;
    else
        local l_l_ChatService_0_Speaker_3 = l_ChatService_0:GetSpeaker(v60.Name);
        if l_l_ChatService_0_Speaker_3 then
            local l_l_ChatService_0_Speaker_4 = l_ChatService_0:GetSpeaker(v61);
            if l_l_ChatService_0_Speaker_4 then
                l_l_ChatService_0_Speaker_3:RemoveMutedSpeaker(l_l_ChatService_0_Speaker_4.Name);
                return true;
            end;
        end;
        return false;
    end;
end;
v38 = {};
l_Players_0.PlayerAdded:connect(function(v64)
    for v65, v66 in pairs(v38) do
        local l_l_ChatService_0_Speaker_5 = l_ChatService_0:GetSpeaker(v65.Name);
        if l_l_ChatService_0_Speaker_5 then
            for v68 = 1, #v66 do
                if v66[v68] == v64.UserId then
                    l_l_ChatService_0_Speaker_5:AddMutedSpeaker(v64.Name);
                end;
            end;
        end;
    end;
end);
l_Players_0.PlayerRemoving:connect(function(v69)
    v38[v69] = nil;
end);
l_DefaultChatSystemChatEvents_0.SetBlockedUserIdsRequest.OnServerEvent:Connect(function(v70, v71)
    if type(v71) ~= "table" then
        return ;
    else
        local v72 = {};
        local l_l_ChatService_0_Speaker_6 = l_ChatService_0:GetSpeaker(v70.Name);
        if l_l_ChatService_0_Speaker_6 then
            for v74 = 1, math.min(#v71, 50) do
                if type(v71[v74]) == "number" then
                    table.insert(v72, v71[v74]);
                    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v71[v74]);
                    if l_l_Players_0_PlayerByUserId_0 then
                        l_l_ChatService_0_Speaker_6:AddMutedSpeaker(l_l_Players_0_PlayerByUserId_0.Name);
                    end;
                end;
            end;
            v38[v70] = v72;
        end;
        return ;
    end;
end);
l_DefaultChatSystemChatEvents_0.GetInitDataRequest.OnServerInvoke = function(v76)
    local l_l_ChatService_0_Speaker_7 = l_ChatService_0:GetSpeaker(v76.Name);
    if not (l_l_ChatService_0_Speaker_7 and l_l_ChatService_0_Speaker_7:GetPlayer()) then
        l_l_DefaultChatSystemChatEvents_0_0(v76);
        l_l_ChatService_0_Speaker_7 = l_ChatService_0:GetSpeaker(v76.Name);
    end;
    local v78 = {
        Channels = {}, 
        SpeakerExtraData = {}
    };
    for _, v80 in pairs(l_l_ChatService_0_Speaker_7:GetChannelList()) do
        local l_l_ChatService_0_Channel_1 = l_ChatService_0:GetChannel(v80);
        if l_l_ChatService_0_Channel_1 then
            table.insert(v78.Channels, {
                v80, 
                l_l_ChatService_0_Channel_1:GetWelcomeMessageForSpeaker(l_l_ChatService_0_Speaker_7), 
                l_l_ChatService_0_Channel_1:GetHistoryLogForSpeaker(l_l_ChatService_0_Speaker_7), 
                l_l_ChatService_0_Channel_1.ChannelNameColor
            });
        end;
    end;
    for _, v83 in pairs(l_ChatService_0:GetSpeakerList()) do
        v78.SpeakerExtraData[v83] = l_ChatService_0:GetSpeaker(v83).ExtraData;
    end;
    return v78;
end;
v37 = function(v84, v85, v86)
    local l_l_ChatService_0_Speaker_8 = l_ChatService_0:GetSpeaker(v84);
    local l_l_ChatService_0_Channel_2 = l_ChatService_0:GetChannel(v85);
    if l_l_ChatService_0_Speaker_8 then
        if not l_l_ChatService_0_Channel_2 then
            l_l_ChatService_0_Speaker_8:SendSystemMessage(v7:FormatMessageToSend("GameChat_ChatServiceRunner_ChannelDoesNotExist", "Channel '" .. v85 .. "' does not exist.", "RBX_NAME", v85), v86);
        elseif not l_l_ChatService_0_Channel_2.Joinable then
            l_l_ChatService_0_Speaker_8:SendSystemMessage(v7:FormatMessageToSend("GameChat_ChatServiceRunner_YouCannotJoinChannel", "You cannot join channel '" .. v85 .. "'.", "RBX_NAME", v85), v86);
            return ;
        elseif l_l_ChatService_0_Speaker_8:IsInChannel(l_l_ChatService_0_Channel_2.Name) then
            l_l_ChatService_0_Speaker_8:SetMainChannel(l_l_ChatService_0_Channel_2.Name);
            l_l_ChatService_0_Speaker_8:SendSystemMessage(v7:FormatMessageToSend("GameChat_SwitchChannel_NowInChannel", string.format("You are now chatting in channel: '%s'", l_l_ChatService_0_Channel_2.Name), "RBX_NAME", l_l_ChatService_0_Channel_2.Name), l_l_ChatService_0_Channel_2.Name);
            return ;
        else
            l_l_ChatService_0_Speaker_8:JoinChannel(l_l_ChatService_0_Channel_2.Name);
            return ;
        end;
    end;
end;
local function v94(v89, v90, v91)
    local l_l_ChatService_0_Speaker_9 = l_ChatService_0:GetSpeaker(v89);
    local l_l_ChatService_0_Channel_3 = l_ChatService_0:GetChannel(v90);
    if l_l_ChatService_0_Speaker_9 then
        if not l_l_ChatService_0_Speaker_9:IsInChannel(v90) then
            l_l_ChatService_0_Speaker_9:SendSystemMessage(v7:FormatMessageToSend("GameChat_ChatServiceRunner_YouAreNotInChannel", "You are not in channel '" .. v90 .. "'.", "RBX_NAME", v90), v91);
        elseif not l_l_ChatService_0_Channel_3.Leavable then
            l_l_ChatService_0_Speaker_9:SendSystemMessage(v7:FormatMessageToSend("GameChat_ChatServiceRunner_YouCannotLeaveChannel", "You cannot leave channel '" .. v90 .. "'.", "RBX_NAME", v90), v91);
            return ;
        else
            l_l_ChatService_0_Speaker_9:LeaveChannel(l_l_ChatService_0_Channel_3.Name);
            l_l_ChatService_0_Speaker_9:SendSystemMessage(v7:FormatMessageToSend("GameChat_ChatService_YouHaveLeftChannel", string.format("You have left channel '%s'", v90), "RBX_NAME", l_l_ChatService_0_Channel_3.Name), "System");
            return ;
        end;
    end;
end;
l_ChatService_0:RegisterProcessCommandsFunction("default_commands", function(v95, v96, v97)
    if string.sub(v96, 1, 6):lower() == "/join " then
        v37(v95, string.sub(v96, 7), v97);
        return true;
    elseif string.sub(v96, 1, 3):lower() == "/j " then
        v37(v95, string.sub(v96, 4), v97);
        return true;
    elseif string.sub(v96, 1, 7):lower() == "/leave " then
        v94(v95, string.sub(v96, 8), v97);
        return true;
    elseif string.sub(v96, 1, 3):lower() == "/l " then
        v94(v95, string.sub(v96, 4), v97);
        return true;
    else
        return false;
    end;
end);
if l_ChatSettings_0.GeneralChannelName and l_ChatSettings_0.GeneralChannelName ~= "" then
    local v98 = l_ChatService_0:AddChannel(l_ChatSettings_0.GeneralChannelName);
    v98.Leavable = false;
    v98.AutoJoin = true;
    v98:RegisterGetWelcomeMessageFunction(function(v99)
        if not l_RunService_0:IsStudio() then
            local l_v99_Player_0 = v99:GetPlayer();
            if l_v99_Player_0 then
                local l_status_0, l_result_0 = pcall(function()
                    return l_Chat_0:CanUserChatAsync(l_v99_Player_0.UserId);
                end);
                if not (not l_status_0 or l_result_0) then
                    return "";
                end;
            end;
            return ;
        else
            return nil;
        end;
    end);
end;
local v103 = l_ChatService_0:AddChannel("System");
v103.Leavable = false;
v103.AutoJoin = true;
v103.WelcomeMessage = v7:FormatMessageToSend("GameChat_ChatServiceRunner_SystemChannelWelcomeMessage", "This channel is for system and game notifications.");
v103.SpeakerJoined:connect(function(v104)
    v103:MuteSpeaker(v104);
end);
local function v107(v105)
    if v105:IsA("ModuleScript") then
        local v106 = require(v105);
        if type(v106) == "function" then
            v106(l_ChatService_0);
        end;
    end;
end;
local l_ChatModules_0 = l_Chat_0:WaitForChild("ChatModules");
l_ChatModules_0.ChildAdded:connect(function(v109)
    local l_status_1, l_result_1 = pcall(v107, v109);
    if not (l_status_1 or not l_result_1) then
        print("Error running module " .. v109.Name .. ": " .. l_result_1);
    end;
end);
for _, v113 in pairs(l_ChatModules_0:GetChildren()) do
    local l_status_2, l_result_2 = pcall(v107, v113);
    if not (l_status_2 or not l_result_2) then
        print("Error running module " .. v113.Name .. ": " .. l_result_2);
    end;
end;
l_Players_0.PlayerRemoving:connect(function(v116)
    if l_ChatService_0:GetSpeaker(v116.Name) then
        l_ChatService_0:RemoveSpeaker(v116.Name);
    end;
end);
