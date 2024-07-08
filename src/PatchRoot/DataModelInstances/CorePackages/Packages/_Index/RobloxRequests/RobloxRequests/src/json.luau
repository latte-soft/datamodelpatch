local l_HttpService_0 = game:GetService("HttpService");
return {
    enc = function(v1)
        return l_HttpService_0:JSONEncode(v1);
    end, 
    dec = function(v2)
        return l_HttpService_0:JSONDecode(v2);
    end
};
