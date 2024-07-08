local v0 = require(game:GetService("CorePackages").Cryo);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.AlertsGetAlertInfo);
local v4 = require(l_Modules_0.LuaApp.Actions.ProcessSiteAlertInfoPayload);
return function(v5)
    return function(v6)
        return v3(v5):andThen(function(v7)
            return v6:dispatch(v4((v0.Dictionary.join(v7.responseBody or {}, {
                timestamp = os.time()
            }))));
        end, function(v8)
            v6:dispatch(v4({
                timestamp = os.time()
            }));
            return v2.reject(v8);
        end);
    end;
end;
