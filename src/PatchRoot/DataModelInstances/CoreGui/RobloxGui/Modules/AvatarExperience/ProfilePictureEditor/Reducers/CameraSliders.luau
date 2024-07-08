local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
return v2.createReducer({
    zoomSliderValue = 0, 
    rotateSliderValue = 0
}, {
    [require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderZoom).name] = function(v4, v5)
        return v3.Dictionary.join(v4, {
            zoomSliderValue = v5.zoomSliderValue
        });
    end, 
    [require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderRotate).name] = function(v6, v7)
        return v3.Dictionary.join(v6, {
            rotateSliderValue = v7.rotateSliderValue
        });
    end
});
