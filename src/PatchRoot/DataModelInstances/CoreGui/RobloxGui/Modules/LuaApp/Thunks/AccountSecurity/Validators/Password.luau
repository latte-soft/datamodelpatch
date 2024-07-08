local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Requests.PostPasswordValid);
local v1 = {
    [1] = "Feature.AccountSecurityPrompt.Message.Error.PasswordValidation.WeakPassword", 
    [2] = "Feature.AccountSecurityPrompt.Message.Error.PasswordValidation.ShortPassword", 
    [3] = "Feature.AccountSecurityPrompt.Message.Error.PasswordValidation.PasswordSameAsUsername", 
    [4] = "Feature.AccountSecurityPrompt.Message.Error.PasswordValidation.ForbiddenPassword", 
    [5] = "Feature.AccountSecurityPrompt.Message.Error.PasswordValidation.DumbStrings"
};
local v2 = {};
for _, v4 in pairs(v1) do
    v2[v4] = v4;
end;
return {
    localizationKeys = v2, 
    validator = function(v5, v6, v7)
        return function(v8)
            return v0(v5, v7, v8):andThen(function(v9)
                local v10 = v1[(v9 and v9.responseBody) and v9.responseBody.code];
                if v10 ~= nil then
                    return v6[v10];
                else
                    return nil;
                end;
            end):catch(function(_)
                return nil;
            end);
        end;
    end
};
