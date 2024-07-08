local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.AvatarExperience);
return function(v3, v4)
    return v1.getSliderValueForRangeIdAndBodyPartIndex(v4, v3.AvatarEditor.BodyColorPickerSettings.selectedBodyPartIndex, v3.AvatarEditor.BodyColorPickerSettings.rangeIdToBodyPartsToSliderAndColor3Values);
end;
