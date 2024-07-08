local v0 = {
    new = function()
        return {};
    end
};
v0.fromJsonData = function(v1)
    local v2 = v0.new();
    v2.upVotes = v1.UpVotes;
    v2.downVotes = v1.DownVotes;
    v2.userVote = v1.UserVote;
    v2.canVote = v1.CanVote;
    v2.cantVoteReason = v1.ReasonForNotVoteable;
    return v2;
end;
return v0;
