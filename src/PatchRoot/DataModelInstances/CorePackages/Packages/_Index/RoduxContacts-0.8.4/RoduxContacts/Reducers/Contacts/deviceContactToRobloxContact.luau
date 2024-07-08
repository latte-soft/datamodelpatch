local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Types_0 = l_Parent_0.Types;
local v3 = require(l_Parent_1.Rodux);
local v4 = require(l_Parent_1.Dash);
local _ = require(l_Types_0.ActionTypes);
local _ = require(l_Types_0.ReducerTypes);
local v7 = require(l_Parent_0.getDeepValue);
local v8 = {};
return function(v9)
    return v3.createReducer(v8, {
        [v9.networkingContacts.UploadContactsByUser.Succeeded.name] = function(_, v11)
            if v7(v11, "responseBody.matchedContactFields") then
                local v12 = {};
                v4.forEach(v11.responseBody.matchedContactFields, function(v13)
                    if not v12[v13.idAssignedByFE] then
                        v12[v13.idAssignedByFE] = {};
                    end;
                    v12[v13.idAssignedByFE][v13.userContactId] = true;
                end);
                return v12;
            else
                return {};
            end;
        end
    });
end;
