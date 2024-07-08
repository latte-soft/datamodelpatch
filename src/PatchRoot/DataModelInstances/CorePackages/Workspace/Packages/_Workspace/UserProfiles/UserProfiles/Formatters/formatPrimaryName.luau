local v0 = require(script:FindFirstAncestor("UserProfiles").Parent.VerifiedBadges);
return function(v1, v2)
    if not v2.hasVerifiedBadge then
        if not v2.hasPremiumMembership then
            return v1;
        else
            return (("%*%*"):format(v1, v0.emoji.premium));
        end;
    else
        return (("%*%*"):format(v1, v0.emoji.verified));
    end;
end;
