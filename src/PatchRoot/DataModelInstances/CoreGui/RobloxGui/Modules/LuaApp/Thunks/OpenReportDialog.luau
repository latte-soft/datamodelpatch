local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v3)
    return function(v4)
        v4:dispatch(v2({
            name = v1.ReportDialog, 
            reportData = v3
        }));
    end;
end;
