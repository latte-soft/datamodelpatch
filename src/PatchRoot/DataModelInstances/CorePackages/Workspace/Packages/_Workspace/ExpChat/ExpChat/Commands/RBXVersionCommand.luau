local v0 = require(script:FindFirstAncestor("ExpChat").Version);
local _ = require(script.Parent.types);
return {
    name = script.Name, 
    alias = {
        "/version", 
        "/v"
    }, 
    clientRun = function()
        return {
            key = "CoreScripts.TextChat.Version.Success", 
            metadata = "Roblox.Version.Info.Success", 
            args = {
                RBX_VERSION = string.format("%s (%s)", v0[1], v0[2])
            }
        };
    end
};
