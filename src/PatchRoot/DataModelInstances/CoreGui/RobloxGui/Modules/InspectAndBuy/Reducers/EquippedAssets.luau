return require(game:GetService("CorePackages").Rodux).createReducer({}, {
    [require(script.Parent.Parent.Actions.SetEquippedAssets).name] = function(_, v1)
        local v2 = {};
        for _, v4 in ipairs(v1.equippedAssets) do
            v2[tostring(v4.assetId)] = true;
        end;
        return v2;
    end
});
