local v0 = require(script.Parent.Parent.util.APIUtil);
local l_HttpService_0 = game:GetService("HttpService");
local v2 = string.format("https://apis.%s", (v0.getBaseDomain())) .. "assets/rcc/v1/assets/%s";
return function(v3)
    local v4, v5 = v0.requestAndRetryGet((string.format(v2, v3)));
    if not v4 then
        return false, v5;
    else
        return true, l_HttpService_0:JSONDecode(v5);
    end;
end;
