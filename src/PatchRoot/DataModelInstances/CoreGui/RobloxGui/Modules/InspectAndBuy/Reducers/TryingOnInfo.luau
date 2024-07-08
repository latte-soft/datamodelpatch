return require(game:GetService("CorePackages").Rodux).createReducer({
    tryingOn = false, 
    assetId = nil, 
    assetTypeId = nil
}, {
    [require(script.Parent.Parent.Actions.SetTryingOnInfo).name] = function(_, v1)
        return {
            tryingOn = v1.tryingOn, 
            assetId = v1.assetId, 
            assetTypeId = v1.assetTypeId
        };
    end
});
