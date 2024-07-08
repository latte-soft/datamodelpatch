return function(v0, v1)
    local v2 = not not v0.GameDetails[v1.universeId] and v0.GameDetails[v1.universeId].creator or nil;
    local v3 = "";
    if not (v2 ~= nil) or v2.id == nil then
        return false;
    else
        v3 = tostring(v2.id);
        if not (not v2 or not v0.VerifiedBadges) then
            if v0.VerifiedBadges.VerifiedUsers and v2.type == Enum.CreatorType.User.Name then
                return v0.VerifiedBadges.VerifiedUsers[tostring(v3)] == true;
            elseif v0.VerifiedBadges.VerifiedGroups and v2.type == Enum.CreatorType.Group.Name then
                return v0.VerifiedBadges.VerifiedGroups[tostring(v3)] == true;
            end;
        end;
        return false;
    end;
end;
