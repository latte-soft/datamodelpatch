local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetEmoteAssetId);
local v5 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetFieldOfViewDeg);
local v6 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetLastSuccessfulPoseEmoteAssetId);
local v7 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.CompletePPEEmoteLoading);
local v8 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.StartPPEEmoteLoading);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v10 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.IncrementPPEVersion);
local v11 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v12 = require(l_Modules_0.LuaApp.mutedError);
return v2.createReducer({
    lastSuccessfulPoseEmoteAssetId = nil, 
    emoteAssetId = nil, 
    fieldOfViewDeg = nil, 
    ppeVersion = {
        [v11.Closeup] = 0, 
        [v11.FullBody] = 0
    }, 
    ppeEmoteLoadingCount = 0
}, {
    [v8.name] = function(v13, _)
        return v3.Dictionary.join(v13, {
            ppeEmoteLoadingCount = v13.ppeEmoteLoadingCount + 1
        });
    end, 
    [v7.name] = function(v15, _)
        local v17 = v15.ppeEmoteLoadingCount - 1;
        if v17 < 0 then
            v12("newPPEEmoteLoadingCount is less than 0");
        end;
        return v3.Dictionary.join(v15, {
            ppeEmoteLoadingCount = v17
        });
    end, 
    [v6.name] = function(v18, v19)
        return v3.Dictionary.join(v18, {
            lastSuccessfulPoseEmoteAssetId = v19.lastSuccessfulPoseEmoteAssetId or v3.None
        });
    end, 
    [v4.name] = function(v20, v21)
        return v3.Dictionary.join(v20, {
            emoteAssetId = v21.emoteAssetId or v3.None
        });
    end, 
    [v5.name] = function(v22, v23)
        return v3.Dictionary.join(v22, {
            fieldOfViewDeg = v23.fieldOfViewDeg or v3.None
        });
    end, 
    [v10.name] = function(v24, v25)
        return v3.Dictionary.join(v24, {
            ppeVersion = v3.Dictionary.join(v24.ppeVersion, {
                [v25.thumbnailType] = v24.ppeVersion[v25.thumbnailType] + 1
            })
        });
    end
});
