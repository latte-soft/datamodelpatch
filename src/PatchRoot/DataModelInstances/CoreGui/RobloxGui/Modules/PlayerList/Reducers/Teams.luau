local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
return (v1.createReducer({}, {
    [require(l_Actions_0.AddTeam).name] = function(v4, v5)
        return v2.List.join(v4, {
            v5.team
        });
    end, 
    [require(l_Actions_0.RemoveTeam).name] = function(v6, v7)
        return v2.List.filter(v6, function(v8)
            return v8 ~= v7.team;
        end);
    end
}));
