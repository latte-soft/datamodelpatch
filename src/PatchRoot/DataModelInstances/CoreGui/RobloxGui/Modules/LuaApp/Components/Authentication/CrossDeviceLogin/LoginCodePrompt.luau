local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v7 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v8 = require(l_Modules_0.LuaApp.Thunks.Authentication.CrossDeviceLogin);
local v9 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v10 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v13 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodeStatus);
local v14 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v15 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v16 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v17 = require(l_Modules_0.LuaApp.Http.Requests.GetIXPLayerParameters);
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagCrossDeviceInstructionExperiment);
local v19 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes);
local l_GetFFlagDisableCDLQrCodeForMaquettes_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDisableCDLQrCodeForMaquettes;
local l_GetFFlagEnableShortLinkCodeForVRCDL_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableShortLinkCodeForVRCDL;
local v22 = v2.PureComponent:extend("LoginCodePrompt");
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v24 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodeComponent);
local v25 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.ShortLinkLoginCodeComponent);
local v26 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodeOverlay);
v22.init = function(v27)
    v27:setState({
        Status = v13.Created, 
        DeviceCode = "", 
        AccountPictureUrl = "", 
        DisplayName = "", 
        AltTitle = nil, 
        AltInstruction = nil, 
        AltMobileInstruction = nil, 
        AltDesktopInstruction = nil
    });
    v27.fetchCode = function(v28)
        v27.props.fetchCode(v28):andThen(function(v29)
            if v27.isMounted then
                if not v19() or not v29.QrCodePath then
                    v27:setState({
                        DeviceCode = v29.DeviceCode
                    });
                else
                    v27:setState({
                        DeviceCode = v29.DeviceCode, 
                        QrCodeUrl = v16.fromString("apis:auth-token-service" .. v29.QrCodePath)()
                    });
                end;
                v27.pollLoginStatus(49, v29.DeviceCode, v29.PrivateKey);
            end;
        end, function(v30)
            v27.closeWithError(v30);
        end);
    end;
    local function _(v31, v32, v33)
        spawn(function()
            wait(6);
            if v27.isMounted then
                if v31 > 0 then
                    v27.pollLoginStatus(v31 - 1, v32, v33);
                    return ;
                else
                    v27.codeExpired();
                end;
            end;
        end);
    end;
    v27.pollLoginStatus = function(v35, v36, v37)
        v27.props.getLoginStatus(v27.props.networking, v36, v37):andThen(function(v38)
            if v27.isMounted then
                if v38.Status == v13.Validated then
                    v27.props.closeCentralOverlay();
                    if v27.props.loginCallback then
                        v27.props.loginCallback(v36, v37);
                        return ;
                    end;
                elseif not (v38.Status ~= v13.Expired) or v38.Status == v13.Cancelled then
                    v27.codeExpired();
                    return ;
                else
                    if v27.state.DisplayName == "" and v38.AccountName ~= "" then
                        v27.props.authAnalytics.reportScreenLoaded("confirmPrompt");
                    end;
                    v27:setState({
                        Status = v38.Status, 
                        DisplayName = v38.AccountName, 
                        AccountPictureUrl = v38.AccountPictureUrl
                    });
                    local l_v35_0 = v35;
                    local l_v36_0 = v36;
                    local l_v37_0 = v37;
                    spawn(function()
                        wait(6);
                        if v27.isMounted then
                            if l_v35_0 > 0 then
                                v27.pollLoginStatus(l_v35_0 - 1, l_v36_0, l_v37_0);
                                return ;
                            else
                                v27.codeExpired();
                            end;
                        end;
                    end);
                end;
            end;
        end, function(v42)
            if v42.Body == "\"CodeInvalid\"" then
                v27.codeExpired();
                return ;
            else
                v27.closeWithError(v42);
                return ;
            end;
        end);
    end;
    v27.codeExpired = function()
        if v27.isMounted then
            v27:setState({
                Status = v13.Created, 
                DeviceCode = "", 
                AccountPictureUrl = "", 
                DisplayName = ""
            });
            v27.fetchCode(v27.props.networking);
        end;
    end;
    v27.closeButtonPressed = function()
        if v27.state.DeviceCode ~= "" then
            v27.props.cancelLoginCode(v27.props.networking, v27.state.DeviceCode);
        end;
        v27.props.closeCentralOverlay();
    end;
    v27.closeWithError = function(v43)
        if v43 and v43.Body == "\"InvalidLocation\"" then
            v27.props.setLocationErrorToast();
        else
            v27.props.setNetworkingErrorToast();
        end;
        v27.closeButtonPressed();
    end;
end;
v22.didMount = function(v44)
    v44.isMounted = true;
    v44.props.authAnalytics.reportScreenLoaded(v7.Context.CrossDeviceKey);
    v44.fetchCode(v44.props.networking);
    if v18() then
        v17(v44.props.networking, "PlayerApp.CrossDeviceLogin.DisplayCode", {
            "alt_title", 
            "alt_instruction", 
            "alt_mobile_instruction", 
            "alt_desktop_instruction"
        }):andThen(function(v45)
            local v46 = v45 and v45.responseBody;
            local v47 = false;
            if type(v46) == "table" then
                v47 = next(v46) and v44.isMounted;
            end;
            if v47 then
                v44:setState({
                    AltTitle = v46.alt_title ~= "" and v46.alt_title or nil, 
                    AltInstruction = v46.alt_instruction ~= "" and v46.alt_instruction or nil, 
                    AltMobileInstruction = v46.alt_mobile_instruction ~= "" and v46.alt_mobile_instruction or nil, 
                    AltDesktopInstruction = v46.alt_desktop_instruction ~= "" and v46.alt_desktop_instruction or nil
                });
            end;
        end);
    end;
end;
v22.willUnmount = function(v48)
    v48.isMounted = false;
end;
v22.render = function(v49)
    local v50 = v49.props.isDualLayout or v49.state.DisplayName == "";
    local v51 = v49.props.isDualLayout and v49.state.DisplayName ~= "";
    return l_withStyle_0(function(_)
        local v53 = if not not l_GetFFlagEnableShortLinkCodeForVRCDL_0() and l_IsVRAppBuild_0() then v2.createElement(v25, {
            DeviceCode = v49.state.DeviceCode, 
            ShortLink = "roblox.com/quest"
        }) else v2.createElement(v24, {
            Status = v49.state.Status, 
            DeviceCode = v49.state.DeviceCode, 
            AccountPictureUrl = v49.state.AccountPictureUrl, 
            DisplayName = v49.state.DisplayName, 
            QrCodeUrl = v49.state.QrCodeUrl, 
            showCodeView = v50, 
            showConfirmLoginText = v51, 
            AltTitle = v49.state.AltTitle, 
            AltInstruction = v49.state.AltInstruction, 
            AltMobileInstruction = v49.state.AltMobileInstruction, 
            AltDesktopInstruction = v49.state.AltDesktopInstruction, 
            disableCdlQrCodeForMaquettes = v49.props.disableCdlQrCodeForMaquettes, 
            hideDeviceCode = v49.props.hideDeviceCode, 
            showLockIcon = v49.props.showLockIcon, 
            isDualLayout = v49.props.isDualLayout
        });
        if not v49.props.isOverlay then
            return v53;
        else
            return v2.createElement(v26, {
                loginCode = v53, 
                screenSize = v49.props.screenSize, 
                onCloseClicked = v49.closeButtonPressed
            }, {
                ViewContainer = v53
            });
        end;
    end);
end;
v22 = v3.connect(function(v54, _)
    return {
        screenSize = v54.ScreenSize
    };
end, function(v56)
    return {
        closeCentralOverlay = function()
            return v56(v10());
        end, 
        fetchCode = function(v57)
            return v56(v8.FetchDeviceCode(v57));
        end, 
        getLoginStatus = function(v58, v59, v60)
            return v56(v8.GetLoginStatus(v58, v59, v60));
        end, 
        cancelLoginCode = function(v61, v62)
            return v56(v8.CancelLoginCode(v61, v62));
        end, 
        setNetworkingErrorToast = function(_)
            v56(v9({
                HttpError = Enum.HttpError.OK
            }));
        end, 
        setLocationErrorToast = function(_)
            v56(v14({
                toastType = v15.NetworkingError, 
                toastMessage = "Authentication.CrossDevice.Label.NotAvailableOnNetwork"
            }));
        end
    };
end)((l_RoactServices_0.connect({
    networking = v5, 
    authAnalytics = v6
})(v22)));
if l_GetFFlagDisableCDLQrCodeForMaquettes_0() then
    v22 = l_RoactAppPolicy_0.connect(function(v65, _)
        return {
            disableCdlQrCodeForMaquettes = v65.getDisableCDLQrCodeForMaquettes() or false
        };
    end)(v22);
end;
return v22;
