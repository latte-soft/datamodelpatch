local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v2 = require(l_script_FirstAncestor_0.Parent.LuauPolyfill);
local v3 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
return function(v4, v5, v6, v7)
    return v4(("%*/v1/create-conversations"):format(v3), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            conversations = {
                {
                    type = v5, 
                    name = v7, 
                    participant_user_ids = v2.Array.map(v6, function(v8)
                        return (tonumber(v8));
                    end)
                }
            }
        })
    });
end;
