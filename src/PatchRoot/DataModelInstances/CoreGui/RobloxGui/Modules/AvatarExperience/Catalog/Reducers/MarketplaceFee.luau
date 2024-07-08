local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.Common.Models.MarketplaceFeeInfo);
return require(l_CorePackages_0.Rodux).createReducer({}, {
    [require(l_Modules_0.AvatarExperience.Catalog.Actions.SetMarketplaceFee).name] = function(v5, v6)
        return v3.Dictionary.join(v5, (v4.fromGetResaleTaxRate(v6.marketplaceFeeInfo)));
    end
});
