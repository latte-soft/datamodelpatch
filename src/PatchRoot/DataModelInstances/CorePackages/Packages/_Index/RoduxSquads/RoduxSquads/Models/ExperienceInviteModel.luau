local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxSquads");
local v1 = require(l_script_FirstAncestor_0.Parent.t);
local v2 = require(l_script_FirstAncestor_0.Enums.ExperienceDetailResultStatus);
local v3 = require(l_script_FirstAncestor_0.Enums.ExperienceInviteState);
local v4 = require(l_script_FirstAncestor_0.Enums.ExperienceInviteVoteType);
local v5 = require(l_script_FirstAncestor_0.Enums.MembershipEntityType);
local function _(v6)
    local v7 = 0;
    for v8 = 1, #v6 do
        if v6[v8].voteType == "Accepted" then
            v7 = v7 + 1;
        end;
    end;
    return v7;
end;
local v10 = {};
v10.new = function(v11)
    assert(v10.isValid(v11));
    v10.__index = v10;
    setmetatable(v11, v10);
    return v11;
end;
v10.mock = function(v12)
    v12 = v12 or {};
    local v13 = v12.votes or {
        [1] = {
            userId = 456, 
            voteType = v4.Accept
        }
    };
    local v14 = 0;
    for v15 = 1, #v13 do
        if v13[v15].voteType == "Accepted" then
            v14 = v14 + 1;
        end;
    end;
    return (v10.new({
        experienceInviteId = v12.experienceInviteId or "987", 
        version = v12.version or 1, 
        inviterId = v12.inviterId or 123456, 
        membershipEntityType = v12.membershipEntityType or v5.GroupUp, 
        membershipEntityId = v12.membershipEntityId or "54321", 
        createdUtcMs = v12.createdUtcMs or 1665988271, 
        experienceDetail = v12.experienceDetail or {
            placeId = 15308759682, 
            experienceResultStatus = v2.Reserved
        }, 
        totalSpots = v12.totalSpots or 6, 
        spotsTaken = v14, 
        state = v12.state or v3.Active, 
        votes = v13
    }));
end;
v10.format = function(v16)
    local v17 = not not v16.votes and v16.votes or v16.Votes;
    local l_new_0 = v10.new;
    local v19 = {
        experienceInviteId = not not v16.experienceInviteId and v16.experienceInviteId or v16.ExperienceInviteId, 
        version = not not v16.version and v16.version or v16.Version, 
        inviterId = not not v16.inviterId and v16.inviterId or v16.InviterId, 
        membershipEntityType = not not v16.membershipEntityType and v16.membershipEntityType or v16.MembershipEntityType, 
        membershipEntityId = not not v16.membershipEntityId and v16.membershipEntityId or v16.MembershipEntityId, 
        createdUtcMs = not not v16.createdUtcMs and v16.createdUtcMs or v16.CreatedUtcMs, 
        experienceDetail = not not v16.experienceDetail and v16.experienceDetail or v16.ExperienceDetail, 
        totalSpots = not not v16.totalSpots and v16.totalSpots or v16.TotalSpots
    };
    local v20 = 0;
    for v21 = 1, #v17 do
        if v17[v21].voteType == "Accepted" then
            v20 = v20 + 1;
        end;
    end;
    v19.spotsTaken = v20;
    v19.state = not not v16.state and v16.state or v16.State;
    v19.votes = v17;
    return (l_new_0(v19));
end;
v10.isValid = v1.strictInterface({
    experienceInviteId = v1.string, 
    version = v1.number, 
    inviterId = v1.number, 
    membershipEntityType = v1.string, 
    membershipEntityId = v1.string, 
    createdUtcMs = v1.number, 
    experienceDetail = v1.strictInterface({
        placeId = v1.number, 
        experienceResultStatus = v1.string
    }), 
    totalSpots = v1.number, 
    spotsTaken = v1.number, 
    state = v1.string, 
    votes = v1.array(v1.strictInterface({
        userId = v1.number, 
        voteType = v1.string
    }))
});
return v10;
