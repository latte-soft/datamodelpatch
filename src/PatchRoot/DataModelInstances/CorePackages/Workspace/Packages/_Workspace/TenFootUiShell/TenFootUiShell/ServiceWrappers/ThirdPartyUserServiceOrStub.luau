local v0 = {
    ActiveUserSignedOut = require(script:FindFirstAncestor("TenFootUiShell").Parent.AppCommonLib).Signal.new()
};
local v1 = nil;
pcall(function()
    v1 = game:GetService("ThirdPartyUserService");
end);
return v1 or v0;
