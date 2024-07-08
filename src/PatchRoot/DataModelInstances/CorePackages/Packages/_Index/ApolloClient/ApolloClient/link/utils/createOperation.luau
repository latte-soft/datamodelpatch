local v0 = {};
local l_Object_0 = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Object;
local _ = require(script.Parent.Parent.core.types);
v0.createOperation = function(v3, v4)
    local l_v4_0 = v4;
    local v6 = l_Object_0.assign({}, v3);
    return (setmetatable(l_v4_0, {
        __index = {
            setContext = function(_, v8)
                if typeof(v8) == "function" then
                    v6 = l_Object_0.assign({}, v6, v8(v6));
                    return ;
                else
                    v6 = l_Object_0.assign({}, v6, v8);
                    return ;
                end;
            end, 
            getContext = function(_)
                return l_Object_0.assign({}, v6);
            end
        }
    }));
end;
return v0;
