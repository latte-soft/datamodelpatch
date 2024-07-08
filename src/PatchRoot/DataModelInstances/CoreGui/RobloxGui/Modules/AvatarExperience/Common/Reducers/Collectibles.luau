local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(l_CorePackages_0.Rodux).combineReducers({
    CollectiblesItemInfo = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesItemInfo), 
    CollectiblesResellableInstances = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesResellableInstances), 
    CollectiblesMarketplaceResaleParameters = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesMarketplaceResaleParameters), 
    CollectiblesResellersInstances = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesResellersInstances)
});
