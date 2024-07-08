local v0 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
return function(v2)
    local l_roduxNetworking_0 = v2.roduxNetworking;
    local v4 = nil;
    local v7 = l_roduxNetworking_0.POST({
        Name = "CreateExperienceInvite"
    }, function(v5, v6)
        if v2.useMockedResponse then
            v4 = {
                responseBody = {
                    experienceInvite = {
                        experienceInviteId = "10000000-0000-0000-0000-000000000000", 
                        version = 1, 
                        inviterId = 3447649029, 
                        membershipEntityType = "GroupUp", 
                        membershipEntityId = v6.membershipEntityId, 
                        createdUtcMs = os.time() * 1000, 
                        experienceDetail = {
                            placeId = v6.placeId, 
                            experienceResultStatus = "Undecided"
                        }, 
                        totalSpots = 6, 
                        state = "Active", 
                        votes = {
                            [1] = {
                                userId = v6.userId, 
                                voteType = "Accept"
                            }
                        }
                    }
                }
            };
        end;
        return v5(v0):path("squads"):path("v1"):path("invite-squad-to-experience"):body({
            squadId = v6.squadId, 
            placeId = v6.placeId
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
