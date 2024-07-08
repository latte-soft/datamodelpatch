local l_String_0 = require(script.Parent.Parent.Parent.LuauPolyfill).String;
return function(v1)
    return "\"\\u" .. l_String_0.slice("0000" .. string.format("%x", v1), -4):upper() .. "\"";
end;
