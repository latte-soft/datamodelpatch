return require(game:GetService("CorePackages").Rodux).createReducer({
    itemType = nil, 
    itemId = nil
}, {
    [require(script.Parent.Parent.Actions.SetItemBeingPurchased).name] = function(_, v1)
        return {
            itemType = v1.itemType, 
            itemId = v1.itemId
        };
    end
});
