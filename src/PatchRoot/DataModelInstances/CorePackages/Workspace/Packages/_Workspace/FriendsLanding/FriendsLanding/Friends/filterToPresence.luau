local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_PresenceType_0 = require(l_script_FirstAncestor_0.dependencies).RoduxPresence.Enums.PresenceType;
local v2 = require(l_script_FirstAncestor_0.Friends.filterStates);
return function(v3)
    if v3 == v2.InExperience then
        return {
            l_PresenceType_0.InGame, 
            l_PresenceType_0.InStudio
        };
    elseif v3 == v2.Offline then
        return {
            l_PresenceType_0.Offline
        };
    elseif v3 == v2.Online then
        return {
            l_PresenceType_0.Online, 
            l_PresenceType_0.InStudio, 
            l_PresenceType_0.InGame
        };
    else
        return {
            l_PresenceType_0.Online, 
            l_PresenceType_0.InStudio, 
            l_PresenceType_0.InGame, 
            l_PresenceType_0.Offline
        };
    end;
end;
