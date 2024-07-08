local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
return v2.createReducer({}, {
    [require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetPeekabooLayoutDetails).name] = function(v4, v5)
        return v3.Dictionary.join(v4, {
            [v5.screenName] = v3.Dictionary.join(v4[v5.screenName] or {}, {
                screenHeightPix = v5.screenHeightPix, 
                topYPix = v5.topYPix, 
                viewportSizePix = v5.viewportSizePix
            })
        });
    end
});
