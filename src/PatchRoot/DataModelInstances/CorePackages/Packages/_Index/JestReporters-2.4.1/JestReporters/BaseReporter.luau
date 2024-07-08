local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v3 = {};
local _ = require(l_Parent_1.JestTestResult);
local l_remove_0 = require(l_Parent_1.JestUtil).remove;
local _ = require(l_Parent_0.types);
local l_Writeable_0 = require(l_Parent_1.RobloxShared).Writeable;
local v8 = {};
v8.__index = v8;
v8.new = function(v9)
    local v10 = setmetatable({}, v8);
    v10._process = l_Object_0.assign({}, {
        env = {}, 
        stdout = l_Writeable_0.new(), 
        stderr = l_Writeable_0.new()
    }, v9 or {});
    return v10;
end;
v8.log = function(v11, v12)
    v11._process.stderr:write(v12);
end;
v8.onRunStart = function(v13, _, _)
    l_remove_0(v13._process.stderr);
end;
v8.onTestCaseResult = function(_, _, _)
end;
v8.onTestResult = function(_, _, _, _)
end;
v8.onTestStart = function(_, _)
end;
v8.onRunComplete = function(_, _, _)
end;
v8._setError = function(v28, v29)
    v28._error = v29;
end;
v8.getLastError = function(v30)
    return v30._error;
end;
v3.default = v8;
return v3;
