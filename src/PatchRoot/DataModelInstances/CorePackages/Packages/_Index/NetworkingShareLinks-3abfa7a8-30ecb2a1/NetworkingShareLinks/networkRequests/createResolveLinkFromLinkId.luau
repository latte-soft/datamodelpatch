local v0 = require(script.Parent.Parent.SHARELINKS_URL);
local _ = require(script.Parent.Parent.networkingShareLinkTypes);
return function(v2)
    local v5 = v2.roduxNetworking.POST({
        Name = "resolve-link"
    }, function(v3, v4)
        return v3(v0):path("v1"):path("resolve-link"):body({
            linkType = v4.linkType, 
            linkId = v4.linkId
        });
    end);
    if v2.useMockedResponse then
        v5.Mock.clear();
        v5.Mock.reply(function()
            return {
                responseBody = {
                    experienceInviteData = {
                        instanceId = "ABCDEF", 
                        inviterId = 46430379, 
                        placeId = 1818, 
                        status = "Valid", 
                        universeId = 13058
                    }
                }
            };
        end);
    end;
    return v5;
end;
