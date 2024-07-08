local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v5.Focusable;
local v7 = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.AfterAvatarExperienceLoaded);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceView);
local v16 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.ExternalNavigationHandler);
local v19 = require(l_Modules_0.AvatarExperience.Common.Actions.SetPlayEmoteInBackground);
local v20 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v22 = v4.PureComponent:extend("AvatarBackground");
v22.defaultProps = {
    playEmote = true, 
    isVisible = true, 
    isTopBarVisible = true
};
v22.validateProps = v8.strictInterface({
    focusController = v8.optional(v8.table), 
    title = v8.optional(v8.string), 
    playEmote = v8.optional(v8.boolean), 
    isVisible = v8.optional(v8.boolean), 
    renderContent = v8.optional(v8.callback), 
    isTopBarSecondary = v8.optional(v8.boolean), 
    isTopBarVisible = v8.optional(v8.boolean), 
    deviceOrientation = v8.string, 
    currentCharacter = v8.Instance, 
    setPlayEmoteInBackground = v8.callback, 
    navigateBackInAppRoute = v8.callback, 
    avatarRoute = v8.optional(v8.table), 
    detail = v8.optional(v8.string), 
    navigation = v8.table
});
v22.init = function(v23)
    v23.focusController = v23.props.focusController or v5.createFocusController();
    v23.backButtonPressed = function()
        v23.props.navigateBackInAppRoute(true);
    end;
    v23.backButton = v16.makeBackButton(v23.backButtonPressed);
    v23.renderContent = function()
        if not v23.props.renderContent then
            return nil;
        else
            return v23.props.renderContent({
                character = v23.props.currentCharacter
            });
        end;
    end;
end;
v22.renderTopBarWithLocalized = function(v24)
    if not v24.props.title then
        return v24:renderTopBar("");
    else
        return l_withLocalization_0({
            title = v24.props.title
        })(function(v25)
            return v24:renderTopBar(v25.title);
        end);
    end;
end;
v22.renderTopBar = function(v26, v27)
    return v4.createElement(v16.Container, {
        isSecondary = v26.props.isTopBarSecondary, 
        titleText = v27, 
        transparentBackground = true, 
        leftItem = v26.backButton
    });
end;
v22.renderAvatarExperienceView = function(v28, v29)
    return v4.createElement(v15, {
        topBar = not not v29 and v28:renderTopBarWithLocalized() or nil, 
        bottomBarEnabled = false, 
        isSceneFullView = true, 
        isUIFullView = false
    }, {
        ExternalNavigationHandler = v4.createElement(v18, {
            navigation = v28.props.navigation
        }), 
        GamepadFocusHandlerForPage = v4.createElement(v14, {
            focusController = v28.focusController
        })
    });
end;
v22.renderMainView = function(v30)
    if v30.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait then
        return v30:renderAvatarExperienceView(v30.props.isTopBarVisible);
    else
        return v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, {
            TopBar = if v30.props.isTopBarVisible then v30:renderTopBarWithLocalized() else nil, 
            AEView = v30:renderAvatarExperienceView(false)
        });
    end;
end;
v22.render = function(v31)
    return v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        focusController = v31.focusController
    }, {
        BackButtonConnection = v4.createElement(l_ExternalEventConnection_0, {
            event = l_GuiService_0.ShowLeaveConfirmation, 
            callback = v31.backButtonPressed
        }), 
        NavigationEventsLogger = v4.createElement(v17, {
            pageName = "AvatarBackground"
        }), 
        Mainview = v31:renderMainView(), 
        Content = v31.renderContent()
    });
end;
v22.didUpdate = function(v32, v33)
    if v32.props.playEmote ~= v33.playEmote then
        v32.props.setPlayEmoteInBackground(v32.props.playEmote);
    end;
end;
v22.didMount = function(v34)
    v34.props.setPlayEmoteInBackground(v34.props.playEmote);
end;
return v13((v11((v7.connect(function(v35)
    return {
        deviceOrientation = v35.DeviceOrientation, 
        currentCharacter = v35.AvatarExperience.AvatarScene.Character.CurrentCharacter
    };
end, function(v36)
    return {
        setPlayEmoteInBackground = function(v37)
            v36(v19(v37));
        end, 
        navigateBackInAppRoute = function(v38)
            v36(v20(v38));
        end
    };
end)(v22)))));
