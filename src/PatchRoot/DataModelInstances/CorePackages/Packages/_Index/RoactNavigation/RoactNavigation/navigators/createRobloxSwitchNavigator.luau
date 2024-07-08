local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.createNavigator);
local v2 = require(l_Parent_0.routers.SwitchRouter);
local v3 = require(l_Parent_0.views.RobloxSwitchView);
return function(v4, v5)
    return v1(v3, v2(v4, v5), v5 or {});
end;
