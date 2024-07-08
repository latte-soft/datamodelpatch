local l_Parent_0 = script.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local v2 = {};
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_CONTEXT_TYPE_0 = l_ReactSymbols_0.REACT_CONTEXT_TYPE;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_REACT_FORWARD_REF_TYPE_0 = l_ReactSymbols_0.REACT_FORWARD_REF_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = l_ReactSymbols_0.REACT_FRAGMENT_TYPE;
local l_REACT_LAZY_TYPE_0 = l_ReactSymbols_0.REACT_LAZY_TYPE;
local l_REACT_MEMO_TYPE_0 = l_ReactSymbols_0.REACT_MEMO_TYPE;
local l_REACT_PORTAL_TYPE_0 = l_ReactSymbols_0.REACT_PORTAL_TYPE;
local l_REACT_PROFILER_TYPE_0 = l_ReactSymbols_0.REACT_PROFILER_TYPE;
local l_REACT_PROVIDER_TYPE_0 = l_ReactSymbols_0.REACT_PROVIDER_TYPE;
local l_REACT_STRICT_MODE_TYPE_0 = l_ReactSymbols_0.REACT_STRICT_MODE_TYPE;
local l_REACT_SUSPENSE_TYPE_0 = l_ReactSymbols_0.REACT_SUSPENSE_TYPE;
local l_REACT_SUSPENSE_LIST_TYPE_0 = l_ReactSymbols_0.REACT_SUSPENSE_LIST_TYPE;
local l_isValidElementType_0 = require(l_Parent_0.Shared).isValidElementType;
local l_REACT_BINDING_TYPE_0 = l_ReactSymbols_0.REACT_BINDING_TYPE;
local function v22(v18)
    if typeof(v18) == "table" and v18 ~= nil then
        local v19 = v18["$$typeof"];
        if v19 == l_REACT_ELEMENT_TYPE_0 then
            local l_type_0 = v18.type;
            if not (((l_type_0 ~= l_REACT_FRAGMENT_TYPE_0 and l_type_0 ~= l_REACT_PROFILER_TYPE_0) and l_type_0 ~= l_REACT_STRICT_MODE_TYPE_0) and l_type_0 ~= l_REACT_SUSPENSE_TYPE_0) or l_type_0 == l_REACT_SUSPENSE_LIST_TYPE_0 then
                return l_type_0;
            else
                local l_l_type_0_0 = l_type_0;
                if l_l_type_0_0 then
                    l_l_type_0_0 = false;
                    if typeof(l_type_0) == "table" then
                        l_l_type_0_0 = l_type_0["$$typeof"];
                    end;
                end;
                if not (((l_l_type_0_0 ~= l_REACT_CONTEXT_TYPE_0 and l_l_type_0_0 ~= l_REACT_FORWARD_REF_TYPE_0) and l_l_type_0_0 ~= l_REACT_LAZY_TYPE_0) and l_l_type_0_0 ~= l_REACT_MEMO_TYPE_0) or l_l_type_0_0 == l_REACT_PROVIDER_TYPE_0 then
                    return l_l_type_0_0;
                else
                    return v19;
                end;
            end;
        elseif not (v19 ~= l_REACT_PORTAL_TYPE_0) or v19 == l_REACT_BINDING_TYPE_0 then
            return v19;
        end;
    end;
    return nil;
end;
v2.typeOf = v22;
v2.ContextConsumer = l_REACT_CONTEXT_TYPE_0;
v2.ContextProvider = l_REACT_PROVIDER_TYPE_0;
v2.Element = l_REACT_ELEMENT_TYPE_0;
v2.ForwardRef = l_REACT_FORWARD_REF_TYPE_0;
v2.Fragment = l_REACT_FRAGMENT_TYPE_0;
v2.Lazy = l_REACT_LAZY_TYPE_0;
v2.Memo = l_REACT_MEMO_TYPE_0;
v2.Portal = l_REACT_PORTAL_TYPE_0;
v2.Profiler = l_REACT_PROFILER_TYPE_0;
v2.StrictMode = l_REACT_STRICT_MODE_TYPE_0;
v2.Suspense = l_REACT_SUSPENSE_TYPE_0;
v2.Binding = l_ReactSymbols_0.REACT_BINDING_TYPE;
v2.isValidElementType = l_isValidElementType_0;
local v23 = false;
local v24 = false;
v2.isAsyncMode = function(_)
    if not (not _G.__DEV__ or v23) then
        v23 = true;
        l_console_0.warn("The ReactIs.isAsyncMode() alias has been deprecated, " .. "and will be removed in React 18+.");
    end;
    return false;
end;
v2.isConcurrentMode = function(_)
    if not (not _G.__DEV__ or v24) then
        v24 = true;
        l_console_0.warn("The ReactIs.isConcurrentMode() alias has been deprecated, " .. "and will be removed in React 18+.");
    end;
    return false;
end;
v2.isContextConsumer = function(v27)
    return v22(v27) == l_REACT_CONTEXT_TYPE_0;
end;
v2.isContextProvider = function(v28)
    return v22(v28) == l_REACT_PROVIDER_TYPE_0;
end;
v2.isElement = function(v29)
    local v30 = false;
    if typeof(v29) == "table" then
        v30 = false;
        if v29 ~= nil then
            v30 = v29["$$typeof"] == l_REACT_ELEMENT_TYPE_0;
        end;
    end;
    return v30;
end;
v2.isForwardRef = function(v31)
    return v22(v31) == l_REACT_FORWARD_REF_TYPE_0;
end;
v2.isFragment = function(v32)
    return v22(v32) == l_REACT_FRAGMENT_TYPE_0;
end;
v2.isLazy = function(v33)
    return v22(v33) == l_REACT_LAZY_TYPE_0;
end;
v2.isMemo = function(v34)
    return v22(v34) == l_REACT_MEMO_TYPE_0;
end;
v2.isPortal = function(v35)
    return v22(v35) == l_REACT_PORTAL_TYPE_0;
end;
v2.isProfiler = function(v36)
    return v22(v36) == l_REACT_PROFILER_TYPE_0;
end;
v2.isStrictMode = function(v37)
    return v22(v37) == l_REACT_STRICT_MODE_TYPE_0;
end;
v2.isSuspense = function(v38)
    return v22(v38) == l_REACT_SUSPENSE_TYPE_0;
end;
v2.isBinding = function(v39)
    return v22(v39) == l_REACT_BINDING_TYPE_0;
end;
return v2;
