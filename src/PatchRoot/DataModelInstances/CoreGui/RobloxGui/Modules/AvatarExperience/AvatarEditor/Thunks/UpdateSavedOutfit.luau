local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Promise);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.UpdateOutfit);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v8 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v9 = require(l_Modules_0.LuaApp.Enum.ToastType);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v12 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local v13 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarEditorServiceCreateOutfitSupportsGears);
local v14 = {
    toastMessage = "Feature.Avatar.Message.UpdateOutfitSuccess", 
    isLocalized = false, 
    toastType = v9.SuccessConfirmation
};
local v15 = {
    toastMessage = "Feature.Avatar.Message.FailedUpdateOutfit", 
    isLocalized = false, 
    toastType = v9.InformationMessage
};
local function _(v16)
    return v7.UpdateOutfitKey .. v16;
end;
return function(v18, v19, v20)
    v3.isType(v20, "string", "UpdateSavedOutfit thunk expects outfitId to be a string");
    v3.isType(v18, "function", "UpdateSavedOutfit thunk expects networkImpl to be a function");
    v3.isType(v19, "table", "UpdateSavedOutfit thunk expects avatarEditorAnalytics to be a table");
    v3.isType(v20, "string", "UpdateSavedOutfit thunk expects outfitId to be a string");
    return v12.convertAvatarEditorServiceThunk("UpdateSavedOutfit", function(v21, v22)
        return l_PerformFetch_0.Single(v7.UpdateOutfitKey .. v20, function(v23)
            local v24 = v23:getState();
            local v25 = v11.getHumanoidDescriptionFromState(v24.AvatarExperience);
            local v26 = Enum.HumanoidRigType[v24.AvatarExperience.AvatarEditor.Character.AvatarType];
            local v27 = 0;
            if v13() then
                v27 = v11.getGearAssetIdFromState(v24.AvatarExperience);
            end;
            return v4.new(function(v28, v29)
                if v11.doAESCallAndAwaitResult(v22, v22.NoPromptUpdateOutfit, v22.PromptUpdateOutfitCompleted, v20, v25, v26, v27) == Enum.AvatarPromptResult.Success then
                    v23:dispatch(v6(v18, v20));
                    v23:dispatch(v8(v14));
                    v19.outfitUpdated(v20);
                    v28();
                    return ;
                else
                    v23:dispatch(v8(v15));
                    v29();
                    return ;
                end;
            end);
        end)(v21);
    end);
end;
