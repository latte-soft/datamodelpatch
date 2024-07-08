local l_HttpService_0 = game:GetService("HttpService");
return function(v1, v2)
    if not (v2 ~= "POST") or v2 == "PATCH" then
        if type(v1) == "table" then
            return l_HttpService_0:JSONEncode(v1);
        elseif type(v1) == "string" then
            return v1;
        else
            error("Expected postBody to be a string or table");
        end;
    end;
    return nil;
end;
