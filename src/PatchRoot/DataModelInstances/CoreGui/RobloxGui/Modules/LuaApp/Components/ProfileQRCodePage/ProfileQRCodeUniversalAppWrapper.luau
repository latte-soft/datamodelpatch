local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_PermissionsProtocol_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol;
local v4 = require(l_CorePackages_0.Workspace.Packages.ProfileQRCode);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Roact);
local _ = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v8 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local v9 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateBack);
local v10 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDown);
local v11 = require(l_script_FirstAncestor_0.LuaApp.Enum.OverlayType);
local l_RobloxEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver;
local v13 = require(l_script_FirstAncestor_0.LuaApp.Actions.SetCentralOverlay);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v15 = require(l_script_FirstAncestor_0.LuaApp.Hooks.useRoactService);
return function(v16)
    local v17 = l_useDispatch_0();
    local v18 = v15(l_AppNotificationService_0);
    return v6.createElement(v4.ProfileQRCodeEntryPoint, {
        robloxEventReceiver = v5.useMemo(function()
            return l_RobloxEventReceiver_0.new(v18);
        end, {
            v18
        }), 
        source = v16.source, 
        onClose = v5.useCallback(function()
            v17(v9(true));
        end, {}), 
        openQrCodeScanner = v5.useCallback(function()
            l_PermissionsProtocol_0.default:checkOrRequestPermissions({
                l_PermissionsProtocol_0.Permissions.CAMERA_ACCESS
            }):andThen(function(v19)
                if v19 == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    v17(v10({
                        name = v8.ScanQrCode
                    }));
                    return ;
                else
                    v17(v13(v11.CameraPermissionPrompt));
                    return ;
                end;
            end);
        end, {})
    });
end;
