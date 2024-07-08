local v0 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
local function v2(v3)
    if type(v3) ~= "table" then
        return v3;
    else
        local v4 = {};
        for v5, v6 in pairs(v3) do
            v4[v5] = v2(v6);
        end;
        return v4;
    end;
end;
return function(v7)
    local l_roduxNetworking_0 = v7.roduxNetworking;
    local v9 = nil;
    local v15 = l_roduxNetworking_0.POST({
        Name = "VoteForExperienceInvite"
    }, function(v10, v11)
        if v7.useMockedResponse then
            local v12 = v2(v11.mockedExperienceInvite);
            local v13 = nil;
            for v14 = 1, #v12.votes do
                if v12.votes[v14].userId == v11.userId then
                    v13 = v12.votes[v14];
                    break;
                end;
            end;
            if not v13 then
                v12.votes[#v12.votes + 1] = {
                    userId = v11.userId, 
                    voteType = v11.voteType
                };
            else
                v13.voteType = v11.voteType;
            end;
            v12.version = v12.version + 1;
            v9 = {
                responseBody = {
                    experienceInvite = v12
                }
            };
        end;
        return v10(v0):path("v1"):path("squad"):body({
            experienceInviteId = v11.experienceInviteId, 
            voteType = v11.voteType
        });
    end);
    if v7.useMockedResponse then
        v15.Mock.clear();
        v15.Mock.reply(function()
            return v9;
        end);
    end;
    return v15;
end;
