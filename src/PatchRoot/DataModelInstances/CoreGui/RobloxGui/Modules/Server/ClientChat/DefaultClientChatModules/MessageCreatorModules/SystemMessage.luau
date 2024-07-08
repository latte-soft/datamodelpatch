local l_Parent_0 = script.Parent.Parent;
local l_ChatSettings_0 = require(l_Parent_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_Parent_0:WaitForChild("ChatConstants"));
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
local v4 = nil;
pcall(function()
    v4 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
CreateSystemMessageLabel = function(v5, v6)
    local l_Message_0 = v5.Message;
    if not (not v4 or not v4.LocalizeFormattedMessage) then
        l_Message_0 = v4:LocalizeFormattedMessage(l_Message_0);
    end;
    local v8 = v5.ExtraData or {};
    local v9 = v8.Font or l_ChatSettings_0.DefaultFont;
    local v10 = v8.TextSize or l_ChatSettings_0.ChatWindowTextSize;
    local v11 = v8.ChatColor or l_ChatSettings_0.DefaultMessageColor;
    local v12 = v8.ChannelColor or v11;
    local l_l_Util_0_BaseMessage_0, v14 = l_Util_0:CreateBaseMessage(l_Message_0, v9, v10, v11);
    v14.AutoLocalize = true;
    local v15 = nil;
    if v6 ~= v5.OriginalChannel then
        local v16 = nil;
        v16 = if not not v4 and v5.OriginalChannel == "System" then string.format("{%s}", (v4:Get("InGame.Chat.Label.SystemMessagePrefix", "System"))) else if v4 and v5.OriginalChannel == "Team" then string.format("{%s}", (v4:Get("InGame.Chat.Label.TeamMessagePrefix", "System"))) else string.format("{%s}", v5.OriginalChannel);
        v15 = l_Util_0:AddChannelButtonToBaseMessage(v14, v12, v16, v5.OriginalChannel);
        v14.Text = l_Util_0:CreateLeadingSpaces(l_Util_0:GetNumberOfSpaces(v16, v9, v10) + 1) .. l_Util_0:SanitizeForRichText(l_Message_0);
    end;
    local function v18(v17)
        return l_Util_0:GetMessageHeight(v14, l_l_Util_0_BaseMessage_0, v17);
    end;
    local v19 = {
        [v14] = {
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
    if v15 then
        v19[v15] = {
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
    local l_l_Util_0_FadeFunctions_0, v21, v22 = l_Util_0:CreateFadeFunctions(v19);
    return {
        [l_Util_0.KEY_BASE_FRAME] = l_l_Util_0_BaseMessage_0, 
        [l_Util_0.KEY_BASE_MESSAGE] = v14, 
        [l_Util_0.KEY_UPDATE_TEXT_FUNC] = nil, 
        [l_Util_0.KEY_GET_HEIGHT] = v18, 
        [l_Util_0.KEY_FADE_IN] = l_l_Util_0_FadeFunctions_0, 
        [l_Util_0.KEY_FADE_OUT] = v21, 
        [l_Util_0.KEY_UPDATE_ANIMATION] = v22
    };
end;
return {
    [l_Util_0.KEY_MESSAGE_TYPE] = l_ChatConstants_0.MessageTypeSystem, 
    [l_Util_0.KEY_CREATOR_FUNCTION] = CreateSystemMessageLabel
};
