local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v4 = require(l_Parent_0.utils.invariant);
local v5 = require(l_Parent_0.utils.isValidScreenComponent);
return function(v6, v7)
    local v8 = v6[v7];
    if v8 == nil then
        error(("There is no route defined for key %s.\nMust be one of: %s"):format(v7, table.concat(l_Array_0.map(l_Object_0.keys(v6), function(v9)
            return ("'%s'"):format(v9);
        end), ",")), 2);
    end;
    if type(v8) == "table" then
        if v8.screen ~= nil then
            v4(v5(v8.screen), "screen for key '%s' must be a valid Roact component.", v7);
            return v8.screen;
        elseif type(v8.getScreen) == "function" then
            local v10 = v8.getScreen();
            v4(v5(v10), "The getScreen defined for route '%s' didn't return a valid " .. "screen or navigator.\n\n" .. "Please pass it like this:\n" .. "%s = {\n    getScreen: function() return MyScreen end\n}", v7, v7);
            return v10;
        end;
    end;
    v4(v5(v8), "Value for key '%s' must be a route config table or a valid Roact component.", v7);
    return v8;
end;
