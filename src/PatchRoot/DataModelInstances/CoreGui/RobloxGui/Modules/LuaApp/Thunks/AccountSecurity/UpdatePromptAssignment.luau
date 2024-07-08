local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptAssignmentAction);
local v2 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptType);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.PostUpdatePromptAssignments);
return function(v4, v5, v6)
    return function(_)
        local v8 = v2.toRawValue(v5);
        if v8 == nil then
            v8 = v5;
        end;
        return v3(v4, v8, v1.toRawValue(v6)):andThen(function(v9)
            return v9.responseBody;
        end);
    end;
end;
