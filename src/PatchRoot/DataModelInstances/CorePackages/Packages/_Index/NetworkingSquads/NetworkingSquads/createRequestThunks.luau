local _ = require(script.Parent.networkingSquadTypes);
local l_networkRequests_0 = script.Parent.networkRequests;
local v2 = require(l_networkRequests_0.createCreateOrJoinSquad);
local v3 = require(l_networkRequests_0.createGetSquadActive);
local v4 = require(l_networkRequests_0.createGetSquadFromSquadId);
local v5 = require(l_networkRequests_0.createJoinSquad);
local v6 = require(l_networkRequests_0.createLeaveSquad);
local v7 = require(l_networkRequests_0.createSquadInvite);
local v8 = require(l_networkRequests_0.createCreateExperienceInvite);
local v9 = require(l_networkRequests_0.createGetExperienceInvite);
local v10 = require(l_networkRequests_0.createVoteForExperienceInvite);
return function(v11)
    return {
        CreateOrJoinSquad = v2(v11), 
        GetSquadActive = v3(v11), 
        GetSquadFromSquadId = v4(v11), 
        JoinSquad = v5(v11), 
        LeaveSquad = v6(v11), 
        SquadInvite = v7(v11), 
        CreateExperienceInvite = v8(v11), 
        GetExperienceInvite = v9(v11), 
        VoteForExperienceInvite = v10(v11)
    };
end;
