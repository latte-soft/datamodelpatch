local l_Url_0 = require(script:FindFirstAncestor("Achievements").Parent.Http).Url;
return function(v1)
    return v1(string.format("%svoting-api/user/get-vote-count?targetType=Place", l_Url_0.APIS_URL), "GET");
end;
