local l_Url_0 = require(script:FindFirstAncestor("ChallengeDialog").Parent.Http).Url;
return function(v1)
    return v1(string.format("%schallenge-dialog-service/v1/dialogs", l_Url_0.APIS_URL), "GET");
end;
