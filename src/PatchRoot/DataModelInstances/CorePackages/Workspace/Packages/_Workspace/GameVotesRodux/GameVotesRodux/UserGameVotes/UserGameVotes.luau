local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameVotesRodux");
local l_Immutable_0 = require(l_script_FirstAncestor_0.Parent.AppCommonLib).Immutable;
local v2 = require(l_script_FirstAncestor_0.UserGameVotes.SetUserGameVotes);
local v3 = require(l_script_FirstAncestor_0.UserGameVotes.ClearUserGameVotes);
return function(v4, v5)
    v4 = v4 or {};
    if v5.type == v2.name then
        return (l_Immutable_0.Set(v4, v5.universeId, {
            canVote = v5.canVote, 
            userVote = v5.userVote, 
            reasonForNotVoteable = v5.reasonForNotVoteable
        }));
    else
        if v5.type == v3.name then
            v4 = l_Immutable_0.Set(v4, v5.universeId, nil);
        end;
        return v4;
    end;
end;
