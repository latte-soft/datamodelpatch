local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_NetworkingFriends_0 = v1.NetworkingFriends;
local _ = require(l_Parent_0.Common.LocalTypes);
local l_NetworkingContacts_0 = v1.NetworkingContacts;
local l_NetworkingUserSettings_0 = v1.NetworkingUserSettings;
local l_RoduxContacts_0 = v1.RoduxContacts;
local l_Promise_0 = v1.Promise;
local l_llama_0 = v1.llama;
return function(v9)
    return {
        requestFriendship = function(v10)
            return v9(l_NetworkingFriends_0.RequestFriendshipFromContactId.API(v10));
        end, 
        findContacts = function()
            return v9(l_NetworkingContacts_0.FindContactFriends.API()):andThen(function(v11)
                return v11.responseBody.userContactIds;
            end);
        end, 
        getContactEntities = function(v12)
            if not l_llama_0.isEmpty(v12) and v12 then
                return v9(l_NetworkingContacts_0.GetContactEntitiesByContactId.API(v12));
            else
                return l_Promise_0.resolve();
            end;
        end, 
        uploadContacts = function(v13)
            return v9(l_NetworkingContacts_0.UploadContactsByUser.API(v13));
        end, 
        updateUserSettings = function()
            return v9(l_NetworkingUserSettings_0.UpdateUserSettings.API({
                canUploadContacts = true
            }));
        end, 
        deviceContactsReceived = function(v14)
            return v9(l_RoduxContacts_0.Actions.DeviceContactsReceived(v14));
        end, 
        requestSent = function(v15)
            return v9(l_RoduxContacts_0.Actions.RequestSent({
                id = v15
            }));
        end
    };
end;
