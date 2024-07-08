local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.Parent.LuauPolyfill);
local v2 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
local v3 = require(script.Parent.RoduxNetworking);
local _ = require(l_script_FirstAncestor_0.responses.SharedTypes);
return v3.POST(script, function(v5, v6, v7, v8)
    return v5(v2):path("v1"):path("create-conversations"):body({
        conversations = {
            {
                type = v6, 
                name = v8, 
                participant_user_ids = v1.Array.map(v7, function(v9)
                    return (tonumber(v9));
                end)
            }
        }
    }):setStatusIds(v7);
end);
