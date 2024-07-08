local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v3 = require(l_CorePackages_0.Logging);
local v4 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local l_UserAgreementsCounterNames_0 = require(l_CorePackages_0.Workspace.Packages.UserAgreements).UserAgreementsCounterNames;
game:DefineFastInt("LuaFetchUpdatedUserAgreementsErrorsThrottling", 10000);
return function(v6, v7)
    local v8 = v2.fromString("apis:user-agreements/v1/agreements-resolution-signup/Web");
    return v6(v8(), "GET"):andThen(function(v9)
        if v9.responseCode ~= 200 then
            return ;
        else
            return v9.responseBody;
        end;
    end, function(v10)
        v3.warn(string.format("Url: %s, Status: %s, isJSONValid: %s", v8, tostring(v10.HttpError), (tostring(v10.isJSONValid))));
        v4(l_UserAgreementsCounterNames_0.FetchAgreementsHttpRequestFailure, 1);
        if v7 ~= nil then
            v7.InfluxDb:reportSeries(script.Name, {
                url = v8, 
                statusCode = v10.StatusCode, 
                errorMessage = v10.Body
            }, game:GetFastInt("LuaFetchUpdatedUserAgreementsErrorsThrottling"));
        end;
    end);
end;
