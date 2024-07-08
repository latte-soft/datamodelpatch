local v0 = false;
local l_status_0, l_result_0 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2");
end);
v0 = l_status_0 and l_result_0;
l_status_0 = game:GetService("Players");
l_result_0 = script.Parent.Parent;
local l_ChatSettings_0 = require(l_result_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_result_0:WaitForChild("ChatConstants"));
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
local v6 = utf8.char(57344);
IsPlayerVerified = function(v7)
    local l_l_status_0_PlayerByUserId_0 = l_status_0:GetPlayerByUserId(v7);
    if l_l_status_0_PlayerByUserId_0 then
        local l_status_1, l_result_1 = pcall(function()
            return l_l_status_0_PlayerByUserId_0.HasVerifiedBadge;
        end);
        if not l_status_1 then
            return false;
        else
            return l_result_1;
        end;
    else
        return false;
    end;
end;
AppendVerifiedBadge = function(v11)
    return v11 .. v6;
end;
CreateMessageLabel = function(v12, v13, v14)
    local l_FromSpeaker_0 = v12.FromSpeaker;
    local v16 = nil;
    v16 = if not not l_ChatSettings_0.PlayerDisplayNamesEnabled and v12.SpeakerDisplayName then v12.SpeakerDisplayName else l_FromSpeaker_0;
    if IsPlayerVerified(v12.SpeakerUserId) then
        v16 = AppendVerifiedBadge(v16);
    end;
    local _ = v12.Message;
    local v18 = v12.ExtraData or {};
    local v19 = v18.Font or l_ChatSettings_0.DefaultFont;
    local v20 = v18.TextSize or l_ChatSettings_0.ChatWindowTextSize;
    local v21 = v18.NameColor or l_ChatSettings_0.DefaultNameColor;
    local v22 = v18.ChatColor or l_ChatSettings_0.DefaultMessageColor;
    local v23 = v18.ChannelColor or v22;
    local v24 = v18.Tags or {};
    local v25 = string.format("[%s]:", v16);
    local _ = l_Util_0:GetStringTextBounds(v25, v19, v20);
    local v27 = l_Util_0:GetNumberOfSpaces(v25, v19, v20) + 1;
    local l_l_Util_0_BaseMessage_0, v29 = l_Util_0:CreateBaseMessage("", v19, v20, v22);
    local v30 = l_Util_0:AddNameButtonToBaseMessage(v29, v21, v25, l_FromSpeaker_0);
    local v31 = nil;
    local v32 = UDim2.new(0, 0, 0, 0);
    if v13 ~= v12.OriginalChannel then
        local v33 = string.format("{%s}", v12.OriginalChannel);
        v31 = l_Util_0:AddChannelButtonToBaseMessage(v29, v23, v33, v12.OriginalChannel);
        v32 = UDim2.new(0, v31.Size.X.Offset + l_Util_0:GetStringTextBounds(" ", v19, v20).X, 0, 0);
        v27 = (v27 + l_Util_0:GetNumberOfSpaces(v33, v19, v20)) + 1;
    end;
    local v34 = {};
    for _, v36 in pairs(v24) do
        local v37 = v36.TagColor or Color3.fromRGB(255, 0, 255);
        local v38 = string.format("[%s] ", v36.TagText or "???");
        local v39 = l_Util_0:AddTagLabelToBaseMessage(v29, v37, v38);
        v39.Position = v32;
        v27 = v27 + l_Util_0:GetNumberOfSpaces(v38, v19, v20);
        v32 = v32 + UDim2.new(0, v39.Size.X.Offset, 0, 0);
        table.insert(v34, v39);
    end;
    v30.Position = v32;
    local v40 = false;
    local v41 = nil;
    if v0 then
        pcall(function()
            v41 = l_Util_0:AddTranslationButtonToBaseMessage(v29);
            v32 = v32 + UDim2.new(0, v30.Size.X.Offset + 2, 0, 0);
            v41.Position = v32;
        end);
    end;
    local function v43(v42)
        v40 = false;
        if not v12.IsFiltered then
            v29.Text = l_Util_0:CreateLeadingSpaces(v27) .. string.rep("_", v42.MessageLengthUtf8 or v42.MessageLength);
            return ;
        else
            v29.Text = l_Util_0:CreateLeadingSpaces(v27) .. l_Util_0:SanitizeForRichText(v42.Message);
            return ;
        end;
    end;
    local function _(v44)
        if v41 == nil then
            return ;
        else
            if v41.Visible == false then
                v27 = v27 + 6;
            end;
            v41.Visible = true;
            v40 = true;
            if v44.TranslatedMessage == "" then
                v43(v44);
                return ;
            else
                v29.Text = l_Util_0:CreateLeadingSpaces(v27) .. l_Util_0:SanitizeForRichText(v44.TranslatedMessage);
                return ;
            end;
        end;
    end;
    local function _(v46)
        v12.TranslatedMessage = v46.TranslatedMessage;
        if not v46.TranslatedMessage then
            v43(v46);
            return ;
        elseif v41 == nil then
            return ;
        else
            if v41.Visible == false then
                v27 = v27 + 6;
            end;
            v41.Visible = true;
            v40 = true;
            if v46.TranslatedMessage == "" then
                v43(v46);
                return ;
            else
                v29.Text = l_Util_0:CreateLeadingSpaces(v27) .. l_Util_0:SanitizeForRichText(v46.TranslatedMessage);
                return ;
            end;
        end;
    end;
    local function v49(v48)
        if not v0 then
            if not v12.IsFiltered then
                v29.Text = l_Util_0:CreateLeadingSpaces(v27) .. string.rep("_", v48.MessageLengthUtf8 or v48.MessageLength);
                return ;
            else
                v29.Text = l_Util_0:CreateLeadingSpaces(v27) .. l_Util_0:SanitizeForRichText(v48.Message);
                return ;
            end;
        else
            v12.TranslatedMessage = v48.TranslatedMessage;
            if not v48.TranslatedMessage then
                v43(v48);
                return ;
            elseif v41 == nil then
                return ;
            else
                if v41.Visible == false then
                    v27 = v27 + 6;
                end;
                v41.Visible = true;
                v40 = true;
                if v48.TranslatedMessage == "" then
                    v43(v48);
                    return ;
                else
                    v29.Text = l_Util_0:CreateLeadingSpaces(v27) .. l_Util_0:SanitizeForRichText(v48.TranslatedMessage);
                    return ;
                end;
            end;
        end;
    end;
    local function _()
        if v40 or not v12.TranslatedMessage then
            v43(v12);
        else
            local l_v12_0 = v12;
            if not (v41 == nil) then
                if v41.Visible == false then
                    v27 = v27 + 6;
                end;
                v41.Visible = true;
                v40 = true;
                if l_v12_0.TranslatedMessage == "" then
                    v43(l_v12_0);
                else
                    v29.Text = l_Util_0:CreateLeadingSpaces(v27) .. l_Util_0:SanitizeForRichText(l_v12_0.TranslatedMessage);
                end;
            end;
        end;
        if v14 then
            v14();
        end;
    end;
    if v0 and v41 ~= nil then
        local v53 = v41.MouseButton1Click:connect(function()
            if v40 or not v12.TranslatedMessage then
                v43(v12);
            else
                local l_v12_1 = v12;
                if not (v41 == nil) then
                    if v41.Visible == false then
                        v27 = v27 + 6;
                    end;
                    v41.Visible = true;
                    v40 = true;
                    if l_v12_1.TranslatedMessage == "" then
                        v43(l_v12_1);
                    else
                        v29.Text = l_Util_0:CreateLeadingSpaces(v27) .. l_Util_0:SanitizeForRichText(l_v12_1.TranslatedMessage);
                    end;
                end;
            end;
            if v14 then
                v14();
            end;
        end);
        local v54 = nil;
        local l_v53_0 = v53 --[[ copy: 30 -> 38 ]];
        do
            local l_v54_0 = v54;
            l_v54_0 = v41.Changed:connect(function(v57)
                if v57 == "Parent" then
                    l_v53_0:Disconnect();
                    l_v54_0:Disconnect();
                end;
            end);
        end;
    end;
    v49(v12);
    local function v59(v58)
        return l_Util_0:GetMessageHeight(v29, l_l_Util_0_BaseMessage_0, v58);
    end;
    local v60 = {
        [v30] = {
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
    if v0 and v41 ~= nil then
        v60[v41] = {
            ImageTransparency = {
                FadedIn = 0, 
                FadedOut = 1
            }
        };
    end;
    v60[v29] = {
        TextTransparency = {
            FadedIn = 0, 
            FadedOut = 1
        }, 
        TextStrokeTransparency = {
            FadedIn = 0.75, 
            FadedOut = 1
        }
    };
    for v61, v62 in pairs(v34) do
        local _ = string.format("Tag%d", v61);
        v60[v62] = {
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
    if v31 then
        v60[v31] = {
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
    local l_l_Util_0_FadeFunctions_0, v65, v66 = l_Util_0:CreateFadeFunctions(v60);
    return {
        [l_Util_0.KEY_BASE_FRAME] = l_l_Util_0_BaseMessage_0, 
        [l_Util_0.KEY_BASE_MESSAGE] = v29, 
        [l_Util_0.KEY_UPDATE_TEXT_FUNC] = v49, 
        [l_Util_0.KEY_GET_HEIGHT] = v59, 
        [l_Util_0.KEY_FADE_IN] = l_l_Util_0_FadeFunctions_0, 
        [l_Util_0.KEY_FADE_OUT] = v65, 
        [l_Util_0.KEY_UPDATE_ANIMATION] = v66
    };
end;
return {
    [l_Util_0.KEY_MESSAGE_TYPE] = l_ChatConstants_0.MessageTypeDefault, 
    [l_Util_0.KEY_CREATOR_FUNCTION] = CreateMessageLabel
};
