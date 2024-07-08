local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_default_0 = require(l_script_FirstAncestor_0.Parent.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableAppChatTabBarVisibilityPrevention);
game:DefineFastFlag("EnableNewChatTabExperimentAndroidBackButtonFix", false);
return function()
    return ((game:GetFastFlag("EnableNewChatTabExperimentAndroidBackButtonFix") and v2()) and l_default_0.isEnabled()) and l_default_0:getConnectTabLeadsToChatTab();
end;
