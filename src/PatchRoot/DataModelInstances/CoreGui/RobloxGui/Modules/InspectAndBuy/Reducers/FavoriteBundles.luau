local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Cryo);
return v1.createReducer({}, {
    [require(script.Parent.Parent.Actions.SetFavoriteBundle).name] = function(v3, v4)
        return v2.Dictionary.join(v3, {
            [v4.id] = v4.isFavorite
        });
    end
});
