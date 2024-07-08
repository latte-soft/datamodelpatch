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
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RevokeOutfit);
local v12 = {
    toastMessage = "Feature.Avatar.Message.FailedDeleteCostume", 
    isLocalized = false, 
    toastType = v8.InformationMessage
};
local function _(v13)
    return v6.DeleteOutfitsKey .. v13;
end;
return function(v15)
    v3.isType(v15, "string", "DeleteOutfit thunk expects id to be a string");
    return v10.convertAvatarEditorServiceThunk("DeleteOutfit", function(v16, v17)
        return l_PerformFetch_0.Single(v6.DeleteOutfitsKey .. v15, function(v18)
            return v4.new(function(v19, v20)
                if v9.doAESCallAndAwaitResult(v17, v17.NoPromptDeleteOutfit, v17.PromptDeleteOutfitCompleted, v15) == Enum.AvatarPromptResult.Success then
                    v18:dispatch(v11(v15));
                    v19();
                    return ;
                else
                    v18:dispatch(v7(v12));
                    v20();
                    return ;
                end;
            end);
        end)(v16);
    end);
end;
