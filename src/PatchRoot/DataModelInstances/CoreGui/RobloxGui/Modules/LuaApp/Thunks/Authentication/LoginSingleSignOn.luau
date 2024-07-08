local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.LoginRequests);
local v5 = require(l_Modules_0.LuaApp.Models.Authentication.LoginResult);
local v6 = require(l_Modules_0.LuaApp.Enum.LoginErrorCodeSSO);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v8 = require(l_Modules_0.LuaApp.Components.Authentication.Logger);
return function(v9)
    return l_PerformFetch_0.Single(script.Name, function(_)
        return v4.singleSignOnLogin(v9):andThen(function(v11)
            if not v11 or not v11[1] then
                v8:warning(string.format("Single sign on result error: %s", (tostring(v11))));
                return v3.reject({
                    errorCode = v6.AuthError
                });
            else
                local l_status_0, l_result_0 = pcall(function()
                    return v5.fromJsonData(v11[1]);
                end);
                if not l_status_0 then
                    v8:warning(string.format("Single sign on loginResult error: %s", (tostring(l_result_0))));
                    return v3.reject({
                        errorCode = v6.AuthError
                    });
                else
                    return v3.resolve(l_result_0);
                end;
            end;
        end, function(v14)
            v8:warning(string.format("Single sign on login error: %s", (tostring(v14))));
            if not v14 or not v14.Body then
                return v3.reject(v14);
            else
                local v15 = l_HttpService_0:JSONDecode(v14.Body);
                return v3.reject({
                    errorCode = if not v15.errors[1] then v6.AuthError else v15.errors[1].code
                });
            end;
        end);
    end);
end;
