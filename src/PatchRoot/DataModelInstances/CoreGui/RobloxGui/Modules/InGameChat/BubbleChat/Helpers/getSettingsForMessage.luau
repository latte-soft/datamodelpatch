local v0 = require(game:GetService("CorePackages").Packages.t);
local v1 = require(script.Parent.Parent.Types);
local v2 = require(script.Parent.maybeAssert);
local _ = script.Parent.Parent.Parent.Parent.Flags;
return function(v4, v5)
    v2(v1.IChatSettings(v4));
    v2(v0.optional(v1.IMessage)(v5));
    local l_UserSpecificSettings_0 = v4.UserSpecificSettings;
    if l_UserSpecificSettings_0 and v5 then
        return (l_UserSpecificSettings_0[v5.userId] or v5.adornee and l_UserSpecificSettings_0[v5.adornee:GetFullName()]) or v4;
    else
        return v4;
    end;
end;
