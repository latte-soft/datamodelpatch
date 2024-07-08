local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.AccountPinError);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.PostLockAccountPin);
local v4 = require(l_Modules_0.LuaApp.Promise);
local l_Enum_0 = v2.Enum;
return function(v6)
    return function(_)
        return v3(v6):andThen(function(v8)
            return v8.responseBody;
        end):catch(function(v9)
            if v9.Body then
                return v4.reject(l_Enum_0.fromRawValue(l_HttpService_0:JSONDecode(v9.Body).errors[1].code) or l_Enum_0.Default);
            else
                return v4.reject(l_Enum_0.Default);
            end;
        end);
    end;
end;
