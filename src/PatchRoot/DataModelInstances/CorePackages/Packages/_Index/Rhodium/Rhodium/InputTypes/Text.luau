local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local v1 = require(script:FindFirstAncestor("Rhodium").VirtualInputUtils);
return {
    sendText = function(v2)
        l_VirtualInputManager_0:SendTextInputCharacterEvent(v2, (v1.getCurrentWindow()));
    end
};
