local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Rodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetDefaultRigidAdjustmentInfo);
local v6 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetUserRigidAdjustmentInfo);
local v7 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Models.AdjustmentInfoRigid);
return v3.createReducer({}, {
    [v5.name] = function(v8, v9)
        return v2.Dictionary.join(v8, {
            [v9.assetId] = v2.Dictionary.join(v8[v9.assetId] or {}, v7.fromDefaultInfo(v9))
        });
    end, 
    [v6.name] = function(v10, v11)
        return v2.Dictionary.join(v10, {
            [v11.assetId] = v2.Dictionary.join(v10[v11.assetId] or {}, v7.fromUserInfo(v11))
        });
    end
});
