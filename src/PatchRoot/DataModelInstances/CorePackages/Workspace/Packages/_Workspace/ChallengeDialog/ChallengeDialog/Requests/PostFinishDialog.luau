local l_Parent_0 = script:FindFirstAncestor("ChallengeDialog").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v3, v4, v5)
    return v3(string.format("%schallenge-dialog-service/v1/dialogs", l_Url_0.APIS_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            dialog = v4, 
            action = v5
        })
    });
end;
