local l_HttpService_0 = game:GetService("HttpService");
return function(v1, ...)
    local v2 = "https://reactjs.org/docs/error-decoder.html?invariant=" .. tostring(v1);
    for v3 = 1, select("#", ...) do
        v2 = v2 .. "&args[]=" .. l_HttpService_0:UrlEncode(select(v3, ...));
    end;
    return string.format("Minified React error #%d; visit %s for the full message or " .. "use the non-minified dev environment for full errors and additional " .. "helpful warnings.", v1, v2);
end;
