local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Error_0 = v0.Error;
local l_String_0 = v0.String;
return {
    default = function(v3)
        local v4 = typeof(v3);
        if v4 == "function" then
            local v5 = l_String_0.trim(debug.info(v3, "n"));
            if v5 ~= nil and v5 ~= "" then
                return v5;
            end;
        elseif not (v4 ~= "number") or v3 == nil then
            return ("%s"):format((tostring(v3)));
        elseif v4 == "string" then
            return v3;
        end;
        local _ = nil;
        error(l_Error_0.new(("Invalid first argument, %s. It must be a named function, number, or string."):format(typeof(v3) == "function" and "[Function anonymous]" or tostring(v3))));
    end
};
