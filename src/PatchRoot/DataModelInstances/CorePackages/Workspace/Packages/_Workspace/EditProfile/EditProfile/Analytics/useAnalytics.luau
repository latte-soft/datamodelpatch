local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(script.Parent.EditProfileAnalyticsContext);
local v2 = require(l_Parent_0.React);
return function()
    return v2.useContext(v1);
end;
