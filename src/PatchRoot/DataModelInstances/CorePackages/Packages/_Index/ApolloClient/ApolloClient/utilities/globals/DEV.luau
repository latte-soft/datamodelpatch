local v0 = {};
local l_Boolean_0 = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean;
local l_default_0 = require(script.Parent.Parent.common.global).default;
local v3 = "__" .. "DEV" .. "__";
local _ = function()
    local _, v5 = xpcall(function()
        return l_Boolean_0.toJSBoolean(_G.__DEV__);
    end, function()
        l_default_0[v3] = true;
        return l_default_0[v3];
    end);
    return v5;
end;
local _, v8 = xpcall(function()
    return l_Boolean_0.toJSBoolean(_G.__DEV__);
end, function()
    l_default_0[v3] = true;
    return l_default_0[v3];
end);
v0.default = v8;
return v0;
