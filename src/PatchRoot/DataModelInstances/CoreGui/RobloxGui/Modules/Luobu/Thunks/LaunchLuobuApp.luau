local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v5 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v6 = require(l_Modules_0.LuaApp.Thunks.FetchLocale);
local v7 = require(l_Modules_0.LuaApp.Thunks.FetchTheme);
local v8 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v9 = require(l_Modules_0.LuaApp.Thunks.GetLocalUser);
local v10 = require(l_Modules_0.LuaApp.Thunks.PreloadApplicationData);
local v11 = require(l_Modules_0.LuaApp.Thunks.Authentication.User);
local v12 = require(l_Modules_0.LuaApp.Thunks.Authentication.ClearApp);
local v13 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v14 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v15 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local l_ReceivedUserCountryCode_0 = require(l_CorePackages_0.Workspace.Packages.CountryCode).ReceivedUserCountryCode;
local l_SetAuthenticationStatus_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus;
local v19 = require(l_Modules_0.LuaApp.Http.Requests.GetAccountInfo);
local v20 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v21 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v22 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local v23 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v25 = require(l_Modules_0.Luobu.Analytics.Events.AppSessionCheckCounterNames);
local v26 = require(l_Modules_0.LuaApp.AppPage);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v28 = require(l_Modules_0.LuaApp.Promise);
local v29 = require(l_Modules_0.LuaApp.PromiseUtilities);
local l_AuthenticationProtocol_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationProtocol).AuthenticationProtocol;
local function _(v31)
    v5.initializeUserLayers(v31);
end;
local function _(v33, v34)
    l_GuiService_0:BroadcastNotification(v33:toJsonData(), v23.DID_LOG_IN);
    v34:dispatch(l_SetAuthenticationStatus_0(v20.LOGGED_IN));
end;
local function v41(v36, v37, v38)
    v29.Batch({
        (v6(v37))
    }):andThen(function(v39)
        v39[1]:match(function(v40)
            v13.setRobloxLocaleId(v40.signupAndLoginLocale);
            l_LocalizationService_0:SetRobloxLocaleId(v40.signupAndLoginLocale);
        end);
        if v38 then
            v36:dispatch(v12());
        end;
        v36:dispatch(l_SetAuthenticationStatus_0(v20.LOGGED_OUT));
        v36:dispatch(v8({
            {
                name = v26.Landing
            }
        }));
    end);
end;
local function v53(v42, v43, v44, v45, v46)
    return v19(v43):andThen(function(v47)
        v44.Diag:reportCounter(v25.Success, 1);
        local v48 = v11.fromRequest(v47);
        if not (v48:isEqual(v46) and not v45.useMSDKWebAuthentication()) then
            v48:setToLocalPlayer();
            v48:setToLocalStorage();
            v42:dispatch(v12());
            v42:dispatch(v9());
            v42:dispatch(l_ReceivedUserCountryCode_0(v48.countryCode));
            v42:dispatch(v8({
                {
                    name = v26.Home
                }
            }));
            v5.initializeUserLayers(v48.userId);
        end;
        v42:dispatch(v10(v43, v44, v45));
        local v49 = {};
        table.insert(v49, v6(v43):andThen(function(v50)
            v13.setRobloxLocaleId(v50.generalExperienceLocale);
            v13.setGameLocaleId(v50.ugcLocale);
            l_LocalizationService_0:SetRobloxLocaleId(v50.generalExperienceLocale);
        end));
        l_MemStorageService_0:Fire(v21.ThemeUpdate, (v13.getAuthenticatedTheme()));
        table.insert(v49, v7(v43, v48.userId):andThen(function(v51)
            v13.setAuthenticatedTheme(v51);
            l_MemStorageService_0:Fire(v21.ThemeUpdate, v51);
        end));
        v29.Batch(v49):andThen(function()
            v13.flush();
        end);
        return v28.resolve(v48);
    end, function(v52)
        if v52.StatusCodes == l_StatusCodes_0.UNAUTHORIZED then
            v44.Diag:reportCounter(v25.Failure401Unauthenticated, 1);
        end;
        v44.Diag:reportCounter(v25.Failure, 1);
        return v28.reject();
    end);
end;
local function _(v54, v55, v56, v57, v58)
    v58:setToLocalPlayer();
    v5.initializeUserLayers(v58.userId);
    spawn(function()
        v54:dispatch(v9());
        v54:dispatch(l_ReceivedUserCountryCode_0(v58.countryCode));
        v54:dispatch(v8({
            {
                name = v26.Home
            }
        }));
        v53(v54, v55, v56, v57, v58):andThen(function(v59)
            local v60, v61 = l_AuthenticationProtocol_0.default:requestAuth(l_AuthenticationProtocol_0.AuthProviders.MSDK, l_AuthenticationProtocol_0.AuthMethods.NONE):await();
            if not v60 or v61.statusCode ~= 0 then
                l_Logger_0:info("MSDK Auto Login with ErrorCode: " .. v61.statusCode);
                v41(v54, v55, true);
                v56.Diag:reportCounter("MSDKAutoLoginErrorCode_" .. v61.statusCode, 1);
                v54:dispatch(v14(v55, l_GuiService_0, v15.UnauthorizedAutoLogin));
                return ;
            else
                local l_v54_0 = v54;
                l_GuiService_0:BroadcastNotification(v59:toJsonData(), v23.DID_LOG_IN);
                l_v54_0:dispatch(l_SetAuthenticationStatus_0(v20.LOGGED_IN));
                return ;
            end;
        end, function()
            v41(v54, v55, true);
        end);
    end);
end;
local function _(v64, v65, v66, v67, v68, v69)
    if not v69 then
        spawn(function()
            v53(v64, v65, v66, v67, v68):andThen(function(v70)
                local l_v64_0 = v64;
                l_GuiService_0:BroadcastNotification(v70:toJsonData(), v23.DID_LOG_IN);
                l_v64_0:dispatch(l_SetAuthenticationStatus_0(v20.LOGGED_IN));
            end, function()
                v41(v64, v65, false);
            end);
        end);
        return ;
    else
        v41(v64, v65, false);
        return ;
    end;
end;
return function(v73, v74, v75, v76)
    return function(v77)
        local v78 = v11.fromLocalStorage();
        if v78.userId ~= -1 and not v75.useMSDKWebAuthentication() then
            l_Logger_0:info(string.format("[%f] LaunchLuobuApp::handleCachedUser()", tick()));
            local l_v73_0 = v73;
            local l_v74_0 = v74;
            local l_v75_0 = v75;
            v78:setToLocalPlayer();
            v5.initializeUserLayers(v78.userId);
            spawn(function()
                v77:dispatch(v9());
                v77:dispatch(l_ReceivedUserCountryCode_0(v78.countryCode));
                v77:dispatch(v8({
                    {
                        name = v26.Home
                    }
                }));
                v53(v77, l_v73_0, l_v74_0, l_v75_0, v78):andThen(function(v82)
                    local v83, v84 = l_AuthenticationProtocol_0.default:requestAuth(l_AuthenticationProtocol_0.AuthProviders.MSDK, l_AuthenticationProtocol_0.AuthMethods.NONE):await();
                    if not v83 or v84.statusCode ~= 0 then
                        l_Logger_0:info("MSDK Auto Login with ErrorCode: " .. v84.statusCode);
                        v41(v77, l_v73_0, true);
                        l_v74_0.Diag:reportCounter("MSDKAutoLoginErrorCode_" .. v84.statusCode, 1);
                        v77:dispatch(v14(l_v73_0, l_GuiService_0, v15.UnauthorizedAutoLogin));
                        return ;
                    else
                        local l_v77_0 = v77;
                        l_GuiService_0:BroadcastNotification(v82:toJsonData(), v23.DID_LOG_IN);
                        l_v77_0:dispatch(l_SetAuthenticationStatus_0(v20.LOGGED_IN));
                        return ;
                    end;
                end, function()
                    v41(v77, l_v73_0, true);
                end);
            end);
            return ;
        else
            l_Logger_0:info(string.format("[%f] LaunchLuobuApp::handleNoCachedUser()", tick()));
            local l_v73_1 = v73;
            local l_v74_1 = v74;
            local l_v75_1 = v75;
            if not (v76 == v22.Startup) then
                spawn(function()
                    v53(v77, l_v73_1, l_v74_1, l_v75_1, v78):andThen(function(v89)
                        local l_v77_1 = v77;
                        l_GuiService_0:BroadcastNotification(v89:toJsonData(), v23.DID_LOG_IN);
                        l_v77_1:dispatch(l_SetAuthenticationStatus_0(v20.LOGGED_IN));
                    end, function()
                        v41(v77, l_v73_1, false);
                    end);
                end);
                return ;
            else
                v41(v77, l_v73_1, false);
                return ;
            end;
        end;
    end;
end;
