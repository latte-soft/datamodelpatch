local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
return (v1.createReducer({}, {
    [require(l_Actions_0.AddPlayerToTeam).name] = function(v4, v5)
        return v2.Dictionary.join(v4, {
            [v5.player.UserId] = v5.team
        });
    end, 
    [require(l_Actions_0.RemovePlayerFromTeam).name] = function(v6, v7)
        return v2.Dictionary.join(v6, {
            [v7.player.UserId] = v2.None
        });
    end, 
    [require(l_Actions_0.RemovePlayer).name] = function(v8, v9)
        return v2.Dictionary.join(v8, {
            [v9.player.UserId] = v2.None
        });
    end
}));
