local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local l_NetworkStatus_0 = v1.RoduxNetworking.Enum.NetworkStatus;
local l_NetworkingFriends_0 = v1.NetworkingFriends;
local l_NetworkingContacts_0 = v1.NetworkingContacts;
local l_Selectors_0 = v1.RoduxContacts.Selectors;
local l_memoize_0 = v1.memoize;
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local v9 = require(script.Parent.getDeviceContacts);
local v10 = require(script.Parent.decorateMatchedContact);
return function(v11)
    local l_LocalUserId_0 = v11.LocalUserId;
    local v13 = l_getDeepValue_0(v11, l_RODUX_KEY_0 .. ".Contacts");
    local v14 = l_memoize_0(v9)(v13);
    local v15 = v10(l_Selectors_0.sortContacts(v11), v13);
    local v16 = true;
    if l_NetworkingFriends_0.RequestFriendshipFromContactId.getStatus(v11, l_LocalUserId_0) ~= l_NetworkStatus_0.Fetching then
        v16 = true;
        if l_NetworkingContacts_0.FindContactFriends.getStatus(v11, l_LocalUserId_0) ~= l_NetworkStatus_0.Fetching then
            v16 = true;
            if l_NetworkingContacts_0.GetContactEntitiesByContactId.getStatus(v11, l_LocalUserId_0) ~= l_NetworkStatus_0.Fetching then
                v16 = l_NetworkingContacts_0.UploadContactsByUser.getStatus(v11, l_LocalUserId_0) == l_NetworkStatus_0.Fetching;
            end;
        end;
    end;
    return {
        localUserId = v11.LocalUserId, 
        matchedContacts = v15, 
        deviceContacts = v14, 
        screenSize = v11.ScreenSize, 
        isFetching = v16
    };
end;
