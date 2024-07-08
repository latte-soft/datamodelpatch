local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Shell.OrderedMap);
local v2 = require(l_Modules_0.Shell.Actions.DeleteError);
local function v4(v3)
    return v3.Code;
end;
local function v7(v5, v6)
    return v5.timestamp < v6.timestamp;
end;
return function(v8, v9)
    v8 = v8 or v1.new(v4, v7);
    if v9.error and type(v9.error.Code) == "number" then
        if v9.type == v2.name then
            return (v1.Delete(v8, v9.error.Code));
        else
            v8 = v1.Insert(v8, v9.error);
        end;
    end;
    return v8;
end;
