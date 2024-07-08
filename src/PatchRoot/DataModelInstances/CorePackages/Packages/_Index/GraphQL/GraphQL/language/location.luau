local l_String_0 = require(script.Parent.Parent.Parent.LuauPolyfill).String;
local _ = require(script.Parent.source);
return {
    getLocation = function(v2, v3)
        local v4 = {
            "\r\n", 
            "\r", 
            "\n"
        };
        local v5 = 1;
        local l_v3_0 = v3;
        local v7 = l_String_0.findOr(v2.body, v4);
        while v7 ~= nil and v7.index < v3 do
            local v8 = v7.index + string.len(v7.match);
            v5 = v5 + 1;
            l_v3_0 = (v3 + 1) - v8;
            v7 = l_String_0.findOr(v2.body, v4, v8);
        end;
        return {
            line = v5, 
            column = l_v3_0
        };
    end
};
