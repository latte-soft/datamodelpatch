local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Roact);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local v6 = if not require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI)() then require(l_script_FirstAncestor_0.SocialLibraries).Components.PlainTextAutomaticSize else require(script.Parent.PlainTextAutomaticSize);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v8 = require(script.Parent.AssetCardTempAutomaticSize);
local v9 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
local v10 = require(script.Parent.ChatMessageContainerAutomaticSize);
local v11 = require(script.Parent.Logger);
local l_pruneConsecutiveNewLines_0 = require(l_script_FirstAncestor_0.SocialLibraries).Utils.pruneConsecutiveNewLines;
local v13 = {
    [v9.PlainText] = {
        component = v6, 
        name = "PlainText", 
        paddingOffset = 0
    }, 
    [v9.Link] = {
        component = v8, 
        name = "AssetCard", 
        paddingOffset = 2
    }
};
local v14 = v3.PureComponent:extend("ChatMessage");
v14.defaultProps = {
    additionalProps = {
        placeId = nil, 
        universeId = nil, 
        senderUserId = nil, 
        onDetailsOpened = function()
        end, 
        openGameDetailsPage = function()
        end
    }, 
    BackgroundColor3 = nil, 
    content = "", 
    debugElement = nil, 
    displayName = nil, 
    failed = false, 
    filteredForReceivers = false, 
    isIncoming = false, 
    isNewSender = false, 
    isSending = false, 
    isUnfiltered = false, 
    messageType = nil, 
    moderated = false, 
    parentWidth = 0, 
    senderUserId = nil, 
    sent = nil, 
    showDateTime = false, 
    thumbnail = nil, 
    Transparency = nil, 
    wideMode = false, 
    viewProfileOnAvatarPressed = true, 
    messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.", 
    messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.", 
    unknownUserText = "PLACEHOLDER unknown user"
};
v14.init = function(v15)
    v15.getModeratedText = function(v16)
        return string.gsub(v16, "[^%s]", "#");
    end;
    v15.messageMaxWidth = function(v17, v18)
        local v19 = 128;
        if v17 then
            v19 = v19 + 112;
        end;
        return v18 - v19;
    end;
    v15.getBubbleMaxWidth = l_memoize_0(function(v20, v21, v22, v23)
        return l_Text_0.GetTextBounds(v21, v23, v22, Vector2.new(v20, 10000)).X + 20;
    end);
end;
v14.render = function(v24)
    local v25 = v13[v24.props.messageType];
    local v26 = v24.messageMaxWidth(v24.props.wideMode, v24.props.parentWidth);
    if v25 then
        local v27 = l_pruneConsecutiveNewLines_0(v24.props.content);
        local v28 = not not v24.props.moderated and v24.getModeratedText(v27) or v27;
        return l_withStyle_0(function(v29)
            local l_Body_0 = v29.Font.Body;
            local v31 = v29.Font.BaseSize * l_Body_0.RelativeSize;
            return v3.createElement(v10, v2.Dictionary.join(v24.props, {
                messageMaxWidth = v26, 
                messageTypePaddingOffset = v25.paddingOffset, 
                renderMessage = function(v32)
                    return v3.createFragment({
                        [v25.name] = v3.createElement(v25.component, v2.Dictionary.join({
                            additionalProps = v24.props.additionalProps, 
                            font = l_Body_0.Font, 
                            hasTail = v24.props.isNewSender, 
                            innerPadding = 10, 
                            isIncoming = v24.props.isIncoming, 
                            isPending = (v24.props.isSending or v24.props.moderated) or v24.props.failed, 
                            isUnfiltered = v24.props.isUnfiltered, 
                            maxWidth = v24.getBubbleMaxWidth(v26, v28, v31, l_Body_0.Font), 
                            messageDefaultNoticeText = v24.props.messageDefaultNoticeText, 
                            messageModeratedNoticeText = v24.props.messageModeratedNoticeText, 
                            parentWidth = v24.props.parentWidth, 
                            text = v28, 
                            textSize = v31, 
                            wideMode = v24.props.wideMode, 
                            [v3.Change.AbsoluteSize] = v24.messageSizeChanged
                        }, v32 or {}))
                    });
                end
            }));
        end);
    else
        v11:warning("ChatMessage doesn't support messageType: {}", v24.props.messageType);
        return nil;
    end;
end;
return v14;
