local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.PromiseUtilities);
local v6 = require(script.Parent.AppStorageUtilities);
local v7 = require(l_Modules_0.LuaApp.Actions.SetNativeLocaleName);
local v8 = require(script.Parent.ClearApp);
local l_SetAuthenticationStatus_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus;
local v10 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v11 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v12 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v13 = require(l_Modules_0.LuaApp.FlagSettings);
local v14 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v15 = require(l_Modules_0.LuaApp.Thunks.NavigateToRoute);
local v16 = require(l_Modules_0.LuaApp.AppPage);
local l_GetFFlagEnableSwapToSourceButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableSwapToSourceButton;
local v18 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v19 = require(l_Modules_0.LuaApp.Util.ExperimentCacheManager);
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagIXPExperimentCache);
local v21 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v22 = require(l_Modules_0.LuaApp.Analytics.RobloxTelemetryConfigs.LuaLogoutReasons);
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
return function(v24, v25, _, v27, v28)
    v5.Batch({
        v27
    }):andThen(function(v29)
        if not (not v29 or not v29[1]) then
            v29[1]:match(function(v30)
                v6.setRobloxLocaleId(v30.signupAndLoginLocale);
                l_LocalizationService_0:SetRobloxLocaleId(v30.signupAndLoginLocale);
                if l_GetFFlagEnableSwapToSourceButton_0() then
                    v25:dispatch(v7(""));
                end;
            end);
        end;
        if v24 then
            v25:dispatch(v8());
            l_MemStorageService_0:Fire(v12.ThemeUpdate, "dark");
        end;
        v25:dispatch(l_SetAuthenticationStatus_0(v11.LOGGED_OUT));
        if v28 ~= nil then
            v21.default:logRobloxTelemetryEvent(v22, nil, {
                lualogoutreasons = v28
            });
        end;
        if not v13.WeChatLoginEnabled() then
            if not v13.LuaAppLoginUIEnabled() then
                v25:dispatch(v14({
                    name = v16.LoginNative
                }));
            elseif not l_getAppFeaturePolicies_0().getUseSingleSignOn() then
                v25:dispatch(v10({
                    {
                        name = v16.Landing
                    }
                }));
            else
                v25:dispatch(v15({
                    {
                        name = v16.SingleSignOnContainer
                    }
                }));
            end;
        else
            v25:dispatch(v10({
                {
                    name = v16.WeChatLoginWrapper
                }
            }));
        end;
        if v20() then
            v18.clearUserLayers();
            v19.default:clearCache();
        end;
    end);
end;
