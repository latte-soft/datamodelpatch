local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameVotesRodux");
local l_Immutable_0 = require(l_script_FirstAncestor_0.Parent.AppCommonLib).Immutable;
local v2 = require(l_script_FirstAncestor_0.GameVotes.SetGameVotes);
return function(v3, v4)
    v3 = v3 or {};
    assert(v3, "");
    if v4.type == v2.name then
        v3 = l_Immutable_0.Set(v3, v4.universeId, {
            upVotes = v4.upVotes, 
            downVotes = v4.downVotes
        });
    end;
    return v3;
end;
