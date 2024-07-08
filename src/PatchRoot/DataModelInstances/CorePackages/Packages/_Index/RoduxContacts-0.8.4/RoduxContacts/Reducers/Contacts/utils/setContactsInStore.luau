local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Types_0 = l_Parent_0.Types;
local _ = require(l_Types_0.ReducerTypes);
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Types_0.ActionTypes);
local v5 = require(l_Parent_1.Dash);
return function(v6)
    local l_userContactIds_0 = v6.responseBody.userContactIds;
    local v8 = {};
    v5.forEach(l_userContactIds_0, function(v9)
        v8[v9] = {};
    end);
    return v8;
end;
