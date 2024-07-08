local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Rodux);
local _ = require(l_Parent_0.Types.ReducerTypes);
local v3 = {
    prefillDiscoverabilitySetting = false
};
return function(v4)
    return v1.createReducer(v3, {
        [v4.networkingUserSettings.GetUserSettingsMetadata.Succeeded.name] = function(_, v6)
            return {
                prefillDiscoverabilitySetting = v6.responseBody and v6.responseBody.prefillDiscoverabilitySetting
            };
        end
    });
end;
