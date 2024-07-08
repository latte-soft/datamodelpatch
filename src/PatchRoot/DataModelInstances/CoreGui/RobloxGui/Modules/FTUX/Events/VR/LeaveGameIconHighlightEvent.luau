local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local _ = require(script.Parent.Parent.EventType);
local v2 = require(l_RobloxGui_0.Modules.VR.VRHub);
return {
    Name = "LeaveGameIconHighlightEvent", 
    StartEvent = function()
        v2:SetShowHighlightedLeaveGameIconToggled(true);
    end, 
    StopEvent = function()
        v2:SetShowHighlightedLeaveGameIconToggled(false);
    end
};
