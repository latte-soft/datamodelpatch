local v0 = require(script:FindFirstAncestor("AppChat").Flags.getFFlagChatLandingScreenWithSwitchNavigatorFix);
local _ = nil;
if not v0() then
    return (require(script.Parent.ChatLandingScreenWithSwitchNavigatorOld));
else
    return (require(script.Parent.ChatLandingScreenWithSwitchNavigatorNew));
end;
