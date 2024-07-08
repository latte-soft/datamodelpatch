return require(game:GetService("CorePackages").Rodux).createReducer({
    viewingDetails = false, 
    assetId = nil
}, {
    [require(script.Parent.Parent.Actions.SetDetailsInformation).name] = function(_, v1)
        return {
            viewingDetails = v1.viewingDetails, 
            assetId = v1.assetId
        };
    end
});
