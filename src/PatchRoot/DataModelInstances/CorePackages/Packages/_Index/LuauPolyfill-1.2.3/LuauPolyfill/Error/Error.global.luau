local _ = require(script.Parent.Parent.Parent.ES7Types);
local v1 = {};
v1.__index = v1;
v1.__tostring = function(v2)
    return getmetatable(v1).__tostring(v2);
end;
local function _(v3)
    local v4 = setmetatable({
        name = "Error", 
        message = v3 or ""
    }, v1);
    v1.__captureStackTrace(v4, 4);
    return v4;
end;
v1.new = function(v6)
    local v7 = setmetatable({
        name = "Error", 
        message = v6 or ""
    }, v1);
    v1.__captureStackTrace(v7, 4);
    return v7;
end;
v1.captureStackTrace = function(v8, v9)
    v1.__captureStackTrace(v8, 3, v9);
end;
v1.__captureStackTrace = function(v10, v11, v12)
    if typeof(v12) == "function" then
        local v13 = debug.traceback(nil, v11);
        local v14 = string.find(v13, string.gsub(debug.info(v12, "s"), "([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1") .. ":%d* function " .. debug.info(v12, "n"));
        local v15 = nil;
        if v14 ~= nil then
            local v16, v17 = string.find(v13, "\n", v14 + 1);
            v14 = v16;
            v15 = v17;
        end;
        if v15 ~= nil then
            v13 = string.sub(v13, v15 + 1);
        end;
        v10.__stack = v13;
    else
        v10.__stack = debug.traceback(nil, v11);
    end;
    v1.__recalculateStacktrace(v10);
end;
v1.__recalculateStacktrace = function(v18)
    local l_message_0 = v18.message;
    v18.stack = (v18.name or "Error") .. if l_message_0 ~= nil and l_message_0 ~= "" then ": " .. l_message_0 else "" .. "\n" .. (not v18.__stack and "" or v18.__stack);
end;
return (setmetatable(v1, {
    __call = function(_, ...)
        local v21 = setmetatable({
            name = "Error", 
            message = ... or ""
        }, v1);
        v1.__captureStackTrace(v21, 4);
        return v21;
    end, 
    __tostring = function(v22)
        if v22.name ~= nil then
            if v22.message and v22.message ~= "" then
                return string.format("%s: %s", tostring(v22.name), (tostring(v22.message)));
            else
                return (tostring(v22.name));
            end;
        else
            return (tostring("Error"));
        end;
    end
}));
