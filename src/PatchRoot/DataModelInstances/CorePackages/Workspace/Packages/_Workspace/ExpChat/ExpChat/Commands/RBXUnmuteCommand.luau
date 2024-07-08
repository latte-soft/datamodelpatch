local v0 = require(script.Parent.getPlayersFromString);
local v1 = require(script:FindFirstAncestor("ExpChat").Actions.UserUnmuted);
local _ = require(script.Parent.types);
return {
    name = script.Name, 
    alias = {
        "/unmute", 
        "/um"
    }, 
    clientRun = function(v3, v4, v5)
        local v6 = string.split(v5, " ")[2];
        if v6 then
            local v7 = v0(v3:getState().Players, v6);
            if #v7 == 0 then
                return {
                    key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist", 
                    args = {
                        RBX_NAME = v6
                    }, 
                    metadata = "Roblox.Unmute.Error.PlayerNotFound"
                };
            elseif #v7 > 1 then
                return {
                    key = "InGame.Chat.Response.DisplayNameMultipleMatches", 
                    args = {}, 
                    metadata = "Roblox.Unmute.Error.MultipleMatches"
                };
            else
                local v8 = v7[1];
                if v8.userId == tostring(v4) then
                    return {
                        key = "CoreScripts.TextChat.Mute.Error.CannotMuteSelf", 
                        args = {}, 
                        metadata = "Roblox.Unmute.Error.CannotMuteSelf"
                    };
                else
                    v3:dispatch(v1(v8.userId));
                    return {
                        key = "CoreScripts.TextChat.Unmute.Success", 
                        args = {
                            RBX_NAME = v8.nameToDisplay
                        }, 
                        metadata = "Roblox.Unmute.Info.Success"
                    };
                end;
            end;
        else
            return {
                key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist", 
                args = {
                    RBX_NAME = ""
                }, 
                metadata = "Roblox.Unmute.Error.PlayerNotFound"
            };
        end;
    end
};
