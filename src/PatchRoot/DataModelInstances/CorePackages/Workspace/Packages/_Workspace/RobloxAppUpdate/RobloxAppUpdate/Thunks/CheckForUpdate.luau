local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxAppUpdate");
local v1 = require(l_script_FirstAncestor_0.Actions.SetAppUpdateStatus);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Dash);
local l_joinGamePlayButton_0 = require(l_Parent_0.ExperienceAnalytics).Points.joinGamePlayButton;
local l_SetNetworkingErrorToast_0 = require(l_Parent_0.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
local v6 = require(l_script_FirstAncestor_0.Thunks.OpenCentralOverlayForUpdateRequiredPrompt);
local l_GetFFlagMoveUpdateCheckToUniversalApp_0 = require(l_Parent_0.SharedFlags).GetFFlagMoveUpdateCheckToUniversalApp;
return function(v8, v9, v10, v11, v12)
    return function(v13)
        if l_GetFFlagMoveUpdateCheckToUniversalApp_0() and v8 == nil then
            warn("appUpdateImpl is nil");
            if v11 then
                v11();
            end;
            return ;
        elseif v9 and not v8:canPerformBinaryUpdate() then
            if v11 then
                v11();
            end;
            return ;
        else
            v8:checkForUpdate():andThen(function(v14)
                local l_appUpdateStatus_0 = v14.appUpdateStatus;
                local v16 = {
                    appUpdateStatus = l_appUpdateStatus_0
                };
                if v12 then
                    v16 = v3.join(v16, v12);
                end;
                l_joinGamePlayButton_0(v10.InfluxDb, "checkForUpdate", v16);
                if not v14.errorMessage then
                    if l_appUpdateStatus_0 == Enum.AppUpdateStatus.Available then
                        if not l_GetFFlagMoveUpdateCheckToUniversalApp_0() then
                            v13:dispatch(v1(l_appUpdateStatus_0));
                            return ;
                        else
                            v13:dispatch(v6(v8:canPerformBinaryUpdate()));
                            return ;
                        end;
                    else
                        if v11 then
                            v11();
                        end;
                        return ;
                    end;
                else
                    warn(v14.errorMessage);
                    v13:dispatch(l_SetNetworkingErrorToast_0({
                        HttpError = Enum.HttpError.OK
                    }));
                    return ;
                end;
            end);
            return ;
        end;
    end;
end;
