local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.BackButtonAction);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.connectFakeBackButton);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v11 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.rn.backButton");
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.getActiveChildNavigationOptionsSafely);
local v13 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v14 = require(l_Modules_0.LuaApp.Thunks.InstantResetNavigationHistory);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v18 = v4.Component:extend("BackButtonHandler");
v18.validateProps = v6.strictInterface({
    navigation = v6.table, 
    avatarExperienceActive = v6.boolean, 
    resetNavigationHistory = v6.optional(v6.callback), 
    instantResetNavigationHistory = v6.optional(v6.callback), 
    avatarRoute = v6.optional(v6.table), 
    EventForTests = v6.optional(v6.table)
});
v18.init = function(v19)
    v19.backButtonConnection = nil;
    v19.onBackButtonPressed = function()
        local l_navigation_0 = v19.props.navigation;
        local v21 = v19:getBackButtonAction();
        v11:info("pressed: {}", v21);
        if v21 == v8.GoBack then
            local l_prevNavPage_0 = v19.props.avatarRoute.current.params.prevNavPage;
            local l_prevNavHistory_0 = v19.props.avatarRoute.current.params.prevNavHistory;
            if not l_prevNavPage_0 or not l_prevNavHistory_0 then
                v10.closeFocusedScreen(l_navigation_0);
                return ;
            elseif not rawget(v15, l_prevNavPage_0) then
                v19.props.resetNavigationHistory(l_prevNavHistory_0);
                return ;
            else
                l_navigation_0.navigate(l_prevNavPage_0);
                return ;
            end;
        elseif v21 == v8.Unhandled then
            l_GuiService_0:BroadcastNotification("", v7.BACK_BUTTON_NOT_CONSUMED);
            return ;
        elseif v21 == v8.NoOp then
            return ;
        else
            v11:warning("Invalid back button action: {}", v21);
            return ;
        end;
    end;
    v9(v19.onBackButtonPressed);
end;
v18.getBackButtonAction = function(v24)
    return v12(v24.props.navigation).backButtonAction or v8.GoBack;
end;
v18.render = function(_)
    return nil;
end;
v18.didMount = function(v26)
    if v26.props.avatarExperienceActive then
        v26:connectBackButton();
    end;
end;
v18.didUpdate = function(v27, v28, _)
    if v28.avatarExperienceActive ~= v27.props.avatarExperienceActive then
        if not v27.props.avatarExperienceActive then
            v27:disconnectBackButton();
        else
            v27:connectBackButton();
            return ;
        end;
    end;
end;
v18.willUnmount = function(v30)
    v30:disconnectBackButton();
end;
v18.connectBackButton = function(v31)
    if not v31.backButtonConnection then
        v11:info("connected");
        pcall(function()
            if not v31.props.EventForTests then
                v31.backButtonConnection = l_GuiService_0.ShowLeaveConfirmation:Connect(v31.onBackButtonPressed);
                return ;
            else
                v31.backButtonConnection = v31.props.EventForTests:Connect(v31.onBackButtonPressed);
                return ;
            end;
        end);
        return ;
    else
        return ;
    end;
end;
v18.disconnectBackButton = function(v32)
    v11:info("disconnected");
    if v32.backButtonConnection then
        v32.backButtonConnection:Disconnect();
        v32.backButtonConnection = nil;
    end;
end;
return (v5.connect(function(v33, _)
    local l_history_0 = v33.Navigation.history;
    local v36 = l_history_0[#l_history_0];
    return {
        avatarExperienceActive = v36[#v36].name == v15.AvatarExperienceRoot
    };
end, function(v37)
    return {
        resetNavigationHistory = function(v38)
            return v37(v13(nil, v38));
        end, 
        instantResetNavigationHistory = function(v39)
            return v37(v14(nil, v39));
        end
    };
end)((v16(v18))));
