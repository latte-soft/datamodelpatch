local v0 = require(script:FindFirstAncestor("ProfileQRCode").Parent.React);
local v1 = require(script.Parent.ProfileQRCodeAnalytics);
return function()
    return v0.useContext(v1);
end;
