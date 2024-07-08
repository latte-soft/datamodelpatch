local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_GuiService_0 = game:GetService("GuiService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v5 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v5.Roact;
local l_RoactRodux_0 = v5.RoactRodux;
local l_t_0 = v5.t;
local l_UIBlox_0 = v5.UIBlox;
local l_Promise_0 = v5.Promise;
local l_FullscreenTitleBar_0 = l_UIBlox_0.App.Bar.FullscreenTitleBar;
local l_Parent_0 = script.Parent.Parent;
local v13 = require(l_Parent_0.InGameMenuPolicy);
local v14 = require(l_Parent_0.Thunks.OpenEducationalPopup);
local v15 = require(l_Parent_0.Actions.StartLeavingGame);
local v16 = require(l_Parent_0.Utility.ExternalEventConnection);
local v17 = require(l_Parent_0.Utility.UserLocalStore);
local v18 = require(l_Parent_0.Flags.GetFIntFullscreenTitleBarTriggerDelayMillis);
local v19 = require(l_Parent_0.Flags.GetFFlagCleanUpFullscreenTitleBarPromiseOnUnmount);
local v20 = require(l_Parent_0.Flags.GetFFlagFullscreenTitleBarInjectGameServices);
local v21 = require(l_Parent_0.Flags.GetFFlagFixFullscreenTitleBarPromiseCancel);
local v22 = l_Roact_0.PureComponent:extend("FullscreenTitleBar");
v22.validateProps = l_t_0.strictInterface({
    titleText = l_t_0.optional(l_t_0.string), 
    displayOrder = l_t_0.integer, 
    isMenuOpen = l_t_0.boolean, 
    isEducationalPopupEnabled = l_t_0.boolean, 
    maxDisplayCount = l_t_0.integer, 
    openEducationalPopup = l_t_0.callback, 
    startLeavingGame = l_t_0.callback, 
    userGameSettings = l_t_0.optional(l_t_0.union(l_t_0.Instance, l_t_0.table)), 
    guiService = l_t_0.optional(l_t_0.union(l_t_0.Instance, l_t_0.table)), 
    appStorageService = l_t_0.optional(l_t_0.union(l_t_0.Instance, l_t_0.table))
});
v22.defaultProps = {
    titleText = "Roblox", 
    userGameSettings = l_UserGameSettings_0, 
    guiService = l_GuiService_0, 
    appStorageService = l_AppStorageService_0
};
v22.init = function(v23)
    v23.userGameSettings = not not v20() and v23.props.userGameSettings or l_UserGameSettings_0;
    v23.guiService = not not v20() and v23.props.guiService or l_GuiService_0;
    v23.appStorageService = not not v20() and v23.props.appStorageService or l_AppStorageService_0;
    v23:setState({
        isTriggered = false, 
        fullscreenEnabled = v23.userGameSettings:InFullScreen()
    });
    v23.onFullscreenChanged = function(v24)
        v23:setState({
            fullscreenEnabled = v24, 
            isTriggered = false
        });
    end;
    v23.triggerTitleBar = function()
        local v25 = v18() / 1000;
        if v25 > 0 then
            v23.triggerTitleBarPromise = l_Promise_0.delay(v25):andThenCall(function()
                v23.triggerTitleBarPromise = nil;
                if not v23.state.isTriggered then
                    v23:setState({
                        isTriggered = true
                    });
                end;
            end);
            return ;
        else
            if not v23.state.isTriggered then
                v23:setState({
                    isTriggered = true
                });
            end;
            return ;
        end;
    end;
    v23.cancelTriggerTitleBar = function()
        if v23.triggerTitleBarPromise then
            v23.triggerTitleBarPromise:cancel();
            v23.triggerTitleBarPromise = nil;
        end;
    end;
    v23.hideTitleBar = function()
        if v23.state.isTriggered then
            v23:setState({
                isTriggered = false
            });
        end;
    end;
    v23.exitFullscreen = function()
        v23.hideTitleBar();
        v23.guiService:ToggleFullscreen();
    end;
    v23.closeRoblox = function()
        v23.hideTitleBar();
        if not v23.props.isEducationalPopupEnabled then
            v23.props.startLeavingGame();
            return ;
        else
            v23.props.openEducationalPopup(v23.guiService, v17.new(), v23.props.maxDisplayCount);
            return ;
        end;
    end;
    v23.onDisappear = function()
        if v23.hideTitleBarPromise then
            if not v21() then
                v23.hideTitleBarPromise.cancel();
            else
                v23.hideTitleBarPromise:cancel();
            end;
            v23.hideTitleBarPromise = nil;
        end;
        v23.hideTitleBarPromise = l_Promise_0.delay(0.5):andThenCall(function()
            v23.hideTitleBarPromise = nil;
            v23.hideTitleBar();
        end);
    end;
    v23.mouseReenter = function()
        if not (not v23.state.isTriggered or not v23.hideTitleBarPromise) then
            v23.hideTitleBarPromise:cancel();
            v23.hideTitleBarPromise = nil;
        end;
    end;
end;
v22.render = function(v26)
    return l_Roact_0.createFragment({
        FullscreenChangedEvent = l_Roact_0.createElement(v16, {
            event = v26.userGameSettings.FullscreenChanged, 
            callback = v26.onFullscreenChanged
        }), 
        FullscreenTitleBar = l_Roact_0.createElement(l_Roact_0.Portal, {
            target = l_CoreGui_0
        }, {
            InGameFullscreenTitleBarScreen = l_Roact_0.createElement("ScreenGui", {
                Enabled = v26.state.fullscreenEnabled, 
                IgnoreGuiInset = true, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = v26.props.displayOrder
            }, {
                TriggerArea = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    [l_Roact_0.Event.MouseEnter] = v26.triggerTitleBar, 
                    [l_Roact_0.Event.MouseLeave] = v26.cancelTriggerTitleBar
                }), 
                Bar = l_Roact_0.createElement(l_FullscreenTitleBar_0, {
                    title = v26.props.titleText, 
                    isTriggered = v26.state.isTriggered, 
                    onDisappear = v26.onDisappear, 
                    onHover = v26.mouseReenter, 
                    exitFullscreen = v26.exitFullscreen, 
                    closeRoblox = v26.closeRoblox
                })
            })
        })
    });
end;
v22.didUpdate = function(v27, v28)
    if not (v28.isMenuOpen or not v27.props.isMenuOpen) then
        v27.hideTitleBar();
    end;
end;
v22.willUnmount = function(v29)
    if v19() then
        if v29.hideTitleBarPromise then
            v29.hideTitleBarPromise:cancel();
        end;
        if v29.triggerTitleBarPromise then
            v29.triggerTitleBarPromise:cancel();
        end;
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v30, _)
    return {
        isMenuOpen = v30.isMenuOpen
    };
end, function(v32)
    return {
        openEducationalPopup = function(v33, v34, v35)
            return v32(v14(v33, v34, v35));
        end, 
        startLeavingGame = function()
            v32(v15());
        end
    };
end)((v13.connect(function(v36, _)
    return {
        isEducationalPopupEnabled = v36.enableEducationalPopup(), 
        maxDisplayCount = v36.educationalPopupMaxDisplayCount()
    };
end)(v22)));
