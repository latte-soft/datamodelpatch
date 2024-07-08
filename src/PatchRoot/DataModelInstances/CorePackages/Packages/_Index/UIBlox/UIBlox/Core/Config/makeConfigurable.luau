local v0 = require(script.Parent.Config);
local function _(v1)
    if v1:sub(-1, -1) == "\n" then
        return v1:sub(1, -2);
    else
        return v1;
    end;
end;
return function(v3, v4, v5)
    if typeof(v4) ~= "string" then
        error("Bad argument #2 - expected a string for the name of the library");
    end;
    if typeof(v5) ~= "table" then
        error("Bad argument #3 - expected a default config table for the library");
    end;
    local v6 = {};
    local v7 = v0.new(v5);
    v6.init = function(v8)
        setmetatable(v6, nil);
        if v8 then
            v7.set(v8);
        end;
        v6.Config = v7.get();
        local v9 = v3(v6.Config);
        for v10, v11 in pairs(v9) do
            v6[v10] = v11;
        end;
        local v12 = debug.traceback();
        local v13 = if v12:sub(-1, -1) == "\n" then v12:sub(1, -2) else v12;
        v6.init = function(v14)
            if v14 == v8 then
                return ;
            else
                local v15 = debug.traceback();
                warn(string.format("%s has already been configured\nFirst init traceback:\n%s\nCurrent init traceback:\n%s", v4, v13, if v15:sub(-1, -1) == "\n" then v15:sub(1, -2) else v15));
                return ;
            end;
        end;
        if not _G.__UIBLOX_TRACK_USAGE__ then
            return (setmetatable(v6, {
                __index = function(_, v17)
                    error(("%q (%s) is not a valid member of %s"):format(tostring(v17), typeof(v17), v4), 2);
                end, 
                __newindex = function(_, v19, _)
                    error(("%q (%s) is not a valid member of %s"):format(tostring(v19), typeof(v19), v4), 2);
                end
            }));
        else
            return (setmetatable(v6, (getmetatable(v9))));
        end;
    end;
    return (setmetatable(v6, {
        __index = function(_, _)
            error(("You must call %s.init(config) before using itformat(v4), 2);
        end, 
        __newindex = function(_, _, _)
            error(("You must call %s.init(config) before using itformat(v4), 2);
        end
    }));
end;
