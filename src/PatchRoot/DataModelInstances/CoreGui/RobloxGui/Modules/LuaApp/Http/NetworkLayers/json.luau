local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.HttpError);
local v4 = require(l_Modules_0.LuaApp.Http.HttpResponse);
return function(v5)
    return function(v6, v7, v8)
        return (v5(v6, v7, v8):andThen(function(v9)
            local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v9.responseBody);
            if l_status_0 then
                return v4.new(v9.requestUrl, l_result_0, v9.responseTimeMs, v9.responseCode);
            else
                return v2.reject(v3.new(v6, v3.Kind.InvalidJson, (string.format("Cannot parse : %s", v9.responseBody or "nil"))));
            end;
        end));
    end;
end;
