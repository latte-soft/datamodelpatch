local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local v5 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local l_default_0 = require(script.Parent.pluralize).default;
local _ = require(script.Parent.types);
v4.default = function(v9, v10, v11)
    local v14 = l_Array_0.reduce(v9, function(v12, v13)
        return v12 + (not not l_Boolean_0.toJSBoolean(v13.matches.total) and v13.matches.total or 0);
    end, 0);
    local v15 = nil;
    v15 = if not l_Boolean_0.toJSBoolean(v10.runTestsByPath) then ("Pattern: %s - 0 matches"):format(v5.yellow(v10.testPathPattern)) else ("Files: %s"):format((tostring(l_Array_0.join(l_Array_0.map(v10.nonFlagArgs, function(v16)
        return ("\"%s\""):format((tostring(v16)));
    end), ", "))));
    if not l_Boolean_0.toJSBoolean(v11) then
        return ("%s\n"):format(v5.bold("No tests found, exiting with code 1")) .. "Run with `--passWithNoTests` to exit with code 0" .. "\n" .. ("In %s"):format(v5.bold(v10.rootDir)) .. "\n" .. ("  %s checked across %s. Run with `--verbose` for more details."):format(tostring(l_default_0("file", v14, "s")), (tostring(l_default_0("project", #v9, "s")))) .. ("\n%s"):format((tostring(v15)));
    else
        return ("%s\n"):format(v5.bold("No tests found, exiting with code 0")) .. ("In %s"):format(v5.bold(v10.rootDir)) .. "\n" .. ("  %s checked across %s. Run with `--verbose` for more details."):format(tostring(l_default_0("file", v14, "s")), (tostring(l_default_0("project", #v9, "s")))) .. ("\n%s"):format((tostring(v15)));
    end;
end;
return v4;
