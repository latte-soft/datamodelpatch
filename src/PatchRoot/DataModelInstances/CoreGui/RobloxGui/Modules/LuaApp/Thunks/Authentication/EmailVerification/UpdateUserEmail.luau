local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.PostUserEmail);
local v4 = require(l_Modules_0.LuaApp.Util.isStringEmail);
return function(v5, v6, v7)
    return function(_)
        if v4(v6) then
            return v3(v5, v6, v7):andThen(function(_)
                return v2.resolve();
            end, function(v10)
                local v11 = false;
                local v12 = false;
                local v13 = "";
                local v14 = 0;
                if v10.Body then
                    local v15 = l_HttpService_0:JSONDecode(v10.Body).errors[1];
                    v14 = v15.code;
                    v11 = v14 == 8;
                    v12 = v14 == 9;
                    v13 = v15.message;
                end;
                return v2.reject({
                    EmailInvalid = v12, 
                    PasswordIncorrect = v11, 
                    Message = v13, 
                    ErrorCode = v14
                });
            end);
        else
            return v2.reject({
                EmailInvalid = true
            });
        end;
    end;
end;
