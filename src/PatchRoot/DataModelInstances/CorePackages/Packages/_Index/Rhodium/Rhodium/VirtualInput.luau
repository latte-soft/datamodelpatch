local l_script_FirstAncestor_0 = script:FindFirstAncestor("Rhodium");
local v1 = require(l_script_FirstAncestor_0.InputTypes.Keyboard);
local v2 = require(l_script_FirstAncestor_0.InputTypes.Mouse);
local v3 = require(l_script_FirstAncestor_0.InputTypes.Touch);
local v4 = require(l_script_FirstAncestor_0.InputTypes.Text);
local v5 = require(l_script_FirstAncestor_0.InputTypes.GamePad);
local v6 = require(l_script_FirstAncestor_0.VirtualInputUtils);
return {
    Keyboard = v1, 
    Mouse = v2, 
    Touch = v3, 
    Text = v4, 
    GamePad = v5, 
    setCurrentWindow = v6.setCurrentWindow, 
    getCurrentWindow = v6.getCurrentWindow, 
    waitForInputEventsProcessed = v6.waitForInputEventsProcessed
};
