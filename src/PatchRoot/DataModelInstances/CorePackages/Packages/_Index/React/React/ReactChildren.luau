local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Shared);
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_getIteratorFn_0 = l_ReactSymbols_0.getIteratorFn;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_REACT_PORTAL_TYPE_0 = l_ReactSymbols_0.REACT_PORTAL_TYPE;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v8 = require(script.Parent.ReactElement);
local l_isValidElement_0 = v8.isValidElement;
local l_cloneAndReplaceKey_0 = v8.cloneAndReplaceKey;
local function _(v11)
    return "$" .. string.gsub(string.gsub(v11, "=", "=0"), ":", "=2");
end;
local function _(v13)
    return v13;
end;
local function _(v15, v16)
    if (typeof(v15) == "table" and v15 ~= nil) and v15.key ~= nil then
        return "$" .. string.gsub(string.gsub(tostring(v15.key), "=", "=0"), ":", "=2");
    else
        return (tostring(v16));
    end;
end;
local function v18(v19, v20, v21, v22, v23)
    local v24 = typeof(v19);
    if not (v24 ~= "nil" and v24 ~= "boolean") or v24 == "userdata" then
        v19 = nil;
    end;
    local v25 = false;
    if v19 == nil then
        v25 = true;
    elseif not (v24 ~= "string") or v24 == "number" then
        v25 = true;
    elseif v24 == "table" then
        local v26 = v19["$$typeof"];
        if not (v26 ~= l_REACT_ELEMENT_TYPE_0) or v26 == l_REACT_PORTAL_TYPE_0 then
            v25 = true;
        end;
    end;
    if not v25 then
        local v27 = nil;
        local v28 = nil;
        local v29 = 0;
        local v30 = v22 == "" and "." or v22 .. ":";
        if not l_Array_0.isArray(v19) then
            local v31 = l_getIteratorFn_0(v19);
            if typeof(v31) == "function" then
                local v32 = v31(v19);
                local v33 = nil;
                local v34 = 1;
                v33 = v32.next();
                while not v33.done do
                    v27 = v33.value;
                    local l_v30_0 = v30;
                    local l_v27_0 = v27;
                    v28 = l_v30_0 .. if (typeof(l_v27_0) == "table" and l_v27_0 ~= nil) and l_v27_0.key ~= nil then "$" .. string.gsub(string.gsub(tostring(l_v27_0.key), "=", "=0"), ":", "=2") else tostring(v34);
                    v34 = v34 + 1;
                    v29 = v29 + v18(v27, v20, v21, v28, v23);
                    v33 = v32.next();
                end;
            end;
            return v29;
        else
            for v37 = 1, #v19 do
                v27 = v19[v37];
                local l_v30_1 = v30;
                local l_v27_1 = v27;
                v29 = v29 + v18(v27, v20, v21, l_v30_1 .. if (typeof(l_v27_1) == "table" and l_v27_1 ~= nil) and l_v27_1.key ~= nil then "$" .. string.gsub(string.gsub(tostring(l_v27_1.key), "=", "=0"), ":", "=2") else tostring(v37), v23);
            end;
            return v29;
        end;
    else
        local l_v19_0 = v19;
        local v41 = v23(l_v19_0);
        local v42 = if v22 == "" then "." .. if (typeof(l_v19_0) == "table" and l_v19_0 ~= nil) and l_v19_0.key ~= nil then "$" .. string.gsub(string.gsub(tostring(l_v19_0.key), "=", "=0"), ":", "=2") else tostring(1) else v22;
        if not l_Array_0.isArray(v41) then
            if v41 ~= nil then
                if l_isValidElement_0(v41) then
                    local l_key_0 = v41.key;
                    v41 = l_cloneAndReplaceKey_0(v41, v21 .. if not not l_key_0 and (not l_v19_0 or l_v19_0.key ~= l_key_0) then tostring(l_key_0) .. "/" else "" .. v42);
                end;
                table.insert(v20, v41);
            end;
        else
            local v44 = "";
            if v42 ~= nil then
                v44 = v42 .. "/";
            end;
            v18(v41, v20, v44, "", function(v45)
                return v45;
            end);
        end;
        return 1;
    end;
end;
local function v53(v46, v47, _)
    if v46 == nil then
        return nil;
    else
        local v49 = {};
        local v50 = 1;
        v18(v46, v49, "", "", function(v51)
            local v52 = v47(v51, v50);
            v50 = v50 + 1;
            return v52;
        end);
        return v49;
    end;
end;
return {
    forEach = function(v54, v55, v56)
        v53(v54, function(...)
            v55(...);
        end, v56);
    end, 
    map = v53, 
    count = function(v57)
        local v58 = 0;
        v53(v57, function()
            v58 = v58 + 1;
        end);
        return v58;
    end, 
    only = function(v59)
        l_invariant_0(l_isValidElement_0(v59), "React.Children.only expected to receive a single React element child.");
        return v59;
    end, 
    toArray = function(v60)
        return v53(v60, function(v61)
            return v61;
        end) or {};
    end
};
