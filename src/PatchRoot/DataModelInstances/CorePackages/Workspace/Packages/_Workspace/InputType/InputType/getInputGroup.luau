local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.InputTypeConstants);
local v2 = require(script.Parent.InputTypeMap);
local l_getFFlagDebugLuaAppAlwaysUseGamepad_0 = require(l_Parent_0.SharedFlags).getFFlagDebugLuaAppAlwaysUseGamepad;
return function(v4)
    if not l_getFFlagDebugLuaAppAlwaysUseGamepad_0() then
        return v2[v4] or v1.None;
    else
        return v1.Gamepad;
    end;
end;
