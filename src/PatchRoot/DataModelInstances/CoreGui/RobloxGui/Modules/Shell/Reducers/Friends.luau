local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Shell.Actions.SetFriendsData);
local v2 = require(l_Modules_0.Common.Immutable);
return function(v3, v4)
    v3 = v3 or {
        initialized = false, 
        data = {}
    };
    assert(v3, "");
    if v4.type == v1.name then
        if v4.data then
            local v5 = {};
            for v6 in ipairs(v4.data) do
                table.insert(v5, (v2.JoinDictionaries(v4.data[v6])));
            end;
            return {
                initialized = true, 
                data = v5
            };
        else
            return {
                initialized = false, 
                data = {}
            };
        end;
    else
        return v3;
    end;
end;
