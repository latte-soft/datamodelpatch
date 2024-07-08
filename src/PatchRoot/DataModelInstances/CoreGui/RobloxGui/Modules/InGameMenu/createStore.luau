local l_Rodux_0 = require(game:GetService("CorePackages").InGameMenuDependencies).Rodux;
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.GlobalConfig);
local v3 = require(l_Parent_0.reducer);
return function()
    local v4 = {
        l_Rodux_0.thunkMiddleware
    };
    if v2.logStore then
        table.insert(v4, l_Rodux_0.loggerMiddleware);
    end;
    return l_Rodux_0.Store.new(v3, nil, v4);
end;
