local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Reducers.SettingsReducer);
local v2 = require(l_CorePackages_0.Rodux);
return {
    Destruct = function(v3)
        v3.store:destruct();
    end, 
    store = v2.Store.new(v1, nil, {
        v2.thunkMiddleware
    })
};
