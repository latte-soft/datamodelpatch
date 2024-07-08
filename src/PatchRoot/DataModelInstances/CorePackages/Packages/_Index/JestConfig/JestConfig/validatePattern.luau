local l_Parent_0 = script.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = require(l_Parent_0.RegExp);
return {
    default = function(v3)
        if (not (v3 ~= nil) or not l_Boolean_0.toJSBoolean(v3)) or pcall(function()
            v2(v3, "i");
        end) then
            return true;
        else
            return false;
        end;
    end
};
