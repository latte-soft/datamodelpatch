local l_Url_0 = require(script:FindFirstAncestor("Achievements").Parent.Http).Url;
return function(v1)
    return v1(string.format("%sv1/xbox/get-login-consecutive-days", l_Url_0.AUTH_URL), "GET");
end;
