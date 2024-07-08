local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = require(script:FindFirstAncestor("UserLib").Parent.Http).Url;
return function(v2, v3)
    local v4 = {};
    for _, v6 in pairs(v3) do
        local v7 = tonumber(v6);
        if v7 then
            table.insert(v4, v7);
        end;
    end;
    return v2(string.format("%s/presence/users", l_Url_0.PRESENCE_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            userIds = v4
        })
    });
end;
