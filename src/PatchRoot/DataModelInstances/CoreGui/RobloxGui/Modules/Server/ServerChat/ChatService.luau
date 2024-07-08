local v0 = {
    0.05, 
    0.1, 
    0.2
};
local v1 = {};
local l_RunService_0 = game:GetService("RunService");
local l_Chat_0 = game:GetService("Chat");
local _ = l_Chat_0:WaitForChild("ClientChatModules");
local l_Parent_0 = script.Parent;
local l_ClientChatModules_1 = l_Chat_0:WaitForChild("ClientChatModules");
local v7 = {
    ChatColor = require(l_ClientChatModules_1:WaitForChild("ChatSettings")).ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
};
local l_ChatConstants_0 = require(l_ClientChatModules_1:WaitForChild("ChatConstants"));
local l_ChatChannel_0 = require(l_Parent_0:WaitForChild("ChatChannel"));
local l_Speaker_0 = require(l_Parent_0:WaitForChild("Speaker"));
local l_Util_0 = require(l_Parent_0:WaitForChild("Util"));
local v12 = nil;
pcall(function()
    v12 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
v12 = v12 or {};
if not (v12.FormatMessageToSend and v12.LocalizeFormattedMessage) then
    v12.FormatMessageToSend = function(_, _, v15)
        return v15;
    end;
end;
local function _(v16)
    return string.len((string.gsub(v16, " ", ""))) == 0;
end;
local v18 = {};
v18.__index = v18;
v18.AddChannel = function(v19, v20, v21)
    if v19.ChatChannels[v20:lower()] then
        error(string.format("Channel %q alrady exists.", v20));
    end;
    local function v26(v22, v23)
        if v23:lower() == "/leave" then
            local l_v19_Channel_0 = v19:GetChannel(v20);
            local l_v19_Speaker_0 = v19:GetSpeaker(v22);
            if not (not l_v19_Channel_0 or not l_v19_Speaker_0) then
                if not l_v19_Channel_0.Leavable then
                    l_v19_Speaker_0:SendSystemMessage(v12:FormatMessageToSend("GameChat_ChatService_CannotLeaveChannel", "You cannot leave this channel."), v20);
                else
                    l_v19_Speaker_0:LeaveChannel(v20);
                    l_v19_Speaker_0:SendSystemMessage(v12:FormatMessageToSend("GameChat_ChatService_YouHaveLeftChannel", string.format("You have left channel '%s'", v20), "RBX_NAME", v20), "System");
                end;
            end;
            return true;
        else
            return false;
        end;
    end;
    local v27 = l_ChatChannel_0.new(v19, v20);
    v19.ChatChannels[v20:lower()] = v27;
    v27:RegisterProcessCommandsFunction("default_commands", v26, l_ChatConstants_0.HighPriority);
    local l_status_0, l_result_0 = pcall(function()
        v19.eChannelAdded:Fire(v20);
    end);
    if not (l_status_0 or not l_result_0) then
        print("Error addding channel: " .. l_result_0);
    end;
    if v21 ~= nil then
        v27.AutoJoin = v21;
        if v21 then
            for _, v31 in pairs(v19.Speakers) do
                v31:JoinChannel(v20);
            end;
        end;
    end;
    return v27;
end;
v18.RemoveChannel = function(v32, v33)
    if not v32.ChatChannels[v33:lower()] then
        warn(string.format("Channel %q does not exist.", v33));
    else
        local l_Name_0 = v32.ChatChannels[v33:lower()].Name;
        v32.ChatChannels[v33:lower()]:InternalDestroy();
        v32.ChatChannels[v33:lower()] = nil;
        local l_status_1, l_result_1 = pcall(function()
            v32.eChannelRemoved:Fire(l_Name_0);
        end);
        if not (l_status_1 or not l_result_1) then
            print("Error removing channel: " .. l_result_1);
            return ;
        end;
    end;
end;
v18.GetChannel = function(v37, v38)
    return v37.ChatChannels[v38:lower()];
end;
v18.AddSpeaker = function(v39, v40)
    if v39.Speakers[v40:lower()] then
        error("Speaker \"" .. v40 .. "\" already exists");
    end;
    local v41 = l_Speaker_0.new(v39, v40);
    v39.Speakers[v40:lower()] = v41;
    local l_status_2, l_result_2 = pcall(function()
        v39.eSpeakerAdded:Fire(v40);
    end);
    if not (l_status_2 or not l_result_2) then
        print("Error adding speaker: " .. l_result_2);
    end;
    return v41;
end;
v18.InternalUnmuteSpeaker = function(v44, v45)
    for _, v47 in pairs(v44.ChatChannels) do
        if v47:IsSpeakerMuted(v45) then
            v47:UnmuteSpeaker(v45);
        end;
    end;
end;
v18.RemoveSpeaker = function(v48, v49)
    if not v48.Speakers[v49:lower()] then
        warn("Speaker \"" .. v49 .. "\" does not exist");
    else
        local l_Name_1 = v48.Speakers[v49:lower()].Name;
        v48:InternalUnmuteSpeaker(l_Name_1);
        v48.Speakers[v49:lower()]:InternalDestroy();
        v48.Speakers[v49:lower()] = nil;
        local l_status_3, l_result_3 = pcall(function()
            v48.eSpeakerRemoved:Fire(l_Name_1);
        end);
        if not (l_status_3 or not l_result_3) then
            print("Error removing speaker: " .. l_result_3);
            return ;
        end;
    end;
end;
v18.GetSpeaker = function(v53, v54)
    return v53.Speakers[v54:lower()];
end;
v18.GetSpeakerByUserOrDisplayName = function(v55, v56)
    local v57 = v55.Speakers[v56:lower()];
    if not v57 then
        for _, v59 in pairs(v55.Speakers) do
            local l_v59_Player_0 = v59:GetPlayer();
            if l_v59_Player_0 and l_v59_Player_0.DisplayName:lower() == v56:lower() then
                return v59;
            end;
        end;
        return ;
    else
        return v57;
    end;
end;
v18.GetChannelList = function(v61)
    local v62 = {};
    for _, v64 in pairs(v61.ChatChannels) do
        if not v64.Private then
            table.insert(v62, v64.Name);
        end;
    end;
    return v62;
end;
v18.GetAutoJoinChannelList = function(v65)
    local v66 = {};
    for _, v68 in pairs(v65.ChatChannels) do
        if v68.AutoJoin then
            table.insert(v66, v68);
        end;
    end;
    return v66;
end;
v18.GetSpeakerList = function(v69)
    local v70 = {};
    for _, v72 in pairs(v69.Speakers) do
        table.insert(v70, v72.Name);
    end;
    return v70;
end;
v18.SendGlobalSystemMessage = function(v73, v74)
    for _, v76 in pairs(v73.Speakers) do
        v76:SendSystemMessage(v74, nil);
    end;
end;
v18.RegisterFilterMessageFunction = function(v77, v78, v79, v80)
    if v77.FilterMessageFunctions:HasFunction(v78) then
        error(string.format("FilterMessageFunction '%s' already exists", v78));
    end;
    v77.FilterMessageFunctions:AddFunction(v78, v79, v80);
end;
v18.FilterMessageFunctionExists = function(v81, v82)
    return v81.FilterMessageFunctions:HasFunction(v82);
end;
v18.UnregisterFilterMessageFunction = function(v83, v84)
    if not v83.FilterMessageFunctions:HasFunction(v84) then
        error(string.format("FilterMessageFunction '%s' does not exists", v84));
    end;
    v83.FilterMessageFunctions:RemoveFunction(v84);
end;
v18.RegisterProcessCommandsFunction = function(v85, v86, v87, v88)
    if v85.ProcessCommandsFunctions:HasFunction(v86) then
        error(string.format("ProcessCommandsFunction '%s' already exists", v86));
    end;
    v85.ProcessCommandsFunctions:AddFunction(v86, v87, v88);
end;
v18.ProcessCommandsFunctionExists = function(v89, v90)
    return v89.ProcessCommandsFunctions:HasFunction(v90);
end;
v18.UnregisterProcessCommandsFunction = function(v91, v92)
    if not v91.ProcessCommandsFunctions:HasFunction(v92) then
        error(string.format("ProcessCommandsFunction '%s' does not exist", v92));
    end;
    v91.ProcessCommandsFunctions:RemoveFunction(v92);
end;
local v93 = 0;
local v94 = 0;
local v95 = 0;
v18.InternalNotifyFilterIssue = function(v96)
    if tick() - v94 > 60 then
        v95 = 0;
    end;
    v95 = v95 + 1;
    v94 = tick();
    if v95 >= 3 and tick() - v93 > 60 then
        v93 = tick();
        local l_v96_Channel_0 = v96:GetChannel("System");
        if l_v96_Channel_0 then
            l_v96_Channel_0:SendSystemMessage(v12:FormatMessageToSend("GameChat_ChatService_ChatFilterIssues", "The chat filter is currently experiencing issues and messages may be slow to appear."), v7);
        end;
    end;
end;
local v98 = {};
v18.InternalApplyRobloxFilter = function(v99, v100, v101, v102)
    if not l_RunService_0:IsServer() or l_RunService_0:IsStudio() then
        if not v98[v101] then
            v98[v101] = true;
            wait();
        end;
        return v101;
    else
        local l_v99_Speaker_0 = v99:GetSpeaker(v100);
        local v104 = v102 and v99:GetSpeaker(v102);
        if l_v99_Speaker_0 == nil then
            return nil;
        else
            local l_l_v99_Speaker_0_Player_0 = l_v99_Speaker_0:GetPlayer();
            local v106 = v104 and v104:GetPlayer();
            if l_l_v99_Speaker_0_Player_0 == nil then
                return v101;
            elseif not (string.len((string.gsub(v101, " ", ""))) == 0) then
                local v107 = tick();
                local v108 = 0;
                while true do
                    local l_status_4, l_result_4 = pcall(function()
                        if not v106 then
                            return l_Chat_0:FilterStringForBroadcast(v101, l_l_v99_Speaker_0_Player_0);
                        else
                            return l_Chat_0:FilterStringAsync(v101, l_l_v99_Speaker_0_Player_0, v106);
                        end;
                    end);
                    if not l_status_4 then
                        warn("Error filtering message:", l_result_4);
                        v108 = v108 + 1;
                        if not (v108 <= 3) or tick() - v107 > 60 then
                            v99:InternalNotifyFilterIssue();
                            return nil;
                        else
                            local v111 = v0[math.min(#v0, v108)];
                            wait(v111 + (math.random() * 2 - 1) * v111);
                        end;
                    else
                        return l_result_4;
                    end;
                end;
            else
                return v101;
            end;
        end;
    end;
end;
v18.InternalApplyRobloxFilterAndTranslate = function(v112, v113, v114, v115, v116)
    if not (l_RunService_0:IsServer() and not l_RunService_0:IsStudio()) then
        wait();
        return true, false, v115;
    else
        local l_v112_Speaker_0 = v112:GetSpeaker(v113);
        if l_v112_Speaker_0 == nil then
            return false, nil, nil;
        else
            local l_l_v112_Speaker_0_Player_0 = l_v112_Speaker_0:GetPlayer();
            if l_l_v112_Speaker_0_Player_0 == nil then
                return true, false, v115;
            elseif not (string.len((string.gsub(v115, " ", ""))) == 0) then
                local l_status_5, l_result_5 = pcall(function()
                    return (game:GetService("TextService"):FilterAndTranslateStringAsync(v115, l_l_v112_Speaker_0_Player_0.UserId, v114, v116));
                end);
                if not l_status_5 then
                    warn("Error filtering and translating message", v115, l_result_5);
                    v112:InternalNotifyFilterIssue();
                    return false, nil, nil;
                else
                    return true, true, l_result_5;
                end;
            else
                return true, false, v115;
            end;
        end;
    end;
end;
v18.InternalApplyRobloxFilterNewAPI = function(v121, v122, v123, v124)
    if not (l_RunService_0:IsServer() and not l_RunService_0:IsStudio()) then
        wait();
        return true, false, v123;
    else
        local l_v121_Speaker_0 = v121:GetSpeaker(v122);
        if l_v121_Speaker_0 == nil then
            return false, nil, nil;
        else
            local l_l_v121_Speaker_0_Player_0 = l_v121_Speaker_0:GetPlayer();
            if l_l_v121_Speaker_0_Player_0 == nil then
                return true, false, v123;
            elseif not (string.len((string.gsub(v123, " ", ""))) == 0) then
                local l_status_6, l_result_6 = pcall(function()
                    return (game:GetService("TextService"):FilterStringAsync(v123, l_l_v121_Speaker_0_Player_0.UserId, v124));
                end);
                if not l_status_6 then
                    warn("Error filtering message:", v123, l_result_6);
                    v121:InternalNotifyFilterIssue();
                    return false, nil, nil;
                else
                    return true, true, l_result_6;
                end;
            else
                return true, false, v123;
            end;
        end;
    end;
end;
v18.InternalDoMessageFilter = function(v129, v130, v131, v132)
    for v133, v134, _ in (v129.FilterMessageFunctions:GetIterator()), nil, nil do
        local l_status_7, l_result_7 = pcall(function()
            v134(v130, v131, v132);
        end);
        if not l_status_7 then
            warn(string.format("DoMessageFilter Function '%s' failed for reason: %s", v133, l_result_7));
        end;
    end;
end;
v18.InternalDoProcessCommands = function(v138, v139, v140, v141)
    for v142, v143, _ in (v138.ProcessCommandsFunctions:GetIterator()), nil, nil do
        local l_status_8, l_result_8 = pcall(function()
            local v145 = v143(v139, v140, v141);
            if type(v145) ~= "boolean" then
                error("Process command functions must return a bool");
            end;
            return v145;
        end);
        if l_status_8 then
            if l_result_8 then
                return true;
            end;
        else
            warn(string.format("DoProcessCommands Function '%s' failed for reason: %s", v142, l_result_8));
        end;
    end;
    return false;
end;
v18.InternalGetUniqueMessageId = function(v148)
    local l_MessageIdCounter_0 = v148.MessageIdCounter;
    v148.MessageIdCounter = l_MessageIdCounter_0 + 1;
    return l_MessageIdCounter_0;
end;
v18.InternalAddSpeakerWithPlayerObject = function(v150, v151, v152, v153)
    if v150.Speakers[v151:lower()] then
        error("Speaker \"" .. v151 .. "\" already exists");
    end;
    local v154 = l_Speaker_0.new(v150, v151);
    v154:InternalAssignPlayerObject(v152);
    v150.Speakers[v151:lower()] = v154;
    if v153 then
        local l_status_9, l_result_9 = pcall(function()
            v150.eSpeakerAdded:Fire(v151);
        end);
        if not (l_status_9 or not l_result_9) then
            print("Error adding speaker: " .. l_result_9);
        end;
    end;
    return v154;
end;
v18.InternalFireSpeakerAdded = function(v157, v158)
    local l_status_10, l_result_10 = pcall(function()
        v157.eSpeakerAdded:Fire(v158);
    end);
    if not (l_status_10 or not l_result_10) then
        print("Error firing speaker added: " .. l_result_10);
    end;
end;
v1.new = function()
    local v161 = setmetatable({}, v18);
    v161.MessageIdCounter = 0;
    v161.ChatChannels = {};
    v161.Speakers = {};
    v161.FilterMessageFunctions = l_Util_0:NewSortedFunctionContainer();
    v161.ProcessCommandsFunctions = l_Util_0:NewSortedFunctionContainer();
    v161.eChannelAdded = Instance.new("BindableEvent");
    v161.eChannelRemoved = Instance.new("BindableEvent");
    v161.eSpeakerAdded = Instance.new("BindableEvent");
    v161.eSpeakerRemoved = Instance.new("BindableEvent");
    v161.ChannelAdded = v161.eChannelAdded.Event;
    v161.ChannelRemoved = v161.eChannelRemoved.Event;
    v161.SpeakerAdded = v161.eSpeakerAdded.Event;
    v161.SpeakerRemoved = v161.eSpeakerRemoved.Event;
    v161.ChatServiceMajorVersion = 0;
    v161.ChatServiceMinorVersion = 5;
    return v161;
end;
return v1.new();
