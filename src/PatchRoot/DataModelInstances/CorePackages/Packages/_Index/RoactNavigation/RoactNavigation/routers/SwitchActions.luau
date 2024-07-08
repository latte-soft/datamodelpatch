local l_Object_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Object;
local v1 = require(script.Parent.Parent.NavigationSymbol)("JUMP_TO");
local v2 = {
    JumpTo = v1
};
setmetatable(v2, {
    __index = function(_, v4)
        error(("%q is not a valid member of SwitchActions"):format((tostring(v4))), 2);
    end
});
v2.jumpTo = function(v5)
    local v6 = {
        type = v1, 
        preserveFocus = true
    };
    if not v5 then
        return v6;
    else
        return (l_Object_0.assign(v6, v5));
    end;
end;
return v2;
