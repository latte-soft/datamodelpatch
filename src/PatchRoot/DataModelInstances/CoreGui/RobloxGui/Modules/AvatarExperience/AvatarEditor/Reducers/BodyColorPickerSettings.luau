local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyColorViewSetting);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetSelectedBodyPartColorIds);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetRangeIdToBodyPartsToSliderAndColor3Values);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetSelectedBodyPartIndex);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v2.createReducer({
    viewSetting = "Standard", 
    selectedBodyPartColorIds = {}, 
    rangeIdToBodyPartsToSliderAndColor3Values = {}, 
    selectedBodyPartIndex = 1
}, {
    [v6.name] = function(v9, v10)
        local l_rangeIdToBodyPartsToSliderAndColor3Values_0 = v9.rangeIdToBodyPartsToSliderAndColor3Values;
        return v3.Dictionary.join(v9, {
            rangeIdToBodyPartsToSliderAndColor3Values = v3.Dictionary.join(l_rangeIdToBodyPartsToSliderAndColor3Values_0, {
                [v10.rangeId] = v3.Dictionary.join(l_rangeIdToBodyPartsToSliderAndColor3Values_0[v10.rangeId] or {}, {
                    [v10.bodyPartForSkinColoringId] = {
                        color3 = v10.color3, 
                        sliderValue = v10.sliderValue
                    }
                })
            })
        });
    end, 
    [v7.name] = function(v12, v13)
        return v3.Dictionary.join(v12, {
            selectedBodyPartIndex = v13.selectedBodyPartIndex
        });
    end, 
    [v4.name] = function(v14, v15)
        return v3.Dictionary.join(v14, {
            viewSetting = v15.bodyColorViewSetting
        });
    end, 
    [v5.name] = function(v16, v17)
        return v3.Dictionary.join(v16, {
            selectedBodyPartColorIds = v17.selectedBodyPartColorIds
        });
    end
});
