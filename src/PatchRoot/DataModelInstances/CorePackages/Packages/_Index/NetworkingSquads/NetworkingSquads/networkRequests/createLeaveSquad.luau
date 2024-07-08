local v0 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
return function(v2)
    local v5 = v2.roduxNetworking.POST({
        Name = "LeaveSquad"
    }, function(v3, v4)
        return v3(v0):path("v1"):path("squad"):id(v4.squadId):body({});
    end);
    if v2.useMockedResponse then
        v5.Mock.clear();
        v5.Mock.reply(function()
            return {
                responseBody = {}
            };
        end);
    end;
    return v5;
end;
