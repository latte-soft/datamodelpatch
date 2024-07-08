local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.UIBlox);
local v8 = require(l_CorePackages_0.Cryo);
local l_Consumer_0 = v7.Style.Consumer;
local v10 = require(l_Modules_0.LuaApp.Thunks.FetchTheme);
local v11 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v15 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v16 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v17 = require(l_Modules_0.LuaApp.LuaAppBacktraceReporter);
local v18 = {
    ThemeUpdate = "ThemeUpdate"
};
local v19 = v6.Component:extend("ThemeUpdater");
v19.init = function(v20)
    local l_RobloxEventReceiver_0 = v20.props.RobloxEventReceiver;
    local l_networking_0 = v20.props.networking;
    v20.changeTheme = function(v23)
        if v20.props.themeOverride then
            v23 = v20.props.themeOverride;
        end;
        l_NotificationService_0.SelectedTheme = v23;
        v20.props.appStyle:updateTheme(v23);
        v17:updateSharedAttributes({
            AppTheme = v23
        });
    end;
    v20.updateTheme = function()
        local function v25(v24)
            l_MemStorageService_0:Fire(v15.ThemeUpdate, v24);
            v20.changeTheme(v24);
            v11.setAuthenticatedTheme(v24);
            v11.flush();
        end;
        if not v20.props.themeOverride then
            return v10(l_networking_0, l_Players_0.LocalPlayer.UserId):andThen(function(v26)
                l_MemStorageService_0:Fire(v15.ThemeUpdate, v26);
                v20.changeTheme(v26);
                v11.setAuthenticatedTheme(v26);
                v11.flush();
            end);
        else
            return v25(v20.props.themeOverride);
        end;
    end;
    v20.tokens = {
        l_RobloxEventReceiver_0:observeEvent("UserThemeTypeChangeNotification", function(v27, v28)
            if (v27.Type or v28) == v18.ThemeUpdate then
                v20.updateTheme();
            end;
        end), 
        l_MemStorageService_0:Bind(v15.ThemeUpdate, function(v29)
            v20.changeTheme(v29);
        end)
    };
end;
v19.render = function(_)
end;
v19.willUnmount = function(v31)
    for _, v33 in pairs(v31.tokens) do
        v33:disconnect();
    end;
end;
return l_RoactServices_0.connect({
    networking = v13, 
    guiService = l_AppGuiService_0
})(function(v34)
    local v35 = nil;
    v35 = v16(function(v36)
        return v36.getForceTheme();
    end);
    return v6.createElement(l_Consumer_0, {
        render = function(v37)
            return v6.createElement(v19, v8.Dictionary.join(v34, {
                appStyle = v37, 
                themeOverride = v35
            }));
        end
    });
end);
