local l_Parent_0 = script:FindFirstAncestor("UserAgreements").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v2 = require(l_Parent_0.Loggers).Logger:new("UserAgreements");
local v3 = require(script.Parent.UserAgreementsCounterNames);
game:DefineFastInt("LuaFetchUpdatedUserAgreementsErrorsThrottling", 10000);
return function(v4, v5)
    local v6 = l_Url_0.APIS_URL .. "user-agreements/v1/agreements-resolution/Web";
    return v4(v6, "GET"):andThen(function(v7)
        if v7.responseCode ~= 200 then
            return ;
        else
            return v7.responseBody;
        end;
    end, function(v8)
        v2:warning(string.format("Url: %s, Status: %s, isJSONValid: %s", v6, tostring(v8.HttpError), (tostring(v8.isJSONValid))));
        if v5 then
            v5.Diag:reportCounter(v3.FetchAgreementsHttpRequestFailure, 1);
            v5.InfluxDb:reportSeries(script.Name, {
                url = v6, 
                statusCode = v8.StatusCode, 
                errorMessage = v8.Body
            }, game:GetFastInt("LuaFetchUpdatedUserAgreementsErrorsThrottling"));
        end;
    end);
end;
