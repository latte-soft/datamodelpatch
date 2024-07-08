local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_CorePackages_0.Logging);
local v6 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v7 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v8 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Constants);
local v9 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v10 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.IncrementPPEVersion);
local v11 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local v12 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Utils);
local v13 = require(l_Modules_0.LuaApp.mutedError);
local v14 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local v17 = {
    toastMessage = "Feature.Avatar.Message.FailedWritePPE", 
    isLocalized = false, 
    toastType = v7.InformationMessage
};
local v18 = {
    toastMessage = "Feature.Avatar.Label.PPEFinishedToast", 
    isLocalized = false, 
    toastType = v7.InformationMessage
};
return function(v19, v20, v21, v22, v23, v24)
    v3.isType(v20, "userdata", "WritePPEConfig thunk expects thumbnailType to be a userdata");
    v3.isTypeOrNil(v21, "string", "WritePPEConfig thunk expects emoteAssetId to be a string or nil");
    v3.isType(v22, "number", "WritePPEConfig thunk expects cameraDistanceScale to be a number");
    v3.isType(v23, "number", "WritePPEConfig thunk expects cameraYRotDeg to be a number");
    v3.isType(v24, "number", "WritePPEConfig thunk expects fieldOfViewDeg to be a number");
    local v25 = v8.PPEConfigWriteStatusKeys[v20];
    return v11.convertAvatarEditorServiceThunk("WritePPEConfig", function(v26, v27)
        return l_PerformFetch_0.Single(v25, function(v28)
            if v20 == v9.Closeup then
                local l_clickFinalSave_0 = v19.clickFinalSave;
                local l_v20_0 = v20;
                local v31 = false;
                if v22 == 1 then
                    v31 = v23 == 0;
                end;
                l_clickFinalSave_0(l_v20_0, v31, v21);
            end;
            return v2.new(function(v32, _)
                local v34 = not not v21 and tonumber(v21) or 0;
                local v35 = v12.ConvertThumbnailTypeToEnum(v20);
                local v36 = v27:NoPromptSaveAvatarThumbnailCustomization(v35, v34, v22, v23, v24);
                while not v36 do
                    v27.PromptSaveAvatarThumbnailCustomizationCompleted:Wait();
                    v36 = v27:NoPromptSaveAvatarThumbnailCustomization(v35, v34, v22, v23, v24);
                end;
                local v37, v38 = v27.PromptSaveAvatarThumbnailCustomizationCompleted:Wait();
                if v37 == Enum.AvatarPromptResult.Success then
                    if v20 == v9.Closeup then
                        v28:dispatch(v6(v18));
                    end;
                    v28:dispatch(v10(v20));
                    v32();
                    return ;
                else
                    v13(string.format("Call to AvatarEditorService:NoPromptSaveAvatarThumbnailCustomization failed with error code \"%s\"", (tostring(v38))));
                    if v16() then
                        v14(v15.Counter.AvatarEditorServiceErrors.NoPromptSaveAvatarThumbnailCustomization);
                    end;
                    v28:dispatch(v6(v17));
                    v5.warn("WebApi failure in WritePPEConfig");
                    return ;
                end;
            end);
        end)(v26);
    end);
end;
