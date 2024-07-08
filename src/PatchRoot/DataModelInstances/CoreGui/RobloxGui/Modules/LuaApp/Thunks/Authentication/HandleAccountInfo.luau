local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_GuiService_0 = game:GetService("GuiService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_Modules_0.LuaApp.Http.Requests.GetUserAppLaunchInfo);
local v8 = require(script.Parent.User);
local v9 = require(l_Modules_0.LuaApp.Thunks.GetLocalUser);
local v10 = require(l_Modules_0.LuaApp.PromiseUtilities);
local l_SetAuthenticationStatus_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus;
local v12 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local _ = require(l_Modules_0.LuaApp.Thunks.NavigateSideways);
local v14 = require(l_Modules_0.LuaApp.Thunks.FetchTheme);
local v15 = require(script.Parent.ClearApp);
local v16 = require(script.Parent.AppStorageUtilities);
local v17 = require(l_Modules_0.LuaApp.AppPage);
local v18 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v19 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v20 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v21 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v22 = require(l_Modules_0.LuaApp.Analytics.Events.AppSessionCheckCounterNames);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v24 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v25 = require(l_Modules_0.LuaApp.Thunks.CloseAccountAuthenticationFailureOverlay);
local v26 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v27 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResetOnNoAccountInfoFound);
local v28 = require(l_Modules_0.LuaApp.Thunks.Authentication.ShowAccountAuthenticationFailureOverlay);
local v29 = require(l_Modules_0.LuaApp.Thunks.ApiFetchUsersRoles);
local l_ReceivedUserCountryCode_0 = require(l_CorePackages_0.Workspace.Packages.CountryCode).ReceivedUserCountryCode;
local v31 = not not game:GetEngineFeature("AppTracing") and game:GetService("TracerService") or nil;
local v32 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v33 = require(l_Modules_0.LuaApp.Flags.GetFFlagPasskeySignupEnabled);
local v34 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local function _(v35, v36)
    l_GuiService_0:BroadcastNotification(v35:toJsonData(), v20.DID_LOG_IN);
    v36:dispatch(l_SetAuthenticationStatus_0(v19.LOGGED_IN));
end;
local function v43(v38, v39, v40, v41)
    local v42 = not game:GetEngineFeature("SignupActionRequiredKeyAvailable") and "" or v16.getSignupActionRequired();
    if not v39 or not v41.isUnder13 then
        if v42 == "auth" then
            if not v33() and not v34() then
                v16.setSignupActionRequired("");
                v16.flush();
                v38:dispatch(v12({
                    {
                        name = v40
                    }
                }));
                return ;
            else
                v38:dispatch(v12({
                    {
                        name = v17.AddAuthMethodPage
                    }
                }));
                return ;
            end;
        else
            v38:dispatch(v12({
                {
                    name = v40
                }
            }));
            return ;
        end;
    else
        v38:dispatch(v12({
            {
                name = v17.U13Block
            }
        }));
        return ;
    end;
end;
local function v44(v45, v46, v47, v48, v49, v50, v51, v52, v53, v54)
    local v55 = "";
    if v31 then
        v55 = v31:StartSpan("luaAccountInfo", "");
    end;
    if v52 then
        v52:logEventOnce("lua_auth_request_begin");
    end;
    v7(v45):andThen(function(v56)
        if v52 then
            v52:logEventOnce("lua_auth_request_end");
        end;
        if v31 and v55 ~= "" then
            v31:FinishSpan(v55);
        end;
        l_RbxAnalyticsService_0:ReportCounter("Network_AccountInfo_Ok");
        v21(v22.Success, 1);
        local v57 = v8.fromUserInfoRequest(v56);
        if v49:getState().CentralOverlay.OverlayType == v26.AccountAuthenticationFailureOverlay then
            v49:dispatch(v25());
            if v57:isEqual(v46) then
                v43(v49, v53, v50, v57);
            end;
        end;
        if not v57:isEqual(v46) then
            v57:setToLocalPlayer();
            v57:setToLocalStorage();
            if v48 then
                v49:dispatch(v15());
                v54 = false;
            end;
            v49:dispatch(v9());
            v49:dispatch(l_ReceivedUserCountryCode_0(v57.countryCode));
            v43(v49, v53, v50, v57);
            v24.initializeUserLayers(v57.userId);
        end;
        if not v54 then
            v54 = true;
            v51();
        end;
        local v58 = {};
        table.insert(v58, v47:andThen(function(v59)
            v16.setRobloxLocaleId(v59.generalExperienceLocale);
            v16.setGameLocaleId(v59.ugcLocale);
            l_LocalizationService_0:SetRobloxLocaleId(v59.generalExperienceLocale);
        end));
        local v60 = v14(v45, v57.userId);
        v49:dispatch(v29(v45));
        local v61 = not game:GetEngineFeature("SignupActionRequiredKeyAvailable") and "" or v16.getSignupActionRequired();
        local v62 = false;
        if v61 == "auth" then
            v62 = v33();
        end;
        table.insert(v58, v60:andThen(function(v63)
            v16.setAuthenticatedTheme(v63);
            if not v62 then
                l_MemStorageService_0:Fire(v18.ThemeUpdate, v63);
            end;
        end));
        v10.Batch(v58):andThen(function()
            v16.flush();
        end);
        local l_v49_0 = v49;
        l_GuiService_0:BroadcastNotification(v57:toJsonData(), v20.DID_LOG_IN);
        l_v49_0:dispatch(l_SetAuthenticationStatus_0(v19.LOGGED_IN));
    end, function(v65)
        if v65.HttpError ~= Enum.HttpError.ConnectFail then
            l_RbxAnalyticsService_0:ReportCounter("Network_AccountInfo_Error");
        else
            l_RbxAnalyticsService_0:ReportCounter("Network_AccountInfo_None");
        end;
        if v65.StatusCode == l_StatusCodes_0.UNAUTHORIZED then
            v21(v22.Failure401Unauthenticated, 1);
        else
            v21(v22.FailureUnknownError, 1);
        end;
        v21(v22.Failure, 1);
        if v65.StatusCode == l_StatusCodes_0.UNAUTHORIZED then
            v27(v48, v49, v45, v47, v32.UnauthorizedAutoLogin);
            return ;
        else
            v28(v49, function()
                v44(v45, v46, v47, v48, v49, v50, v51);
            end);
            return ;
        end;
    end);
end;
return v44;
