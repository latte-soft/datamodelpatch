local v0 = require(script.Parent.console);
local v1 = require(script.Parent.ReactSymbols);
local l_REACT_CONTEXT_TYPE_0 = v1.REACT_CONTEXT_TYPE;
local l_REACT_FORWARD_REF_TYPE_0 = v1.REACT_FORWARD_REF_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = v1.REACT_FRAGMENT_TYPE;
local l_REACT_PORTAL_TYPE_0 = v1.REACT_PORTAL_TYPE;
local l_REACT_MEMO_TYPE_0 = v1.REACT_MEMO_TYPE;
local l_REACT_PROFILER_TYPE_0 = v1.REACT_PROFILER_TYPE;
local l_REACT_PROVIDER_TYPE_0 = v1.REACT_PROVIDER_TYPE;
local l_REACT_STRICT_MODE_TYPE_0 = v1.REACT_STRICT_MODE_TYPE;
local l_REACT_SUSPENSE_TYPE_0 = v1.REACT_SUSPENSE_TYPE;
local l_REACT_SUSPENSE_LIST_TYPE_0 = v1.REACT_SUSPENSE_LIST_TYPE;
local l_REACT_LAZY_TYPE_0 = v1.REACT_LAZY_TYPE;
local l_REACT_BLOCK_TYPE_0 = v1.REACT_BLOCK_TYPE;
local _ = require(script.Parent.ReactTypes);
local l_describeError_0 = require(script.Parent["ErrorHandling.roblox"]).describeError;
local function _(v16, v17, v18)
    local v19 = "<function>";
    if typeof(v17) == "table" then
        v19 = (v17.displayName or v17.name) or "";
    end;
    return (v16.displayName or v19 ~= "" and string.format("%s(%s)", v18, v19)) or v18;
end;
local function _(v21)
    return v21.displayName or "Context";
end;
local function v23(v24)
    if v24 == nil then
        return nil;
    else
        local v25 = typeof(v24);
        if (_G.__DEV__ and v25 == "table") and typeof(v24.tag) == "number" then
            v0.warn("Received an unexpected object in getComponentName(). " .. "This is likely a bug in React. Please file an issue.");
        end;
        if v25 == "function" then
            local v26 = debug.info(v24, "n");
            if v26 and string.len(v26) > 0 then
                return v26;
            else
                return nil;
            end;
        elseif v25 == "string" then
            return v24;
        elseif v24 == l_REACT_FRAGMENT_TYPE_0 then
            return "Fragment";
        elseif v24 == l_REACT_PORTAL_TYPE_0 then
            return "Portal";
        elseif v24 == l_REACT_PROFILER_TYPE_0 then
            return "Profiler";
        elseif v24 == l_REACT_STRICT_MODE_TYPE_0 then
            return "StrictMode";
        elseif v24 == l_REACT_SUSPENSE_TYPE_0 then
            return "Suspense";
        elseif v24 == l_REACT_SUSPENSE_LIST_TYPE_0 then
            return "SuspenseList";
        else
            if v25 == "table" then
                local v27 = v24["$$typeof"];
                if v27 == l_REACT_CONTEXT_TYPE_0 then
                    return (v24.displayName or "Context") .. ".Consumer";
                elseif v27 == l_REACT_PROVIDER_TYPE_0 then
                    return (v24._context.displayName or "Context") .. ".Provider";
                elseif v27 == l_REACT_FORWARD_REF_TYPE_0 then
                    local l_render_0 = v24.render;
                    local v29 = "<function>";
                    if typeof(l_render_0) == "table" then
                        v29 = (l_render_0.displayName or l_render_0.name) or "";
                    end;
                    return (v24.displayName or v29 ~= "" and string.format("%s(%s)", "ForwardRef", v29)) or "ForwardRef";
                elseif v27 == l_REACT_MEMO_TYPE_0 then
                    return v23(v24.type);
                elseif v27 == l_REACT_BLOCK_TYPE_0 then
                    return v23(v24._render);
                elseif v27 == l_REACT_LAZY_TYPE_0 then
                    local v30, v31 = xpcall(v24._init, l_describeError_0, v24._payload);
                    if not v30 then
                        return nil;
                    else
                        return v23(v31);
                    end;
                elseif not v24.displayName then
                    if not v24.name then
                        local v32 = getmetatable(v24);
                        if not (not v32 or not rawget(v32, "__tostring")) then
                            return (tostring(v24));
                        end;
                    else
                        return v24.name;
                    end;
                else
                    return v24.displayName;
                end;
            end;
            return nil;
        end;
    end;
end;
return v23;
