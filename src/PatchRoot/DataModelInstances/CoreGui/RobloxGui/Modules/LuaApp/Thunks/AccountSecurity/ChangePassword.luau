local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PasswordError);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.PostChangePassword);
local v4 = require(l_Modules_0.LuaApp.Promise);
local l_Enum_0 = v2.Enum;
return function(v6, v7, v8)
    return function(_)
        return v3(v6, v7, v8):andThen(function(v10)
            return v10.responseBody;
        end):catch(function(v11)
            if v11.Body then
                return v4.reject(l_Enum_0.fromRawValue(l_HttpService_0:JSONDecode(v11.Body).errors[1].code) or l_Enum_0.Default);
            else
                return v4.reject(l_Enum_0.Default);
            end;
        end);
    end;
end;
