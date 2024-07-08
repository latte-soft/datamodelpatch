local l_default_0 = require(script:FindFirstAncestor("AppChat").Parent.SocialCommon).Experiments.NewChatTabExperimentation.default;
game:DefineFastFlag("EnableAppChatTabBarVisibilityPrevention", false);
return function()
    return (game:GetFastFlag("EnableAppChatTabBarVisibilityPrevention") and l_default_0.isEnabled()) and l_default_0:getConnectTabLeadsToChatTab();
end;
