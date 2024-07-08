local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_String_0 = v1.String;
local v5 = {};
local v6 = require(l_Parent_0.constants);
local l_REGEX_SPECIAL_CHARS_0 = v6.REGEX_SPECIAL_CHARS;
local l_REGEX_SPECIAL_CHARS_GLOBAL_0 = v6.REGEX_SPECIAL_CHARS_GLOBAL;
v5.isObject = function(v9)
    local v10 = false;
    if v9 ~= nil then
        v10 = false;
        if typeof(v9) == "table" then
            v10 = not l_Array_0.isArray(v9);
        end;
    end;
    return v10;
end;
v5.hasRegexChars = function(v11)
    return string.match(v11, l_REGEX_SPECIAL_CHARS_0) ~= nil;
end;
v5.isRegexChar = function(v12)
    local v13 = false;
    if #v12 == 1 then
        v13 = v5.hasRegexChars(v12);
    end;
    return v13;
end;
local l_stringReplace_0 = require(l_Parent_0.stringUtils).stringReplace;
v5.escapeRegex = function(v15)
    return l_stringReplace_0(v15, l_REGEX_SPECIAL_CHARS_GLOBAL_0, function(v16)
        return "\\" .. v16;
    end);
end;
v5.toPosixSlashes = function(_)
    error("toPosixSlashes not implemented");
end;
v5.removeBackslashes = function(_)
    error("removeBackslashes not implemented");
end;
v5.supportsLookbehinds = function()
    return false;
end;
v5.isWindows = function(v19)
    if typeof(v19) == "table" and typeof(v19.windows) == "boolean" then
        return v19.windows;
    else
        return false;
    end;
end;
v5.escapeLast = function(v20, v21, v22)
    local v23 = l_String_0.lastIndexOf(v20, v21, v22);
    if v23 == -1 then
        return v20;
    elseif v20:sub(v23 - 1, v23 - 1) == "\\" then
        return v5.escapeLast(v20, v21, v23 - 1);
    else
        return ("%s%s"):format(l_String_0.slice(v20, 1, v23), l_String_0.slice(v20, v23));
    end;
end;
v5.removePrefix = function(v24, v25)
    local v26 = v25 or {};
    local l_v24_0 = v24;
    if l_String_0.startsWith(l_v24_0, "./") then
        l_v24_0 = l_String_0.slice(l_v24_0, 3);
        v26.prefix = "./";
    end;
    return l_v24_0;
end;
v5.wrapOutput = function(v28, v29, v30)
    local v31 = v29 or {};
    local v32 = v30 or {};
    local v33 = ("%s(?:%s)%s"):format(not l_Boolean_0.toJSBoolean(v32.contains) and "^" or "", v28, not l_Boolean_0.toJSBoolean(v32.contains) and "$" or "");
    if v31.negated == true then
        v33 = ("(?:(?format(v33);
    end;
    return v33;
end;
return v5;
