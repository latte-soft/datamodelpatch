local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactUtils);
local v3 = require(l_Parent_0.React);
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_memo_0 = v3.memo;
local l_useMemo_0 = v3.useMemo;
local v7 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v10 = require(l_Parent_0.Cryo);
local v11 = require(script.Parent.Utils.getBoldTextTheme);
local l_ConversationCell_0 = require(l_script_FirstAncestor_0.Components.Cells).ConversationCell;
local v13 = require(script.Parent.ConversationTimestamp);
local v14 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableAppChatPaddingConsistency);
local v15 = game:DefineFastFlag("DebugEnableAppChatConversationIdPreview", false);
local _ = require(l_script_FirstAncestor_0.types);
local v17 = {
    entryHeight = 64, 
    boldTitle = true
};
return l_memo_0(function(v18)
    local v19 = v10.Dictionary.join(v17, v18);
    local v20 = l_useStyle_0();
    local l_conversation_0 = v19.conversation;
    local v22 = l_conversation_0.hasUnreadMessages and not v7(l_conversation_0);
    local v23 = if not v22 then v20 else v11(v20);
    local l_Body_0 = v23.Font.Body;
    local v25 = v23.Font.BaseSize * l_Body_0.RelativeSize;
    local v26 = v19.conversation.shortRelativeTime or "";
    local v27 = l_useMemo_0(function()
        return l_Text_0.GetTextWidth(v26, l_Body_0.Font, v25);
    end, l_dependencyArray_0(v26, l_Body_0.Font, v25));
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v19.entryHeight), 
        BackgroundTransparency = 1
    }, {
        cell = v3.createElement(l_ConversationCell_0, {
            Size = UDim2.new(1, 0, 0, v19.entryHeight), 
            conversation = v19.conversation, 
            childWidth = v27 + 24, 
            subTitleText = if not v15 then v19.conversation.lastMessageContent else v19.conversation.id, 
            onActivated = v19.onActivated, 
            style = v23, 
            boldTitle = v22, 
            hideLeftPadding = v14()
        }, v10.Dictionary.join(v19.children or {}, {
            timeStamp = v3.createElement(v13, {
                currentStyle = v23, 
                paddingX = 12, 
                paddingY = 14, 
                text = v26, 
                textSize = v25, 
                textWidth = v27
            })
        }))
    });
end);
