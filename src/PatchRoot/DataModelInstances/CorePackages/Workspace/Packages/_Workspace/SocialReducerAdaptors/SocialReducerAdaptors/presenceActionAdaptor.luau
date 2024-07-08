local l_llama_0 = require(script:FindFirstAncestor("SocialReducerAdaptors").dependencies).llama;
return function(v1)
    local function v3(v2)
        return v1.Actions.ReceivedUserPresence((v1.Models.Presence.new(l_llama_0.Dictionary.join(v2, {
            presence = l_llama_0.None, 
            userPresenceType = (table.find({
                "OFFLINE", 
                "ONLINE", 
                "IN_GAME", 
                "IN_STUDIO"
            }, v2.presence) or 1) - 1, 
            gameInstanceId = l_llama_0.None, 
            gameId = v2.gameInstanceId, 
            lastOnline = not not DateTime.now() and DateTime.fromUnixTimestamp(v2.lastOnline or 0):ToIsoDate() or "1970-01-01T00:00:00Z", 
            type = l_llama_0.None
        }))));
    end;
    return {
        ReceivedUserPresence = function(v4)
            if not v4.payload then
                return {
                    v3(v4)
                };
            else
                return {
                    v4
                };
            end;
        end
    };
end;
