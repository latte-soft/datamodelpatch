local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_NetworkingUserSettings_0 = v1.NetworkingUserSettings;
local l_NetworkingAccountInformation_0 = v1.NetworkingAccountInformation;
local l_PermissionsProtocol_0 = v1.PermissionsProtocol;
local l_Promise_0 = v1.Promise;
local l_llama_0 = v1.llama;
local v7 = require(l_Parent_0.Utils.contactImporterModalInfo);
local l_updateOptedInUsers_0 = v1.SocialModalsCommon.Utils.updateOptedInUsers;
local v9 = require(l_Parent_0.Utils.contactImporterOSPermissions);
local v10 = require(l_Parent_0.Common.Constants);
local v11 = require(l_Parent_0.Actions.SetContactImporterDisplayLogic);
local function v13(_)
end;
return function(v14, v15, v16)
    return function(v17)
        local _ = {};
        l_Promise_0.all({
            v17:dispatch(l_NetworkingUserSettings_0.GetUserSettings.API({})):andThen(function(v19)
                return l_Promise_0.resolve({
                    canUploadContacts = v19.responseBody.canUploadContacts, 
                    phoneNumberDiscoverability = v19.responseBody.phoneNumberDiscoverability
                }, v13);
            end), 
            v17:dispatch(l_NetworkingAccountInformation_0.GetPhoneInformation.API()):andThen(function(v20)
                return l_Promise_0.resolve({
                    isPhoneVerified = v20.responseBody.isVerified
                }, v13);
            end), 
            v15:hasPermissions({
                l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
            }):andThen(function(v21)
                local v22 = v21 and v21.status == l_PermissionsProtocol_0.Status.AUTHORIZED;
                if not v22 then
                    l_updateOptedInUsers_0:clearLocalStorage(v16);
                end;
                return l_Promise_0.resolve({
                    hasOSPermissions = v22
                });
            end, v13)
        }):andThen(function(v23)
            local v24 = {};
            for _, v26 in v23, nil, nil do
                v24 = l_llama_0.Dictionary.join(v24, v26);
            end;
            local v27 = v7:isUserOptedInLocalStorage(v16, v14);
            v24[v10.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_AGAIN] = v7:shouldUserSeeModalPotentiallyAgain(v16, v14);
            v24[v10.IS_USER_OPTED_IN_LOCAL_STORAGE] = v27;
            v17:dispatch(v11(v24));
            local v28 = v9:getLastOSPermissionSettings(v16);
            local l_hasOSPermissions_0 = v24.hasOSPermissions;
            if v28 ~= l_hasOSPermissions_0 then
                v17:dispatch(l_NetworkingUserSettings_0.UpdateUserSettings.API({
                    canUploadContacts = l_hasOSPermissions_0
                }));
            end;
            v9:updateOSPermissionSettings(v16, l_hasOSPermissions_0);
        end):catch(function()
            v17:dispatch(l_NetworkingUserSettings_0.UpdateUserSettings.API({
                canUploadContacts = false
            }));
        end);
    end;
end;
