local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Cryo_0 = v0.Cryo;
return v0.Rodux.createReducer({
    name = "Game", 
    description = ""
}, {
    [require(script.Parent.Parent.Actions.SetGameNameAndDescription).name] = function(v2, v3)
        return l_Cryo_0.Dictionary.join(v2, {
            name = v3.gameName, 
            description = v3.gameDescription
        });
    end
});
