local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent;
return require(l_CorePackages_0.Rodux).combineReducers({
    assets = require(l_Parent_0.FavoriteAssets), 
    bundles = require(l_Parent_0.FavoriteBundles)
});
