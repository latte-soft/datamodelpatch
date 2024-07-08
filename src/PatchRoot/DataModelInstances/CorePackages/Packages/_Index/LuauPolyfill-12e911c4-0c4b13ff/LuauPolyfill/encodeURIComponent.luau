local v0 = require(script.Parent.String.charCodeAt);
local v1 = require(script.Parent.Error);
local l_HttpService_0 = game:GetService("HttpService");
return function(v3)
    local v4 = utf8.len(v3);
    if not (v4 ~= 0) or v4 == nil then
        return "";
    else
        local v5 = v0(v3, 1);
        if v4 == 1 then
            if v5 == 55296 then
                error(v1.new("URI malformed"));
            end;
            if v5 == 57343 then
                error(v1.new("URI malformed"));
            end;
        end;
        if v5 >= 56320 and v5 < 57343 then
            error(v1.new("URI malformed"));
        end;
        return (l_HttpService_0:UrlEncode(v3):gsub("%%2D", "-"):gsub("%%5F", "_"):gsub("%%2E", "."):gsub("%%21", "gsub("%%7E", "~"):gsub("%%2A", "*"):gsub("%%27", "'"):gsub("%%28", "("):gsub("%%29", ")"));
    end;
end;
