local v0 = require(game:GetService("CorePackages").Rodux);
local v1 = require(script.Parent.Parent.Actions.UpdateStoreId);
local v2 = 0;
return v0.createReducer("0", {
    [v1.name] = function(_, _)
        v2 = v2 + 1;
        return (tostring(v2));
    end
});
