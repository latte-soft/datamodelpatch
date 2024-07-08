local _ = require(script:FindFirstAncestor("GraphQLServer").graphql.generatedTypes);
return function(v1)
    local v2 = DateTime.now();
    local v3 = DateTime.fromUnixTimestamp(v2.UnixTimestamp + 86400);
    return {
        id = v1, 
        title = "Event Name", 
        description = "Event description goes here...", 
        host = {
            hostType = "user", 
            hostId = "1", 
            hostName = "Roblox", 
            hasVerifiedBadge = true
        }, 
        eventTime = {
            startUtc = v2:ToIsoDate(), 
            endUtc = v3:ToIsoDate(), 
            startTime = v2, 
            endTime = v3
        }, 
        universeId = "3531439676", 
        eventStatus = "active", 
        createdTime = v2, 
        updatedTime = v2, 
        userRsvpStatus = "none", 
        experienceDetails = {
            id = "3531439676", 
            name = "Experience Name", 
            playing = 50000
        }, 
        rsvpCounters = {
            going = 2500, 
            notGoing = 0, 
            none = 0, 
            maybeGoing = 0
        }, 
        rsvps = {
            {
                userId = "957765952", 
                rsvpStatus = "going"
            }, 
            {
                userId = "35392", 
                rsvpStatus = "going"
            }, 
            {
                userId = "4416634", 
                rsvpStatus = "going"
            }, 
            {
                userId = "1893522417", 
                rsvpStatus = "going"
            }, 
            {
                userId = "1343930", 
                rsvpStatus = "going"
            }, 
            {
                userId = "29819622", 
                rsvpStatus = "notGoing"
            }, 
            {
                userId = "1668748746", 
                rsvpStatus = "notGoing"
            }, 
            {
                userId = "308199922", 
                rsvpStatus = "notGoing"
            }
        }
    };
end;
