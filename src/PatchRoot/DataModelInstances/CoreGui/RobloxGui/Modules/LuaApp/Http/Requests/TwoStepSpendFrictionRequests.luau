local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return {
    status = function(v2)
        return v2(string.format("%sv2/spend-friction/two-step-verification/status", v1.ECONOMY_URL), "GET");
    end, 
    generate = function(v3)
        return v3(string.format("%sv2/spend-friction/two-step-verification/generate", v1.ECONOMY_URL), "POST", {
            postBody = "", 
            maxRetryCount = 0
        });
    end, 
    redeem = function(v4, v5, v6)
        return v4(string.format("%sv2/spend-friction/two-step-verification/redeem", v1.ECONOMY_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                challengeToken = v5, 
                verificationToken = v6
            }), 
            maxRetryCount = 0
        });
    end
};
