local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetAdjustmentSliders);
local v5 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetSelectedAccessory);
local v6 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentSliderType);
local function _()
    return {
        [v6.PositionX] = 0, 
        [v6.PositionY] = 0, 
        [v6.PositionZ] = 0, 
        [v6.RotationX] = 0, 
        [v6.RotationY] = 0, 
        [v6.RotationZ] = 0, 
        [v6.Scale] = 0
    };
end;
return v2.createReducer({}, {
    [v4.name] = function(v8, v9)
        return v3.Dictionary.join(v8, {
            [v9.assetId] = v3.Dictionary.join(v8[v9.assetId] or {}, {
                [v9.adjustmentSliderType] = v9.value
            })
        });
    end, 
    [v5.name] = function(v10, v11)
        if v10[v11.selectedAccessory] then
            return v10;
        else
            return v3.Dictionary.join(v10, {
                [v11.selectedAccessory] = {
                    [v6.PositionX] = 0, 
                    [v6.PositionY] = 0, 
                    [v6.PositionZ] = 0, 
                    [v6.RotationX] = 0, 
                    [v6.RotationY] = 0, 
                    [v6.RotationZ] = 0, 
                    [v6.Scale] = 0
                }
            });
        end;
    end
});
