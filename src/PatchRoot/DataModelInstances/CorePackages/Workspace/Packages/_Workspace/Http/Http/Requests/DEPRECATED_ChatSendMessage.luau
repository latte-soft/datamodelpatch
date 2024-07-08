local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local v2 = require(l_script_FirstAncestor_0.Url);
local _ = require(l_script_FirstAncestor_0.RequestTypes);
return function(v4, v5, v6, v7, v8, v9)
    return v4(string.format("%s/send-message", v2.CHAT_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            conversationId = v5, 
            message = v6, 
            decorators = v7, 
            isExperienceInvite = v8, 
            userId = v9
        })
    });
end;
