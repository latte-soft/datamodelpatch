local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorStructure);
local v2 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v5 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Constants);
local v6 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v7 = {};
local v8 = {
    v6.Closeup, 
    v6.FullBody
};
v7.ConvertThumbnailTypeToInt = function(v9)
    return table.find(v8, v9);
end;
v7.ConvertThumbnailTypeToEnum = function(v10)
    if v10 == v6.Closeup then
        return Enum.AvatarThumbnailCustomizationType.Closeup;
    else
        return Enum.AvatarThumbnailCustomizationType.FullBody;
    end;
end;
v7.isPPEScreenUsingPeekabooWidget = function(v11)
    local v12 = true;
    if v11 ~= v4.ProfilePictureEditorCamera then
        v12 = v11 == v4.ProfilePictureEditorFinal;
    end;
    return v12;
end;
v7.getEmotesCategorySubcategoryAndInfo = function()
    local v13 = v1().AssetTypeToCategorySubcategory[v3.AssetTypeIdStrings.EmoteAnimation];
    local l_category_0 = v13.category;
    local l_subcategory_0 = v13.subcategory;
    return l_category_0, l_subcategory_0, (v2.getAvatarEditorCategoryInfo(l_category_0, l_subcategory_0));
end;
v7.getSliderValueFromYRotDeg = function(v16)
    return (math.clamp((v16 * v5.SliderMax) / v5.YRotMaxDeg, -v5.SliderMax, v5.SliderMax));
end;
v7.getYRotDegFromSliderValue = function(v17)
    return (math.clamp((v17 * v5.YRotMaxDeg) / v5.SliderMax, -v5.YRotMaxDeg, v5.YRotMaxDeg));
end;
v7.getCameraDistanceScaleFromSliderValue = function(v18)
    local v19 = -v18 / v5.SliderMax + 1;
    return ((1 - v5.ZoomMinScale) * v19) * v19 + v5.ZoomMinScale;
end;
v7.getSliderValueFromCameraDistanceScale = function(v20)
    return (math.clamp((math.sqrt((v20 - v5.ZoomMinScale) / (1 - v5.ZoomMinScale)) - 1) * -v5.SliderMax, -v5.SliderMax, v5.SliderMax));
end;
return v7;
