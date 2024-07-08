local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_List_0 = require(l_Parent_0.llama).List;
local v4 = require(l_script_FirstAncestor_0.BubbleChat.ChatBubble);
local v5 = require(l_script_FirstAncestor_0.Flags.getFixBubblesOutofOrderWhenZoomedIn);
local v6 = require(l_script_FirstAncestor_0.GlobalFlags);
local v7 = v2.Component:extend("BubbleChatList");
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTranslationUIEnabledBubbleChat);
v7.getDerivedStateFromProps = function(v9, v10)
    local v11 = {};
    if v10.bubbles then
        for _, v13 in ipairs(v10.bubbles) do
            if not l_List_0.findWhere(v9.messages, function(v14, _)
                return v14.messageId == v13.messageId;
            end) then
                table.insert(v11, {
                    messageId = v13.messageId, 
                    fadingOut = true
                });
            end;
        end;
    end;
    for _, v17 in ipairs(v9.messages) do
        local v18 = nil;
        if v5() then
            v18 = tonumber(tostring(v17.timestamp):sub(-9));
        end;
        table.insert(v11, {
            messageId = v17.messageId, 
            fadingOut = false, 
            text = v17.text, 
            translation = if not v8() then nil else v17.translation, 
            useTranslation = if not v8() then nil else v17.useTranslation, 
            timestamp = v18 or v17.timestamp, 
            bubbleChatMessageProperties = v17.bubbleChatMessageProperties
        });
    end;
    return {
        bubbles = v11
    };
end;
v7.init = function(v19, v20)
    v19.state = {};
    if not (not (not v20.messages or #v20.messages == 0) or not v20.onLastBubbleFadeOut) then
        v20.onLastBubbleFadeOut();
    end;
    v19.onBubbleFadeOut = function(v21)
        local v23 = l_List_0.filter(v19.state.bubbles, function(v22)
            return v22.messageId ~= v21;
        end);
        if not (#v23 == 0) or not v19.props.onLastBubbleFadeOut then
            v19:setState({
                bubbles = v23
            });
            return ;
        else
            v19.props.onLastBubbleFadeOut();
            return ;
        end;
    end;
end;
v7.render = function(v24)
    local v25 = {};
    local l_chatSettings_0 = v24.props.chatSettings;
    v25.Layout = v2.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Bottom, 
        Padding = UDim.new(0, l_chatSettings_0.BubblesSpacing)
    });
    v25.CaretPadding = (v24.props.chatSettings.TailVisible and (not v6.AvatarChatEnabled or v24.props.showCaret)) and v2.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 8)
    });
    for v27, v28 in ipairs(v24.state.bubbles) do
        local v29 = v27 == #v24.state.bubbles;
        local v30 = not not v29 and v24.props.renderFirstInsert or nil;
        local l_insertSize_0 = v24.props.insertSize;
        if not v5() then
            v25["Bubble" .. v28.messageId] = v2.createElement(v4, {
                messageId = v28.messageId, 
                text = v28.text or "", 
                translation = if not v8() then nil else v28.translation, 
                useTranslation = if not v8() then nil else v28.useTranslation, 
                timestamp = not not v28.timestamp and v28.timestamp.UnixTimestamp or 0, 
                isMostRecent = v29, 
                theme = v24.props.theme, 
                fadingOut = v28.fadingOut, 
                onFadeOut = v24.onBubbleFadeOut, 
                chatSettings = l_chatSettings_0, 
                renderInsert = v30, 
                insertSize = l_insertSize_0, 
                showCaret = v24.props.showCaret, 
                clientSettings = v24.props.clientSettings, 
                bubbleChatMessageProperties = v28.bubbleChatMessageProperties
            });
        else
            v25["Bubble" .. v28.messageId] = v2.createElement(v4, {
                messageId = v28.messageId, 
                text = v28.text or "", 
                translation = if not v8() then nil else v28.translation, 
                useTranslation = if not v8() then nil else v28.useTranslation, 
                timestamp = v28.timestamp or 0, 
                isMostRecent = v29, 
                theme = v24.props.theme, 
                fadingOut = v28.fadingOut, 
                onFadeOut = v24.onBubbleFadeOut, 
                chatSettings = l_chatSettings_0, 
                renderInsert = v30, 
                insertSize = l_insertSize_0, 
                showCaret = v24.props.showCaret, 
                clientSettings = v24.props.clientSettings, 
                bubbleChatMessageProperties = v28.bubbleChatMessageProperties, 
                isTextChatServiceOn = v24.props.isTextChatServiceOn
            });
        end;
    end;
    return v2.createElement("Frame", {
        Visible = v24.props.isVisible, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, v25);
end;
return v7;
