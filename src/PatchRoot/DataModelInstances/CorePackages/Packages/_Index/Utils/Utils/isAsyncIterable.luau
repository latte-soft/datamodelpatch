local l_Symbol_0 = require(script.Parent.Parent.LuauPolyfill).Symbol;
return {
    isAsyncIterable = function(v1)
        local l_asyncIterator_0 = l_Symbol_0.asyncIterator;
        local v3 = false;
        if typeof(v1) == "table" then
            v3 = false;
            if v1 ~= nil then
                v3 = (l_asyncIterator_0 and v1[l_asyncIterator_0]) and typeof(v1[l_asyncIterator_0]) == "function";
            end;
        end;
        return v3;
    end
};
