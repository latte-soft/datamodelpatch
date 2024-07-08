local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.FollowingsPostFollow);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.FollowingsDeleteFollow);
local _ = require(l_Modules_0.LuaApp.Actions.SetGameFollow);
local v6 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v8 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v9 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v10 = require(l_Modules_0.LuaApp.Actions.SetGameFollow);
local _ = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v14 = require(l_Modules_0.LuaApp.Actions.Games.SetExperienceNotificationsEnabledCount);
local v15 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixNotificationsEnabledLimitReached);
local function _(v16, v17)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v19 = l_Localization_0.new(l_RobloxLocaleId_0);
    v19:SetLocale(l_RobloxLocaleId_0);
    return v19:Format(v16, v17);
end;
local function v21(v22, v23, v24, v25, v26, v27)
    if type(v23) ~= "string" then
        error("SendGameFollow thunk expects universeId to be a string");
    end;
    if type(v24) ~= "boolean" then
        error("SendGameFollow thunk expects isFollowed to be a boolean");
    end;
    return l_PerformFetch_0.Single("SendGameFollow" .. v23, function(v28)
        local l_LocalUserId_0 = v28:getState().LocalUserId;
        if v25 then
            if not v15() then
                local v30 = v28:getState().GameFollowings[v23];
                if not (not not v30 and (v30.canFollow or false) or not v24) then
                    v28:dispatch(v8({
                        toastType = v9.GameFollowError, 
                        toastMessage = "Feature.GameFollows.TooltipNotificationsLimitReached"
                    }));
                    return v2.resolve();
                end;
            else
                local v31 = v27 or 0;
                local v32 = v26 or 0;
                if not v24 then
                    v28:dispatch(v14(v32 - 1));
                elseif v31 <= v32 then
                    v28:dispatch(v8({
                        toastType = v9.GameFollowError, 
                        toastMessage = "Feature.GameFollows.TooltipNotificationsLimitReached"
                    }));
                    return v2.resolve();
                else
                    v28:dispatch(v14(v32 + 1));
                end;
            end;
            v28:dispatch(v10(v23, v24));
        end;
        if not v24 then
            return v4(v22, l_LocalUserId_0, v23):andThen(function(v33)
                if v28:getState().GameFollowings[v23].isFollowed then
                    return v21(v22, v23, true, v25, v26, v27);
                else
                    if v25 then
                        local v34 = v28:getState().Games and v28:getState().Games[v23];
                        local v35 = not not v34 and v34.name or "";
                        local l_v28_0 = v28;
                        local l_v8_0 = v8;
                        local v38 = {
                            toastType = v9.NotificationsTurnedOff
                        };
                        local v39 = {
                            experienceName = v35
                        };
                        local l_RobloxLocaleId_1 = l_LocalizationService_0.RobloxLocaleId;
                        local v41 = l_Localization_0.new(l_RobloxLocaleId_1);
                        v41:SetLocale(l_RobloxLocaleId_1);
                        v38.toastMessage = v41:Format("Feature.GameFollows.TooltipTurnedOffNotifications", v39);
                        v38.isLocalized = true;
                        l_v28_0:dispatch(l_v8_0(v38));
                    end;
                    return v2.resolve(v33);
                end;
            end, function(v42)
                v28:dispatch(v10(v23, true));
                if v15() then
                    v28:dispatch(v14(v26 or 0));
                end;
                v28:dispatch(v6(v42));
                return v2.reject(v42);
            end);
        else
            return v3(v22, l_LocalUserId_0, v23):andThen(function(v43)
                if not v28:getState().GameFollowings[v23].isFollowed then
                    return v21(v22, v23, false, v25, v26, v27);
                else
                    if v25 then
                        local v44 = v28:getState().Games and v28:getState().Games[v23];
                        local v45 = not not v44 and v44.name or "";
                        local l_v28_1 = v28;
                        local l_v8_1 = v8;
                        local v48 = {
                            toastType = v9.NotificationsTurnedOn
                        };
                        local v49 = {
                            experienceName = v45
                        };
                        local l_RobloxLocaleId_2 = l_LocalizationService_0.RobloxLocaleId;
                        local v51 = l_Localization_0.new(l_RobloxLocaleId_2);
                        v51:SetLocale(l_RobloxLocaleId_2);
                        v48.toastMessage = v51:Format("Feature.GameFollows.TooltipTurnedOnNotifications", v49);
                        v48.isLocalized = true;
                        l_v28_1:dispatch(l_v8_1(v48));
                    end;
                    return v2.resolve(v43);
                end;
            end, function(v52)
                v28:dispatch(v10(v23, false));
                if v15() then
                    v28:dispatch(v14(v26 or 0));
                end;
                if v52.StatusCode == 400 then
                    v28:dispatch(v8({
                        toastType = v9.GameFollowError, 
                        toastMessage = not v25 and "Feature.GameFollows.TooltipFollowLimitReached" or "Feature.GameFollows.TooltipNotificationsLimitReached"
                    }));
                else
                    v28:dispatch(v6(v52));
                end;
                return v2.reject(v52);
            end);
        end;
    end);
end;
return v21;
