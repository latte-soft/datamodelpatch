local v0 = {
    new = function()
        return {};
    end
};
v0.fromJsonData = function(v1)
    local v2 = v0.new();
    v2.creatorId = v1.CreatorID;
    v2.creatorName = v1.CreatorName;
    v2.name = v1.Name;
    v2.universeId = v1.UniverseID;
    v2.placeId = v1.PlaceID;
    v2.iconId = v1.ImageId;
    v2.totalUpVotes = v1.TotalUpVotes;
    v2.totalDownVotes = v1.TotalDownVotes;
    return v2;
end;
return v0;
