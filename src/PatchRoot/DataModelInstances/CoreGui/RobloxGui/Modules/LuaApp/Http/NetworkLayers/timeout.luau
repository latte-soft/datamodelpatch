local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.Http.HttpError);
return function(v3, v4)
    assert(type(v3) == "function", "Expected requestFunc to be a function");
    local v5 = 30;
    if v4 then
        assert(type(v4) == "number", "Expected timout to be a number");
        assert(v4 > 0, "Expected timeout to be greater than or equal to 0");
        v5 = v4;
    end;
    return function(v6, v7, v8)
        local v9 = v3(v6, v7, v8);
        return (v1.new(function(v10, v11)
            v9:andThen(v10, v11);
            delay(v5, function()
                v11(v2.new(v6, v2.Kind.LuaTimeout, (string.format("Lua Timeout of %s seconds reached.", (tostring(v5))))));
            end);
        end));
    end;
end;
