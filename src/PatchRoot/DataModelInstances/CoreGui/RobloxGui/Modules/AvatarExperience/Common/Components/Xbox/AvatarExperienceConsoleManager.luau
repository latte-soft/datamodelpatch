local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Lighting_0 = game:GetService("Lighting");
local v3 = nil;
pcall(function()
    v3 = game:GetService("ThirdPartyUserService");
end);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v8 = require(l_Modules_0.Shell.Actions.RemoveScreen);
local v9 = require(l_Modules_0.Shell.CameraManager);
local v10 = require(l_Modules_0.Shell.AvatarEditorScreenWrapper);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceMountedAtStartup);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.Xbox.AvatarExperienceViewportListener);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.Xbox.AvatarExperienceThemeFetcher);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.Xbox.AppShellContext);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.EventReceivers.AXPlatformServiceListener);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.Xbox.AvatarExperienceConsoleAppContainer);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.Xbox.AvatarExperiencePurchaseEventListener);
local v18 = require(l_Modules_0.LuaApp.AppPage);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v20 = require(l_Modules_0.LuaApp.Components.ToastV2);
local v21 = require(l_Modules_0.LuaApp.Thunks.NavigateToRoute);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadBottomBar);
local v23 = require(l_Modules_0.LuaApp.Navigation.CurrentTabContext);
local v24 = require(l_Modules_0.LuaApp.Navigation.SwitchNavigatorVisibleContext);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v26 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.gamepad");
local v27 = v4.PureComponent:extend("AvatarExperienceConsoleManager");
local v28 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagUpdateAppShellBalance);
v27.validateProps = v6.strictInterface({
    store = v6.table, 
    screenList = v6.table, 
    navigateToPage = v6.callback, 
    removeScreen = v6.callback
});
v27.wrapPageInScreenGui = function(v29, v30, _, v32, v33)
    return v4.createElement("ScreenGui", {
        Enabled = v32.isVisible and v29.props.screenList[1].id == tostring(v10), 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        DisplayOrder = v32.displayOrder
    }, {
        Contents = v4.createElement(v30, v33)
    });
end;
v27.updateLighting = function(_)
    local l_AvatarEditor_0 = l_Lighting_0:FindFirstChild("AvatarEditor");
    if l_AvatarEditor_0 then
        l_AvatarEditor_0:Destroy();
    end;
    local l_Blur_0 = l_Lighting_0:FindFirstChild("Blur");
    if l_Blur_0 then
        l_Blur_0.Enabled = false;
    end;
end;
v27.init = function(v37)
    v37.state = {
        start = false
    };
    v37.returnToAppShell = function()
        v26:info("returnToAppShell()");
        v37.props.removeScreen(v37.props.screenList[1]);
    end;
    v37.appShellContextValue = {
        returnToAppShell = v37.returnToAppShell
    };
    v37.onActiveUserSignedOut = function()
        if v37.state.start then
            v9:SwitchToFlyThrough();
            v37:setState({
                start = false
            });
        end;
    end;
end;
v27.renderAvatarExperienceRoot = function(v38)
    local l_start_0 = v38.state.start;
    return (v4.createElement(v24.Provider, {
        value = true
    }, {
        Content = v4.createElement(v23.Provider, {
            value = not not l_start_0 and v19.AvatarExperienceRoot or v18.None
        }, {
            Content = v4.createElement(v14.Provider, {
                value = v38.appShellContextValue
            }, {
                Content = v38:wrapPageInScreenGui(v16, v19.AvatarExperienceRoot, {
                    isVisible = l_start_0, 
                    displayOrder = 0
                })
            })
        })
    }));
end;
v27.didUpdate = function(v40, v41, _)
    if v40.props.screenList ~= v41.screenList then
        if not (not (v41.screenList[1] and v41.screenList[1].id ~= tostring(v10)) or not v40.props.screenList[1]) and v40.props.screenList[1].id == tostring(v10) then
            v9:SwitchToAvatarEditor();
            v40:updateLighting();
            v40:setState({
                start = true
            });
            return ;
        elseif not (not (v41.screenList[1] and v41.screenList[1].id == tostring(v10)) or not v40.props.screenList[1]) and v40.props.screenList[1].id ~= tostring(v10) then
            v9:SwitchToFlyThrough();
            v40:setState({
                start = false
            });
        end;
    end;
end;
v27.render = function(v43)
    return v4.createElement("Folder", {}, {
        Toast = v4.createElement(v20, {
            displayOrder = 13
        }), 
        GamepadBottomBar = v4.createElement(v22, {
            displayOrder = 14, 
            hideGamepadBottomBar = v43.props.screenList[1].id ~= tostring(v10)
        }), 
        AvatarExperienceViewportListener = v4.createElement(v12), 
        AvatarExperienceThemeFetcher = v4.createElement(v13), 
        AvatarExperienceMountedAtStartup = v4.createElement(v11, {
            userLoggedIn = true, 
            shouldStart = v43.state.start, 
            store = v43.props.store
        }), 
        AvatarExperienceRoot = v43:renderAvatarExperienceRoot(), 
        AXPlatformServiceListener = v4.createElement(v15), 
        AvatarExperiencePurchaseEventListener = if not v28() then nil else v4.createElement(v17), 
        ActiveUserSignedOutCn = if not v3 then nil else v4.createElement(l_ExternalEventConnection_0, {
            event = v3.ActiveUserSignedOut, 
            callback = v43.onActiveUserSignedOut
        })
    });
end;
return v5.connect(function(v44, _)
    return {
        screenList = v44.ScreenList
    };
end, function(v46)
    return {
        navigateToPage = function(v47)
            v46(v21({
                {
                    name = v47
                }
            }));
        end, 
        removeScreen = function(v48)
            v46(v8(v48));
        end
    };
end)(v27);
