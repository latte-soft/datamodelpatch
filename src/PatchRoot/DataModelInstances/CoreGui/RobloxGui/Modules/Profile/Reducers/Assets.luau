local v0 = require(script:FindFirstAncestor("Profile").dependencies);
local l_Rodux_0 = v0.Rodux;
local l_Dash_0 = v0.Dash;
local v3 = require(script.Parent.Models.AssetInfo);
return l_Rodux_0.createReducer({}, {
    [v0.NetworkingCurrentlyWearing.GetItemDetails.Succeeded.name] = function(v4, v5)
        local v6 = {};
        for _, v8 in ipairs(v5.responseBody.data) do
            local v9 = v3.fromAsset(v8);
            v6[v9.id] = v9;
        end;
        return l_Dash_0.join(v4, v6);
    end
});
