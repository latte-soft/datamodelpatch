local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Dash_0 = v1.Dash;
return v1.Rodux.createReducer({}, {
    [require(l_Parent_0.Networking.GetContactAvatar).Succeeded.name] = function(v3, v4)
        local v5 = {};
        for _, v7 in ipairs(v4.responseBody.data) do
            v5[tostring(v7.targetId)] = v7;
        end;
        return l_Dash_0.join(v3, v5);
    end
});
