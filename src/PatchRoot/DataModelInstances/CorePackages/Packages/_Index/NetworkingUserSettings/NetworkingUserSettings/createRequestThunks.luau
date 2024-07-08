local l_Parent_0 = script.Parent;
local l_networkRequests_0 = l_Parent_0.networkRequests;
local v2 = require(l_networkRequests_0.createGetUserSettings);
local v3 = require(l_networkRequests_0.createUpdateUserSettings);
local v4 = require(l_networkRequests_0.createGetUserSettingsMetadata);
local _ = require(l_Parent_0.Types.networkRequestsTypes);
return function(v6)
    return {
        GetUserSettings = v2(v6), 
        UpdateUserSettings = v3(v6), 
        GetUserSettingsMetadata = v4(v6)
    };
end;
