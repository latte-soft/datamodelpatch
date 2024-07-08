local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Error_0 = v0.Error;
local l_String_0 = v0.String;
return {
    default = function(v3)
        if not (typeof(v3) ~= "string" and typeof(v3) ~= "number") or v3 == nil then
            return v3;
        else
            if typeof(v3) ~= "function" then
                error(l_Error_0.new("describe expects a function, number, or string."));
            end;
            local v4 = l_String_0.trim(debug.info(v3, "n"));
            if v4 ~= nil and v4 ~= "" then
                return v4;
            else
                return "[Function anonymous]";
            end;
        end;
    end
};
