local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
return require(l_CorePackages_0.Rodux).createReducer({}, {
    [require(script.Parent.Parent.Actions.SetAssetToBundlesMapping).name] = function(v2, v3)
        return v1.Dictionary.join(v2, {
            [tostring(v3.assetId)] = v3.bundleIds
        });
    end
});
