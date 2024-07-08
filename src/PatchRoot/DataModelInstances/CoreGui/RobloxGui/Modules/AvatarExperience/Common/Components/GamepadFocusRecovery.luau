local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactNavigation);
local l_withNavigation_0 = v4.withNavigation;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v8 = require(l_Modules_0.LuaApp.mutedError);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.gamepad");
local v11 = v3.PureComponent:extend("GamepadFocusRecovery");
v11.defaultProps = {
    debugName = "Unspecified"
};
v11.validateProps = v9.strictInterface({
    focusController = v9.table, 
    isGamepadInput = v9.boolean, 
    debugName = v9.optional(v9.string), 
    avatarRoute = v6.Interface, 
    navigation = v9.table
});
v11.init = function(v12)
    v12:setState({
        isFocused = v12.props.navigation.isFocused()
    });
    v12.onWillFocus = function()
        v12.selectedCoreObjectConnection = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
            v12:startTrackingSelectedCoreObject();
        end);
        v12:startTrackingSelectedCoreObject();
        v12:setState({
            isFocused = true
        });
    end;
    v12.onWillBlur = function()
        v12:onBlurOrUnmount();
        v12:setState({
            isFocused = false
        });
    end;
end;
v11.onBlurOrUnmount = function(v13)
    v13:stopTrackingSelectedCoreObject();
    if v13.selectedCoreObjectConnection then
        v13.selectedCoreObjectConnection:Disconnect();
        v13.selectedCoreObjectConnection = nil;
    end;
end;
v11.handleFocusLost = function(v14, v15)
    wait();
    local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
    if not (l_SelectedCoreObject_0 ~= nil) or not l_SelectedCoreObject_0:IsDescendantOf(game) then
        if v14:canCaptureFocus() then
            v14.props.focusController:captureFocus();
            if v15 ~= nil then
                v8(string.format("[GamepadFocusRecovery] Lost focus on object: %s, screen: %s, %s", tostring(v15), v14.props.debugName, (tostring(v14.props.avatarRoute))), nil);
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v11.startTrackingSelectedCoreObject = function(v17)
    v17:stopTrackingSelectedCoreObject();
    local l_SelectedCoreObject_1 = l_GuiService_0.SelectedCoreObject;
    v10:trace("SelectedCoreObject: {}", not not l_SelectedCoreObject_1 and l_SelectedCoreObject_1:GetFullName() or "nil");
    if l_SelectedCoreObject_1 ~= nil and l_SelectedCoreObject_1:IsDescendantOf(game) then
        v17.selectedCoreObjectAncestryConnection = l_SelectedCoreObject_1.AncestryChanged:Connect(function(_, v20)
            if not v20 then
                v17:stopTrackingSelectedCoreObject();
                v17:handleFocusLost(l_SelectedCoreObject_1);
            end;
        end);
        return ;
    else
        v17:handleFocusLost(l_SelectedCoreObject_1);
        return ;
    end;
end;
v11.stopTrackingSelectedCoreObject = function(v21)
    if v21.selectedCoreObjectAncestryConnection then
        v21.selectedCoreObjectAncestryConnection:Disconnect();
        v21.selectedCoreObjectAncestryConnection = nil;
    end;
end;
v11.render = function(v22)
    return v3.createElement(v4.NavigationEvents, {
        onWillFocus = v22.onWillFocus, 
        onWillBlur = v22.onWillBlur
    });
end;
v11.willUnmount = function(v23)
    v23:onBlurOrUnmount();
end;
v11.canCaptureFocus = function(v24)
    return ((v24.props.avatarRoute and v24.props.avatarRoute.isVisible) and v24.props.isGamepadInput) and v24.state.isFocused;
end;
return l_withNavigation_0(v7(v11), nil);
