local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_CorePackages_0.Logging);
local v5 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Constants);
local v6 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v7 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Utils);
local v8 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Http.WebApi);
local v9 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetEmoteAssetId);
local v10 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderZoom);
local v11 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderRotate);
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableRevertPpeCustomizationFlow);
local function v22(v13, v14)
    local v15 = nil;
    local v16 = 1;
    local v17 = 0;
    local v18 = v7.ConvertThumbnailTypeToInt(v14);
    local l_avatarThumbnailCustomizations_0 = v13.avatarThumbnailCustomizations;
    if l_avatarThumbnailCustomizations_0 then
        for _, v21 in l_avatarThumbnailCustomizations_0, nil, nil do
            if v21.thumbnailType == v18 then
                if v21.emoteAssetId and v21.emoteAssetId ~= 0 then
                    v15 = tostring(v21.emoteAssetId);
                end;
                if v21.camera then
                    v16 = v21.camera.distanceScale;
                    if v12() and v16 == -1 then
                        v16 = 1;
                    end;
                    v17 = v21.camera.yRotDeg;
                end;
            end;
        end;
    end;
    return v15, v7.getSliderValueFromCameraDistanceScale(v16), (v7.getSliderValueFromYRotDeg(v17));
end;
return function(v23)
    return l_PerformFetch_0.Single(v5.PPEConfigFetchStatusKey, function(v24)
        return v8.FetchPPEConfig(v23):andThen(function(v25)
            local v26 = v25 and v25.responseBody;
            if not v26 then
                return v2.reject();
            else
                local v27, v28, v29 = v22(v26, v6.Closeup);
                v24:dispatch(v9(v27));
                if v28 then
                    v24:dispatch(v10(v28));
                end;
                if v29 then
                    v24:dispatch(v11(v29));
                end;
                return v2.resolve();
            end;
        end, function(v30)
            v4.warn("WebApi failure in FetchPPEConfig");
            return v2.reject(v30);
        end);
    end);
end;
