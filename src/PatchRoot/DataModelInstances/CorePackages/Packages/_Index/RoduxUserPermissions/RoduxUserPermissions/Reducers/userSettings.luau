local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Rodux);
local _ = require(l_Parent_0.Types.ReducerTypes);
local v3 = {
    canUploadContacts = nil
};
return function(v4)
    local l_networkingUserSettings_0 = v4.networkingUserSettings;
    return v1.createReducer(v3, {
        [l_networkingUserSettings_0.GetUserSettings.Succeeded.name] = function(_, v7)
            return {
                canUploadContacts = v7.responseBody and v7.responseBody.canUploadContacts
            };
        end, 
        [l_networkingUserSettings_0.UpdateUserSettings.Succeeded.name] = function(v8, v9)
            if v9.postBody and v9.postBody.canUploadContacts ~= nil then
                return {
                    canUploadContacts = v9.postBody.canUploadContacts
                };
            else
                return v8;
            end;
        end
    });
end;
