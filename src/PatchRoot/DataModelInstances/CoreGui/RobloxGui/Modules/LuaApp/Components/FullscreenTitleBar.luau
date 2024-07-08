local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Promise);
local v5 = require(l_CorePackages_0.Packages.t);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_AppUserGameSettings_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUserGameSettings;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v10 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v11 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v12 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local l_FullscreenTitleBar_0 = require(l_CorePackages_0.UIBlox).App.Bar.FullscreenTitleBar;
local v14 = require(l_Modules_0.LuaApp.Flags.GetFIntFullscreenTitleBarTriggerDelayMillis);
local v15 = require(l_Modules_0.LuaApp.Flags.GetFFlagFixFullscreenTitleBarPromiseCancel);
local v16 = v3.PureComponent:extend("FullscreenTitleBar");
v16.validateProps = v5.strictInterface({
    titleText = v5.optional(v5.string), 
    displayOrder = v5.integer, 
    appUserGameSettings = v5.optional(v5.union(v5.Instance, v5.table)), 
    guiService = v5.optional(v5.union(v5.Instance, v5.table)), 
    analytics = v5.optional(v5.union(v5.Instance, v5.table))
});
v16.defaultProps = {
    titleText = "Roblox", 
    displayOrder = 1
};
v16.init = function(v17)
    v17:setState({
        isTriggered = false, 
        fullscreenEnabled = v17.props.appUserGameSettings:InFullScreen()
    });
    v17.onFullscreenChanged = function(v18)
        v17:setState({
            fullscreenEnabled = v18, 
            isTriggered = false
        });
    end;
    v17.triggerTitleBar = function()
        local v19 = v14() / 1000;
        if v19 > 0 then
            v17.triggerTitleBarPromise = v4.delay(v19):andThenCall(function()
                v17.triggerTitleBarPromise = nil;
                if not v17.state.isTriggered then
                    v17:setState({
                        isTriggered = true
                    });
                end;
            end);
            return ;
        else
            if not v17.state.isTriggered then
                v17:setState({
                    isTriggered = true
                });
            end;
            return ;
        end;
    end;
    v17.cancelTriggerTitleBar = function()
        if v17.triggerTitleBarPromise then
            v17.triggerTitleBarPromise:cancel();
            v17.triggerTitleBarPromise = nil;
        end;
    end;
    v17.onDisappear = function()
        if v17.hideTitleBarPromise then
            if not v15() then
                v17.hideTitleBarPromise.cancel();
            else
                v17.hideTitleBarPromise:cancel();
            end;
            v17.hideTitleBarPromise = nil;
        end;
        v17.hideTitleBarPromise = v4.delay(0.5):andThenCall(function()
            v17.hideTitleBarPromise = nil;
            if v17.state.isTriggered then
                v17:setState({
                    isTriggered = false
                });
            end;
        end);
    end;
    v17.exitFullscreen = function()
        if v17.state.isTriggered then
            v17:setState({
                isTriggered = false
            });
        end;
        v17.props.guiService:ToggleFullscreen();
    end;
    v17.closeRoblox = function()
        v17.props.guiService:BroadcastNotification("", v10.NATIVE_EXIT);
    end;
    v17.mouseReenter = function()
        if not (not v17.state.isTriggered or not v17.hideTitleBarPromise) then
            v17.hideTitleBarPromise:cancel();
            v17.hideTitleBarPromise = nil;
        end;
    end;
end;
v16.render = function(v20)
    return v3.createFragment({
        FullscreenChangedEvent = v3.createElement(v11, {
            event = v20.props.appUserGameSettings.FullscreenChanged, 
            callback = v20.onFullscreenChanged
        }), 
        FullscreenTitleBar = v20.state.fullscreenEnabled and v3.createElement(v3.Portal, {
            target = l_CoreGui_0
        }, {
            FullscreenTitleBarScreen = v3.createElement(v12, {
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = v20.props.displayOrder
            }, {
                TriggerArea = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    [v3.Event.MouseEnter] = v20.triggerTitleBar, 
                    [v3.Event.MouseLeave] = v20.cancelTriggerTitleBar
                }), 
                Bar = v3.createElement(l_FullscreenTitleBar_0, {
                    title = v20.props.titleText, 
                    isTriggered = v20.state.isTriggered, 
                    onDisappear = v20.onDisappear, 
                    onHover = v20.mouseReenter, 
                    exitFullscreen = v20.exitFullscreen, 
                    closeRoblox = v20.closeRoblox
                })
            })
        })
    });
end;
v16.willUnmount = function(v21)
    if v21.hideTitleBarPromise then
        v21.hideTitleBarPromise:cancel();
    end;
    if v21.triggerTitleBarPromise then
        v21.triggerTitleBarPromise:cancel();
    end;
end;
return l_RoactServices_0.connect({
    analytics = v7, 
    appUserGameSettings = l_AppUserGameSettings_0, 
    guiService = l_AppGuiService_0
})(v16);
