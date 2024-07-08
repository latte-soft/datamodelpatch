local v0 = require(script.Parent.ReactSymbols);
local l_REACT_CONTEXT_TYPE_0 = v0.REACT_CONTEXT_TYPE;
local l_REACT_FORWARD_REF_TYPE_0 = v0.REACT_FORWARD_REF_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = v0.REACT_FRAGMENT_TYPE;
local l_REACT_PROFILER_TYPE_0 = v0.REACT_PROFILER_TYPE;
local l_REACT_PROVIDER_TYPE_0 = v0.REACT_PROVIDER_TYPE;
local l_REACT_DEBUG_TRACING_MODE_TYPE_0 = v0.REACT_DEBUG_TRACING_MODE_TYPE;
local l_REACT_STRICT_MODE_TYPE_0 = v0.REACT_STRICT_MODE_TYPE;
local l_REACT_SUSPENSE_TYPE_0 = v0.REACT_SUSPENSE_TYPE;
local l_REACT_MEMO_TYPE_0 = v0.REACT_MEMO_TYPE;
local l_REACT_LAZY_TYPE_0 = v0.REACT_LAZY_TYPE;
local l_REACT_FUNDAMENTAL_TYPE_0 = v0.REACT_FUNDAMENTAL_TYPE;
local l_REACT_BLOCK_TYPE_0 = v0.REACT_BLOCK_TYPE;
local l_REACT_SERVER_BLOCK_TYPE_0 = v0.REACT_SERVER_BLOCK_TYPE;
local l_REACT_LEGACY_HIDDEN_TYPE_0 = v0.REACT_LEGACY_HIDDEN_TYPE;
return function(v15)
    local v16 = typeof(v15);
    if not (v16 ~= "string") or v16 == "function" then
        return true;
    elseif not ((((v15 ~= l_REACT_FRAGMENT_TYPE_0 and v15 ~= l_REACT_PROFILER_TYPE_0) and v15 ~= l_REACT_DEBUG_TRACING_MODE_TYPE_0) and v15 ~= l_REACT_STRICT_MODE_TYPE_0) and v15 ~= l_REACT_SUSPENSE_TYPE_0) or v15 == l_REACT_LEGACY_HIDDEN_TYPE_0 then
        return true;
    else
        if v16 == "table" then
            if not v15.isReactComponent then
                if not ((((((v15["$$typeof"] ~= l_REACT_LAZY_TYPE_0 and v15["$$typeof"] ~= l_REACT_MEMO_TYPE_0) and v15["$$typeof"] ~= l_REACT_PROVIDER_TYPE_0) and v15["$$typeof"] ~= l_REACT_CONTEXT_TYPE_0) and v15["$$typeof"] ~= l_REACT_FORWARD_REF_TYPE_0) and v15["$$typeof"] ~= l_REACT_FUNDAMENTAL_TYPE_0) and v15["$$typeof"] ~= l_REACT_BLOCK_TYPE_0) or v15[1] == l_REACT_SERVER_BLOCK_TYPE_0 then
                    return true;
                end;
            else
                return true;
            end;
        end;
        return false;
    end;
end;
