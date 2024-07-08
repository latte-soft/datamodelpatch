local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Parent.LuauPolyfill);
local _ = require(script.Parent.helpers_types);
return {
    hasOwnProperty = require(l_Parent_0.luaUtils.hasOwnProperty), 
    toArray = function(v3)
        if not v3._array then
            local v4 = {};
            v3:forEach(function(v5)
                table.insert(v4, v5);
            end);
            return v4;
        else
            return table.clone(v3._array);
        end;
    end, 
    maybeUnsubscribe = function(v6)
        local l_unsubscribe_0 = v6.unsubscribe;
        if type(l_unsubscribe_0) == "function" then
            v6.unsubscribe = nil;
            l_unsubscribe_0();
        end;
    end
};
