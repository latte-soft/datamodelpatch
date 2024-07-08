local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
if not require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI)() then
    local v2 = require(l_Parent_0.Roact);
    local v3 = require(l_Parent_0.UIBlox);
    local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
    local v5 = require(l_Parent_0.Cryo);
    local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
    local v7 = require(script.Parent.Utils.getBoldTextTheme);
    local l_ConversationCell_0 = require(l_script_FirstAncestor_0.Components.Cells).ConversationCell;
    local v9 = require(script.Parent.ConversationTimestamp);
    local v10 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableAppChatPaddingConsistency);
    local v11 = game:DefineFastFlag("DebugEnableAppChatConversationIdPreview", false);
    local v12 = v2.PureComponent:extend("ConversationEntry");
    v12.defaultProps = {
        entryHeight = 64, 
        conversation = nil, 
        onActivated = nil, 
        boldTitle = true
    };
    v12.init = function(v13)
        v13.getTextWidth = l_memoize_0(function(v14, v15, v16)
            return l_Text_0.GetTextWidth(v14, v15, v16);
        end);
    end;
    v12.render = function(v17)
        return v3.Style.withStyle(function(v18)
            local l_props_0 = v17.props;
            local l_conversation_0 = l_props_0.conversation;
            local v21 = not not l_conversation_0.hasUnreadMessages and v7(v18) or v18;
            local v22 = l_props_0[v2.Children] or {};
            local l_Body_0 = v21.Font.Body;
            local v24 = v21.Font.BaseSize * l_Body_0.RelativeSize;
            local v25 = v17.props.conversation.shortRelativeTime or "";
            local v26 = v17.getTextWidth(v25, l_Body_0.Font, v24);
            return v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_props_0.entryHeight), 
                BackgroundTransparency = 1
            }, {
                cell = v2.createElement(l_ConversationCell_0, {
                    Size = UDim2.new(1, 0, 0, v17.props.entryHeight), 
                    conversation = l_props_0.conversation, 
                    childWidth = v26 + 24, 
                    subTitleText = if not v11 then l_props_0.conversation.lastMessageContent else l_props_0.conversation.id, 
                    onActivated = l_props_0.onActivated, 
                    style = v21, 
                    boldTitle = l_conversation_0.hasUnreadMessages, 
                    hideLeftPadding = v10()
                }, v5.Dictionary.join(v22, {
                    timeStamp = v2.createElement(v9, {
                        currentStyle = v21, 
                        paddingX = 12, 
                        paddingY = 14, 
                        text = v25, 
                        textSize = v24, 
                        textWidth = v26
                    })
                }))
            });
        end);
    end;
    return v12;
else
    return require(script.Parent.ConversationEntry2);
end;
