local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.GetUsernameSuggestions);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.PostUsernameSuggestions);
local v5 = require(l_Modules_0.LuaApp.Flags.GetFFlagUsernameSuggestionUsePostRequest);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
return {
    suggestUsernames = function(v7, v8, v9, _)
        if not v5() then
            return v3(v7, v8, v9):andThen(function(v11)
                return v2.resolve({
                    shouldUpdateState = true, 
                    didGenerate = v11.responseBody.didGenerateNewUsername, 
                    suggestions = v11.responseBody.suggestedUsernames
                });
            end, function(v12)
                return v2.resolve({
                    shouldUpdateState = v12.StatusCode ~= l_StatusCodes_0.TOO_MANY_REQUESTS, 
                    didGenerate = false, 
                    suggestions = {}
                });
            end);
        else
            return v4(v7, v8, v9):andThen(function(v13)
                if not (v13 ~= nil) or v13.responseBody == nil then
                    return v2.reject();
                else
                    return v2.resolve({
                        shouldUpdateState = true, 
                        didGenerate = v13.responseBody.didGenerateNewUsername, 
                        suggestions = v13.responseBody.suggestedUsernames
                    });
                end;
            end, function(v14)
                return v2.resolve({
                    shouldUpdateState = v14.StatusCode ~= l_StatusCodes_0.TOO_MANY_REQUESTS, 
                    didGenerate = false, 
                    suggestions = {}
                });
            end);
        end;
    end
};
