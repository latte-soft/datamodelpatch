local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Util.joinGame);
local v4 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v5 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local _ = require(l_CorePackages_0.Workspace.Packages.PlayerContextualMenu);
return function(v7)
    return function(v8)
        v8:dispatch(v5(v4.PlayerContextualMenu, v2.Dictionary.join({
            joinExperience = function(v9, v10)
                v3:ByUser({
                    id = v9
                }, v10);
            end
        }, v7)));
    end;
end;
