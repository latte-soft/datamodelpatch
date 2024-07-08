local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Rodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
return v1.createReducer(require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentTypeEnum).Position, {
    [require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetAdjustmentType).name] = function(_, v4)
        return v4.adjustmentType;
    end
});
