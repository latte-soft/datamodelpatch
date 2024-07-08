local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local function _(v3, v4)
    v3:dispatch(v2(v4));
end;
return function(v6, v7)
    return function(v8)
        v8:dispatch(v2({
            name = v1.ExperienceDetail, 
            detail = tostring(v6), 
            extraProps = v7
        }));
    end;
end;
