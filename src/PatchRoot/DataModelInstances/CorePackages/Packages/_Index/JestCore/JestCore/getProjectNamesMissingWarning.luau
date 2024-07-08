local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local v5 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local l_default_0 = require(script.Parent.getProjectDisplayName).default;
v4.default = function(v8, v9)
    local v11 = #l_Array_0.filter(v8, function(v10)
        return not l_Boolean_0.toJSBoolean(l_default_0(v10));
    end);
    if v11 == 0 then
        return nil;
    else
        local v12 = {};
        if l_Boolean_0.toJSBoolean(v9.selectProjects) then
            table.insert(v12, "--selectProjects");
        end;
        if l_Boolean_0.toJSBoolean(v9.ignoreProjects) then
            table.insert(v12, "--ignoreProjects");
        end;
        return v5.yellow(("You provided values for %s but %s.\n"):format(tostring(l_Array_0.join(v12, " and ")), v11 == 1 and "a project does not have a name" or ("%s projects do not have a name"):format((tostring(v11)))) .. "Set displayName in the config of all projects in order to disable this warning.\n");
    end;
end;
return v4;
