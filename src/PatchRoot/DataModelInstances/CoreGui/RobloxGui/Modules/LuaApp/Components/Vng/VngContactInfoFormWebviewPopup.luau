local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_Modules_0.Common.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local _ = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v7 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v8 = require(l_Modules_0.LuaApp.AppPage);
local v9 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v10 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v12 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v13 = require(l_Modules_0.LuaApp.Http.Requests.StartVngVerificationForm);
local v14 = require(l_Modules_0.LuaApp.Http.Requests.ValidateVngVerificationFormStatus);
local v15 = require(l_Modules_0.LuaApp.Components.Vng.VngComplianceLoadingPopup);
local v16 = v3.PureComponent:extend("VngContactInfoFormWebviewPopup");
local l_LoadingSpinner_0 = require(l_CorePackages_0.UIBlox).App.Loading.LoadingSpinner;
local v18 = require(l_Modules_0.LuaApp.Thunks.CloseVngContactInfoFormWebviewPopup);
local l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseUpdatedVNGAgreementsWorkflow;
v16.didMount = function(v20)
    local l_networking_0 = v20.props.networking;
    local l_guiService_0 = v20.props.guiService;
    local l_logout_0 = v20.props.logout;
    local l_exit_0 = v20.props.exit;
    v13(l_networking_0):andThen(function(v25)
        local l_formUrl_0 = v25.responseBody.formUrl;
        if l_formUrl_0 then
            v20.props.openWebView(l_formUrl_0, "", l_networking_0, l_logout_0, l_guiService_0, l_exit_0);
            return ;
        else
            l_exit_0();
            return ;
        end;
    end, function(_)
        l_logout_0(l_networking_0, l_guiService_0);
    end);
end;
windowClosedCallback = function(v28, v29, v30, v31)
    v14(v30):andThen(function(v32)
        if v32.responseBody.completed == false then
            v28(v30, v29);
            return ;
        else
            v29:BroadcastNotification("", v12.RESTART_LUA_APP);
            v31();
            return ;
        end;
    end, function()
        v28(v30, v29);
    end);
end;
v16.render = function(v33)
    if not l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v33.props.screenSize.Y), 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0
        }, {
            Layout = v3.createElement(l_LoadingSpinner_0, {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.new(0.5, 0, 0.5, 0)
            })
        });
    else
        return v3.createElement(v15, {});
    end;
end;
return (l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    networking = v5
})((v4.connect(function(v34)
    return {
        screenSize = v34.ScreenSize
    };
end, function(v35)
    return {
        logout = function(v36, v37)
            v35(v9(v36, v37, v10.PartnerFormNotComplete));
        end, 
        openWebView = function(v38, v39, v40, v41, v42, v43)
            v35(v7({
                name = v8.GenericWebPage, 
                detail = v38, 
                extraProps = {
                    title = v39, 
                    onClose = function()
                        windowClosedCallback(v41, v42, v40, v43);
                    end
                }
            }));
        end, 
        exit = function()
            v35(v18());
        end
    };
end)(v16))));
