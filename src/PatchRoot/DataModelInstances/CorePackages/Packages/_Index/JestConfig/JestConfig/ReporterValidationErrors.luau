local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_String_0 = v1.String;
local v5 = {};
local v6 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local l_ValidationError_0 = require(l_Parent_0.JestValidate).ValidationError;
local v10 = require(script.Parent.utils);
local l_BULLET_0 = v10.BULLET;
local l_DOCUMENTATION_NOTE_0 = v10.DOCUMENTATION_NOTE;
local l_JSON_0 = require(l_Parent_0.RobloxShared).nodeUtils.JSON;
local v14 = nil;
local v15 = {
    "table", 
    "ModuleScript"
};
local v16 = ("%sReporter Validation Error"):format((tostring(l_BULLET_0)));
local function v19(v17, v18)
    return l_ValidationError_0.new(v16, ("  Reporter at index %s must be of type:\n"):format((tostring(v17))) .. ("    %s\n"):format(v6.green(v6.bold(l_Array_0.join(v15, " or ")))) .. "  but instead received:\n" .. ("    %s"):format(v6.red(v6.bold(l_getType_0(v18)))), l_DOCUMENTATION_NOTE_0);
end;
v5.createReporterError = v19;
local function v26(v20, v21, v22, v23, v24, v25)
    return l_ValidationError_0.new(v16, ("  Unexpected value for %s "):format(v25) .. ("at index %s of reporter at index %s\n"):format(tostring(v22), (tostring(v21))) .. "  Expected:\n" .. ("    %s\n"):format(v6.red(v6.bold(v24))) .. "  Got:\n" .. ("    %s\n"):format(v6.green(v6.bold(l_getType_0(v23)))) .. "  Reporter configuration:\n" .. ("    %s"):format(v6.green(v6.bold(l_Array_0.join(l_String_0.split(l_JSON_0.stringify(v20, nil, 2), "\n"), "\n    ")))), l_DOCUMENTATION_NOTE_0);
end;
v5.createArrayReporterError = v26;
v5.validateReporters = function(v27)
    return l_Array_0.every(v27, function(v28, v29)
        if not l_Boolean_0.toJSBoolean(l_Array_0.isArray(v28)) then
            if typeof(v28) ~= "string" then
                error(v19(v29, v28));
            end;
        else
            v14(v28, v29);
        end;
        return true;
    end);
end;
v14 = function(v30, v31)
    local v32, v33 = table.unpack(v30, 1, 2);
    if typeof(v32) == "Instance" and v32:isA("ModuleScript") then
        if typeof(v33) ~= "table" then
            error(v26(v30, v31, 1, v33, "table", "Reporter Configuration"));
        end;
        return ;
    else
        error(v26(v30, v31, 0, v32, "ModuleScript", "Path"));
        return ;
    end;
end;
return v5;
