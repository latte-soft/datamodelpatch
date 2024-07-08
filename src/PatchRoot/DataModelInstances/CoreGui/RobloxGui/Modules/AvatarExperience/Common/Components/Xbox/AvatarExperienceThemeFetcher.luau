local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_NotificationService_0 = game:GetService("NotificationService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Cryo);
local l_Consumer_0 = v5.Style.Consumer;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v11 = require(l_Modules_0.LuaApp.Thunks.FetchTheme);
local v12 = require(l_Modules_0.LuaApp.Flags.FFlagDebugLuaAppsUseDarkTheme);
local v13 = v3.Component:extend("AvatarExperienceThemeFetcher");
v13.init = function(v14)
    v14.changeTheme = function(v15)
        if v12 then
            v15 = "dark";
        end;
        l_NotificationService_0.SelectedTheme = v15;
        v14.props.appStyle:updateTheme(v15);
    end;
end;
v13.didMount = function(v16)
    v11(v16.props.networking, v16.props.localUserId):andThen(function(v17)
        v16.changeTheme(v17);
    end);
end;
v13.render = function(_)
end;
v13 = l_RoactServices_0.connect({
    networking = v10
})((v4.connect(function(v19, _)
    return {
        localUserId = v19.LocalUserId
    };
end)(v13)));
return function(v21)
    return v3.createElement(l_Consumer_0, {
        render = function(v22)
            return v3.createElement(v13, v6.Dictionary.join(v21, {
                appStyle = v22
            }));
        end
    });
end;
