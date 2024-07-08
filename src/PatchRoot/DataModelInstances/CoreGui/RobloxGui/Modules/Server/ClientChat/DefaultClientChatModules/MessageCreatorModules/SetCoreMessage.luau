local l_Parent_0 = script.Parent.Parent;
local l_ChatSettings_0 = require(l_Parent_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_Parent_0:WaitForChild("ChatConstants"));
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
CreateSetCoreMessageLabel = function(v4, _)
    local l_Message_0 = v4.Message;
    local v7 = v4.ExtraData or {};
    local l_l_Util_0_BaseMessage_0, v9 = l_Util_0:CreateBaseMessage(l_Message_0, v7.Font or l_ChatSettings_0.DefaultFont, v7.TextSize or l_ChatSettings_0.ChatWindowTextSize, v7.Color or l_ChatSettings_0.DefaultMessageColor);
    local function v11(v10)
        return l_Util_0:GetMessageHeight(v9, l_l_Util_0_BaseMessage_0, v10);
    end;
    local l_l_Util_0_FadeFunctions_0, v13, v14 = l_Util_0:CreateFadeFunctions({
        [v9] = {
            TextTransparency = {
                FadedIn = 0, 
                FadedOut = 1
            }, 
            TextStrokeTransparency = {
                FadedIn = 0.75, 
                FadedOut = 1
            }
        }
    });
    return {
        [l_Util_0.KEY_BASE_FRAME] = l_l_Util_0_BaseMessage_0, 
        [l_Util_0.KEY_BASE_MESSAGE] = v9, 
        [l_Util_0.KEY_UPDATE_TEXT_FUNC] = nil, 
        [l_Util_0.KEY_GET_HEIGHT] = v11, 
        [l_Util_0.KEY_FADE_IN] = l_l_Util_0_FadeFunctions_0, 
        [l_Util_0.KEY_FADE_OUT] = v13, 
        [l_Util_0.KEY_UPDATE_ANIMATION] = v14
    };
end;
return {
    [l_Util_0.KEY_MESSAGE_TYPE] = l_ChatConstants_0.MessageTypeSetCore, 
    [l_Util_0.KEY_CREATOR_FUNCTION] = CreateSetCoreMessageLabel
};
