local _ = require(script.Parent.types);
return {
    name = script.Name, 
    alias = {
        "/help", 
        "/?"
    }, 
    clientRun = function()
        return {
            key = {
                "CoreScripts.TextChat.Help.FirstLine", 
                "GameChat_ChatCommandsTeller_WhisperCommand", 
                "GameChat_ChatCommandsTeller_TeamCommand", 
                "GameChat_ChatCommandsTeller_MuteCommand", 
                "GameChat_ChatCommandsTeller_UnMuteCommand", 
                "CoreScripts.TextChat.Clear.Help.Description"
            }, 
            metadata = "Roblox.Help.Info", 
            args = nil
        };
    end
};
