local v0 = require(script.Parent.hasSameParticipants);
return function(v1)
    if v1.existing then
        if not (not v1.new.lastUpdated or not v1.existing.lastUpdated) and math.floor((v1.existing.lastUpdated:GetUnixTimestamp())) ~= math.floor((v1.new.lastUpdated:GetUnixTimestamp())) then
            return true;
        elseif v1.existing.title ~= v1.new.title then
            return true;
        elseif v0({
            existing = v1.existing.participants, 
            new = v1.new.participants
        }) then
            if not v1.new.hasUnreadMessages or v1.existing.hasUnreadMessages then
                return false;
            else
                return true;
            end;
        else
            return true;
        end;
    else
        return true;
    end;
end;
