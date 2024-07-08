local l_Parent_0 = script.Parent.Parent;
local l_Types_0 = l_Parent_0.Types;
local v2 = require(l_Parent_0.Reducers.isPhoneVerified);
local v3 = require(l_Parent_0.Reducers.userSettings);
local v4 = require(l_Parent_0.Reducers.userSettingsMetadata);
local _ = require(l_Types_0.ReducerTypes);
local v6 = {
    isPhoneVerified = false, 
    userSettings = {}, 
    userSettingsMetadata = {}
};
return function(v7)
    return function(v8, v9)
        local v10 = v8 or v6;
        return {
            isPhoneVerified = v2(v7)(v10.isPhoneVerified, v9), 
            userSettings = v3(v7)(v10.userSettings, v9), 
            userSettingsMetadata = v4(v7)(v10.userSettingsMetadata, v9)
        };
    end;
end;
