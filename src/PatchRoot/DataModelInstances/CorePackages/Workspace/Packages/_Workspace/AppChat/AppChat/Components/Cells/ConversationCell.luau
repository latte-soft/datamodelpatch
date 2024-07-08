local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v6 = require(l_script_FirstAncestor_0.SocialLibraries);
local l_TestStyle_0 = v6.Components.TestStyle;
local l_getConversationDisplayTitle_0 = v6.Conversation.getConversationDisplayTitle;
local v9 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local v10 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v11 = require(script.Parent.PresenceBubbleCellStyled);
local v12 = {
    chatIsUnfilteredKey = "Feature.Chat.Message.ChatIsUnfiltered", 
    boldTitle = true, 
    childWidth = 0, 
    isLoading = false, 
    Size = UDim2.new(1, 0, 1, 0), 
    hideLeftPadding = false, 
    style = l_TestStyle_0
};
return v3.memo(function(v13)
    local v14 = v2.Dictionary.join(v12, v13);
    local l_conversation_0 = v14.conversation;
    local v16 = (v10() and l_conversation_0) and v9(l_conversation_0);
    local v17 = v3.useCallback(function()
        if v14.onActivated then
            v14.onActivated(v14.conversation);
        end;
    end, l_dependencyArray_0(v14.onActivated));
    local v18 = l_getConversationDisplayTitle_0(l_conversation_0);
    local v19 = if not v14.subTitleText then nil else v14.subTitleText:split("\n");
    local v20 = not not v19 and v19[1] or "";
    local v21 = {
        subTitleText = "Upgraded conversation"
    };
    if v16 then
        v20 = v21.subTitleText;
    end;
    return v3.createElement(v11, {
        boldTitle = v14.boldTitle, 
        style = v14.style, 
        childWidth = v14.childWidth, 
        onActivated = v17, 
        onCircleActivated = v14.onCircleActivated, 
        subTitleText = v20, 
        subTitleIcon = if not v16 then nil else l_Images_0["icons/status/private_small"], 
        secondaryTitleText = v14.secondaryTitleText, 
        Size = v14.Size, 
        isLoading = v14.isLoading, 
        avatarCirclePresenceImage = l_conversation_0.presenceImage, 
        titleText = v18, 
        thumbnails = l_conversation_0.thumbnails, 
        hideLeftPadding = v14.hideLeftPadding
    }, v14.children or {});
end);
