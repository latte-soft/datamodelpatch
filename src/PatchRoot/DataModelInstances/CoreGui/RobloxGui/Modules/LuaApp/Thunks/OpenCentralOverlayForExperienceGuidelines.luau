local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v2 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
return function(v3, v4)
    return function(v5)
        v5:dispatch(v2(v1.ExperienceGuidelinesExplained, {
            universeId = v3, 
            hideCloseButton = v4
        }));
    end;
end;
