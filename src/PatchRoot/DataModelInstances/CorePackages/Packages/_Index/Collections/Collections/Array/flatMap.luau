local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_0.flat);
local v4 = require(l_Parent_0.map);
local _ = require(l_Parent_1.ES7Types);
return function(v6, v7, v8)
    if l___DEV___0 then
        if typeof(v6) ~= "table" then
            error(string.format("Array.flatMap called on %s", (typeof(v6))));
        end;
        if typeof(v7) ~= "function" then
            error("callback is not a function");
        end;
    end;
    return v3(v4(v6, v7, v8));
end;
