local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagShowVerifiedBadgeInNewChat);
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTranslationUIEnabled);
local v7 = require(l_script_FirstAncestor_0.Config);
local v8 = require(l_script_FirstAncestor_0.ClientSettings.useInterpolatedClientSettings);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("UI");
local v10 = require(l_script_FirstAncestor_1.ScrollingView);
local v11 = require(l_script_FirstAncestor_1.TextMessageLabel);
local v12 = require(l_script_FirstAncestor_1.TranslatedTextMessage);
local v13 = {
    LayoutOrder = 1, 
    size = UDim2.fromScale(1, 1), 
    messages = {}, 
    transparencyValue = v7.ChatWindowBackgroundTransparency, 
    textTransparency = 0, 
    mutedUserIds = {}, 
    verifiedUserIds = {}, 
    showTranslationButton = false
};
return function(v14)
    local v15 = l_Dictionary_0.join(v13, v14);
    local l_chatWindowSettings_0 = v15.chatWindowSettings;
    local l_BackgroundTransparency_0 = v8(l_chatWindowSettings_0).BackgroundTransparency;
    local l_BackgroundColor3_0 = v8(l_chatWindowSettings_0).BackgroundColor3;
    local v22 = v3.useCallback(function(v19, v20)
        if type(v20) == "number" then
            return v15.transparencyValue;
        else
            return v20:map(function(v21)
                return v19 + v21 * (1 - v19);
            end);
        end;
    end);
    local v25 = v3.useCallback(function(v23)
        v15.resetTargetChannel();
        local v24 = tonumber(v23.userId);
        if v24 then
            v15.activateWhisperMode(v24);
        end;
    end);
    return v3.createElement("Frame", {
        BackgroundColor3 = l_BackgroundColor3_0, 
        BorderSizePixel = 0, 
        LayoutOrder = v15.LayoutOrder, 
        Size = v15.size, 
        Visible = v15.visible, 
        BackgroundTransparency = v22(l_BackgroundTransparency_0, v15.transparencyValue), 
        [v3.Event.MouseEnter] = v15.onHovered, 
        [v3.Event.MouseLeave] = v15.onUnhovered, 
        [v3.Change.AbsoluteSize] = function(v26)
            local l_ChatWindowConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if not (not l_ChatWindowConfiguration_0 or not v15.onAbsoluteSizeChanged) then
                v15.onAbsoluteSizeChanged(v26, l_ChatWindowConfiguration_0);
            end;
        end, 
        [v3.Change.AbsolutePosition] = function(v28)
            local l_ChatWindowConfiguration_1 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if not (not l_ChatWindowConfiguration_1 or not v15.onAbsoluteSizeChanged) then
                v15.onAbsolutePositionChanged(v28, l_ChatWindowConfiguration_1);
            end;
        end
    }, {
        uiSizeConstraint = v3.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v7.ChatWindowMaxWidth, v7.ChatWindowMaxHeight)
        }), 
        scrollingView = v3.createElement(v10, {
            size = v15.size, 
            messages = v15.messages
        }, v3.useCallback(function(v30)
            local v34 = l_Dictionary_0.map(v30, function(v31, v32)
                if not v31.isVisibleInChatWindow then
                    return nil, nil;
                else
                    local v33 = not not v31.userId and if v5() then l_Dictionary_0.has(v15.verifiedUserIds, v31.userId) else false;
                    if not v6() then
                        return v3.createElement(v11, {
                            message = v31, 
                            LayoutOrder = v32, 
                            isUserVerified = v33, 
                            textTransparency = v22(0, v15.textTransparency), 
                            textStrokeTransparency = v22(v15.chatWindowSettings.TextStrokeTransparency, v15.textTransparency), 
                            onTextMessageLabelButtonActivated = v25, 
                            chatWindowSettings = v15.chatWindowSettings
                        }), v31.messageId;
                    else
                        return v3.createElement(v12, {
                            message = v31, 
                            LayoutOrder = v32, 
                            isUserVerified = v33, 
                            textTransparency = v22(0, v15.textTransparency), 
                            textStrokeTransparency = v22(v15.chatWindowSettings.TextStrokeTransparency, v15.textTransparency), 
                            onTextMessageLabelButtonActivated = v25, 
                            chatWindowSettings = v15.chatWindowSettings, 
                            showTranslationButton = v15.showTranslationButton, 
                            onToggle = function()
                            end
                        }), v31.messageId;
                    end;
                end;
            end);
            v34["$layout"] = v3.createElement("UIListLayout", {
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder
            });
            return v34;
        end)(v15.messages))
    });
end;
