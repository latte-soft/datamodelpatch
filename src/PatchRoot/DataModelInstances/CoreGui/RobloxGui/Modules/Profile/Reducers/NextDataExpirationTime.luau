local v0 = require(script:FindFirstAncestor("Profile").dependencies);
local l_Dash_0 = v0.Dash;
return v0.Rodux.createReducer({}, {
    [require(script.Parent.Actions.SetNextDataExpirationTime).name] = function(v2, v3)
        return l_Dash_0.join(v2, {
            [v3.key] = v3.nextDataExpirationTime
        });
    end
});
