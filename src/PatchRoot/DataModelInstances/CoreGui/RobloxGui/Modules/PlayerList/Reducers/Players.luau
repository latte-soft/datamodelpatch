local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
return (v1.createReducer({}, {
    [require(l_Actions_0.AddPlayer).name] = function(v4, v5)
        return v2.List.join(v4, {
            v5.player
        });
    end, 
    [require(l_Actions_0.RemovePlayer).name] = function(v6, v7)
        return v2.List.filter(v6, function(v8)
            return v8 ~= v7.player;
        end);
    end
}));
