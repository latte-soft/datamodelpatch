local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Types_0 = l_Parent_0.Types;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Types_0.ActionTypes);
local _ = require(l_Types_0.ReducerTypes);
local v5 = require(l_Parent_1.Dash);
return function(v6, v7)
    local l_userContactsEntities_0 = v7.responseBody.userContactsEntities;
    local v9 = {};
    v5.forEach(l_userContactsEntities_0, function(v10)
        v9[v10.id] = {
            contactName = v10.name, 
            mutualContacts = v10.mutualContacts, 
            avatarAssetHashId = v10.avatarAssetHashId
        };
    end);
    return v5.join(v6, v9);
end;
