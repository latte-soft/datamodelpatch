local v0 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
return function(v2)
    local l_roduxNetworking_0 = v2.roduxNetworking;
    local v4 = nil;
    local v7 = l_roduxNetworking_0.POST({
        Name = "CreateOrJoinSquad"
    }, function(v5, v6)
        if v2.useMockedResponse then
            v4 = {
                responseBody = {
                    squad = {
                        squadId = "20000000-0000-0000-0000-000000000000", 
                        initiatorId = 3447631062, 
                        createdUtc = os.clock() * 1000, 
                        channelId = v6.channelId, 
                        members = {
                            {
                                userId = 3447631062, 
                                rank = 0
                            }, 
                            {
                                userId = 2591622000, 
                                rank = 1
                            }, 
                            {
                                userId = 3447649029, 
                                rank = 2
                            }, 
                            {
                                userId = 3447641701, 
                                rank = 3
                            }, 
                            {
                                userId = 3447635964, 
                                rank = 4
                            }, 
                            {
                                userId = 3447642362, 
                                rank = 5
                            }
                        }
                    }
                }
            };
        end;
        return v5(v0):path("v1"):path("squad"):body({
            channelId = v6.channelId
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
