local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.Http.Requests.GetAuthMetaData);
return function(v3)
    return v2(v3):andThen(function(v4)
        if not v4 or not v4.responseBody then
            return v1.reject();
        else
            return v1.resolve(v4.responseBody);
        end;
    end, function(v5)
        return v1.reject({
            v5.StatusCode
        });
    end);
end;
