local l_IXPService_0 = game:GetService("IXPService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useExternalEvent_0 = require(l_CorePackages_0.UIBlox).Core.Hooks.useExternalEvent;
local v4 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.init");
local l_AvatarExperienceFeatureLayer_0 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers).AvatarExperienceFeatureLayer;
return function()
    l_useExternalEvent_0(l_IXPService_0.OnUserLayerLoadingStatusChanged, function(v6)
        v4:info("IXPLayerLoadingStatusChanged: {}", v6);
        local l_l_IXPService_0_UserLayerLoadingStatus_0 = l_IXPService_0:GetUserLayerLoadingStatus();
        local l_l_IXPService_0_UserStatusForLayer_0 = l_IXPService_0:GetUserStatusForLayer(l_AvatarExperienceFeatureLayer_0);
        if l_l_IXPService_0_UserLayerLoadingStatus_0 ~= v6 then
            v4:info("IXPLayerLoadingStatusChanged -- latest status differs: {}", l_l_IXPService_0_UserLayerLoadingStatus_0);
        end;
        if l_l_IXPService_0_UserStatusForLayer_0 ~= v6 then
            v4:info("IXPLayerLoadingStatusChanged -- status for layer {} differs: {}", l_AvatarExperienceFeatureLayer_0, l_l_IXPService_0_UserStatusForLayer_0);
        end;
    end);
    return nil;
end;
