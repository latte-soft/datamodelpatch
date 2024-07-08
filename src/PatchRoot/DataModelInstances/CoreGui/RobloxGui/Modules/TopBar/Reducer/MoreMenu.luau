local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
return (v1.createReducer({
    open = false, 
    backpackOpen = false, 
    leaderboardOpen = false, 
    emotesOpen = false, 
    emotesEnabled = true
}, {
    [require(l_Actions_0.SetMoreMenuOpen).name] = function(v4, v5)
        return v2.Dictionary.join(v4, {
            open = v5.open
        });
    end, 
    [require(l_Actions_0.SetBackpackOpen).name] = function(v6, v7)
        return v2.Dictionary.join(v6, {
            open = false, 
            backpackOpen = v7.open
        });
    end, 
    [require(l_Actions_0.SetEmotesOpen).name] = function(v8, v9)
        return v2.Dictionary.join(v8, {
            open = false, 
            emotesOpen = v9.open
        });
    end, 
    [require(l_Actions_0.SetEmotesEnabled).name] = function(v10, v11)
        return v2.Dictionary.join(v10, {
            emotesEnabled = v11.enabled
        });
    end, 
    [require(l_Actions_0.SetLeaderboardOpen).name] = function(v12, v13)
        return v2.Dictionary.join(v12, {
            open = false, 
            leaderboardOpen = v13.open
        });
    end
}));
