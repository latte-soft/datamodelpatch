local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_beforeAll_0 = require(l_Parent_0.Dev.JestGlobals).beforeAll;
local v4 = require(l_script_FirstAncestor_0.Logger);
l_beforeAll_0(function()
    v4:setParent(l_Logger_0);
end);
