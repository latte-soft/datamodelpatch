local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxPresence");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Actions.ReceivedUserPresence);
local v5 = require(l_script_FirstAncestor_0.Models.PresenceModel);
local v6 = {};
return function(v7)
    return v2.createReducer(v6, {
        [v4.name] = function(v8, v9)
            local l_userId_0 = v9.payload.userId;
            local l_payload_0 = v9.payload;
            assert(v5.isValid(l_payload_0));
            return v3.Dictionary.join(v8, {
                [l_userId_0] = v5.format(l_payload_0)
            });
        end, 
        [v7.presenceNetworking.GetPresencesFromUserIds.Succeeded.name] = function(v12, v13)
            local l_userPresences_0 = v13.responseBody.userPresences;
            local v15 = {};
            for _, v17 in ipairs(l_userPresences_0) do
                v15[tostring(v17.userId)] = v5.format(v17);
            end;
            return v3.Dictionary.join(v12, v15);
        end
    });
end;
