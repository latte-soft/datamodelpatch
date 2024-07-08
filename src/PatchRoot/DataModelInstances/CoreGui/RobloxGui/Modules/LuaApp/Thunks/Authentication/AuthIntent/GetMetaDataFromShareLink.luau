local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.Http.Requests.GetShareLinkMetaData);
local l_HttpService_0 = game:GetService("HttpService");
return function(v4, v5, v6)
    return v2(v4, v5, v6):andThen(function(v7)
        if (not v7 or not v7.responseBody) or not v7.responseBody.data then
            return v1.reject();
        else
            return v1.resolve((l_HttpService_0:JSONDecode(v7.responseBody.data)));
        end;
    end, function(v8)
        return v1.reject({
            v8.StatusCode
        });
    end);
end;
