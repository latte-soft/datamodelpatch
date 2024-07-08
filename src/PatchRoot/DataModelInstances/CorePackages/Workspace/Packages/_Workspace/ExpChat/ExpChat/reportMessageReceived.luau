local v0 = require(script:FindFirstAncestor("ExpChat").Analytics);
local function v4(v1)
    if v1.Status == Enum.TextChatMessageStatus.Success then
        local l_TextChannel_0 = v1.TextChannel;
        if l_TextChannel_0 then
            local l_Name_0 = l_TextChannel_0.Name;
            if string.find(l_Name_0, "^RBX") == nil then
                return "expChatMessageReceivedSuccessCustom";
            elseif l_Name_0 == "RBXGeneral" then
                return "expChatMessageReceivedSuccessGeneral";
            elseif l_Name_0 == "RBXSystem" then
                return "expChatMessageReceivedSuccessSystem";
            elseif not string.find(l_Name_0, "^RBXWhisper") then
                if not string.find(l_Name_0, "^RBXTeam") then
                    return "expChatMessageReceivedSuccessCustom";
                else
                    return "expChatMessageReceivedSuccessTeam";
                end;
            else
                return "expChatMessageReceivedSuccessWhisper";
            end;
        end;
    end;
    if v1.Status == Enum.TextChatMessageStatus.Unknown then
        return "expChatMessageReceivedUnknown";
    elseif v1.Status == Enum.TextChatMessageStatus.InvalidTextChannelPermissions then
        return "expChatMessageReceivedInvalidTextChannelPermissions";
    elseif v1.Status == Enum.TextChatMessageStatus.InvalidPrivacySettings then
        return "expChatMessageReceivedInvalidPrivacySettings";
    elseif v1.Status == Enum.TextChatMessageStatus.TextFilterFailed then
        return "expChatMessageReceivedTextFilterFailed";
    elseif v1.Status == Enum.TextChatMessageStatus.Floodchecked then
        return "expChatMessageReceivedFloodchecked";
    elseif v1.Status == Enum.TextChatMessageStatus.MessageTooLong then
        return "expChatMessageReceivedMessageTooLong";
    else
        return nil;
    end;
end;
return function(v5, v6)
    local l_TextSource_0 = v6.TextSource;
    if l_TextSource_0 and v5 == l_TextSource_0.UserId then
        local v8 = v4(v6);
        if v8 then
            v0.reportCounter(v8);
        end;
    end;
end;
