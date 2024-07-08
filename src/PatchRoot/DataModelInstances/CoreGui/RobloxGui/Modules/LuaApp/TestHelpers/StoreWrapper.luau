local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.AppReducer);
local v3 = require(l_CorePackages_0.Rodux);
local v4 = {};
v4.new = function(v5, v6)
    local v7 = {
        internalStore = v3.Store.new(v2, v5 or {}, v6)
    };
    setmetatable(v7, {
        __index = function(_, v9)
            if not v4[v9] then
                return v7.internalStore[v9];
            else
                return v4[v9];
            end;
        end, 
        __newindex = function(_, v11, v12)
            v7.internalStore[v11] = v12;
        end
    });
    return v7;
end;
v4.getState = function(v13)
    local v14 = v13.internalStore:getState();
    return (setmetatable({}, {
        __index = function(_, v16)
            return v14[v16];
        end
    }));
end;
return v4;
