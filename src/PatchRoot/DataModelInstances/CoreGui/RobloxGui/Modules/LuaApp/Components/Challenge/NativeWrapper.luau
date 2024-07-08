local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v4 = require(l_Modules_0.Common.Roact);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.RoactNavigation);
local v7 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v8 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local v11 = require(l_Modules_0.LuaApp.Enum.Challenge.GenericType);
local v12 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v13 = require(l_Modules_0.LuaApp.Http.UrlBase);
local v14 = require(l_Modules_0.LuaApp.Promise);
local v15 = require(l_Modules_0.LuaApp.Analytics.RobloxTelemetryConfigs.ChallengeNativeWrapperEvent);
local v16 = require(l_Modules_0.LuaApp.Components.Challenge.DeviceIntegrityTokenChallenge);
local v17 = require(l_Modules_0.LuaApp.Components.Challenge.DeviceAccessTokenChallenge);
local l_FFlagUnifyNavigationGraph_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifyNavigationGraph;
local v19 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppChallengeMoreTelemetryEnabled);
local v20 = nil;
pcall(function()
    v20 = game:GetService("AccountService");
end);
local v21 = v4.PureComponent:extend(script.Name);
v21.defaultProps = {
    accountService = v20
};
local v22 = v12.new({
    base = v13.APIS, 
    path = "challenge/v1/continue"
});
canRenderNativeChallenge = function(v23, v24)
    local v25;
    if v23 ~= v11.DeviceIntegrity then
        v25 = false;
        if not (v23 == v11.DeviceAccessToken) then
            goto label0;
        end;
    end;
    v25 = false;
    if v24 ~= nil then
        v25 = v24 ~= "";
    end;
    ::label0::;
    return v25;
end;
v21.init = function(v26)
    v26:validateChallengeAndSetState(v26.props.challengeType, v26.props.challengeMetadata);
end;
v21.render = function(v27)
    local l_challengeType_0 = v27.state.challengeType;
    local l_challengeMetadata_0 = v27.state.challengeMetadata;
    if l_challengeType_0 == v11.DeviceIntegrity then
        return v4.createElement(v16, {
            challengeId = v27.props.challengeId, 
            challengeMetadata = l_challengeMetadata_0, 
            onChallengeCompleted = function(v30)
                v27:challengeContinue(v30);
            end, 
            onChallengeFailed = function(v31)
                v27:failSession(v31);
            end, 
            accountService = v27.props.accountService
        });
    elseif l_challengeType_0 == v11.DeviceAccessToken then
        return v4.createElement(v17, {
            challengeId = v27.props.challengeId, 
            challengeMetadata = l_challengeMetadata_0, 
            onChallengeCompleted = function(v32)
                v27:challengeContinue(v32);
            end, 
            onChallengeFailed = function(v33)
                v27:failSession(v33);
            end, 
            accountService = v27.props.accountService
        });
    else
        return nil;
    end;
end;
v21.clearState = function(v34)
    v34:setState({
        challengeId = nil, 
        challengeType = nil, 
        challengeMetadata = nil
    });
    v34.props.navigation.goBack();
end;
v21.failSession = function(v35, v36)
    v35.props.onSessionFailed(v36);
    v35:clearState();
end;
v21.validateChallengeAndSetState = function(v37, v38, v39)
    if not canRenderNativeChallenge(v38, v39) then
        if v19() then
            v37.props.loggingProtocol:logRobloxTelemetryEvent(v15, {}, {
                context = "renderFailure", 
                challengeId = v37.props.challengeId, 
                challengeType = v38, 
                challengeMetadata = v39
            });
        end;
        v37:failSession();
        return ;
    else
        if v19() then
            v37.props.loggingProtocol:logRobloxTelemetryEvent(v15, {}, {
                context = "challengeTriggered", 
                challengeId = v37.props.challengeId, 
                challengeType = v38, 
                challengeMetadata = v39
            });
        end;
        v37:setState({
            challengeType = v38, 
            challengeMetadata = v39
        });
        return ;
    end;
end;
v21.challengeContinue = function(v40, v41)
    local v42 = v11.toRawValue(v40.state.challengeType);
    return v14.new(function(v43, _)
        local v45, _ = v40.props.networkImpl(v22(), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                challengeId = v40.props.challengeId, 
                challengeType = v42, 
                challengeMetadata = v41
            })
        });
        return v45:andThen(function(v47)
            local l_responseBody_0 = v47.responseBody;
            if l_responseBody_0.challengeType ~= nil and l_responseBody_0.challengeType ~= "" then
                v40:validateChallengeAndSetState(v11.fromRawValue(l_responseBody_0.challengeType), l_responseBody_0.challengeMetadata);
                v43();
                return ;
            else
                v40.props.onSessionCompleted();
                v40:clearState();
                v43();
                return ;
            end;
        end, function(v49)
            if v19() then
                v40.props.loggingProtocol:logRobloxTelemetryEvent(v15, {}, {
                    context = "continueFailure", 
                    challengeId = v40.props.challengeId, 
                    challengeType = v42, 
                    challengeMetadata = v41, 
                    error = tostring(v49.StatusCode)
                });
            end;
            v40:failSession(v49);
            v43();
        end);
    end);
end;
if l_FFlagUnifyNavigationGraph_0 then
    local l_v21_0 = v21;
    v21 = function(v51)
        return v4.createElement(l_v21_0, v5.Dictionary.join(v51, v51.navigation.getParam("extraProps", {})));
    end;
end;
return (l_RoactServices_0.connect({
    networkImpl = v3, 
    analytics = v7, 
    loggingProtocol = l_AppLogging_0
})((v8.connect(nil, nil)((v6.withNavigation(v21))))));
