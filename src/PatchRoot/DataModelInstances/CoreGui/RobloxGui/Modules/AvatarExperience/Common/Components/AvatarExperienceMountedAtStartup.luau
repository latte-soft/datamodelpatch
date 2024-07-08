local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceInitialization);
local v6 = require(l_Modules_0.AvatarExperience.Common.Managers.AvatarSceneManager);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.ItemSelectionManager);
local v8 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v9 = require(l_Modules_0.AvatarExperience.Common.Debug.AvatarExperienceIXPDiagnostics);
return (v3.connect(function(v10, _)
    return {
        authStatus = v10.AuthenticationStatus.status
    };
end, nil)(function(v12)
    local l_shouldStart_0 = v12.shouldStart;
    local l_shouldManageBackground_0 = v12.shouldManageBackground;
    local l_store_0 = v12.store;
    local v16 = v12.authStatus == v8.LOGGED_IN or l_shouldStart_0;
    return v4.createElement(v4.Fragment, {}, {
        ItemSelectionManager = v4.createElement(v7), 
        AvatarSceneManager = if not v16 then nil else v4.createElement(v6, {
            store = l_store_0, 
            shouldStart = l_shouldStart_0, 
            shouldManageBackground = l_shouldManageBackground_0, 
            renderSky = l_shouldStart_0
        }), 
        AvatarExperienceInitialization = if not v16 then nil else v4.createElement(v5), 
        AvatarExperienceIXPDiagnostics = v4.createElement(v9)
    });
end));
