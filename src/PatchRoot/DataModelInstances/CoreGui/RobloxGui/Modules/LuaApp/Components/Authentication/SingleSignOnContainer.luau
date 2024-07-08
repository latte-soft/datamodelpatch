local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local l_LoadingSpinner_0 = v3.App.Loading.LoadingSpinner;
local l_IconSize_0 = v3.App.Constant.IconSize;
local v6 = require(l_Modules_0.LuaApp.AppPage);
local v7 = require(l_Modules_0.LuaApp.Thunks.Authentication.LoginSingleSignOn);
local v8 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v9 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v10 = require(l_Modules_0.LuaApp.Analytics.Events.AppLoginCounterNames);
local v11 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local v12 = require(l_Modules_0.LuaApp.Components.Authentication.Logger);
local v13 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v14 = require(l_Modules_0.LuaApp.Promise);
local v15 = require(l_Modules_0.LuaApp.Actions.Authentication.SetLoginResult);
local v16 = require(l_Modules_0.LuaApp.Enum.LoginErrorCodeSSO);
local v17 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v18 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_AppOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppOmniRecommendationsRequest;
local v20 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v21 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useEarlyIsFocused_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useEarlyIsFocused;
local l_IsPrefetchOneCopyEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).IsPrefetchOneCopyEnabled;
local v26 = require(script.Parent.Flags.FFlagSSOLoggingProtocolEnabled);
local function v33(v27, v28, v29, v30, v31, v32)
    v30(v15(v27));
    v9(v10.Success, 1);
    if not v26 then
        v30(v8(v28, v29, v31, v32));
        return ;
    else
        v30(v8(v28, v29, v31, v32, v11.Startup, v13));
        return ;
    end;
end;
local function v44(v34, v35, v36, v37, v38, v39, v40)
    return v34(v7(v35)):andThen(function(v41)
        if v41 then
            v33(v41, v35, v36, v34, v37, v38);
        end;
        return v14.resolve();
    end, function(v42)
        local l_errorCode_0 = v42.errorCode;
        v12:warning(string.format("Single sign on failed error: %s", (tostring(l_errorCode_0))));
        if not l_errorCode_0 or l_errorCode_0 ~= v16.NoAccountConnected and not v16.NoAccountConnectedXbox then
            v40();
            return v14.reject(v42);
        else
            v39();
            return v14.resolve();
        end;
    end);
end;
local function v46(v45)
    return v45;
end;
return function(_)
    local v48 = l_useNavigation_0();
    local v49 = l_useDispatch_0();
    local v50 = v20(v17);
    local v51 = v20(v18);
    local v52 = v21(v46);
    local v53 = nil;
    if l_IsPrefetchOneCopyEnabled_0() then
        v53 = v20(l_AppOmniRecommendationsRequest_0);
    end;
    local v54 = v2.useCallback(function()
        return v48.navigate(v6.Authentication);
    end, {
        v48
    });
    local v55 = v2.useCallback(function()
        return v48.navigate(v6.EngagementScreenContainer);
    end, {
        v48
    });
    local v56 = l_useEarlyIsFocused_0();
    v2.useEffect(function()
        if v56 then
            v44(v49, v50, v53, v51, v52, v54, v55):andThen(function(_)
                return v14.resolve();
            end, function(_)
                return v14.resolve();
            end);
        end;
    end, {
        v56
    });
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        ZIndex = 1
    }, {
        LoadingBar = v2.createElement(l_LoadingSpinner_0, {
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.fromScale(0.5, 0.5), 
            size = UDim2.fromOffset(l_IconSize_0.Large, l_IconSize_0.Large)
        })
    });
end;
