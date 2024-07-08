local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local v1 = require(script:FindFirstAncestor("Rhodium").VirtualInputUtils);
local v5 = {
    SendKeyEvent = function(v2, v3, v4)
        l_VirtualInputManager_0:SendKeyEvent(v2, v3, v4, (v1.getCurrentWindow()));
    end
};
v5.pressKey = function(v6)
    v5.SendKeyEvent(true, v6, false);
end;
v5.releaseKey = function(v7)
    v5.SendKeyEvent(false, v7, false);
end;
v5.hitKey = function(v8)
    v5.pressKey(v8);
    v5.releaseKey(v8);
    v1.waitForInputEventsProcessed();
end;
return v5;
