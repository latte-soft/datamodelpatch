local l_Parent_0 = script.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local _ = require(l_Parent_0.RobloxShared);
return {
    default = function(v3)
        if l_Boolean_0.toJSBoolean(v3.isTTY) then
            v3:write("\027[999D\027[K");
        end;
    end
};
