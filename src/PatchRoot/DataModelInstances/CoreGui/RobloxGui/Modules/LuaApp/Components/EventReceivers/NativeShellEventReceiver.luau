local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v8 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v9 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v10 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v11 = v3.Component:extend("NativeShellEventReceiver");
v11.didMount = function(v12)
    local l_networking_0 = v12.props.networking;
    local l_guiService_0 = v12.props.guiService;
    v12.connections = {
        l_MemStorageService_0:bind(v8.NativeShellEvent, function(v15)
            if v15 == "NETWORK_ERROR_401" then
                v12.props.logout(l_networking_0, l_guiService_0);
            end;
            l_MemStorageService_0:RemoveItem(v8.NativeShellEvent);
        end)
    };
end;
v11.render = function(_)
end;
v11.willUnmount = function(v17)
    for _, v19 in pairs(v17.connections) do
        v19:Disconnect();
    end;
end;
return (l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    networking = v6
})((v4.connect(nil, function(v20)
    return {
        logout = function(v21, v22)
            v20(v9(v21, v22, v10.NativeSessionCheck));
        end
    };
end)(v11))));
