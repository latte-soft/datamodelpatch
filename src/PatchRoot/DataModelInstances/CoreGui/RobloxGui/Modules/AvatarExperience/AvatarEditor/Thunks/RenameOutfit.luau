local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Promise);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v7 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v8 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v10 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.OutfitRenamed);
local v12 = {
    toastMessage = "Feature.Avatar.Message.RenameCostumeSuccess", 
    isLocalized = false, 
    toastType = v8.InformationMessage
};
local v13 = {
    toastMessage = "Feature.Avatar.Message.FailedRenameCostume", 
    isLocalized = false, 
    toastType = v8.InformationMessage
};
local function _(v14)
    return v6.RenameOutfitKey .. v14;
end;
return function(v16, v17, v18)
    v3.isType(v16, "table", "RenameOutfit thunk expects avatarEditorAnalytics to be a table");
    v3.isType(v17, "string", "RenameOutfit thunk expects id to be a string");
    v3.isType(v18, "string", "RenameOutfit thunk expects name to be a string");
    return v10.convertAvatarEditorServiceThunk("RenameOutfit", function(v19, v20)
        return l_PerformFetch_0.Single(v6.RenameOutfitKey .. v17, function(v21)
            return v4.new(function(v22, v23)
                if v9.doAESCallAndAwaitResult(v20, v20.NoPromptRenameOutfit, v20.PromptRenameOutfitCompleted, v17, v18) == Enum.AvatarPromptResult.Success then
                    v21:dispatch(v11(v17, v18));
                    v21:dispatch(v7(v12));
                    v16.outfitRenamed(v17, v18);
                    v22();
                    return ;
                else
                    v21:dispatch(v7(v13));
                    v23();
                    return ;
                end;
            end);
        end)(v19);
    end);
end;
