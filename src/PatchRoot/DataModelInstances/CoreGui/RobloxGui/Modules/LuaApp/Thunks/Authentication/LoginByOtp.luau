local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.LoginRequests);
local v4 = require(l_Modules_0.LuaApp.Models.Authentication.LoginResult);
local v5 = require(l_Modules_0.LuaApp.Enum.LoginErrorCodes);
local v6 = require(l_Modules_0.LuaApp.Thunks.Authentication.GetMultipleUsersPerCredentialErrorData);
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLoginAccountSelector);
return function(v9, v10, v11, v12, v13, v14)
    return function()
        return v3.logByOtp(v9, v10, v11, v13, v14):andThen(function(v15)
            assert(v15, "no login attempt result");
            assert(#v15 == 1, "no result or more than one result");
            assert(v4.fromJsonData(v15[1]), "result invalid");
            return v4.fromJsonData(v15[1]);
        end, function(v16)
            local v17 = l_HttpService_0:JSONDecode(v16.Body);
            local v18 = nil;
            local l_code_0 = v17.errors[1].code;
            local v20 = nil;
            if l_code_0 == v5.IncorrectCValueOrPassword then
                v18 = "Authentication.Login.Response.IncorrectOtpCode";
            elseif v7() and l_code_0 == v5.SecurityQuestions then
                v18 = "Authentication.Login.Response.SomethingWentWrong";
                if v17.errors[1].fieldData then
                    local v21 = l_HttpService_0:JSONDecode(v17.errors[1].fieldData);
                    if not (not v21.sessionId or not v21.userId) then
                        v20 = v21;
                        v18 = nil;
                    end;
                end;
            elseif v8() and l_code_0 == v5.MultipleUsersPerCredential then
                return v2.reject({
                    errorKey = v18, 
                    errorCode = l_code_0, 
                    usersData = v6(v17)
                });
            elseif l_code_0 == v5.ServiceUnavailable then
                v18 = "Authentication.Login.Response.ServiceUnavailable";
            elseif l_code_0 ~= v5.AccountLocked then
                v18 = "Authentication.Login.Response.LoginWithUsernameUnknownError";
            end;
            return v2.reject({
                errorKey = v18, 
                errorCode = l_code_0, 
                securityQuestionsData = v20, 
                securityQuestionsCallback = v12
            });
        end);
    end;
end;
