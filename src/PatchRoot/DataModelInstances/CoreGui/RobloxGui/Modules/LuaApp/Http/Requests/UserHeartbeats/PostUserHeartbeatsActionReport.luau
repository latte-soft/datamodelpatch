local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CoreGui_0.RobloxGui.Modules.LuaApp.Http.Url);
local function _()
    return (math.floor(os.time() * 1000));
end;
return function(v5, v6)
    return v5(string.format("%suser-heartbeats-api/action-report", v3.APIS_URL), "POST", {
        postBody = string.gsub(string.gsub(l_HttpService_0:JSONEncode({
            actionInfo = v6, 
            clientSideTimestampEpochMs = math.floor(os.time() * 1000), 
            sessionInfo = {
                sessionId = l_RbxAnalyticsService_0:GetSessionId()
            }
        }), "\"loginActionInfo\":%[%]", "\"loginActionInfo\":{}"), "\"logoutActionInfo\":%[%]", "\"logoutActionInfo\":{}")
    });
end;
