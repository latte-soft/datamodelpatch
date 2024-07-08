local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.LoginRequests);
local v5 = require(l_Modules_0.LuaApp.Models.Authentication.LoginResult);
local v6 = require(l_Modules_0.LuaApp.Enum.LoginErrorCodes);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
return function(v8, v9, v10)
    return function(_)
        return v4.logByPasskey(v8, v9, v10):andThen(function(v12)
            assert(v12, "no login attempt result");
            assert(#v12 == 1, "no result or more than one result");
            local v13 = v5.fromJsonData(v12[1]);
            assert(v13, "result invalid");
            return v13;
        end, function(v14)
            l_Logger_0:error("Error logging in by passkey. Error: ", v14.Body);
            local l_code_0 = l_HttpService_0:JSONDecode(v14.Body).errors[1].code;
            local v16 = "Authentication.Login.Response.SomethingWentWrong";
            if l_code_0 == v6.IncorrectCValueOrPassword then
                v16 = "Authentication.Login.Response.InvalidPasskeyCredential";
            end;
            return v3.reject({
                errorCode = l_code_0, 
                errorKey = v16
            });
        end);
    end;
end;
