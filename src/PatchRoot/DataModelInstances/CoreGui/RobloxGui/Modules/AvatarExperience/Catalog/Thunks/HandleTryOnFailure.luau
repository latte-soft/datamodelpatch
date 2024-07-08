local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v4 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v5 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveFromTryOn);
local v6 = {
    toastMessage = "Feature.Avatar.Label.TryOnFail", 
    isLocalized = false, 
    toastType = v4.InformationMessage
};
return function(v7)
    v2.isType(v7, "string", "HandleTryOnFailure request expects bundleId");
    return function(v8)
        if v8:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems[v7] then
            v8:dispatch(v5(v7));
            v8:dispatch(v3(v6));
        end;
    end;
end;
