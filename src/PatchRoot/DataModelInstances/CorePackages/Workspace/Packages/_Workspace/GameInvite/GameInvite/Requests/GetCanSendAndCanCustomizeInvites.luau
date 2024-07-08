local l_Url_0 = require(script:FindFirstAncestor("GameInvite").Parent.Http).Url;
return function(v1, v2, v3)
    return v1(string.format("%snotifications/v1/can-prompt-experience-invite?%s", l_Url_0.APIS_URL, (l_Url_0:makeQueryString({
        RecipientUserId = v3, 
        Trigger = v2, 
        PlaceId = game.PlaceId
    }))), "GET");
end;
