local v0 = {
    new = function()
        return {};
    end
};
v0.fromJsonData = function(v1)
    local v2 = v0.new();
    v2.creatorName = v1.Builder;
    v2.name = v1.Name;
    v2.description = v1.Description;
    v2.isFavorited = v1.IsFavoritedByUser;
    v2.updated = v1.Updated;
    v2.created = v1.Created;
    v2.maxPlayers = v1.MaxPlayers;
    v2.isExperimental = v1.IsExperimental;
    v2.creatorUserId = v1.BuilderId;
    v2.universeId = v1.UniverseId;
    return v2;
end;
return v0;
