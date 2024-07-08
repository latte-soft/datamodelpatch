local l_Parent_0 = script.Parent;
local l_Array_0 = require(l_Parent_0.Parent.Parent.LuauPolyfill).Array;
local _ = require(l_Parent_0.PromiseOrValue);
local l_isPromise_0 = require(l_Parent_0.isPromise).isPromise;
return {
    promiseReduce = function(v4, v5, v6)
        return l_Array_0.reduce(v4, function(v7, v8)
            if not l_isPromise_0(v7) then
                return v5(v7, v8);
            else
                return v7:andThen(function(v9)
                    return v5(v9, v8);
                end);
            end;
        end, v6);
    end
};
