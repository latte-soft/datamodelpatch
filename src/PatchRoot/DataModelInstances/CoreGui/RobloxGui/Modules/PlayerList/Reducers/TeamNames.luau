local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
return (v1.createReducer({}, {
    [require(l_Actions_0.AddTeam).name] = function(v4, v5)
        return v2.Dictionary.join(v4, {
            [v5.team] = v5.team.Name
        });
    end, 
    [require(l_Actions_0.RemoveTeam).name] = function(v6, v7)
        return v2.Dictionary.join(v6, {
            [v7.team] = v2.None
        });
    end, 
    [require(l_Actions_0.SetTeamName).name] = function(v8, v9)
        return v2.Dictionary.join(v8, {
            [v9.team] = v9.teamName
        });
    end
}));
