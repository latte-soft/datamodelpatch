local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Http.Requests.AccountSwitcher.SwitchAccount);
local v3 = require(script.Parent.Parent.ClearApp);
local v4 = require(script.Parent.Parent.AppStorageUtilities);
local v5 = require(script.Parent.Parent.User);
local v6 = require(l_CorePackages_0.Packages.Promise);
local v7 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFFlagIXPExperimentCache);
local v9 = require(l_Modules_0.LuaApp.Util.ExperimentCacheManager);
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagDebugResetSurveyStorage);
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v12 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppLocalizationConsistencyFixes);
local v13 = require(l_Modules_0.TopBar.Flags.FFlagEnableGamepadMenuSelector);
local v14 = require(l_Modules_0.LuaApp.Components.EventReceivers.CsatSurveyConstants);
local v15 = require(l_Modules_0.LuaApp.Constants);
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v17 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v18 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v19 = require(script.Parent.Parent.OpenAccountSwitchingErrorOverlay);
local l_GuiService_0 = game:GetService("GuiService");
local v21 = require(script.Parent.Parent.Parent.CloseCentralOverlay);
local v22 = require(l_Modules_0.LuaApp.Flags.FFlagLuaEnableDidSwitchAccount);
return function(v23, v24)
    return function(v25)
        local v26 = v4.getAccountBlob();
        local v27 = tostring(v5.fromLocalStorage().userId);
        local function v28()
            v25:dispatch(v21());
        end;
        local function _()
            v25:dispatch(v19("Authentication.AccountSwitch.Header.CantSwitchAccounts", "Authentication.AccountSwitch.Description.TryLoggingInDirectly.2", "CommonUI.Messages.Action.OK", "", v28, nil, v15.Auth.AccountSwitcherSwitchError));
        end;
        return v2(v23, v24, v26, v27):andThen(function(v30)
            if not (v30 ~= nil and v30.responseBody ~= nil) or v30.responseBody.encrypted_users_data_blob == nil then
                return v6.reject(false);
            else
                local l_encrypted_users_data_blob_0 = v30.responseBody.encrypted_users_data_blob;
                v4.setAccountBlob(l_encrypted_users_data_blob_0);
                v4.flush();
                if v30.responseBody.errors ~= nil and #v30.responseBody.errors > 0 then
                    v25:dispatch(v19("Authentication.AccountSwitch.Header.CantSwitchAccounts", "Authentication.AccountSwitch.Description.TryLoggingInDirectly.2", "CommonUI.Messages.Action.OK", "", v28, nil, v15.Auth.AccountSwitcherSwitchError));
                    return v6.reject(false);
                elseif l_encrypted_users_data_blob_0 ~= nil then
                    v25:dispatch(v3());
                    v5.clearLocalStorage();
                    if v8() then
                        v9.default:clearCache();
                    end;
                    if v10() then
                        l_AppStorageService_0:SetItem(v14.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS, "{}");
                    end;
                    if v12() then
                        v4.setRobloxLocaleId("");
                    end;
                    if v13 then
                        l_AppStorageService_0:SetItem("GamepadMenuVirtualCursorPromptShown", "false");
                    end;
                    l_MemStorageService_0:Fire(v18.ThemeUpdate, "dark");
                    l_MemStorageService_0:SetItem(v18.RobuxBalance, "0");
                    l_MemStorageService_0:SetItem(v18.RobuxBalanceLocalized, "--");
                    v17.clearUserLayers();
                    v4.setAccountSwitchStatus(v15.Auth.AccountSwitcherSwitchedStatus);
                    return v6.resolve(true);
                else
                    return v6.reject(false);
                end;
            end;
        end, function(_)
            v25:dispatch(v19("Authentication.AccountSwitch.Header.CantSwitchAccounts", "Authentication.AccountSwitch.Description.TryLoggingInDirectly.2", "CommonUI.Messages.Action.OK", "", v28, nil, v15.Auth.AccountSwitcherSwitchError));
            return v6.reject(false);
        end):andThen(function(v33)
            if v33 then
                if not v22 then
                    l_GuiService_0:BroadcastNotification("", v7.DID_LOG_OUT);
                else
                    l_GuiService_0:BroadcastNotification("", v7.DID_SWITCH_ACCOUNT);
                    return ;
                end;
            end;
        end, function(_)
            return v6.reject(false);
        end);
    end;
end;
