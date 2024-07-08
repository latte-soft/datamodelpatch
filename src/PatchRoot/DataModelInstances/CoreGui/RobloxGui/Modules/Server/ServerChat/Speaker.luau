local v0 = {};
local l_RunService_0 = game:GetService("RunService");
local l_ChatSettings_0 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"));
local _ = script.Parent;
local v4 = nil;
local l_status_0, l_result_0 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures");
end);
v4 = l_status_0 and l_result_0;
l_status_0 = false;
local v7;
l_result_0, v7 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2");
end);
l_status_0 = l_result_0 and v7;
l_result_0 = function(v8)
    local v9 = {};
    for v10, v11 in pairs(v8) do
        v9[v10] = v11;
    end;
    return v9;
end;
v7 = {};
local v12 = {
    eDestroyed = true, 
    eSaidMessage = true, 
    eReceivedMessage = true, 
    eReceivedUnfilteredMessage = true, 
    eMessageDoneFiltering = true, 
    eReceivedSystemMessage = true, 
    eChannelJoined = true, 
    eChannelLeft = true, 
    eMuted = true, 
    eUnmuted = true, 
    eExtraDataUpdated = true, 
    eMainChannelSet = true, 
    eChannelNameColorUpdated = true
};
local v13 = {
    Destroyed = "eDestroyed", 
    SaidMessage = "eSaidMessage", 
    ReceivedMessage = "eReceivedMessage", 
    ReceivedUnfilteredMessage = "eReceivedUnfilteredMessage", 
    RecievedUnfilteredMessage = "eReceivedUnfilteredMessage", 
    MessageDoneFiltering = "eMessageDoneFiltering", 
    ReceivedSystemMessage = "eReceivedSystemMessage", 
    ChannelJoined = "eChannelJoined", 
    ChannelLeft = "eChannelLeft", 
    Muted = "eMuted", 
    Unmuted = "eUnmuted", 
    ExtraDataUpdated = "eExtraDataUpdated", 
    MainChannelSet = "eMainChannelSet", 
    ChannelNameColorUpdated = "eChannelNameColorUpdated"
};
v7.__index = function(v14, v15)
    local v16 = rawget(v7, v15);
    if not v16 then
        if not (not v12[v15] or rawget(v14, v15)) then
            rawset(v14, v15, Instance.new("BindableEvent"));
        end;
        local v17 = v13[v15];
        if not (not v17 or rawget(v14, v15)) then
            if not rawget(v14, v17) then
                rawset(v14, v17, Instance.new("BindableEvent"));
            end;
            rawset(v14, v15, rawget(v14, v17).Event);
        end;
        return (rawget(v14, v15));
    else
        return v16;
    end;
end;
v7.LazyFire = function(v18, v19, ...)
    local v20 = rawget(v18, v19);
    if v20 then
        v20:Fire(...);
    end;
end;
v7.SayMessage = function(v21, v22, v23, v24)
    if not v21.ChatService:InternalDoProcessCommands(v21.Name, v22, v23) then
        if v23 then
            local v25 = v21.Channels[v23:lower()];
            if v25 then
                local v26 = v25:InternalPostMessage(v21, v22, v24);
                if v26 then
                    pcall(function()
                        v21:LazyFire("eSaidMessage", v26, v23);
                    end);
                end;
                return v26;
            else
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v7.JoinChannel = function(v27, v28)
    if not v27.Channels[v28:lower()] then
        local l_Channel_0 = v27.ChatService:GetChannel(v28);
        if not l_Channel_0 then
            error("Channel \"" .. v28 .. "\" does not exist");
        end;
        v27.Channels[v28:lower()] = l_Channel_0;
        l_Channel_0:InternalAddSpeaker(v27);
        local l_status_1, l_result_1 = pcall(function()
            v27.eChannelJoined:Fire(l_Channel_0.Name, l_Channel_0:GetWelcomeMessageForSpeaker(v27));
        end);
        if not (l_status_1 or not l_result_1) then
            print("Error joining channel: " .. l_result_1);
        end;
        return ;
    else
        warn("Speaker is already in channel \"" .. v28 .. "\"");
        return ;
    end;
end;
v7.LeaveChannel = function(v32, v33)
    if v32.Channels[v33:lower()] then
        local v34 = v32.Channels[v33:lower()];
        v32.Channels[v33:lower()] = nil;
        v34:InternalRemoveSpeaker(v32);
        local l_status_2, l_result_2 = pcall(function()
            v32:LazyFire("eChannelLeft", v34.Name);
            if v32.PlayerObj then
                v32.EventFolder.OnChannelLeft:FireClient(v32.PlayerObj, v34.Name);
            end;
        end);
        if not (l_status_2 or not l_result_2) then
            print("Error leaving channel: " .. l_result_2);
        end;
        return ;
    else
        warn("Speaker is not in channel \"" .. v33 .. "\"");
        return ;
    end;
end;
v7.IsInChannel = function(v37, v38)
    return v37.Channels[v38:lower()] ~= nil;
end;
v7.GetChannelList = function(v39)
    local v40 = {};
    for _, v42 in pairs(v39.Channels) do
        table.insert(v40, v42.Name);
    end;
    return v40;
end;
v7.SendMessage = function(v43, v44, v45, v46, v47)
    local v48 = v43.Channels[v45:lower()];
    if not v48 then
        if l_RunService_0:IsStudio() then
            warn(string.format("Speaker '%s' is not in channel '%s' and cannot receive a message in it.", v43.Name, v45));
        end;
        return ;
    else
        v48:SendMessageToSpeaker(v44, v43.Name, v46, v47);
        return ;
    end;
end;
v7.SendSystemMessage = function(v49, v50, v51, v52)
    local v53 = v49.Channels[v51:lower()];
    if not v53 then
        if l_RunService_0:IsStudio() then
            warn(string.format("Speaker '%s' is not in channel '%s' and cannot receive a system message in it.", v49.Name, v51));
        end;
        return ;
    else
        v53:SendSystemMessageToSpeaker(v50, v49.Name, v52);
        return ;
    end;
end;
v7.GetPlayer = function(v54)
    return v54.PlayerObj;
end;
v7.GetNameForDisplay = function(v55)
    if not l_ChatSettings_0.PlayerDisplayNamesEnabled then
        return v55.Name;
    else
        local l_v55_Player_0 = v55:GetPlayer();
        if not l_v55_Player_0 then
            return v55.Name;
        else
            return l_v55_Player_0.DisplayName;
        end;
    end;
end;
v7.SetExtraData = function(v57, v58, v59)
    v57.ExtraData[v58] = v59;
    v57:LazyFire("eExtraDataUpdated", v58, v59);
end;
v7.GetExtraData = function(v60, v61)
    return v60.ExtraData[v61];
end;
v7.SetMainChannel = function(v62, v63)
    local l_status_3, l_result_3 = pcall(function()
        v62:LazyFire("eMainChannelSet", v63);
        if v62.PlayerObj then
            v62.EventFolder.OnMainChannelSet:FireClient(v62.PlayerObj, v63);
        end;
    end);
    if not (l_status_3 or not l_result_3) then
        print("Error setting main channel: " .. l_result_3);
    end;
end;
v7.AddMutedSpeaker = function(v66, v67)
    v66.MutedSpeakers[v67:lower()] = true;
end;
v7.RemoveMutedSpeaker = function(v68, v69)
    v68.MutedSpeakers[v69:lower()] = false;
end;
v7.IsSpeakerMuted = function(v70, v71)
    return v70.MutedSpeakers[v71:lower()];
end;
v7.InternalDestroy = function(v72)
    for _, v74 in pairs(v72.Channels) do
        v74:InternalRemoveSpeaker(v72);
    end;
    v72.eDestroyed:Fire();
    v72.EventFolder = nil;
    v72.eDestroyed:Destroy();
    v72.eSaidMessage:Destroy();
    v72.eReceivedMessage:Destroy();
    v72.eReceivedUnfilteredMessage:Destroy();
    v72.eMessageDoneFiltering:Destroy();
    v72.eReceivedSystemMessage:Destroy();
    v72.eChannelJoined:Destroy();
    v72.eChannelLeft:Destroy();
    v72.eMuted:Destroy();
    v72.eUnmuted:Destroy();
    v72.eExtraDataUpdated:Destroy();
    v72.eMainChannelSet:Destroy();
    v72.eChannelNameColorUpdated:Destroy();
end;
v7.InternalAssignPlayerObject = function(v75, v76)
    v75.PlayerObj = v76;
end;
v7.InternalAssignEventFolder = function(v77, v78)
    v77.EventFolder = v78;
end;
v7.InternalSendMessage = function(v79, v80, v81)
    local l_status_4, l_result_4 = pcall(function()
        v79:LazyFire("eReceivedUnfilteredMessage", v80, v81);
        if v79.PlayerObj then
            v79.EventFolder.OnNewMessage:FireClient(v79.PlayerObj, v80, v81);
        end;
    end);
    if not (l_status_4 or not l_result_4) then
        print("Error sending internal message: " .. l_result_4);
    end;
end;
v7.InternalSendFilteredMessage = function(v84, v85, v86)
    local l_status_5, l_result_5 = pcall(function()
        v84:LazyFire("eReceivedMessage", v85, v86);
        v84:LazyFire("eMessageDoneFiltering", v85, v86);
        if v84.PlayerObj then
            v84.EventFolder.OnMessageDoneFiltering:FireClient(v84.PlayerObj, v85, v86);
        end;
    end);
    if not (l_status_5 or not l_result_5) then
        print("Error sending internal filtered message: " .. l_result_5);
    end;
end;
v7.InternalSendFilteredMessageWithTranslatedFilterResult = function(v89, v90, v91, v92)
    local v93 = {};
    for v94, v95 in pairs(v90) do
        v93[v94] = v95;
    end;
    local l_v93_0 = v93;
    v93 = l_v93_0.FilterResult;
    local l_v89_Player_0 = v89:GetPlayer();
    local v98 = if l_v89_Player_0 ~= nil then v92:GetTranslationForLocale(l_v89_Player_0.LocaleId) else nil;
    local v99 = "";
    local v100 = nil;
    pcall(function()
        if not l_v93_0.IsFilterResult then
            v99 = v93;
        elseif not l_v89_Player_0 then
            v99 = v93:GetNonChatStringForBroadcastAsync();
            if v98 then
                v100 = v98:GetNonChatStringForBroadcastAsync();
                return ;
            end;
        else
            v99 = v93:GetChatForUserAsync(l_v89_Player_0.UserId);
            if v98 then
                v100 = v98:GetChatForUserAsync(l_v89_Player_0.UserId);
                return ;
            end;
        end;
    end);
    if not v4 then
        if #v99 > 0 then
            l_v93_0.Message = v99;
            if v100 then
                l_v93_0.TranslatedMessage = v100;
            end;
            l_v93_0.FilterResult = nil;
            v89:InternalSendFilteredMessage(l_v93_0, v91);
        end;
    else
        l_v93_0.Message = v99;
        if v100 then
            l_v93_0.TranslatedMessage = v100;
        end;
        l_v93_0.FilterResult = nil;
        v89:InternalSendFilteredMessage(l_v93_0, v91);
    end;
end;
v7.InternalSendFilteredMessageWithFilterResult = function(v101, v102, v103)
    local v104 = {};
    for v105, v106 in pairs(v102) do
        v104[v105] = v106;
    end;
    local l_v104_0 = v104;
    v104 = l_v104_0.FilterResult;
    local l_v101_Player_0 = v101:GetPlayer();
    local v109 = "";
    pcall(function()
        if not l_v104_0.IsFilterResult then
            v109 = v104;
            return ;
        elseif not l_v101_Player_0 then
            v109 = v104:GetNonChatStringForBroadcastAsync();
            return ;
        else
            v109 = v104:GetChatForUserAsync(l_v101_Player_0.UserId);
            return ;
        end;
    end);
    if not v4 then
        if #v109 > 0 then
            l_v104_0.Message = v109;
            l_v104_0.FilterResult = nil;
            v101:InternalSendFilteredMessage(l_v104_0, v103);
        end;
    else
        l_v104_0.Message = v109;
        l_v104_0.FilterResult = nil;
        v101:InternalSendFilteredMessage(l_v104_0, v103);
    end;
end;
v7.InternalSendSystemMessage = function(v110, v111, v112)
    local l_status_6, l_result_6 = pcall(function()
        v110:LazyFire("eReceivedSystemMessage", v111, v112);
        if v110.PlayerObj then
            v110.EventFolder.OnNewSystemMessage:FireClient(v110.PlayerObj, v111, v112);
        end;
    end);
    if not (l_status_6 or not l_result_6) then
        print("Error sending internal system message: " .. l_result_6);
    end;
end;
v7.UpdateChannelNameColor = function(v115, v116, v117)
    v115:LazyFire("eChannelNameColorUpdated", v116, v117);
    if v115.PlayerObj then
        v115.EventFolder.ChannelNameColorUpdated:FireClient(v115.PlayerObj, v116, v117);
    end;
end;
v0.new = function(v118, v119)
    local v120 = setmetatable({}, v7);
    v120.ChatService = v118;
    v120.PlayerObj = nil;
    v120.Name = v119;
    v120.ExtraData = {};
    v120.Channels = {};
    v120.MutedSpeakers = {};
    v120.EventFolder = nil;
    return v120;
end;
return v0;
