local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.React);
local _ = require(l_Parent_0.gameInviteModalType);
return (v1.createContext({
    gameDetails = {}, 
    serverType = "", 
    promptMessage = "", 
    trigger = "", 
    isCoreScript = false
}));
