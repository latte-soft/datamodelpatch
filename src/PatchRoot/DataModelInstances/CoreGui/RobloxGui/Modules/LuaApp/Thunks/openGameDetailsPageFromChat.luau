local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v4 = require(l_Modules_0.LuaApp.Thunks.OpenGameDetails);
local l_SetTabBarVisibleFromChat_0 = require(l_CorePackages_0.Workspace.Packages.AppTabBarRodux).Thunks.SetTabBarVisibleFromChat;
return function(v6, v7)
    return function(v8)
        v8:dispatch(v4(v6, {
            onClose = function()
                if v8:getState().FormFactor == l_FormFactor_0.WIDE then
                    v8:dispatch(l_SetTabBarVisibleFromChat_0(true));
                end;
            end, 
            referralSource = v7
        }));
    end;
end;
