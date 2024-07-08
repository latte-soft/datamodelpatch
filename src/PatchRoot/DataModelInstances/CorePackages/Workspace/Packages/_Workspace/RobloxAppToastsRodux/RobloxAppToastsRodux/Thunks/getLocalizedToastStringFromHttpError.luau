local l_StatusCodes_0 = require(script:FindFirstAncestor("RobloxAppToastsRodux").Parent.Http).StatusCodes;
local v1 = {
    [l_StatusCodes_0.BAD_REQUEST] = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    [l_StatusCodes_0.UNAUTHORIZED] = "Feature.Toast.NetworkingError.Unauthorized", 
    [l_StatusCodes_0.FORBIDDEN] = "Feature.Toast.NetworkingError.Forbidden", 
    [l_StatusCodes_0.NOT_FOUND] = "Feature.Toast.NetworkingError.NotFound", 
    [l_StatusCodes_0.REQUEST_TIMEOUT] = "Feature.Toast.NetworkingError.Timeout", 
    [l_StatusCodes_0.TOO_MANY_REQUESTS] = "Feature.Toast.NetworkingError.TooManyRequests", 
    [l_StatusCodes_0.INTERNAL_SERVER_ERROR] = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    [l_StatusCodes_0.NOT_IMPLEMENTED] = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    [l_StatusCodes_0.BAD_GATEWAY] = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    [l_StatusCodes_0.SERVICE_UNAVAILABLE] = "Feature.Toast.NetworkingError.ServiceUnavailable", 
    [l_StatusCodes_0.GATEWAY_TIMEOUT] = "Feature.Toast.NetworkingError.Timeout"
};
return function(v2, v3)
    if not ((v2 ~= Enum.HttpError.DnsResolve and v2 ~= Enum.HttpError.ConnectFail) and v2 ~= Enum.HttpError.NetFail) or v2 == Enum.HttpError.SslConnectFail then
        return "Feature.Toast.NetworkingError.UnableToConnect";
    elseif v2 == Enum.HttpError.TimedOut then
        return "Feature.Toast.NetworkingError.Timeout";
    elseif v2 == Enum.HttpError.Aborted then
        return nil;
    elseif (v2 == Enum.HttpError.OK and v3 ~= nil) and v1[v3] ~= nil then
        return v1[v3];
    else
        return "Feature.Toast.NetworkingError.SomethingIsWrong";
    end;
end;
