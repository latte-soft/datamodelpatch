local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_Parent_0 = script.Parent.Parent;
local l_ChatSettings_0 = require(l_Parent_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_Parent_0:WaitForChild("ChatConstants"));
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
local v6 = utf8.char(57344);
local v7 = nil;
pcall(function()
    v7 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
IsPlayerVerified = function(v8)
    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v8);
    if l_l_Players_0_PlayerByUserId_0 then
        local l_status_0, l_result_0 = pcall(function()
            return l_l_Players_0_PlayerByUserId_0.HasVerifiedBadge;
        end);
        if not l_status_0 then
            return false;
        else
            return l_result_0;
        end;
    else
        return false;
    end;
end;
AppendVerifiedBadge = function(v12)
    return v12 .. v6;
end;
CreateMessageLabel = function(v13, v14)
    local l_FromSpeaker_0 = v13.FromSpeaker;
    local v16 = nil;
    v16 = if not not l_ChatSettings_0.PlayerDisplayNamesEnabled and v13.SpeakerDisplayName then v13.SpeakerDisplayName else l_FromSpeaker_0;
    if IsPlayerVerified(v13.SpeakerUserId) then
        v16 = AppendVerifiedBadge(v16);
    end;
    local _ = v13.Message;
    local v18 = v13.ExtraData or {};
    local v19 = v18.Font or l_ChatSettings_0.DefaultFont;
    local v20 = v18.TextSize or l_ChatSettings_0.ChatWindowTextSize;
    local v21 = v18.NameColor or l_ChatSettings_0.DefaultNameColor;
    local v22 = v18.ChatColor or l_ChatSettings_0.DefaultMessageColor;
    local v23 = v18.ChannelColor or v22;
    local v24 = string.format("[%s]:", v16);
    local _ = l_Util_0:GetStringTextBounds(v24, v19, v20);
    local v26 = l_Util_0:GetNumberOfSpaces(v24, v19, v20) + 1;
    local l_l_Util_0_BaseMessage_0, v28 = l_Util_0:CreateBaseMessage("", v19, v20, v22);
    local v29 = l_Util_0:AddNameButtonToBaseMessage(v28, v21, v24, l_FromSpeaker_0);
    local v30 = nil;
    if v14 ~= v13.OriginalChannel then
        local l_OriginalChannel_0 = v13.OriginalChannel;
        if v13.FromSpeaker ~= l_LocalPlayer_0.Name then
            l_OriginalChannel_0 = string.format("From %s", v13.FromSpeaker);
        end;
        if v7.tryLocalize then
            l_OriginalChannel_0 = v7:tryLocalize(l_OriginalChannel_0);
        end;
        local v32 = string.format("{%s}", l_OriginalChannel_0);
        v30 = l_Util_0:AddChannelButtonToBaseMessage(v28, v23, v32, v13.OriginalChannel);
        v29.Position = UDim2.new(0, v30.Size.X.Offset + l_Util_0:GetStringTextBounds(" ", v19, v20).X, 0, 0);
        v26 = (v26 + l_Util_0:GetNumberOfSpaces(v32, v19, v20)) + 1;
    end;
    local function v34(v33)
        if not v13.IsFiltered then
            v28.Text = l_Util_0:CreateLeadingSpaces(v26) .. string.rep("_", v33.MessageLengthUtf8 or v33.MessageLength);
            return ;
        else
            v28.Text = l_Util_0:CreateLeadingSpaces(v26) .. l_Util_0:SanitizeForRichText(v33.Message);
            return ;
        end;
    end;
    v34(v13);
    local function v36(v35)
        return l_Util_0:GetMessageHeight(v28, l_l_Util_0_BaseMessage_0, v35);
    end;
    local v37 = {
        [v29] = {
            TextTransparency = {
                FadedIn = 0, 
                FadedOut = 1
            }, 
            TextStrokeTransparency = {
                FadedIn = 0.75, 
                FadedOut = 1
            }
        }, 
        [v28] = {
            TextTransparency = {
                FadedIn = 0, 
                FadedOut = 1
            }, 
            TextStrokeTransparency = {
                FadedIn = 0.75, 
                FadedOut = 1
            }
        }
    };
    if v30 then
        v37[v30] = {
            TextTransparency = {
                FadedIn = 0, 
                FadedOut = 1
            }, 
            TextStrokeTransparency = {
                FadedIn = 0.75, 
                FadedOut = 1
            }
        };
    end;
    local l_l_Util_0_FadeFunctions_0, v39, v40 = l_Util_0:CreateFadeFunctions(v37);
    return {
        [l_Util_0.KEY_BASE_FRAME] = l_l_Util_0_BaseMessage_0, 
        [l_Util_0.KEY_BASE_MESSAGE] = v28, 
        [l_Util_0.KEY_UPDATE_TEXT_FUNC] = v34, 
        [l_Util_0.KEY_GET_HEIGHT] = v36, 
        [l_Util_0.KEY_FADE_IN] = l_l_Util_0_FadeFunctions_0, 
        [l_Util_0.KEY_FADE_OUT] = v39, 
        [l_Util_0.KEY_UPDATE_ANIMATION] = v40
    };
end;
return {
    [l_Util_0.KEY_MESSAGE_TYPE] = l_ChatConstants_0.MessageTypeWhisper, 
    [l_Util_0.KEY_CREATOR_FUNCTION] = CreateMessageLabel
};
