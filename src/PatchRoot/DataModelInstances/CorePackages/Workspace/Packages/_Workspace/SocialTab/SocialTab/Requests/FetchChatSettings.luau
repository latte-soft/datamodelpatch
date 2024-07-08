local v0 = require(script:FindFirstAncestor("SocialTab").dependencies);
local l_RoduxNetworking_0 = v0.RoduxNetworking;
local l_Url_0 = v0.Url;
return l_RoduxNetworking_0.GET(script, function(v3)
    return v3(l_Url_0.CHAT_URL):path("chat-settings");
end);
