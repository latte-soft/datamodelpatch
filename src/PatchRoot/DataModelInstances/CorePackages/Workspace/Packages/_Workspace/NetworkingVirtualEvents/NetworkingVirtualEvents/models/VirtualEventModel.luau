local _ = require(script:FindFirstAncestor("NetworkingVirtualEvents").types);
return {
    mock = function(v1)
        local v2 = DateTime.now();
        return {
            id = v1, 
            title = "Event Name", 
            description = "Event description goes here...", 
            host = {
                hostType = "user", 
                hostId = 1, 
                hostName = "Roblox", 
                hasVerifiedBadge = true
            }, 
            eventTime = {
                startTime = v2, 
                endTime = DateTime.fromUnixTimestamp(v2.UnixTimestamp + 86400), 
                startUtc = v2:ToIsoDate(), 
                endUtc = v2:ToIsoDate()
            }, 
            universeId = 3531439676, 
            eventStatus = "active", 
            createdTime = v2, 
            updatedTime = v2, 
            userRsvpStatus = "none"
        };
    end, 
    fromResponse = function(v3)
        local v4 = DateTime.fromIsoDate(v3.eventTime.startUtc);
        local v5 = DateTime.fromIsoDate(v3.eventTime.endUtc);
        local v6 = DateTime.fromIsoDate(v3.createdUtc);
        local v7 = DateTime.fromIsoDate(v3.updatedUtc);
        if ((not v4 or not v5) or not v6) or not v7 then
            return nil;
        else
            return {
                id = v3.id, 
                title = v3.title, 
                description = v3.description, 
                host = v3.host, 
                eventTime = {
                    startTime = v4, 
                    endTime = v5, 
                    startUtc = v3.eventTime.startUtc, 
                    endUtc = v3.eventTime.endUtc
                }, 
                universeId = v3.universeId, 
                eventStatus = v3.eventStatus, 
                createdTime = v6, 
                updatedTime = v7, 
                userRsvpStatus = v3.userRsvpStatus
            };
        end;
    end
};
