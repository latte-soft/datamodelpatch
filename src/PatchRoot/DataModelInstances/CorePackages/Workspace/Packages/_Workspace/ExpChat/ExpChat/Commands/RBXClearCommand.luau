local v0 = require(script:FindFirstAncestor("ExpChat").Actions.ChatWindowMessagesCleared);
local _ = require(script.Parent.types);
return {
    name = script.Name, 
    alias = {
        "/clear", 
        "/cls"
    }, 
    clientRun = function(v2, _, _)
        v2:dispatch(v0());
        return {
            key = "", 
            metadata = "Roblox.Clear.Info.Success"
        };
    end
};
