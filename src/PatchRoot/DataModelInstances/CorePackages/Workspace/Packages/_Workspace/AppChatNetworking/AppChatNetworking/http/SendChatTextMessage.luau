local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v2 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
local l_default_0 = require(l_script_FirstAncestor_0.url.HttpRequest).default;
return function(v4, v5)
    return l_default_0(("%*/v1/send-messages"):format(v2), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            conversation_id = v4, 
            messages = {
                {
                    content = v5
                }
            }
        })
    });
end;
