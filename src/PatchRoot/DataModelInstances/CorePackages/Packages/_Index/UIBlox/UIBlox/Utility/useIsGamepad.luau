local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Enums.InputType);
local v2 = require(l_Parent_0.useInputType);
return function()
    return v2() == v1.Gamepad;
end;
