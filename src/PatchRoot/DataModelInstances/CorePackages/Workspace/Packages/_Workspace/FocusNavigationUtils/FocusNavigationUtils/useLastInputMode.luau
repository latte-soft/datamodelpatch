local l_Parent_0 = script:FindFirstAncestor("FocusNavigationUtils").Parent;
local v1 = require(script.Parent.useLastInputMethod);
local l_VRService_0 = require(l_Parent_0.MockableProxyServices).VRService;
local v3 = game:DefineFastFlag("EnableVRInputModeHandling", false);
local v4 = {
    Keyboard = "Focus", 
    Gamepad = "Focus", 
    Mouse = "Cursor", 
    Touch = "Cursor", 
    None = "None"
};
return function()
    local v5 = v1();
    if not v3 or not l_VRService_0.VREnabled then
        return v4[v5];
    else
        return "Cursor";
    end;
end;
