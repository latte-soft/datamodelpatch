local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CoreGui_0.RobloxGui.Modules.LuaApp.Http.Url);
local function _()
    return (math.floor(os.time() * 1000));
end;
return function(v5, v6, v7)
    return v5(string.format("%suser-heartbeats-api/pulse", v3.APIS_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            clientSideTimestampEpochMs = math.floor(os.time() * 1000), 
            locationInfo = {
                universalAppLocationInfo = {
                    activeState = v6, 
                    pageName = v7
                }
            }, 
            sessionInfo = {
                sessionId = l_RbxAnalyticsService_0:GetSessionId()
            }
        })
    });
end;
