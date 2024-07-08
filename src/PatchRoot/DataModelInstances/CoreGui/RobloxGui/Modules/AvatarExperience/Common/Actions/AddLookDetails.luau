local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Rodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v5 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAvatarWidgetData);
return v2.makeActionCreator(script.Name, function(v6, v7, v8, v9, v10, v11, v12)
    return {
        lookAssetInfos = v9, 
        lookBundleInfos = if not v5() then nil else v10, 
        lookId = v6, 
        lookType = if not v5() then nil else v11, 
        totalValue = if not v5() then nil else v12, 
        totalPrice = v7, 
        totalPremiumPrice = v8
    };
end);
