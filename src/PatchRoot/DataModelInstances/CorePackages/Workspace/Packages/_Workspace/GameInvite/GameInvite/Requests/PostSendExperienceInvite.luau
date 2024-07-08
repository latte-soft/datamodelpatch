local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = require(script:FindFirstAncestor("GameInvite").Parent.Http).Url;
game:DefineFastFlag("LuaAppExperienceJoinIdempotencyKey", false);
return function(v2, v3, v4, v5, v6, v7)
    return v2(string.format("%snotifications/v1/send-experience-invite", l_Url_0.APIS_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            recipientUserId = v3, 
            inviteMessageId = v6, 
            placeId = v4, 
            launchData = v7, 
            trigger = v5, 
            idempotencyKey = if not game:GetFastFlag("LuaAppExperienceJoinIdempotencyKey") then nil else l_HttpService_0:GenerateGUID(false)
        })
    });
end;
