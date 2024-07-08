local l_User_0 = script:FindFirstAncestor("SocialLibraries").User;
local v1 = require(l_User_0.presenceImageByPresence);
local v2 = require(l_User_0.getPresenceTextFromUser);
local v3 = require(script.Parent.getOtherParticipant);
return function(v4, v5)
    if v5.conversationType == "OneToOneConversation" then
        local v6 = v3(v4, v5.participants);
        if v6 then
            local v7 = v4.Users[v6];
            if v7 then
                return {
                    image = v1[v7.presence], 
                    text = v2(v7)
                };
            end;
        end;
    end;
    return nil;
end;
