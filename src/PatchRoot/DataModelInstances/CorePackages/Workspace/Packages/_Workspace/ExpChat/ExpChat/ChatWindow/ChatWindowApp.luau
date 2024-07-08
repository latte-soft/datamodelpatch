local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local l_List_0 = require(l_Parent_0.llama).List;
local v5 = require(l_script_FirstAncestor_0.memoize);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagShowVerifiedBadgeInNewChat);
local v7 = require(script.Parent.UI.ChatWindow);
local v8 = v2.Component:extend("ChatWindowApp");
v8.defaultProps = {
    LayoutOrder = 1, 
    messages = {}, 
    size = UDim2.fromScale(1, 1)
};
v8.render = function(v9)
    return v2.createElement(v7, {
        LayoutOrder = v9.props.LayoutOrder, 
        messages = v9.props.messages, 
        size = v9.props.size, 
        transparencyValue = v9.props.transparencyValue, 
        textTransparency = v9.props.textTransparency, 
        onHovered = v9.props.onHovered, 
        onUnhovered = v9.props.onUnhovered, 
        mutedUserIds = v9.props.mutedUserIds, 
        verifiedUserIds = if not v6() then nil else v9.props.verifiedUserIds, 
        activateWhisperMode = v9.props.activateWhisperMode, 
        resetTargetChannel = v9.props.resetTargetChannel, 
        visible = v9.props.visible, 
        onAbsoluteSizeChanged = v9.props.onAbsoluteSizeChanged, 
        onAbsolutePositionChanged = v9.props.onAbsolutePositionChanged, 
        chatWindowSettings = v9.props.chatWindowSettings, 
        showTranslationButton = v9.props.showTranslationButton
    });
end;
local v12 = v5(function(v10)
    return l_List_0.map(v10.windowMessagesInOrder, function(v11)
        return v10.byMessageId[v11];
    end);
end);
return v3.connect(function(v13)
    return {
        messages = v12(v13.Messages), 
        mutedUserIds = v13.MutedUsers, 
        verifiedUserIds = v13.VerifiedUsers
    };
end)(v8);
