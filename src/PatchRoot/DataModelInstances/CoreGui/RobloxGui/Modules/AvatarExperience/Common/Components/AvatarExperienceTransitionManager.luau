local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local v3 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_usePrevious_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.usePrevious;
local v7 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarRoute);
local v8 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v9 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreenProperties);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ResetSortAndFilters);
local v12 = require(l_Modules_0.AvatarExperience.Common.Thunks.StoreAndClearTryOns);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.SetCameraButtonStatus);
local v14 = require(l_Modules_0.AvatarExperience.Common.Actions.SetCameraButtonErrorOccurred);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v16 = require(l_Modules_0.LuaApp.mutedError);
local v17 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v18 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_getCameraOptIn_0 = require(l_CorePackages_0.Workspace.Packages.CameraOptIn).getCameraOptIn;
local v21 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v22 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local v23 = require(l_Modules_0.AvatarExperience.Flags.FFlagUniversalAppCameraWindowsPermsFix);
local v24 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.transition");
local v25 = {
    toastMessage = "Feature.FaceChat.Subtitle.FeatureDisabled", 
    isLocalized = false, 
    toastType = v17.InformationMessage
};
local v26 = nil;
return function(_)
    local v28 = l_useDispatch_0();
    local v29 = l_useSelector_0(v9.isAvatarExperienceRoute);
    local v30 = l_usePrevious_0(v29);
    local v31 = l_usePrevious_0((v7()));
    local v32 = v8(v19);
    local v33 = v21.useTestVariables(v22.EnabledForUser);
    local function _()
        v24:debug("Leaving AvatarExperience");
        local v34 = if not v31 then nil else v31.opaque.name;
        if (v34 and v10[v34]) and v10[v34].isMultiTryOn then
            v28(v12());
        end;
        v28(v11());
    end;
    local function _()
        v24:debug("Entering AvatarExperience");
    end;
    v3.useEffect(function()
        if not v30 or v29 then
            if not (not v29 or v30) then
                if not (not v33 or not v9.isUserCameraEligible()) then
                    l_getCameraOptIn_0(v32, true):andThen(function(v37)
                        if v26 ~= v37 then
                            l_FaceAnimatorService_0:Init(v37, false);
                            l_FaceAnimatorService_0.TrackerError:Connect(function(v38)
                                v28(v13(false));
                                if v23 then
                                    v28(v14(true));
                                end;
                                v28(v18(v25));
                                v16(string.format("Universal App Camera FaceAnimatorService TrackerError: %s", (tostring(v38))));
                            end);
                            v26 = v37;
                        end;
                    end);
                end;
                v24:debug("Entering AvatarExperience");
            end;
            return ;
        else
            v24:debug("Leaving AvatarExperience");
            local v39 = if not v31 then nil else v31.opaque.name;
            if (v39 and v10[v39]) and v10[v39].isMultiTryOn then
                v28(v12());
            end;
            v28(v11());
            return ;
        end;
    end, {
        v29, 
        v30, 
        v31
    });
    return nil;
end;
