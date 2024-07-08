local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.LuauPolyfill);
local v3 = require(l_Parent_1.Promise);
local _ = require(l_Parent_0.jsutils.PromiseOrValue);
return {
    coerceToPromise = function(v5)
        if not v3.is(v5) then
            return (v3.resolve(v5));
        else
            return v5;
        end;
    end
};
