local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_CorePackages_0.Packages.React);
local l_useState_0 = v5.useState;
local l_useEffect_0 = v5.useEffect;
local v8 = require(l_Modules_0.Common.Roact);
local v9 = require(l_CorePackages_0.RoactNavigation);
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_LoadingSpinner_0 = require(l_CorePackages_0.UIBlox).App.Loading.LoadingSpinner;
local v12 = require(l_Modules_0.LuaApp.Analytics.RobloxTelemetryConfigs.DeviceAccessChallengeEvent);
local v13 = require(l_Modules_0.LuaApp.Components.Challenge.ChallengeEventConstants);
local v14 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppChallengeMoreTelemetryEnabled);
return function(v15)
    local v16 = l_useRoactService_0(l_AppLogging_0);
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    local v21 = l_HttpService_0:JSONDecode(v15.challengeMetadata);
    if v14() then
        local v22, v23 = l_useState_0(false);
        v17 = v22;
        v18 = v23;
        v22, v23 = l_useState_0(false);
        v19 = v22;
        v20 = v23;
    end;
    l_useEffect_0(function()
        v16:logRobloxTelemetryEvent(v12, {}, {
            context = v13.ChallengeLifecycleEventConstants.ChallengeInitialized, 
            challengeId = v15.challengeId, 
            tokenType = v21.tokenType
        });
        local l_accountService_0 = v15.accountService;
        local v25 = nil;
        if not (not l_accountService_0 or not l_accountService_0:DeviceAccessTokenAvailable()) then
            local v26 = l_HttpService_0:JSONDecode(l_accountService_0:GetDeviceAccessToken());
            v25 = v26.errorCode;
            if not (v25 ~= nil) or v25 == "" then
                v26.accessToken.tokenType = v21.tokenType;
                if v14() then
                    v18(true);
                end;
                v15.onChallengeCompleted(l_HttpService_0:JSONEncode(v26.accessToken));
                v16:logRobloxTelemetryEvent(v12, {}, {
                    context = v13.ChallengeLifecycleEventConstants.ChallengeCompleted, 
                    challengeId = v15.challengeId, 
                    tokenType = v21.tokenType
                });
                return ;
            end;
        end;
        if v14() then
            v20(true);
        end;
        v15.onChallengeFailed(v25);
        v16:logRobloxTelemetryEvent(v12, {}, {
            context = v13.ChallengeLifecycleEventConstants.ChallengeInvalidated, 
            challengeId = v15.challengeId, 
            tokenType = v21.tokenType, 
            errorCode = v25
        });
    end, {});
    local v28 = l_useSelector_0(function(v27)
        return {
            screenSize = v27.ScreenSize
        };
    end);
    return v8.createElement("Frame", {
        Size = UDim2.fromOffset(v28.screenSize.X, v28.screenSize.Y), 
        BackgroundTransparency = 0.2, 
        Active = true
    }, {
        Spinner = v8.createElement(l_LoadingSpinner_0, {
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.fromScale(0.5, 0.5), 
            size = UDim2.fromOffset(48, 48)
        }), 
        NavigationEvents = if not v14() then nil else v8.createElement(v9.NavigationEvents, {
            onWillBlur = function()
                if not (v17 or v19) then
                    v16:logRobloxTelemetryEvent(v12, {}, {
                        context = v13.ChallengeLifecycleEventConstants.ChallengeAbandoned, 
                        challengeId = v15.challengeId, 
                        tokenType = v21.tokenType
                    });
                end;
            end
        })
    });
end;
