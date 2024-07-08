local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Object_0 = require(l_Parent_1.Parent.LuauPolyfill).Object;
local v3 = require(l_Parent_0.SwitchRouter);
local v4 = require(l_Parent_1.BackBehavior);
return function(v5, v6)
    local v7 = {
        resetOnBlur = false, 
        backBehavior = v4.InitialRoute
    };
    if v6 then
        v7 = l_Object_0.assign(v7, v6);
    end;
    return v3(v5, v7);
end;
