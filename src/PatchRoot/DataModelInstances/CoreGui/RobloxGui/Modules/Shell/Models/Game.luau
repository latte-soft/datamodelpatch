local v0 = {
    new = function()
        return {};
    end
};
v0.fromJsonData = function(v1)
    local v2 = v0.new();
    v2.creatorId = v1.creatorId;
    v2.creatorName = v1.creatorName;
    v2.name = v1.name;
    v2.universeId = v1.universeId;
    v2.placeId = v1.placeId;
    v2.imageToken = v1.imageToken;
    v2.totalUpVotes = v1.totalUpVotes;
    v2.totalDownVotes = v1.totalDownVotes;
    v2.playerCount = v1.playerCount;
    return v2;
end;
return v0;
