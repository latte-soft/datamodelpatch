local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_Modules_0.LuaApp.AppPage);
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v7 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local l_LoadingSpinner_0 = v4.App.Loading.LoadingSpinner;
local v9 = v2.PureComponent:extend(script.Name);
v9.init = function(v10)
    v10:setState({
        challengeDisplayed = false
    });
end;
v9.didMount = function(v11)
    v11.isMounted = true;
    v11.props.navigateToChallengeWebView({
        challengeType = v11.props.challengeType, 
        challengeParameters = v11.props.challengeParameters, 
        onChallengeAbandoned = v11.props.onChallengeAbandoned, 
        onChallengeLoadFailed = v11.props.onChallengeLoadFailed, 
        onChallengeDisplayed = function()
            v11:setState({
                challengeDisplayed = true
            });
        end, 
        onChallengeUnmounted = function()
            v11.props.navigateBack();
        end, 
        forceWebViewVisible = v11.props.forceWebViewVisible
    });
end;
v9.willUnmount = function(v12)
    v12.isMounted = false;
end;
v9.render = function(v13)
    return v2.createElement("Frame", {
        Size = UDim2.fromOffset(v13.props.screenSize.X, v13.props.screenSize.Y), 
        BackgroundTransparency = 0.2, 
        Active = true
    }, {
        Spinner = v2.createElement(l_LoadingSpinner_0, {
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.fromScale(0.5, 0.5), 
            size = UDim2.fromOffset(48, 48)
        })
    });
end;
return (v3.connect(function(v14, _)
    return {
        screenSize = v14.ScreenSize
    };
end, function(v16)
    return {
        navigateBack = function()
            return v16(v6(true));
        end, 
        navigateToChallengeWebView = function(v17)
            return v16(v7({
                name = v5.ChallengeHybridWebView, 
                extraProps = v17
            }, true));
        end
    };
end)(v9));
