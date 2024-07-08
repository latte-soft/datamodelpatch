local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_llama_0 = v1.llama;
local l_t_0 = v1.t;
local v5 = require(l_script_FirstAncestor_0.Friends.filterToPresence);
local v6 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v7 = require(l_script_FirstAncestor_0.Friends.getCorrectUserPresence);
return function(v8, v9)
    assert(l_t_0.table(v8), "friends should be a table");
    assert(l_t_0.string(v9), "filter should be a string");
    return l_llama_0.List.filter(v8, function(v10)
        if v9 == v6.Inactive then
            return v10.isInactiveFriend;
        else
            return l_llama_0.List.includes(v5(v9), v7(v10) or l_PresenceType_0.Offline);
        end;
    end);
end;
