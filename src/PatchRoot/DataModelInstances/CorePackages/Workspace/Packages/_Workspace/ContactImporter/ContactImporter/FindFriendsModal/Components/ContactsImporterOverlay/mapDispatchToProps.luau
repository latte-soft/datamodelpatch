local v0 = require(script.Parent.Parent.Parent.Parent.dependencies);
local l_NetworkingUserSettings_0 = v0.NetworkingUserSettings;
local l_UpdateContactImporterModalLogic_0 = v0.SocialModalsCommon.Actions.UpdateContactImporterModalLogic;
return function(v3)
    return {
        updateUserSettings = function()
            return v3(l_NetworkingUserSettings_0.UpdateUserSettings.API({
                canUploadContacts = true
            }));
        end, 
        hideContactImporterModal = function()
            return v3(l_UpdateContactImporterModalLogic_0({
                hasOSPermissions = true, 
                shouldShowContactImporterUpsellModal = false
            }));
        end, 
        getUserSettingsMetadata = function()
            return v3(l_NetworkingUserSettings_0.GetUserSettingsMetadata.API());
        end
    };
end;
