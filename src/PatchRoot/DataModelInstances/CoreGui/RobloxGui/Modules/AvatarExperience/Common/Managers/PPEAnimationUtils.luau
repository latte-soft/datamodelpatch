local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_EmoteUtility_0 = require(l_CorePackages_0.Thumbnailing).EmoteUtility;
local v4 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v5 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectIsToolEquipped);
local v6 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Managers.AnimationManagerTypes);
local v8 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.CompletePPEEmoteLoading);
local v9 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.StartPPEEmoteLoading);
local v10 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetLastSuccessfulPoseEmoteAssetId);
local v11 = require(l_Modules_0.AvatarExperience.Common.Managers.AnimationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v13 = {};
local function _(v14)
    if not v14 then
        return false;
    else
        return v14:getEquippedToolModel() ~= nil;
    end;
end;
v13.getDidSomethingRequiringPPEPoseAdjustment = function(v16, v17, v18)
    if v16.AvatarExperience.AvatarScene.Character.CharacterModelVersion ~= v17.AvatarExperience.AvatarScene.Character.CharacterModelVersion then
        return true;
    else
        local l_finalPageViewMode_0 = v16.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode;
        local l_finalPageViewMode_1 = v17.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode;
        if l_finalPageViewMode_0 ~= l_finalPageViewMode_1 then
            if l_finalPageViewMode_0 == v4.Closeup and l_finalPageViewMode_1 == v4.FullBody then
                if not v5(v17) or not not v18 and v18:getEquippedToolModel() ~= nil then
                    return true;
                else
                    return false;
                end;
            elseif l_finalPageViewMode_0 == v4.FullBody and l_finalPageViewMode_1 == v4.Closeup then
                if not v5(v17) or not (not not v18 and v18:getEquippedToolModel() ~= nil) then
                    return true;
                else
                    return false;
                end;
            end;
        end;
        return false;
    end;
end;
v13.getAssetIdsToLoad = function(v21, v22)
    local v23 = {
        ppeEmoteAssetId = v6.getAssetIdForPPEPose(v21)
    };
    if v22 then
        v23.moodAssetId = v6.getEquippedMoodAssetId(v21);
    end;
    return v23;
end;
local v24 = false;
v13.makeLoadedAssets = function(v25, v26, v27)
    local v28 = {};
    local l_CurrentCharacter_0 = v25:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if l_CurrentCharacter_0 then
        if l_CurrentCharacter_0:FindFirstChildOfClass("Humanoid") then
            assert(v24 == false, "promiseHasOutstandingPPELoading should be false");
            v25:dispatch(v9());
            v24 = true;
            local v30 = nil;
            local v31 = nil;
            if v27.ppeEmoteAssetId then
                v30 = tonumber(v27.ppeEmoteAssetId);
            end;
            if v27.moodAssetId then
                v31 = tonumber(v27.moodAssetId);
            end;
            v28.keyframesForPose = l_EmoteUtility_0.LoadKeyframesForPose(l_CurrentCharacter_0, v30, v31, true, not v26.ppeFinalPageFullView);
            v25:dispatch(v8());
            v24 = false;
            return v28;
        else
            return v28;
        end;
    else
        return v28;
    end;
end;
v13.maybeNoteLoadingFinished = function(v32)
    if v24 then
        v32:dispatch(v8());
    end;
    v24 = false;
end;
v13.applyNewProfilePictureEditorPose = function(v33, v34, v35, v36)
    assert(v34, "currentCharacter is non-nil.");
    assert(v35, "humanoid is non-nil..");
    if v36 then
        l_EmoteUtility_0.ApplyKeyframesForPose(v34, v36);
    else
        l_EmoteUtility_0.SetPlayerCharacterNeutralPose(v34);
        if Enum.HumanoidRigType.R6 == v35.RigType then
            l_EmoteUtility_0.AdjustArmOnR6ForTool(v34);
        end;
    end;
    local v37 = nil;
    if v36 then
        v37 = v36.finalAnimationAssetIdOrUrl and tostring(v37);
    end;
    v11.waitForAnimationAndPosingToResolve(function()
        v33:dispatch(v10(v37));
    end);
end;
v13.undoOldProfilePictureEditorPose = function(v38, v39, v40)
    if not (not v40 or not v39) then
        l_EmoteUtility_0.SetPlayerCharacterNeutralPose(v39);
        v38:dispatch(v10(nil));
    end;
end;
return v13;
