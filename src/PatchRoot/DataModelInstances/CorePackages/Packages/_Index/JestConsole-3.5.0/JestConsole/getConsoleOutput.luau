local v0 = {};
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_String_0 = v3.String;
local v6 = require(l_Parent_1.ChalkLua);
local _ = require(l_Parent_1.JestTypes);
local l_formatStackTrace_0 = require(l_Parent_1.JestMessageUtil).formatStackTrace;
local _ = require(l_Parent_0.types);
v0.default = function(v10, v11, v12)
    local v13 = not v12.verbose and "    " or "  ";
    local v14 = v13 .. "  ";
    return l_String_0.trimEnd((l_Array_0.reduce(v10, function(v15, v16)
        local l_type_0 = v16.type;
        local l_message_0 = v16.message;
        local l_origin_0 = v16.origin;
        l_message_0 = l_Array_0.join(l_Array_0.map(l_String_0.split(l_message_0, "\n"), function(v20)
            return v14 .. v20;
        end), "\n");
        local v21 = "console." .. l_type_0;
        local v22 = true;
        local v23 = true;
        if l_type_0 == "warn" then
            l_message_0 = v6.yellow(l_message_0);
            v21 = v6.yellow(v21);
            v22 = v12.noStackTrace or false;
            v23 = false;
        elseif l_type_0 == "error" then
            l_message_0 = v6.red(l_message_0);
            v21 = v6.red(v21);
            v22 = v12.noStackTrace or false;
            v23 = false;
        end;
        return v15 .. v13 .. v6.dim(v21) .. "\n" .. l_String_0.trimEnd(l_message_0) .. "\n" .. v6.dim(l_String_0.trimEnd((l_formatStackTrace_0(l_origin_0, v11, {
            noStackTrace = v22, 
            noCodeFrame = v23
        })))) .. "\n\n";
    end, ""))) .. "\n";
end;
return v0;
