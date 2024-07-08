local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Promise);
local _ = require(l_Parent_1.LuauPolyfill);
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local _ = require(script.Parent.Parent.Parent.utilities);
v0.toPromise = function(v7)
    local v8 = false;
    return v3.new(function(v9, v10)
        v7:subscribe({
            next = function(_, v12)
                if not v8 then
                    v8 = true;
                    v9(v12);
                    return ;
                else
                    l_invariant_0.warn("Promise Wrapper does not support multiple results from Observable");
                    return ;
                end;
            end, 
            error = function(_, v14)
                v10(v14);
            end
        });
    end):andThen(function(v15)
        return v3.delay(0):andThenReturn(v15);
    end);
end;
return v0;
