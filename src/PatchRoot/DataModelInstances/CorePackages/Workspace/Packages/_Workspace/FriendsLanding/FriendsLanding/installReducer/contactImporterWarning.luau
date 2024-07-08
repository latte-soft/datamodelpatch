local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local l_Dash_0 = v0.Dash;
local l_llama_0 = v0.llama;
local l_Rodux_0 = v0.Rodux;
local l_FriendsNetworking_0 = v0.FriendsNetworking;
local l_FriendRequestCreated_0 = v0.RoduxFriends.Actions.FriendRequestCreated;
local v6 = require(script.Parent.Actions.ContactImporterWarningSeen);
local l_ContactImporterConstants_0 = v0.ContactImporterConstants;
local v8 = {
    contactImporterFriendRequests = {}, 
    seenContactImporterFriendRequest = false
};
local function v13(v9, v10)
    return {
        seenContactImporterFriendRequest = v9.seenContactImporterFriendRequest, 
        contactImporterFriendRequests = l_llama_0.Dictionary.filter(v9.contactImporterFriendRequests, function(_, v12)
            return not l_Dash_0.includes(v10, v12);
        end)
    };
end;
return l_Rodux_0.createReducer(v8, {
    [l_FriendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v14, v15)
        return (v13(v14, v15.ids));
    end, 
    [l_FriendsNetworking_0.DeclineFriendRequestFromUserId.Succeeded.name] = function(v16, v17)
        return (v13(v16, v17.ids));
    end, 
    [l_FriendRequestCreated_0.name] = function(v18, v19)
        local l_id_0 = v19.id;
        if v19.originSourceType == l_ContactImporterConstants_0.PHONE_CONTACT_IMPORTER then
            return l_llama_0.Dictionary.join(v18, {
                contactImporterFriendRequests = l_llama_0.Dictionary.join(v18.contactImporterFriendRequests, {
                    [tostring(l_id_0)] = true
                })
            });
        else
            return v18;
        end;
    end, 
    [l_FriendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v21, v22)
        local l_data_0 = v22.responseBody.data;
        local v24 = {};
        for _, v26 in pairs(l_data_0) do
            if v26.friendRequest.originSourceType == l_ContactImporterConstants_0.PHONE_CONTACT_IMPORTER then
                v24[tostring(v26.id)] = true;
            end;
        end;
        return l_llama_0.Dictionary.join(v21, {
            contactImporterFriendRequests = l_llama_0.Dictionary.join(v21.contactImporterFriendRequests, v24)
        });
    end, 
    [v6.name] = function(v27, _)
        if l_llama_0.isEmpty(v27.contactImporterFriendRequests) then
            return v27;
        else
            return l_llama_0.Dictionary.join(v27, {
                seenContactImporterFriendRequest = true
            });
        end;
    end
});
