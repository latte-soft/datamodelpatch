local v0 = require(script:FindFirstAncestor("SocialCommon").Parent.Dash);
return function(v1)
    return v0.join(v1, {
        name = v1.username, 
        gameInstanceId = v1.gameId
    });
end;
