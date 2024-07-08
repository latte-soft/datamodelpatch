local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local v7 = require(l_CorePackages_0.Packages.t);
local l_LoadingSpinner_0 = require(l_CorePackages_0.UIBlox).App.Loading.LoadingSpinner;
local v9 = require(l_Modules_0.LuaApp.Analytics.RobloxTelemetryConfigs.DeviceIntegrityChallengeEvent);
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableAsyncAttestationTokenRetrieval);
local v11 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableTransparentDeviceIntegrityChallengeSpinner);
local v12 = require(l_Modules_0.LuaApp.Components.Challenge.ChallengeEventConstants);
local v13 = v3.PureComponent:extend(script.Name);
v13.validateProps = v7.intersection(v7.interface({
    challengeId = v7.string, 
    challengeMetadata = v7.string, 
    onChallengeCompleted = v7.callback, 
    onChallengeFailed = v7.callback, 
    accountService = v7.interface({
        DeviceIntegrityAvailable = v7.callback, 
        GetDeviceIntegrityToken = v7.optional(v7.callback)
    }), 
    loggingProtocol = v7.interface({
        logRobloxTelemetryEvent = v7.callback
    })
}));
v13.init = function(v14)
    local v15 = l_HttpService_0:JSONDecode(v14.props.challengeMetadata);
    v14.props.loggingProtocol:logRobloxTelemetryEvent(v9, {}, {
        context = v12.ChallengeLifecycleEventConstants.ChallengeInitialized, 
        challengeId = v14.props.challengeId, 
        integrityType = v15.integrityType
    });
    local l_accountService_0 = v14.props.accountService;
    if not l_accountService_0 or not l_accountService_0:DeviceIntegrityAvailable() then
        v14.props.onChallengeFailed();
        v14.props.loggingProtocol:logRobloxTelemetryEvent(v9, {}, {
            context = v12.ChallengeLifecycleEventConstants.ChallengeInvalidated, 
            challengeId = v14.props.challengeId, 
            integrityType = v15.integrityType
        });
        return ;
    else
        local v17 = l_HttpService_0:JSONDecode(if not v10() then l_accountService_0:GetDeviceIntegrityToken(constructAccountServiceParams(v15.requestHash)) else l_accountService_0:GetDeviceIntegrityTokenYield(constructAccountServiceParams(v15.requestHash)));
        v14.props.onChallengeCompleted(l_HttpService_0:JSONEncode({
            redemptionToken = v17.token, 
            integrityType = v15.integrityType
        }));
        v14.props.loggingProtocol:logRobloxTelemetryEvent(v9, {}, {
            context = v12.ChallengeLifecycleEventConstants.ChallengeCompleted, 
            challengeId = v14.props.challengeId, 
            integrityType = v15.integrityType, 
            result = v17.result
        });
        return ;
    end;
end;
v13.render = function(v18)
    local v19 = UDim2.fromOffset(v18.props.screenSize.X, v18.props.screenSize.Y);
    if not v11() then
        return v3.createElement("Frame", {
            Size = v19, 
            BackgroundTransparency = 0.2, 
            Active = true
        }, {
            Spinner = v3.createElement(l_LoadingSpinner_0, {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                size = UDim2.fromOffset(48, 48)
            })
        });
    else
        return v3.createElement("Frame", {
            Size = v19, 
            BackgroundTransparency = 1, 
            Active = true
        }, {
            Spinner = v3.createElement(l_LoadingSpinner_0, {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                size = UDim2.fromOffset(48, 48)
            })
        });
    end;
end;
constructAccountServiceParams = function(v20)
    return l_HttpService_0:JSONEncode({
        requestHash = v20
    });
end;
return (l_RoactServices_0.connect({
    loggingProtocol = l_AppLogging_0
})((v4.connect(function(v21, _)
    return {
        screenSize = v21.ScreenSize
    };
end, nil)(v13))));
