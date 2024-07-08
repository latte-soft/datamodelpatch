local l_NetworkingUserSettings_0 = require(script.Parent.Parent.dependencies).NetworkingUserSettings;
return function()
    return function(v1)
        v1:dispatch(l_NetworkingUserSettings_0.GetUserSettingsMetadata.API());
    end;
end;
