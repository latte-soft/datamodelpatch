local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Object_0 = v0.Object;
return {
    isSymbol = function(v3)
        local v4 = false;
        if typeof(v3) == "userdata" then
            v4 = string.sub(tostring(v3), 1, 7) == "Symbol(";
        end;
        return v4;
    end, 
    getOwnPropertySymbols = function(v5)
        return l_Array_0.filter(l_Object_0.keys(v5), function(v6)
            local v7 = false;
            if typeof(v6) == "userdata" then
                v7 = string.sub(tostring(v6), 1, 7) == "Symbol(";
            end;
            return v7;
        end);
    end, 
    getOwnPropertyNames = function(v8)
        l_Array_0.filter(l_Object_0.keys(v8), function(v9)
            local v10 = false;
            if typeof(v9) == "userdata" then
                v10 = string.sub(tostring(v9), 1, 7) == "Symbol(";
            end;
            return not v10;
        end);
    end, 
    create = function(v11)
        if v11 then
            return (setmetatable({}, v11));
        else
            return {};
        end;
    end
};
