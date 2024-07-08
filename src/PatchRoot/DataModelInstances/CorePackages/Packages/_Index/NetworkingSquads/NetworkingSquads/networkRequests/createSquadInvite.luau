local v0 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
return function(v2)
    local l_roduxNetworking_0 = v2.roduxNetworking;
    local v4 = nil;
    local v7 = l_roduxNetworking_0.POST({
        Name = "SquadInvite"
    }, function(v5, v6)
        if v2.useMockedResponse then
            v4 = {
                responseBody = {
                    channelId = v6.channelId
                }
            };
        end;
        return v5(v0):path("v1"):path("squad"):body({
            squadId = v6.squadId, 
            inviteeUserIds = v6.inviteeUserIds
        });
    end);
    if v2.useMockedResponse then
        v7.Mock.clear();
        v7.Mock.reply(function()
            return v4;
        end);
    end;
    return v7;
end;
