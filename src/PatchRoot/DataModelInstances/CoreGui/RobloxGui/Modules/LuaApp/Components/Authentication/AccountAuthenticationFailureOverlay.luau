local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v5 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_Images_0 = v5.App.ImageSet.Images;
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagDisableAuthFailureRetry);
game:DefineFastInt("AuthFailureMaxRetryDelay", 300);
local v11 = v2.PureComponent:extend("AccountAuthenticationFailureOverlay");
v11.validateProps = v9.interface({
    onActivated = v9.callback, 
    screenSize = v9.Vector2
});
local function _(v12)
    return (math.min(2 ^ v12, game:GetFastInt("AuthFailureMaxRetryDelay")));
end;
v11.init = function(v14)
    v14.state = {
        countdownStarted = false, 
        secondsRemaining = nil
    };
    v14.timesRetried = 0;
    v14.onRetry = function()
        v14:setState({
            countdownStarted = true
        });
    end;
end;
v11.didUpdate = function(v15, _, v17)
    if not (not v15.state.countdownStarted or v17.countdownStarted) then
        v15:_onRetry();
    end;
end;
v11._onRetry = function(v18)
    v18.props.onActivated();
    v18.timesRetried = v18.timesRetried + 1;
    local v19 = tick();
    local v20 = math.min(2 ^ v18.timesRetried, game:GetFastInt("AuthFailureMaxRetryDelay"));
    local function v21()
        if v18.isMounted then
            local v22 = v20 - (tick() - v19);
            if v22 > 0 then
                v18:setState({
                    secondsRemaining = math.round(v22)
                });
                task.delay(1, v21);
                return ;
            else
                v18:setState({
                    countdownStarted = false, 
                    secondsRemaining = v2.None
                });
            end;
        end;
    end;
    v21();
end;
v11.render = function(v23)
    local v24 = nil;
    local v25 = nil;
    if not v10() then
        if not v23.state.countdownStarted then
            v24 = "Authentication.Login.Action.ConnectionError.RetryReady";
            v25 = "Authentication.Login.Label.ConnectionError.RetryReady";
        else
            v24 = "Authentication.Login.Action.ConnectionError.RetryWait";
            v25 = "Authentication.Login.Label.ConnectionError.RetryWait";
        end;
    else
        v24 = "Authentication.Login.Action.ConnectionError.RetryReady";
        v25 = "Authentication.Login.Label.ConnectionError.RetryDisabled";
    end;
    return l_withLocalization_0({
        titleText = "Authentication.Login.Label.ConnectionError.Title", 
        retryButtonText = v24, 
        bodyText = v25
    })(function(v26)
        return v2.createElement(l_InteractiveAlert_0, {
            title = v26.titleText, 
            bodyText = v26.bodyText, 
            titleIcon = l_Images_0["icons/status/error_large"], 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isDisabled = v23.state.countdownStarted or v10(), 
                            onActivated = v23.onRetry, 
                            text = string.gsub(v26.retryButtonText, "{.-}", v23.state.secondsRemaining or "")
                        }
                    }
                }
            }, 
            screenSize = v23.props.screenSize
        });
    end);
end;
v11.didMount = function(v27)
    v27.isMounted = true;
end;
v11.willUnmount = function(v28)
    v28.isMounted = false;
end;
return (v3.connect(function(v29, _)
    return {
        screenSize = v29.ScreenSize
    };
end)(v11));
