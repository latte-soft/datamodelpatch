local v0 = require(script:FindFirstAncestor("FriendsLanding").Friends.filterStates);
return function(v1, v2)
    if not v2 then
        return {
            {
                text = v1.all, 
                id = v0.All
            }, 
            {
                text = v1.online, 
                id = v0.Online
            }, 
            {
                text = v1.inExperience, 
                id = v0.InExperience
            }, 
            {
                text = v1.offline, 
                id = v0.Offline
            }
        };
    else
        return {
            {
                text = v1.all, 
                id = v0.All
            }, 
            {
                text = v1.online, 
                id = v0.Online
            }, 
            {
                text = v1.inExperience, 
                id = v0.InExperience
            }, 
            {
                text = v1.offline, 
                id = v0.Offline
            }, 
            {
                text = v1.inactive, 
                id = v0.Inactive
            }
        };
    end;
end;
