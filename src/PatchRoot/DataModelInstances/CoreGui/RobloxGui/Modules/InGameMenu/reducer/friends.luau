local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Cryo_0 = v0.Cryo;
return v0.Rodux.createReducer({}, {
    [require(script.Parent.Parent.Actions.SetFriendStatus).name] = function(v2, v3)
        return l_Cryo_0.Dictionary.join(v2, {
            [v3.userId] = v3.friendStatus or l_Cryo_0.None
        });
    end
});
