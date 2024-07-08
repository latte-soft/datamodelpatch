local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v2 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
return function(v3, v4, v5, v6, v7, v8)
    return function(v9)
        v9:dispatch(v2(v1.GameDetailMore, {
            universeId = v3, 
            theme = v4, 
            menuPosition = v5, 
            menuWidth = v6, 
            onClose = v7, 
            menuAnchorPoint = v8
        }));
    end;
end;
