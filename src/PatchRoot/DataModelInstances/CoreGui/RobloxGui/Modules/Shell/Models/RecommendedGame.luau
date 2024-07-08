local v0 = {
    new = function()
        return {};
    end
};
v0.fromJsonData = function(v1)
    local v2 = v0.new();
    v2.creatorId = v1.Creator and v1.Creator.CreatorTargetId;
    v2.creatorName = v1.Creator and v1.Creator.CreatorName;
    v2.name = v1.GameName;
    v2.placeId = v1.PlaceId;
    v2.iconId = v1.ImageId;
    return v2;
end;
return v0;
