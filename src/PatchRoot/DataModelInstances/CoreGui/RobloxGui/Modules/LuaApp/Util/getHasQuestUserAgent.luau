local l_HttpService_0 = game:GetService("HttpService");
return function()
    return string.find(l_HttpService_0:GetUserAgent(), "OculusQuest3Store") ~= nil;
end;
