local v0 = {};
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_format_0 = require(l_Parent_0.helpers).format;
local _ = require(l_Parent_1.RobloxShared);
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7, v8)
    local v9 = setmetatable({}, v5);
    local v10 = v8 or {};
    if typeof(v6.write) == "function" then
        v10.stdout = v6;
        v10.stderr = v7;
    end;
    if v10.stderr == nil then
        v10.stderr = v10.stdout;
    end;
    if not (v10.stdout ~= nil) or typeof(v10.stdout.write) ~= "function" then
        error("stdout must have a write method");
    end;
    if not (v10.stderr ~= nil) or typeof(v10.stderr.write) ~= "function" then
        error("stderr must have a write method");
    end;
    v9._stdout = v10.stdout;
    v9._stderr = v10.stderr;
    return v9;
end;
v5._write = function(v11, v12, v13)
    (if v12 == "stdout" then v11._stdout else v11._stderr):write(v13);
end;
v5.log = function(v14, ...)
    v14:_write("stdout", l_format_0(...));
end;
v5.error = function(v15, ...)
    v15:_write("stderr", l_format_0(...));
end;
v0.default = v5;
return v0;
