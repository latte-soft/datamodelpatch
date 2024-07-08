local v0 = {};
local _ = require(script.Parent.Parent.Parent.Parent.LuauPolyfill);
local l_Observable_0 = require(script.Parent.Observable).Observable;
v0.fixObservableSubclass = function(v3)
    local function _(v4)
        v3[v4] = l_Observable_0;
    end;
    v3["@@species"] = l_Observable_0;
    return v3;
end;
return v0;
