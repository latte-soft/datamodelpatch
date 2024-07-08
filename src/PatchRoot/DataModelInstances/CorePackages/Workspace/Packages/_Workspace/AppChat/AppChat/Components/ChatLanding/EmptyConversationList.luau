local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v5 = require(script.Parent.ChatDisabledIndicator);
local v6 = v1.PureComponent:extend("EmptyConversationList");
v6.defaultProps = {
    chatEnabled = false, 
    navigateToPrivacy = function()
    end, 
    makeFriendsToChatKey = "Feature.Chat.Message.MakeFriendsToChat", 
    privacyButtonKey = "Feature.Chat.Label.PrivacySettings", 
    turnOnChatKey = "Feature.Chat.Message.TurnOnChat"
};
v6.didMount = function(v7)
    if not (not l_default_0.isEnabled() or not v7.props.fireRenderEvent) then
        v7.props.fireRenderEvent();
    end;
end;
v6.render = function(v8)
    return l_withLocalization_0({
        privacyButtonText = v8.props.privacyButtonKey, 
        chatDisabledText = not not v8.props.chatEnabled and v8.props.makeFriendsToChatKey or v8.props.turnOnChatKey
    })(function(v9)
        return l_withStyle_0(function(v10)
            return v1.createElement("Frame", {
                BackgroundColor3 = v10.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v10.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                ChatDisabledIndicator = v1.createElement(v5, {
                    chatEnabled = v8.props.chatEnabled, 
                    navigateToPrivacy = v8.props.navigateToPrivacy, 
                    chatDisabledText = v9.chatDisabledText, 
                    privacyButtonText = v9.privacyButtonText
                })
            });
        end);
    end);
end;
return v6;
