local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Cryo);
local v2 = require(l_Modules_0.LuaApp.TestHelpers.MockRequest);
local v3 = require(l_Modules_0.AvatarExperienceRhodiumTest.Helpers.getMockedEndpointsData);
local v4 = require(l_Modules_0.AvatarExperienceRhodiumTest.Helpers.getMockedAttributionEndpointsData);
return function(v5)
    return (v2.mockEndpoints(v1.List.join(v3(v5), v4(v5))));
end;
