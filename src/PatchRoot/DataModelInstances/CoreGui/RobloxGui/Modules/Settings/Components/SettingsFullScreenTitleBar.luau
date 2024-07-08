local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v6 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v6.Roact;
local l_UIBlox_0 = v6.UIBlox;
local l_Promise_0 = v6.Promise;
local _ = require(l_CorePackages_0.Packages.Dash);
local l_t_0 = v6.t;
local l_InGameMenu_0 = l_RobloxGui_0.Modules.InGameMenu;
local v13 = require(l_InGameMenu_0.Resources.Constants);
local l_FullscreenTitleBar_0 = l_UIBlox_0.App.Bar.FullscreenTitleBar;
local v15 = require(l_InGameMenu_0.Utility.ExternalEventConnection);
local v16 = require(l_RobloxGui_0.Modules.Common.GetDefaultQualityLevel);
local v17 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v18 = require(l_InGameMenu_0.Flags.GetFIntFullscreenTitleBarTriggerDelayMillis);
local v19 = l_Roact_0.PureComponent:extend("SettingsFullScreenTitleBar");
v19.validateProps = l_t_0.strictInterface({
    titleText = l_t_0.optional(l_t_0.string), 
    onClose = l_t_0.optional(l_t_0.callback), 
    _mockFullScreen = l_t_0.optional(l_t_0.boolean)
});
v19.defaultProps = {
    titleText = "Roblox"
};
v19.init = function(v20)
    v20:setState({
        isTriggered = false
    });
    v20.show = function()
        v20:setTriggered(true);
    end;
    v20.hide = function()
        v20:setTriggered(false);
    end;
    v20.cancel = function()
        v20:unsetTriggered();
    end;
    v20.onFullscreenChanged = function()
        v20:unsetTriggered();
        v20:setState({
            isTriggered = false
        });
    end;
end;
v19.setTriggered = function(v21, v22)
    v21:unsetTriggered();
    if not (not l_UserGameSettings_0:InFullScreen() and not v21.props._mockFullScreen) then
        v21.triggerPromise = l_Promise_0.delay(v18() / 1000):andThenCall(function()
            v21.triggerPromise = nil;
            v21:setState({
                isTriggered = v22
            });
        end);
    end;
end;
v19.unsetTriggered = function(v23)
    if v23.triggerPromise then
        v23.triggerPromise:cancel();
        v23.triggerPromise = nil;
    end;
end;
v19.toggleFullscreen = function(_)
    l_GuiService_0:ToggleFullscreen();
end;
v19.leaveGame = function(_)
    l_GuiService_0.SelectedCoreObject = nil;
    l_RunService_0.RenderStepped:Wait();
    l_RunService_0.RenderStepped:Wait();
    game:Shutdown();
    settings().Rendering.QualityLevel = v16();
end;
v19.render = function(v26)
    return v17({
        FullscreenTitleBar = l_Roact_0.createElement(l_Roact_0.Portal, {
            target = l_CoreGui_0
        }, {
            InGameFullscreenTitleBarScreen = l_Roact_0.createElement("ScreenGui", {
                Enabled = true, 
                IgnoreGuiInset = true, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = v13.DisplayOrder.FullscreenTitleBar
            }, {
                FullscreenChangedEvent = l_Roact_0.createElement(v15, {
                    event = l_UserGameSettings_0.FullscreenChanged, 
                    callback = v26.onFullscreenChanged
                }), 
                TriggerArea = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    [l_Roact_0.Event.MouseEnter] = v26.show, 
                    [l_Roact_0.Event.MouseLeave] = v26.cancel
                }), 
                Bar = l_Roact_0.createElement(l_FullscreenTitleBar_0, {
                    title = v26.props.titleText, 
                    isTriggered = v26.state.isTriggered, 
                    onDisappear = v26.hide, 
                    onHover = v26.cancel, 
                    exitFullscreen = v26.toggleFullscreen, 
                    closeRoblox = v26.props.onClose or v26.leaveGame
                })
            })
        })
    });
end;
v19.willUnmount = function(v27)
    v27:unsetTriggered();
end;
return {
    mount = function(v28, v29, v30)
        return l_Roact_0.mount(l_Roact_0.createElement(v19, v28 or {}), v29, v30);
    end, 
    update = function(v31, v32)
        return l_Roact_0.update(v31, l_Roact_0.createElement(v19, v32));
    end, 
    unmount = function(v33)
        return l_Roact_0.unmount(v33);
    end
};
