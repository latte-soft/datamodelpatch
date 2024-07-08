local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_NetworkingContacts_0 = v1.NetworkingContacts;
local v3 = require(l_Parent_0.Thunks.FetchProfilePageData);
local l_RetrievalStatus_0 = v1.UIBlox.App.Loading.Enum.RetrievalStatus;
local v5 = require(l_Parent_0.Reducers.Actions.SetProfilePageDataStatus);
return function(v6)
    return {
        fetchProfilePageData = function(v7)
            return v6(v3(v7));
        end, 
        resetProfilePageDataStatus = function(v8)
            v6(v5(v8, l_RetrievalStatus_0.NotStarted.rawValue()));
        end, 
        getContactEntities = function(v9)
            return v6(l_NetworkingContacts_0.GetContactEntitiesByContactId.API(v9));
        end
    };
end;
