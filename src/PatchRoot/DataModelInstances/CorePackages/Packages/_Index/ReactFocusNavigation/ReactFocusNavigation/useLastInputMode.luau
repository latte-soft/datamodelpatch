local v0 = require(script.Parent.useLastInputMethod);
local v1 = {
    Keyboard = "Focus", 
    Gamepad = "Focus", 
    Mouse = "Cursor", 
    Touch = "Cursor", 
    None = "None"
};
return function()
    return v1[v0()];
end;
