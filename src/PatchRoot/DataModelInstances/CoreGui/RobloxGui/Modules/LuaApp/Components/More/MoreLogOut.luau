local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v8 = require(l_Modules_0.LuaApp.Themes.DeprecatedDarkTheme);
local v9 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v10 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v11 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForConfirmSignOut);
local v12 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v14 = require(l_Modules_0.LuaApp.withLocalization);
local v15 = require(l_Modules_0.LuaApp.Thunks.Authentication.EmailVerification.CheckEmailVerificationBeforeLogout);
local v16 = require(l_Modules_0.LuaApp.Thunks.Authentication.PhoneVerification.CheckPhoneVerification);
local v17 = require(l_Modules_0.LuaApp.Flags.GetFFlagEmailUpsellAtLogout);
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v20 = v1.PureComponent:extend("MoreLogOut");
local v21 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v22 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnablePhoneVerificationLogoutUpsell);
local v23 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnablePhoneLogoutUpsellExperiment);
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagGuacControlPhoneUpsellEnabled);
local v25 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local l_IXPService_0 = game:GetService("IXPService");
local v27 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v28 = require(script.Parent.DisconnectButton);
v20.defaultProps = {
    layoutOrder = 1, 
    isPhoneLogoutUpsellEnabled = false, 
    shouldShowPhoneUpsell = false
};
v20.validateProps = v4.strictInterface({
    buttonHeight = v4.integer, 
    buttonMaxWidth = v4.integer, 
    item = v4.table, 
    layoutOrder = v4.optional(v4.integer), 
    position = v4.optional(v4.UDim2), 
    navigateDown = v4.callback, 
    logout = v4.callback, 
    showEmailBeforeLogout = v4.callback, 
    showPhoneBeforeLogout = v4.callback, 
    logoutWithoutShowConfirmation = v4.callback, 
    guiService = v4.union(v4.Instance, v4.table), 
    networkImpl = v4.callback, 
    willActivate = v4.optional(v4.callback), 
    showDisconnectButton = v4.boolean, 
    isPhoneLogoutUpsellEnabled = v4.boolean, 
    shouldShowPhoneUpsell = v4.boolean
});
v20.init = function(v29)
    local l_guiService_0 = v29.props.guiService;
    local l_item_0 = v29.props.item;
    local l_networkImpl_0 = v29.props.networkImpl;
    v29.navigateDown = function()
        v29.props.navigateDown({
            name = l_item_0.context.page
        });
    end;
    v29.showEmailVerificationOrLogout = function()
        if not v17() then
            v29.props.logout(l_networkImpl_0, l_guiService_0, v8);
            return ;
        else
            v29.props.showEmailBeforeLogout(l_networkImpl_0, l_guiService_0, v8);
            return ;
        end;
    end;
    v29.showPhoneVerificationOrLogout = function()
        v29.props.showPhoneBeforeLogout(l_networkImpl_0, l_guiService_0, v8);
    end;
    v29.onActivated = function()
        if v29.props.willActivate then
            v29.props.willActivate();
        end;
        if not v24() then
            l_IXPService_0:LogUserLayerExposure(v27.LogoutLayer);
            local v33 = v23() and v29.props.isPhoneLogoutUpsellEnabled;
            if not v22() and not v33 then
                v29.showEmailVerificationOrLogout();
                return ;
            else
                v29.showPhoneVerificationOrLogout();
                return ;
            end;
        elseif not v29.props.shouldShowPhoneUpsell then
            v29.showEmailVerificationOrLogout();
            return ;
        else
            l_IXPService_0:LogUserLayerExposure(v27.LogoutLayer);
            local v34 = v23() and v29.props.isPhoneLogoutUpsellEnabled;
            if not v22() and not v34 then
                v29.showEmailVerificationOrLogout();
                return ;
            else
                v29.showPhoneVerificationOrLogout();
                return ;
            end;
        end;
    end;
end;
v20.render = function(v35)
    local l_buttonHeight_0 = v35.props.buttonHeight;
    local l_buttonMaxWidth_0 = v35.props.buttonMaxWidth;
    local l_item_1 = v35.props.item;
    local l_layoutOrder_0 = v35.props.layoutOrder;
    local l_position_0 = v35.props.position;
    return v14({
        logOutText = l_item_1.textKey
    })(function(v41)
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = l_position_0, 
            LayoutOrder = l_layoutOrder_0, 
            Size = UDim2.new(1, 0, 0, l_buttonHeight_0)
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            LogOutButtonFrame = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                UISizeConstraint = v1.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(l_buttonMaxWidth_0, l_buttonHeight_0)
                }), 
                LogOutButton = if not v35.props.showDisconnectButton then v1.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.Secondary, 
                    isDisabled = false, 
                    isLoading = false, 
                    onActivated = v35.onActivated, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v41.logOutText
                }) else v1.createElement(v28)
            })
        });
    end);
end;
return l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    networkImpl = v12
})((v25.connectUserLayer({
    v27.LogoutLayer
}, function(v42, _)
    return {
        isPhoneLogoutUpsellEnabled = (v42[v27.LogoutLayer] or {}).IsPhoneLogoutUpsellEnabled
    };
end)((l_RoactAppPolicy_0.connect(function(v44, _)
    return {
        showDisconnectButton = v44.getShowDisconnectButton(), 
        shouldShowPhoneUpsell = not not v24() and v44.getShouldShowPhoneUpsell()
    };
end)((v2.connect(function(_, _)
end, function(v48)
    return {
        navigateDown = function(v49)
            v48(v10(v49));
        end, 
        showEmailBeforeLogout = function(v50, v51, v52)
            v48(v15(v50, v51)):andThen(function()
                v48(v11(function()
                    v48(v9(v50, v51, v21.MoreLogOut));
                end, v52));
            end, function()
            end);
        end, 
        showPhoneBeforeLogout = function(v53, v54, v55)
            v48(v16(v53, v54)):andThen(function()
                v48(v11(function()
                    v48(v9(v53, v54));
                end, v55));
            end, function()
            end);
        end, 
        logout = function(v56, v57, v58)
            v48(v11(function()
                v48(v9(v56, v57, v21.MoreLogOut));
            end, v58));
        end, 
        logoutWithoutShowConfirmation = function(v59, v60)
            v48(v9(v59, v60, v21.MoreLogOut));
        end
    };
end)(v20)))))));
