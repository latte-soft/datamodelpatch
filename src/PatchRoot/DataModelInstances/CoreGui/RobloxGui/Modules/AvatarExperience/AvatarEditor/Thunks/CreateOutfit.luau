local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.mutedError);
local v6 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v7 = require(l_CorePackages_0.Promise);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v10 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v11 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v13 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GrantOutfit);
local v15 = require(l_Modules_0.AvatarExperience.Flags.FFlagXBoxCreateCostumeEnabled);
local v16 = require(l_Modules_0.AvatarExperience.Flags.FFlagShowCreateCostumeXBoxSignalR);
local v17 = game:DefineFastFlag("XBoxCreateCostumeRetry", false);
local v18 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarEditorServiceCreateOutfitSupportsGears);
local v19 = l_GuiService_0:IsTenFootInterface();
local v20 = require(l_CorePackages_0.Cryo);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v22 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v23 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v24 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local v25 = {
    toastMessage = "Feature.Avatar.Message.InvalidName", 
    isLocalized = false, 
    toastType = v11.InformationMessage
};
local v26 = {
    toastMessage = "Feature.Avatar.Message.ReachedMaxOutfits", 
    isLocalized = false, 
    toastType = v11.InformationMessage
};
local v27 = {
    toastMessage = "Feature.Avatar.Message.UnknownErrorCreatingOutfit", 
    isLocalized = false, 
    toastType = v11.InformationMessage
};
return function(v28, v29, v30, v31, v32, v33)
    v6.isType(v28, "function", "CreateOutfit thunk expects networkImpl to be a function");
    v6.isTypeOrNil(v29, "string", "CreateOutfit thunk expects name to be a string or nil");
    v6.isType(v30, "table", "CreateOutfit thunk expects avatarEditorAnalytics to be a table");
    v6.isTypeOrNil(v31, "function", "CreateOutfit thunk expects checkIsMounted to be a function or nil");
    v6.isTypeOrNil(v32, "function", "CreateOutfit thunk expects onComplete to be a callback or nil");
    v6.isTypeOrNil(v33, "Instance", "CreateOutfit thunk expects altHumanoidDescription to be an Instance or nil");
    if not (not v15 and not v16) and v29 == nil then
        v29 = "";
    end;
    return v13.convertAvatarEditorServiceThunk("CreateOutfit", function(v34, v35)
        return l_PerformFetch_0.Single(v8.CreateOutfitKey, function(v36)
            local v37 = v36:getState();
            local v38 = Enum.HumanoidRigType[v37.AvatarExperience.AvatarEditor.Character.AvatarType];
            local v39 = {};
            local v40 = 0;
            if not (not v15 or not v19) then
                v39 = v37.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[v8.EditableCharacterKey] or {};
            end;
            local v41 = nil;
            v41 = if v33 ~= nil then v33 else v12.getHumanoidDescriptionFromState(v37.AvatarExperience);
            if v18() then
                v40 = v12.getGearAssetIdFromState(v37.AvatarExperience);
            end;
            return v7.new(function(v42, v43)
                local v44 = if not v18() then v35:NoPromptCreateOutfit(v41, v38, v29, 0) else v35:NoPromptCreateOutfit(v41, v38, v29, v40);
                while not v44 do
                    v35.PromptCreateOutfitCompleted:Wait();
                    v44 = v35:NoPromptCreateOutfit(v41, v38, v29, 0);
                    if v24() then
                        v22(v23.Counter.AvatarEditorServiceErrors.NoPromptCreateOutfit);
                    end;
                end;
                local v45, v46 = v35.PromptCreateOutfitCompleted:Wait();
                if v45 == Enum.AvatarPromptResult.Success then
                    if not (not v15 or not v19) then
                        if not v17 then
                            local v47 = v9.tableToCamelCaseKeys((v35:GetOutfits():GetCurrentPage()));
                            if v20.isEmpty(v39) and v20.isEmpty(v47) or v39[1] == tostring(v47[1].id) then
                                v5("[Avatar Editor] Updated outfits does not have a new outfit id");
                                if v24() then
                                    v22(v23.Counter.AvatarEditorServiceErrors.GetOutfits);
                                end;
                            end;
                            v36:dispatch(v14(v28, (tostring(v47[1].id))));
                        else
                            v12.ExponentialRepeat(v31, function()
                                local v48 = v9.tableToCamelCaseKeys((v35:GetOutfits():GetCurrentPage()));
                                if not v20.isEmpty(v39) and next(v48) or v39[1] ~= tostring(v48[1].id) then
                                    v36:dispatch(v14(v28, (tostring(v48[1].id))));
                                    return true;
                                else
                                    return false;
                                end;
                            end);
                        end;
                    end;
                    v30.outfitCreated(v29);
                    v42();
                    if v32 ~= nil then
                        v32(true);
                        return ;
                    end;
                else
                    if v46 == Enum.CreateOutfitFailure.InvalidName then
                        v36:dispatch(v10(v25));
                    elseif v46 == Enum.CreateOutfitFailure.OutfitLimitReached then
                        v36:dispatch(v10(v26));
                    elseif v46 == Enum.CreateOutfitFailure.Other then
                        v36:dispatch(v10(v27));
                    end;
                    if v24() then
                        v22(v23.Counter.AvatarEditorServiceErrors.CreateOutfit);
                    end;
                    v43();
                    if v32 ~= nil then
                        v32(false);
                    end;
                end;
            end);
        end)(v34):catch(function(_)
        end);
    end);
end;
