local v0 = require(script:FindFirstAncestor("Profile").dependencies);
local l_Rodux_0 = v0.Rodux;
local l_Dash_0 = v0.Dash;
return l_Rodux_0.createReducer({}, {
    [v0.NetworkingCurrentlyWearing.GetCurrentlyWearing.Succeeded.name] = function(v3, v4)
        return l_Dash_0.join(v3, {
            [tostring(v4.namedIds.users)] = l_Dash_0.map(v4.responseBody.assetIds, tostring)
        });
    end
});
