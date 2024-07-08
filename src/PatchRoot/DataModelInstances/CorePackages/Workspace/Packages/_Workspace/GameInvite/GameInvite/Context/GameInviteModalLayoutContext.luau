local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.React);
local _ = require(l_Parent_0.gameInviteModalType);
return (v1.createContext({
    isFullHeight = false, 
    isFullWidth = false, 
    modalSize = UDim2.new(0, 0, 0, 0), 
    modalMode = "default"
}));
