local v0 = false;
local l_status_0, l_result_0 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserShouldMuteUnfilteredMessage");
end);
v0 = l_status_0 and l_result_0;
l_status_0 = nil;
local v3;
l_result_0, v3 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures");
end);
l_status_0 = l_result_0 and v3;
l_result_0 = false;
local v4;
v3, v4 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2");
end);
l_result_0 = v3 and v4;
v3 = {};
v4 = script.Parent;
local l_Chat_0 = game:GetService("Chat");
local l_RunService_0 = game:GetService("RunService");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local l_Util_0 = require(v4:WaitForChild("Util"));
local v11 = nil;
pcall(function()
    v11 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
v11 = v11 or {};
if not (v11.FormatMessageToSend and v11.LocalizeFormattedMessage) then
    v11.FormatMessageToSend = function(_, _, v14)
        return v14;
    end;
end;
local v15 = {};
v15.__index = v15;
v15.SendSystemMessage = function(v16, v17, v18)
    local v19 = v16:InternalCreateMessageObject(v17, nil, true, v18);
    local l_status_1, l_result_1 = pcall(function()
        v16.eMessagePosted:Fire(v19);
    end);
    if not (l_status_1 or not l_result_1) then
        print("Error posting message: " .. l_result_1);
    end;
    v16:InternalAddMessageToHistoryLog(v19);
    for _, v23 in pairs(v16.Speakers) do
        v23:InternalSendSystemMessage(v19, v16.Name);
    end;
    return v19;
end;
v15.SendSystemMessageToSpeaker = function(v24, v25, v26, v27)
    local v28 = v24.Speakers[v26];
    if not v28 then
        if l_RunService_0:IsStudio() then
            warn(string.format("Speaker '%s' is not in channel '%s' and cannot be sent a system message", v26, v24.Name));
        end;
        return ;
    else
        v28:InternalSendSystemMessage(v24:InternalCreateMessageObject(v25, nil, true, v27), v24.Name);
        return ;
    end;
end;
v15.SendMessageObjToFilters = function(v29, v30, v31, v32)
    local l_Message_0 = v31.Message;
    v31.Message = v30;
    v29:InternalDoMessageFilter(v32.Name, v31, v29.Name);
    v29.ChatService:InternalDoMessageFilter(v32.Name, v31, v29.Name);
    local l_Message_1 = v31.Message;
    v31.Message = l_Message_0;
    return l_Message_1;
end;
v15.CanCommunicateByUserId = function(_, v36, v37)
    if not l_RunService_0:IsStudio() then
        if not (v36 ~= 0) or v37 == 0 then
            return true;
        else
            local l_status_2, l_result_2 = pcall(function()
                return l_Chat_0:CanUsersChatAsync(v36, v37);
            end);
            return l_status_2 and l_result_2;
        end;
    else
        return true;
    end;
end;
v15.CanCommunicate = function(v40, v41, v42)
    local l_v41_Player_0 = v41:GetPlayer();
    local l_v42_Player_0 = v42:GetPlayer();
    if not l_v41_Player_0 or not l_v42_Player_0 then
        return true;
    else
        return v40:CanCommunicateByUserId(l_v41_Player_0.UserId, l_v42_Player_0.UserId);
    end;
end;
v15.SendMessageToSpeaker = function(v45, v46, v47, v48, v49)
    local v50 = v45.Speakers[v47];
    local l_Speaker_0 = v45.ChatService:GetSpeaker(v48);
    if not v50 or not l_Speaker_0 then
        if l_RunService_0:IsStudio() then
            warn(string.format("Speaker '%s' is not in channel '%s' and cannot be sent a message", v47, v45.Name));
        end;
    elseif not v50:IsSpeakerMuted(v48) then
        if v45:CanCommunicate(v50, l_Speaker_0) then
            local v52 = v45:InternalCreateMessageObject(v46, v48, v47 == v48, v49);
            v46 = v45:SendMessageObjToFilters(v46, v52, v48);
            v50:InternalSendMessage(v52, v45.Name);
            local v53, v54, v55 = v45.ChatService:InternalApplyRobloxFilterNewAPI(v52.FromSpeaker, v46, not not v45.Private and Enum.TextFilterContext.PrivateChat or Enum.TextFilterContext.PublicChat);
            if v53 then
                v52.FilterResult = v55;
                v52.IsFilterResult = v54;
                v52.IsFiltered = true;
                v50:InternalSendFilteredMessageWithFilterResult(v52, v45.Name);
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v15.KickSpeaker = function(v56, v57, v58)
    local l_Speaker_1 = v56.ChatService:GetSpeaker(v57);
    if not l_Speaker_1 then
        error("Speaker \"" .. v57 .. "\" does not exist");
    end;
    local v60 = "";
    local v61 = "";
    local l_l_Speaker_1_NameForDisplay_0 = l_Speaker_1:GetNameForDisplay();
    if not v58 then
        v60 = string.format("You were kicked from '%s'", v56.Name);
        v61 = string.format("%s was kicked", l_l_Speaker_1_NameForDisplay_0);
    else
        v60 = string.format("You were kicked from '%s' for the following reason(s): %s", v56.Name, v58);
        v61 = string.format("%s was kicked for the following reason(s): %s", l_l_Speaker_1_NameForDisplay_0, v58);
    end;
    v56:SendSystemMessageToSpeaker(v60, v57);
    l_Speaker_1:LeaveChannel(v56.Name);
    v56:SendSystemMessage(v61);
end;
v15.MuteSpeaker = function(v63, v64, v65, v66)
    local l_Speaker_2 = v63.ChatService:GetSpeaker(v64);
    if not l_Speaker_2 then
        error("Speaker \"" .. v64 .. "\" does not exist");
    end;
    v63.Mutes[v64:lower()] = (not (v66 ~= 0) or v66 == nil) and 0 or os.time() + v66;
    if v65 then
        v63:SendSystemMessage(string.format("%s was muted for the following reason(s): %s", l_Speaker_2:GetNameForDisplay(), v65));
    end;
    local l_status_3, l_result_3 = pcall(function()
        v63.eSpeakerMuted:Fire(v64, v65, v66);
    end);
    if not (l_status_3 or not l_result_3) then
        print("Error mutting speaker: " .. l_result_3);
    end;
    local l_Speaker_3 = v63.ChatService:GetSpeaker(v64);
    if l_Speaker_3 then
        local l_status_4, l_result_4 = pcall(function()
            l_Speaker_3.eMuted:Fire(v63.Name, v65, v66);
        end);
        if not (l_status_4 or not l_result_4) then
            print("Error mutting speaker: " .. l_result_4);
        end;
    end;
end;
v15.UnmuteSpeaker = function(v73, v74)
    if not v73.ChatService:GetSpeaker(v74) then
        error("Speaker \"" .. v74 .. "\" does not exist");
    end;
    v73.Mutes[v74:lower()] = nil;
    local l_status_5, l_result_5 = pcall(function()
        v73.eSpeakerUnmuted:Fire(v74);
    end);
    if not (l_status_5 or not l_result_5) then
        print("Error unmuting speaker: " .. l_result_5);
    end;
    local l_Speaker_4 = v73.ChatService:GetSpeaker(v74);
    if l_Speaker_4 then
        local l_status_6, l_result_6 = pcall(function()
            l_Speaker_4.eUnmuted:Fire(v73.Name);
        end);
        if not (l_status_6 or not l_result_6) then
            print("Error unmuting speaker: " .. l_result_6);
        end;
    end;
end;
v15.IsSpeakerMuted = function(v80, v81)
    return v80.Mutes[v81:lower()] ~= nil;
end;
v15.GetSpeakerList = function(v82)
    local v83 = {};
    for _, v85 in pairs(v82.Speakers) do
        table.insert(v83, v85.Name);
    end;
    return v83;
end;
v15.RegisterFilterMessageFunction = function(v86, v87, v88, v89)
    if v86.FilterMessageFunctions:HasFunction(v87) then
        error(string.format("FilterMessageFunction '%s' already exists", v87));
    end;
    v86.FilterMessageFunctions:AddFunction(v87, v88, v89);
end;
v15.FilterMessageFunctionExists = function(v90, v91)
    return v90.FilterMessageFunctions:HasFunction(v91);
end;
v15.UnregisterFilterMessageFunction = function(v92, v93)
    if not v92.FilterMessageFunctions:HasFunction(v93) then
        error(string.format("FilterMessageFunction '%s' does not exists", v93));
    end;
    v92.FilterMessageFunctions:RemoveFunction(v93);
end;
v15.RegisterProcessCommandsFunction = function(v94, v95, v96, v97)
    if v94.ProcessCommandsFunctions:HasFunction(v95) then
        error(string.format("ProcessCommandsFunction '%s' already exists", v95));
    end;
    v94.ProcessCommandsFunctions:AddFunction(v95, v96, v97);
end;
v15.ProcessCommandsFunctionExists = function(v98, v99)
    return v98.ProcessCommandsFunctions:HasFunction(v99);
end;
v15.UnregisterProcessCommandsFunction = function(v100, v101)
    if not v100.ProcessCommandsFunctions:HasFunction(v101) then
        error(string.format("ProcessCommandsFunction '%s' does not exist", v101));
    end;
    v100.ProcessCommandsFunctions:RemoveFunction(v101);
end;
local function _(v102)
    local v103 = {};
    for v104, v105 in pairs(v102) do
        v103[v104] = v105;
    end;
    return v103;
end;
v15.GetHistoryLog = function(v107)
    local l_ChatHistory_0 = v107.ChatHistory;
    local v109 = {};
    for v110, v111 in pairs(l_ChatHistory_0) do
        v109[v110] = v111;
    end;
    return v109;
end;
v15.GetHistoryLogForSpeaker = function(v112, v113)
    local v114 = -1;
    local l_v113_Player_0 = v113:GetPlayer();
    if l_v113_Player_0 then
        v114 = l_v113_Player_0.UserId;
    end;
    local v116 = {};
    for v117 = 1, #v112.ChatHistory do
        if v112:CanCommunicateByUserId(v114, v112.ChatHistory[v117].SpeakerUserId) then
            local v118 = v112.ChatHistory[v117];
            local v119 = {};
            for v120, v121 in pairs(v118) do
                v119[v120] = v121;
            end;
            local l_v119_0 = v119;
            if not (l_v119_0.MessageType ~= l_ChatConstants_0.MessageTypeDefault) or l_v119_0.MessageType == l_ChatConstants_0.MessageTypeMeCommand then
                v118 = l_v119_0.FilterResult;
                if not l_v119_0.IsFilterResult then
                    l_v119_0.Message = v118;
                elseif not l_v113_Player_0 then
                    l_v119_0.Message = v118:GetNonChatStringForBroadcastAsync();
                else
                    l_v119_0.Message = v118:GetChatForUserAsync(l_v113_Player_0.UserId);
                end;
            end;
            table.insert(v116, l_v119_0);
        end;
    end;
    return v116;
end;
v15.InternalDestroy = function(v123)
    for _, v125 in pairs(v123.Speakers) do
        v125:LeaveChannel(v123.Name);
    end;
    v123.eDestroyed:Fire();
    v123.eDestroyed:Destroy();
    v123.eMessagePosted:Destroy();
    v123.eSpeakerJoined:Destroy();
    v123.eSpeakerLeft:Destroy();
    v123.eSpeakerMuted:Destroy();
    v123.eSpeakerUnmuted:Destroy();
end;
v15.InternalDoMessageFilter = function(v126, v127, v128, v129)
    for v130, v131, _ in (v126.FilterMessageFunctions:GetIterator()), nil, nil do
        local l_status_7, l_result_7 = pcall(function()
            v131(v127, v128, v129);
        end);
        if not l_status_7 then
            warn(string.format("DoMessageFilter Function '%s' failed for reason: %s", v130, l_result_7));
        end;
    end;
end;
v15.InternalDoProcessCommands = function(v135, v136, v137, v138)
    for v139, v140, _ in (v135.ProcessCommandsFunctions:GetIterator()), nil, nil do
        local l_status_8, l_result_8 = pcall(function()
            local v142 = v140(v136, v137, v138);
            if type(v142) ~= "boolean" then
                error("Process command functions must return a bool");
            end;
            return v142;
        end);
        if l_status_8 then
            if l_result_8 then
                return true;
            end;
        else
            warn(string.format("DoProcessCommands Function '%s' failed for reason: %s", v139, l_result_8));
        end;
    end;
    return false;
end;
getLanguageCodeFromLocale = function(v145)
    local v146 = string.gmatch(v145, "[^-]+")();
    if not v146 then
        return "en";
    else
        return v146;
    end;
end;
v15.InternalPostMessage = function(v147, v148, v149, v150)
    if not v147:InternalDoProcessCommands(v148.Name, v149, v147.Name) then
        if v147.Mutes[v148.Name:lower()] ~= nil then
            local v151 = v147.Mutes[v148.Name:lower()];
            if v151 > 0 and v151 < os.time() then
                v147:UnmuteSpeaker(v148.Name);
            else
                v147:SendSystemMessageToSpeaker(v11:FormatMessageToSend("GameChat_ChatChannel_MutedInChannel", "You are muted and cannot talk in this channel"), v148.Name);
                return false;
            end;
        end;
        local v152 = v147:InternalCreateMessageObject(v149, v148.Name, false, v150);
        v152.Message = v149;
        local v153 = nil;
        pcall(function()
            v153 = l_Chat_0:InvokeChatCallback(Enum.ChatCallbackType.OnServerReceivingMessage, v152);
        end);
        v152.Message = nil;
        if v153 then
            if v153.ShouldDeliver == false then
                return false;
            else
                v152 = v153;
            end;
        end;
        v149 = v147:SendMessageObjToFilters(v149, v152, v148);
        local v154 = {};
        for _, v156 in pairs(v147.Speakers) do
            if not (v156:IsSpeakerMuted(v148.Name) or not v147:CanCommunicate(v148, v156)) then
                table.insert(v154, v156.Name);
                if v156.Name == v148.Name then
                    local l_v152_0 = v152;
                    local v158 = {};
                    for v159, v160 in pairs(l_v152_0) do
                        v158[v159] = v160;
                    end;
                    local l_v158_0 = v158;
                    if not v0 then
                        l_v158_0.Message = v149;
                    else
                        l_v158_0.Message = string.rep("_", v152.MessageLengthUtf8 or v152.MessageLength);
                    end;
                    l_v158_0.IsFiltered = true;
                    v156:InternalSendMessage(l_v158_0, v147.Name);
                else
                    v156:InternalSendMessage(v152, v147.Name);
                end;
            end;
        end;
        local l_status_9, l_result_9 = pcall(function()
            v147.eMessagePosted:Fire(v152);
        end);
        if not (l_status_9 or not l_result_9) then
            print("Error posting message: " .. l_result_9);
        end;
        local v164 = not not v147.Private and Enum.TextFilterContext.PrivateChat or Enum.TextFilterContext.PublicChat;
        local v165 = nil;
        if not l_result_0 then
            local v166, v167, v168 = v147.ChatService:InternalApplyRobloxFilterNewAPI(v152.FromSpeaker, v149, v164);
            if not v166 then
                if not l_status_0 then
                    return false;
                else
                    v152.IsFilterResult = false;
                    v152.FilterResult = "";
                    v152.MessageLength = 0;
                end;
            else
                v152.FilterResult = v168;
                v152.IsFilterResult = v167;
            end;
        else
            local v169 = {};
            local v170 = {};
            for _, v172 in pairs(v147.Speakers) do
                local l_v172_Player_0 = v172:GetPlayer();
                if l_v172_Player_0 ~= nil and l_v172_Player_0.LocaleId ~= nil then
                    v170[getLanguageCodeFromLocale(l_v172_Player_0.LocaleId)] = true;
                end;
            end;
            for v174, _ in v170, nil, nil do
                table.insert(v169, v174);
            end;
            local v176, v177, v178 = v147.ChatService:InternalApplyRobloxFilterAndTranslate(v152.FromSpeaker, v169, v149, v164);
            if not v176 then
                if not l_status_0 then
                    return false;
                else
                    v152.IsFilterResult = false;
                    v152.FilterResult = "";
                    v152.MessageLength = 0;
                end;
            else
                if not v177 then
                    v152.FilterResult = v178;
                else
                    v152.FilterResult = v178.SourceText;
                end;
                v152.IsFilterResult = v177;
                if v177 then
                    v165 = v178;
                end;
            end;
        end;
        v152.IsFiltered = true;
        v147:InternalAddMessageToHistoryLog(v152);
        for _, v180 in pairs(v154) do
            local v181 = v147.Speakers[v180];
            if v181 then
                local l_l_result_0_0 = l_result_0;
                if l_l_result_0_0 then
                    l_l_result_0_0 = v165;
                    if l_l_result_0_0 then
                        l_l_result_0_0 = false;
                        if v148:GetPlayer() ~= nil then
                            l_l_result_0_0 = false;
                            if v181:GetPlayer() ~= nil then
                                l_l_result_0_0 = v148:GetPlayer().LocaleId ~= v181:GetPlayer().LocaleId;
                            end;
                        end;
                    end;
                end;
                if not l_l_result_0_0 then
                    v181:InternalSendFilteredMessageWithFilterResult(v152, v147.Name);
                else
                    v181:InternalSendFilteredMessageWithTranslatedFilterResult(v152, v147.Name, v165);
                end;
            end;
        end;
        local v183 = {};
        for _, v185 in pairs(v147.Speakers) do
            if not (v185:IsSpeakerMuted(v148.Name) or not v147:CanCommunicate(v148, v185)) then
                local v186 = false;
                for _, v188 in pairs(v154) do
                    if v185.Name == v188 then
                        v186 = true;
                        break;
                    end;
                end;
                if not v186 then
                    table.insert(v183, v185.Name);
                end;
            end;
        end;
        for _, v190 in pairs(v183) do
            local v191 = v147.Speakers[v190];
            if v191 then
                v191:InternalSendFilteredMessageWithFilterResult(v152, v147.Name);
            end;
        end;
        return v152;
    else
        return false;
    end;
end;
v15.InternalAddSpeaker = function(v192, v193)
    if not v192.Speakers[v193.Name] then
        v192.Speakers[v193.Name] = v193;
        local l_status_10, l_result_10 = pcall(function()
            v192.eSpeakerJoined:Fire(v193.Name);
        end);
        if not (l_status_10 or not l_result_10) then
            print("Error removing channel: " .. l_result_10);
        end;
        return ;
    else
        warn("Speaker \"" .. v193.name .. "\" is already in the channel");
        return ;
    end;
end;
v15.InternalRemoveSpeaker = function(v196, v197)
    if v196.Speakers[v197.Name] then
        v196.Speakers[v197.Name] = nil;
        local l_status_11, l_result_11 = pcall(function()
            v196.eSpeakerLeft:Fire(v197.Name);
        end);
        if not (l_status_11 or not l_result_11) then
            print("Error removing speaker: " .. l_result_11);
        end;
        return ;
    else
        warn("Speaker \"" .. v197.name .. "\" is not in the channel");
        return ;
    end;
end;
v15.InternalRemoveExcessMessagesFromLog = function(v200)
    local l_remove_0 = table.remove;
    while v200.MaxHistory < #v200.ChatHistory do
        l_remove_0(v200.ChatHistory, 1);
    end;
end;
v15.InternalAddMessageToHistoryLog = function(v202, v203)
    table.insert(v202.ChatHistory, v203);
    v202:InternalRemoveExcessMessagesFromLog();
end;
v15.GetMessageType = function(_, _, v206)
    if v206 == nil then
        return l_ChatConstants_0.MessageTypeSystem;
    else
        return l_ChatConstants_0.MessageTypeDefault;
    end;
end;
v15.InternalCreateMessageObject = function(v207, v208, v209, v210, v211)
    local l_v207_MessageType_0 = v207:GetMessageType(v208, v209);
    local v213 = -1;
    local v214 = nil;
    local v215 = nil;
    if v209 then
        v215 = v207.ChatService:GetSpeaker(v209);
        if v215 then
            local l_v215_Player_0 = v215:GetPlayer();
            if not l_v215_Player_0 then
                v213 = 0;
            else
                v213 = l_v215_Player_0.UserId;
                if l_ChatSettings_0.PlayerDisplayNamesEnabled then
                    v214 = v215:GetNameForDisplay();
                end;
            end;
        end;
    end;
    local v217 = {
        ID = v207.ChatService:InternalGetUniqueMessageId(), 
        FromSpeaker = v209, 
        SpeakerDisplayName = v214, 
        SpeakerUserId = v213, 
        OriginalChannel = v207.Name, 
        MessageLength = string.len(v208), 
        MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v208)), 
        MessageType = l_v207_MessageType_0, 
        IsFiltered = v210, 
        Message = not not v210 and v208 or nil, 
        Time = os.time(), 
        ExtraData = {}
    };
    if v215 then
        for v218, v219 in pairs(v215.ExtraData) do
            v217.ExtraData[v218] = v219;
        end;
    end;
    if v211 then
        for v220, v221 in pairs(v211) do
            v217.ExtraData[v220] = v221;
        end;
    end;
    return v217;
end;
v15.SetChannelNameColor = function(v222, v223)
    v222.ChannelNameColor = v223;
    for _, v225 in pairs(v222.Speakers) do
        v225:UpdateChannelNameColor(v222.Name, v223);
    end;
end;
v15.GetWelcomeMessageForSpeaker = function(v226, v227)
    if v226.GetWelcomeMessageFunction then
        local v228 = v226.GetWelcomeMessageFunction(v227);
        if v228 then
            return v228;
        end;
    end;
    return v226.WelcomeMessage;
end;
v15.RegisterGetWelcomeMessageFunction = function(v229, v230)
    if type(v230) ~= "function" then
        error("RegisterGetWelcomeMessageFunction must be called with a function.");
    end;
    v229.GetWelcomeMessageFunction = v230;
end;
v15.UnRegisterGetWelcomeMessageFunction = function(v231)
    v231.GetWelcomeMessageFunction = nil;
end;
v3.new = function(v232, v233, v234, v235)
    local v236 = setmetatable({}, v15);
    v236.ChatService = v232;
    v236.Name = v233;
    v236.WelcomeMessage = v234 or "";
    v236.GetWelcomeMessageFunction = nil;
    v236.ChannelNameColor = v235;
    v236.Joinable = true;
    v236.Leavable = true;
    v236.AutoJoin = false;
    v236.Private = false;
    v236.Speakers = {};
    v236.Mutes = {};
    v236.MaxHistory = 200;
    v236.HistoryIndex = 0;
    v236.ChatHistory = {};
    v236.FilterMessageFunctions = l_Util_0:NewSortedFunctionContainer();
    v236.ProcessCommandsFunctions = l_Util_0:NewSortedFunctionContainer();
    v236.eDestroyed = Instance.new("BindableEvent");
    v236.eMessagePosted = Instance.new("BindableEvent");
    v236.eSpeakerJoined = Instance.new("BindableEvent");
    v236.eSpeakerLeft = Instance.new("BindableEvent");
    v236.eSpeakerMuted = Instance.new("BindableEvent");
    v236.eSpeakerUnmuted = Instance.new("BindableEvent");
    v236.MessagePosted = v236.eMessagePosted.Event;
    v236.SpeakerJoined = v236.eSpeakerJoined.Event;
    v236.SpeakerLeft = v236.eSpeakerLeft.Event;
    v236.SpeakerMuted = v236.eSpeakerMuted.Event;
    v236.SpeakerUnmuted = v236.eSpeakerUnmuted.Event;
    v236.Destroyed = v236.eDestroyed.Event;
    return v236;
end;
return v3;
