local l_HttpService_0 = game:GetService("HttpService");
return function(v1)
    return (l_HttpService_0:UrlEncode(v1):gsub("%%2D", "-"):gsub("%%5F", "_"):gsub("%%2E", "."):gsub("%%21", "gsub("%%7E", "~"):gsub("%%2A", "*"):gsub("%%27", "'"):gsub("%%28", "("):gsub("%%29", ")"));
end;
