local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
return (v1.createReducer({}, {
    [require(l_Actions_0.AddPlayer).name] = function(v4, v5)
        return v2.Dictionary.join(v4, {
            [v5.userId] = {}
        });
    end, 
    [require(l_Actions_0.RemovePlayer).name] = function(v6, v7)
        return v2.Dictionary.join(v6, {
            [v7.userId] = v2.None
        });
    end, 
    [require(l_Actions_0.SetPlayerLeaderstat).name] = function(v8, v9)
        if v8[v9.userId] == nil then
            return v8;
        else
            return v2.Dictionary.join(v8, {
                [v9.userId] = v2.Dictionary.join(v8[v9.userId], {
                    [v9.leaderstat] = v9.value
                })
            });
        end;
    end
}));
