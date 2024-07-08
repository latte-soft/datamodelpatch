local l_HttpService_0 = game:GetService("HttpService");
return function()
    return string.find(l_HttpService_0:GetUserAgent(), "AmazonAppStore") ~= nil;
end;
