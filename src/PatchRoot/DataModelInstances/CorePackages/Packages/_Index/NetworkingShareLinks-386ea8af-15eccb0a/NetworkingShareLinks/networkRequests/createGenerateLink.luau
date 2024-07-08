local v0 = require(script.Parent.Parent.SHARELINKS_URL);
local _ = require(script.Parent.Parent.networkingShareLinkTypes);
return function(v2)
    local v5 = v2.roduxNetworking.POST({
        Name = "create-link"
    }, function(v3, v4)
        return v3(v0):path("v1"):path("create-link"):body({
            linkType = v4.linkType
        });
    end);
    if v2.useMockedResponse then
        v5.Mock.clear();
        v5.Mock.reply(function()
            return {
                responseBody = {
                    linkId = "42685"
                }
            };
        end);
    end;
    return v5;
end;
