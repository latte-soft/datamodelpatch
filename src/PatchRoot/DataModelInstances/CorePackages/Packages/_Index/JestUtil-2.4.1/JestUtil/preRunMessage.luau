local l_Parent_0 = script.Parent.Parent;
local v1 = {};
local v2 = require(l_Parent_0.ChalkLua);
local l_default_0 = require(script.Parent.clearLine).default;
local l_default_1 = require(script.Parent.isInteractive).default;
local _ = require(l_Parent_0.RobloxShared);
v1.print = function(v6)
    if l_default_1 then
        v6:write(v2.bold.dim("Determining test suites to run..."));
    end;
end;
v1.remove = function(v7)
    if l_default_1 then
        l_default_0(v7);
    end;
end;
return v1;
