local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_0.GameDetailsContext);
local v4 = require(l_Parent_2.React);
local _ = require(l_Parent_1.gameInviteModalType);
return function(v6)
    return v4.createElement(v3.Provider, {
        value = {
            gameDetails = v6.gameDetails or {}, 
            serverType = v6.serverType or "", 
            promptMessage = v6.promptMessage or "", 
            trigger = v6.trigger or "", 
            isCoreScript = v6.isCoreScript or false
        }
    }, v6.children);
end;
