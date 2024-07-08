local v0 = require(script.Parent.Parent.SHARELINKS_URL);
local _ = require(script.Parent.Parent.networkingShareLinkTypes);
local l_HttpService_0 = game:GetService("HttpService");
return function(v3)
    local v7 = v3.roduxNetworking.POST({
        Name = "create-link"
    }, function(v4, v5)
        local v6 = {
            instanceId = v5.instanceId, 
            launchData = v5.launchData, 
            placeId = v5.placeId
        };
        return v4(v0):path("v1"):path("create-link"):body({
            linkType = v5.linkType, 
            data = if next(v6) ~= nil then l_HttpService_0:JSONEncode(v6) else nil
        });
    end);
    if v3.useMockedResponse then
        v7.Mock.clear();
        v7.Mock.reply(function()
            return {
                responseBody = {
                    linkId = "42685"
                }
            };
        end);
    end;
    return v7;
end;
