local l_Parent_0 = script.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v2 = require(l_Parent_0.Promise);
local _ = require(l_Parent_0.JestEnvironment);
local v4 = require(l_Parent_0.JestFakeTimers);
local _ = require(l_Parent_0.JestTypes);
local _ = require(l_Parent_0.JestFakeTimers);
local _ = require(l_Parent_0.JestMock);
local v8 = {};
v8.__index = v8;
v8.new = function(v9)
    local v10 = setmetatable({}, v8);
    v10.context = {};
    local v11 = l_Object_0.assign(v10.context, v9.testEnvironmentOptions);
    v10.global = v11;
    v11.global = v11;
    v10.fakeTimers = v4.new();
    return v10;
end;
v8.getVmContext = function(v12)
    return v12.context;
end;
v8.setup = function(_)
    return v2.resolve();
end;
v8.teardown = function(v14)
    return v2.resolve():andThen(function()
        if v14.fakeTimers ~= nil then
            v14.fakeTimers:dispose();
        end;
        v14.context = {};
        v14.fakeTimers = nil;
    end);
end;
return v8;
