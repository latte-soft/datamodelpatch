local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local v6 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local l_default_0 = require(script.Parent.pluralize).default;
local _ = require(script.Parent.types);
v5.default = function(v10, v11, v12)
    local v20 = l_Array_0.map(v10, function(v13)
        local v14 = v13.matches.stats ~= nil and v13.matches.stats or {};
        local l_config_0 = v13.context.config;
        local v19 = l_Array_0.join(l_Array_0.filter(l_Array_0.map(l_Object_0.keys(v14), function(v16)
            if v16 == "roots" and #l_config_0.roots == 1 then
                return nil;
            else
                local v17 = l_config_0[v16];
                if not l_Boolean_0.toJSBoolean(v17) then
                    return nil;
                else
                    return ("  %s: %s - %s"):format(v16, v6.yellow(if not l_Array_0.isArray(v17) then tostring(v17) else l_Array_0.join(v17, ", ")), (tostring((l_default_0("match", not not l_Boolean_0.toJSBoolean(v14[v16]) and v14[v16] or 0, "es")))));
                end;
            end;
        end), function(v18)
            return l_Boolean_0.toJSBoolean(v18);
        end), "\n");
        if not l_Boolean_0.toJSBoolean(v13.matches.total) then
            return ("No files found in %s.\n"):format((tostring(l_config_0.rootDir))) .. "Make sure Jest's configuration does not exclude this directory." .. "\nTo set up Jest, make sure a package.json file exists.\n" .. "Jest Documentation: " .. "https://jestjs.io/docs/configuration";
        else
            return ("In %s\n"):format(v6.bold((tostring(l_config_0.rootDir)))) .. ("  %s checked.\n"):format(l_default_0("file", not not l_Boolean_0.toJSBoolean(v13.matches.total) and v13.matches.total or 0, "s")) .. v19;
        end;
    end);
    local v21 = nil;
    v21 = if not v11.runTestsByPath then ("Pattern: %s - 0 matches"):format(v6.yellow(v11.testPathPattern)) else ("Files: %s"):format(l_Array_0.join(l_Array_0.map(v11.nonFlagArgs, function(v22)
        return ("\"%s\""):format((tostring(v22)));
    end), ", "));
    if not l_Boolean_0.toJSBoolean(v12) then
        return ("%s\n"):format(v6.bold("No tests found, exiting with code 1")) .. "Run with `--passWithNoTests` to exit with code 0" .. "\n" .. l_Array_0.join(v20, "\n") .. "\n" .. v21;
    else
        return ("%s\n%s\n%s"):format(v6.bold("No tests found, exiting with code 0"), tostring(l_Array_0.join(v20, "\n")), (tostring(v21)));
    end;
end;
return v5;
