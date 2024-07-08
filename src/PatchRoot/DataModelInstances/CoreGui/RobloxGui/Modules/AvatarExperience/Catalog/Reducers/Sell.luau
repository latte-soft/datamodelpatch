local v0 = require(game:GetService("CorePackages").Rodux);
local l_Parent_0 = script.Parent;
return v0.combineReducers({
    AvailableToSellAssets = require(l_Parent_0.AvailableToSellAssets), 
    CurrentlySellingAssets = require(l_Parent_0.CurrentlySellingAssets)
});
