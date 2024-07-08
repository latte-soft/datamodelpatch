local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.Parent.LuauPolyfill);
local v2 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
return require(script.Parent.RoduxNetworking).POST(script, function(v3, v4, v5)
    return v3(v2):path("v1"):path("add-users"):body({
        conversation_id = v4, 
        user_ids = v1.Array.map(v5, function(v6)
            return (tonumber(v6));
        end)
    });
end);
