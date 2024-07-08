local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local v5 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local l_default_0 = require(script.Parent.getProjectDisplayName).default;
local v8 = nil;
local v9 = nil;
local v10 = nil;
v4.default = function(v11, v12)
    if #v11 == 0 then
        return v8(v12);
    else
        return v9(v11);
    end;
end;
v8 = function(v13)
    if not l_Boolean_0.toJSBoolean(if not l_Boolean_0.toJSBoolean(v13.ignoreProjects) then v13.ignoreProjects else v13.selectProjects) then
        if not l_Boolean_0.toJSBoolean(v13.ignoreProjects) then
            if not l_Boolean_0.toJSBoolean(v13.selectProjects) then
                return v5.yellow("No projects were found.\n");
            else
                return v5.yellow("You provided values for --selectProjects but no projects were found matching the selection.\n");
            end;
        else
            return v5.yellow("You provided values for --ignoreProjects, but no projects were found matching the selection.\n" .. "Are you ignoring all projects?\n");
        end;
    else
        return v5.yellow("You provided values for --selectProjects and --ignoreProjects, but no projects were found matching the selection.\n" .. "Are you ignoring all the selected projects?\n");
    end;
end;
v9 = function(v14)
    if #v14 == 1 then
        return ("Running one project: %s\n"):format(v5.bold((l_default_0(v14[1]))));
    else
        return ("Running %s projects:\n%s\n"):format(tostring(#v14), (tostring((l_Array_0.join(l_Array_0.sort(l_Array_0.map(v14, v10)), "\n")))));
    end;
end;
v10 = function(v15)
    local v16 = l_default_0(v15);
    return ("- %s"):format((tostring(not l_Boolean_0.toJSBoolean(v16) and "<unnamed project>" or v5.bold(v16))));
end;
return v4;
