local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_CorePackages_0.Cryo);
return v3.createReducer({
    AnimationPreview = nil, 
    AnimationPreviewAssetTypeIdString = nil
}, {
    [require(l_Modules_0.AvatarExperience.Common.Actions.ClearAnimationPreview).name] = function(v5, _)
        return v4.Dictionary.join(v5, {
            AnimationPreview = v4.None, 
            AnimationPreviewAssetTypeIdString = v4.None
        });
    end, 
    [require(l_Modules_0.AvatarExperience.Common.Actions.SetAnimationPreview).name] = function(v7, v8)
        return v4.Dictionary.join(v7, {
            AnimationPreview = v8.assetId, 
            AnimationPreviewAssetTypeIdString = v8.assetTypeIdString
        });
    end
});
