local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local v1 = require(l_script_FirstAncestor_0.Networking.networkRequests.createGetUserSettingsPlatform);
local v2 = require(l_script_FirstAncestor_0.Networking.networkRequests.createUpdateUserSettingsPlatform);
return function(v3)
    return {
        GetUserSettingsPlatform = v1(v3), 
        UpdateUserSettingsPlatform = v2(v3)
    };
end;
